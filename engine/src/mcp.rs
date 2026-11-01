use crate::engine::KnowledgeBase;
use crate::model::Facts;
use serde_json::{json, Value};
use std::io::{self, BufRead, Write};

const PROTOCOL: &str = "2025-06-18";
fn tool_list() -> Value {
    let mut list = json!({"tools":[
      {"name":"kb_search","description":"Read-only search across Version 17.0 scenarios, controls and sources. No personal data.","inputSchema":{"type":"object","properties":{"query":{"type":"string","maxLength":2400},"limit":{"type":"integer","minimum":1,"maximum":20}},"required":["query"],"additionalProperties":false}},
      {"name":"kb_explain","description":"Explain a knowledge ID with original provenance and safety limits.","inputSchema":{"type":"object","properties":{"id":{"type":"string"}},"required":["id"],"additionalProperties":false}},
      {"name":"kb_trace","description":"Read-only graph traversal from a scenario to mapped controls and rights safeguards.","inputSchema":{"type":"object","properties":{"id":{"type":"string"}},"required":["id"],"additionalProperties":false}},
      {"name":"kb_assess","description":"Advisory-only conditional rule evaluation using whitelisted anonymous boolean facts; never legal certification.","inputSchema":{"type":"object","properties":{"facts":{"type":"object","description":"Whitelisted aggregate booleans only. No individual records."}},"required":["facts"],"additionalProperties":false}},
      {"name":"kb_ask","description":"Read-only deterministic retrieval and evidence-review plan for administrators, educators and policymakers.","inputSchema":{"type":"object","properties":{"question":{"type":"string","maxLength":2400},"role":{"type":"string","enum":["general","administrator","educator","policymaker","auditor"]}},"required":["question"],"additionalProperties":false}}
    ]});
    for tool in list["tools"].as_array_mut().unwrap() {
        tool["annotations"] = json!({"readOnlyHint":true,"destructiveHint":false,"idempotentHint":true,"openWorldHint":false});
    }
    let assessment = &mut list["tools"][3]["inputSchema"]["properties"];
    assessment["as_of"] = json!({"type":"string","pattern":"^[0-9]{4}-[0-9]{2}-[0-9]{2}$","description":"Explicit UTC evaluation date. Omit to use the frozen KB reference date, never an implicit clock."});
    assessment["expected_kb_version"] =
        json!({"type":"string","description":"Reject if a different KB version is installed."});
    list
}
fn tool_call(kb: &KnowledgeBase, name: &str, args: &Value) -> Result<Value, String> {
    let fields: &[&str] = match name {
        "kb_search" => &["query", "limit"],
        "kb_explain" | "kb_trace" => &["id"],
        "kb_assess" => &["facts", "as_of", "expected_kb_version"],
        "kb_ask" => &["question", "role"],
        _ => return Err("Unknown or forbidden tool".into()),
    };
    let object = args.as_object().ok_or("Arguments must be an object")?;
    if object.keys().any(|k| !fields.contains(&k.as_str())) {
        return Err("Unexpected tool argument; input redacted".into());
    }
    let string = |key: &str| -> Result<&str, String> {
        args.get(key)
            .and_then(Value::as_str)
            .ok_or_else(|| "Missing or invalid tool argument; input redacted".into())
    };
    match name {
        "kb_search" => {
            let limit = match args.get("limit") {
                None => 8,
                // JSON Schema integers include integral numeric representations
                // such as 2.0 and 2e0. Check integrality and the bounded range
                // before converting; strings, fractions and outliers fail.
                Some(value) => value
                    .as_f64()
                    .filter(|v| v.fract() == 0.0 && (1.0..=20.0).contains(v))
                    .map(|v| v as u64)
                    .ok_or("Limit must be 1 to 20")?,
            };
            Ok(
                json!({"hits":kb.search(string("query")?,limit as usize)?,"knowledgebase_version":kb.rules.kb_version,"advisory_only":true}),
            )
        }
        "kb_explain" | "kb_trace" => {
            let id = string("id")?;
            if !crate::privacy::knowledge_id(id) {
                return Err("Invalid knowledge ID; input redacted".into());
            }
            let data = if name == "kb_explain" {
                kb.explain(id)
            } else {
                kb.trace(id)
            };
            if data.get("error").is_some()
                || data.get("item").and_then(|x| x.get("error")).is_some()
            {
                return Err("Unknown knowledge ID; input redacted".into());
            }
            Ok(data)
        }
        "kb_assess" => {
            let facts: Facts =
                serde_json::from_value(args.get("facts").cloned().ok_or("Facts required")?)
                    .map_err(|_| "Facts must be a public Boolean map; input redacted")?;
            let context = |key: &str| -> Result<Option<&str>, String> {
                match args.get(key) {
                    None => Ok(None),
                    Some(v) => v
                        .as_str()
                        .map(Some)
                        .ok_or_else(|| "Context fields must be strings; input redacted".into()),
                }
            };
            serde_json::to_value(kb.evaluate_with_context(
                &facts,
                context("as_of")?,
                context("expected_kb_version")?,
            )?)
            .map_err(|_| "Response serialization failed".into())
        }
        "kb_ask" => {
            let role = match args.get("role") {
                None => "general",
                Some(v) => v.as_str().ok_or("Audience must be a string")?,
            };
            serde_json::to_value(kb.ask_for_role(string("question")?, role)?)
                .map_err(|_| "Response serialization failed".into())
        }
        _ => unreachable!(),
    }
}

fn rpc_error(id: Value, code: i32, msg: &str) -> Value {
    json!({"jsonrpc":"2.0","id":id,"error":{"code":code,"message":msg}})
}

#[derive(Default)]
struct Session {
    initialized: bool,
    ready: bool,
}
impl Session {
    fn handle(&mut self, kb: &KnowledgeBase, msg: Value) -> Option<Value> {
        let Some(object) = msg.as_object() else {
            return Some(rpc_error(Value::Null, -32600, "Request must be an object"));
        };
        let id = msg.get("id").cloned().unwrap_or(Value::Null);
        let valid_id = match &id {
            Value::Null => !object.contains_key("id"),
            Value::String(s) => crate::privacy::knowledge_id(s),
            Value::Number(n) => n.is_i64() || n.is_u64(),
            _ => false,
        };
        if !valid_id
            || msg["jsonrpc"] != "2.0"
            || !msg["method"].is_string()
            || object
                .keys()
                .any(|k| !["jsonrpc", "id", "method", "params"].contains(&k.as_str()))
        {
            return Some(rpc_error(
                Value::Null,
                -32600,
                "Invalid request; input redacted",
            ));
        }
        let method = msg["method"].as_str().unwrap();
        let notification = !object.contains_key("id");
        let params = msg.get("params").cloned().unwrap_or(json!({}));
        if !params.is_object() {
            return if notification {
                None
            } else {
                Some(rpc_error(id, -32602, "Parameters must be an object"))
            };
        }
        if notification {
            if method == "notifications/initialized" && self.initialized {
                self.ready = true;
            }
            return None;
        }
        match method {
            "initialize" => {
                if self.initialized {
                    return Some(rpc_error(id, -32600, "Already initialized"));
                }
                if !params["protocolVersion"].is_string()
                    || !params["capabilities"].is_object()
                    || !params["clientInfo"]["name"].is_string()
                    || !params["clientInfo"]["version"].is_string()
                {
                    return Some(rpc_error(id, -32602, "Invalid initialization parameters"));
                }
                self.initialized = true;
                Some(json!({"jsonrpc":"2.0","id":id,"result":{
                    "protocolVersion":PROTOCOL,"capabilities":{"tools":{"listChanged":false}},
                    "serverInfo":{"name":"stm-neurosymbolic","version":env!("CARGO_PKG_VERSION")},
                    "instructions":"Read-only public draft advice. No personal input, enforcement, legal certification or deployment authorization. Supplied facts are not authenticated. Human review required."
                }}))
            }
            "ping" => Some(json!({"jsonrpc":"2.0","id":id,"result":{}})),
            _ if !self.ready => Some(rpc_error(
                id,
                -32600,
                "Initialize and send initialized notification first",
            )),
            "tools/list" => {
                if params.as_object().unwrap().keys().any(|k| k != "_meta") {
                    return Some(rpc_error(id, -32602, "Unexpected list parameter"));
                }
                let mut tools = tool_list();
                let properties:serde_json::Map<String,Value>=kb.fact_catalog.facts.iter().map(|fact|(
                    fact.fact.clone(),json!({"type":"boolean","description":format!("True: {} False: {} Evidence: {}",fact.true_means,fact.false_means,fact.evidence_required)})
                )).collect();
                tools["tools"][3]["inputSchema"]["properties"]["facts"] = json!({"type":"object","properties":properties,"additionalProperties":false,"maxProperties":80});
                Some(json!({"jsonrpc":"2.0","id":id,"result":tools}))
            }
            "tools/call" => {
                if params
                    .as_object()
                    .unwrap()
                    .keys()
                    .any(|k| !["name", "arguments", "_meta"].contains(&k.as_str()))
                    || !params["name"].is_string()
                {
                    return Some(rpc_error(id, -32602, "Invalid tool call parameters"));
                }
                let name = params["name"].as_str().unwrap();
                let args = params.get("arguments").cloned().unwrap_or(json!({}));
                let result = match tool_call(kb, name, &args) {
                    Ok(data) => {
                        json!({"content":[{"type":"text","text":data.to_string()}],"isError":false})
                    }
                    Err(error) => json!({"content":[{"type":"text","text":error}],"isError":true}),
                };
                Some(json!({"jsonrpc":"2.0","id":id,"result":result}))
            }
            _ => Some(rpc_error(id, -32601, "Unsupported MCP method")),
        }
    }
}

pub fn run<R: BufRead, W: Write>(
    kb: &KnowledgeBase,
    mut input: R,
    mut output: W,
) -> Result<(), String> {
    let mut session = Session::default();
    loop {
        let (response, stop) =
            match crate::privacy::bounded_line(&mut input, crate::privacy::MAX_REQUEST_BYTES) {
                Ok(None) => break,
                Err(_) => (
                    Some(rpc_error(
                        Value::Null,
                        -32600,
                        "Input limit or stream error; session closed",
                    )),
                    true,
                ),
                Ok(Some(line)) => match crate::json_input::value(&line) {
                    Ok(message) => (session.handle(kb, message), false),
                    Err(_) => (
                        Some(rpc_error(
                            Value::Null,
                            -32700,
                            "Invalid JSON; content redacted",
                        )),
                        false,
                    ),
                },
            };
        if let Some(response) = response {
            writeln!(output, "{response}").map_err(|_| "Output stream unavailable")?;
            output.flush().map_err(|_| "Output stream unavailable")?;
        }
        if stop {
            break;
        }
    }
    Ok(())
}

pub fn serve(kb: &KnowledgeBase) -> Result<(), String> {
    run(kb, io::stdin().lock(), io::stdout().lock())
}

#[cfg(test)]
mod tests {
    use super::*;
    #[test]
    fn tool_list_is_read_only() {
        let tools = tool_list();
        let names = tools["tools"].as_array().unwrap();
        assert_eq!(names.len(), 5);
        for t in names {
            assert_eq!(t["annotations"]["readOnlyHint"], true);
        }
    }
}

#[cfg(test)]
mod protocol_tests {
    use super::*;
    use std::io::Cursor;
    fn init() -> Value {
        json!({"jsonrpc":"2.0","id":1,"method":"initialize","params":{"protocolVersion":"unsupported-version","capabilities":{},"clientInfo":{"name":"synthetic-test","version":"1"}}})
    }
    fn ready() -> (KnowledgeBase, Session) {
        let kb = KnowledgeBase::embedded().unwrap();
        let mut session = Session::default();
        let response = session.handle(&kb, init()).unwrap();
        assert_eq!(response["result"]["protocolVersion"], PROTOCOL);
        assert!(session
            .handle(
                &kb,
                json!({"jsonrpc":"2.0","method":"notifications/initialized"})
            )
            .is_none());
        (kb, session)
    }
    fn call(name: &str, args: Value) -> Value {
        json!({"jsonrpc":"2.0","id":2,"method":"tools/call","params":{"name":name,"arguments":args}})
    }
    #[test]
    fn initialization_is_required_and_notifications_have_no_responses() {
        let kb = KnowledgeBase::embedded().unwrap();
        let mut session = Session::default();
        assert!(session
            .handle(&kb, call("kb_search", json!({"query":"AI"})))
            .unwrap()
            .get("error")
            .is_some());
        let (_, mut session) = ready();
        assert!(session.handle(&kb, init()).unwrap().get("error").is_some());
        assert!(session
            .handle(&kb, json!({"jsonrpc":"2.0","method":"ping"}))
            .is_none());
    }
    #[test]
    fn all_read_only_tools_work_and_bad_arguments_fail_without_echo() {
        let (kb, mut session) = ready();
        for (name, args) in [
            ("kb_search", json!({"query":"AI","limit":8})),
            ("kb_explain", json!({"id":"WA-123"})),
            ("kb_trace", json!({"id":"T01"})),
            ("kb_assess", json!({"facts":{}})),
            (
                "kb_assess",
                json!({"facts":{},"as_of":"2026-10-26","expected_kb_version":"17.0-NSAI.4"}),
            ),
            (
                "kb_ask",
                json!({"question":"gunfire sensor","role":"educator"}),
            ),
        ] {
            assert_eq!(
                session.handle(&kb, call(name, args)).unwrap()["result"]["isError"],
                false
            );
        }
        let marker = ["synthetic", "@", "example.invalid"].concat();
        for (name, args) in [
            ("kb_search", json!({"query":marker})),
            ("kb_search", json!({"query":"AI","limit":0})),
            ("kb_assess", json!({"facts":{},"as_of":"2026-02-30"})),
            (
                "kb_assess",
                json!({"facts":{},"expected_kb_version":"unavailable-version"}),
            ),
            ("kb_search", json!({"query":"AI","limit":"8"})),
            ("kb_ask", json!({"question":"AI","role":false})),
            ("kb_assess", json!({"facts":{marker.clone():true}})),
            ("kb_search", json!({"query":"AI","extra":marker})),
            ("kb_explain", json!({"id":"UNKNOWN"})),
            ("kb_trace", json!({"id":marker})),
            ("write_policy", json!({})),
        ] {
            let response = session.handle(&kb, call(name, args)).unwrap();
            assert_eq!(response["result"]["isError"], true);
            assert!(!response.to_string().contains(&marker));
        }
    }
    #[test]
    fn malformed_and_oversized_streams_have_bounded_redacted_responses() {
        let kb = KnowledgeBase::embedded().unwrap();
        let mut output = Vec::new();
        run(
            &kb,
            Cursor::new(b"invalid-json\n{\"jsonrpc\":\"2.0\",\"id\":9,\"method\":\"ping\"}\n"),
            &mut output,
        )
        .unwrap();
        let messages: Vec<Value> = String::from_utf8(output)
            .unwrap()
            .lines()
            .map(|x| serde_json::from_str(x).unwrap())
            .collect();
        assert_eq!(messages.len(), 2);
        assert_eq!(messages[0]["error"]["code"], -32700);
        assert_eq!(messages[1]["id"], 9);
        let mut output = Vec::new();
        run(
            &kb,
            Cursor::new(vec![b'x'; crate::privacy::MAX_REQUEST_BYTES + 1]),
            &mut output,
        )
        .unwrap();
        assert!(output.len() < 200);
        assert!(serde_json::from_slice::<Value>(&output)
            .unwrap()
            .get("error")
            .is_some());
    }
}
