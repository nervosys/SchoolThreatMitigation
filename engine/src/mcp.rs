use crate::engine::KnowledgeBase;
use crate::model::Facts;
use serde_json::{json, Value};
use std::io::{self, BufRead, Write};

const PROTOCOL: &str = "2025-06-18";
fn tool_list() -> Value {
    json!({"tools":[
      {"name":"kb_search","description":"Read-only search across Version 17.0 scenarios, controls and sources. No personal data.","inputSchema":{"type":"object","properties":{"query":{"type":"string","maxLength":2400},"limit":{"type":"integer","minimum":1,"maximum":20}},"required":["query"],"additionalProperties":false}},
      {"name":"kb_explain","description":"Explain a knowledge ID with original provenance and safety limits.","inputSchema":{"type":"object","properties":{"id":{"type":"string"}},"required":["id"],"additionalProperties":false}},
      {"name":"kb_trace","description":"Read-only graph traversal from a scenario to mapped controls and rights safeguards.","inputSchema":{"type":"object","properties":{"id":{"type":"string"}},"required":["id"],"additionalProperties":false}},
      {"name":"kb_assess","description":"Advisory-only conditional rule evaluation using whitelisted anonymous boolean facts; never legal certification.","inputSchema":{"type":"object","properties":{"facts":{"type":"object","description":"Whitelisted aggregate booleans only. No individual records."}},"required":["facts"],"additionalProperties":false}},
      {"name":"kb_ask","description":"Read-only deterministic retrieval and evidence-review plan for administrators, educators and policymakers.","inputSchema":{"type":"object","properties":{"question":{"type":"string","maxLength":2400},"role":{"type":"string","enum":["general","administrator","educator","policymaker","auditor"]}},"required":["question"],"additionalProperties":false}}
    ]})
}
fn tool_call(kb:&KnowledgeBase,name:&str,args:&Value)->Result<Value,String> {
    match name {
        "kb_search"=>{
            let q=args.get("query").and_then(Value::as_str).ok_or("query must be a string")?;
            if q.len()>2400{return Err("Query too long".into());}
            let lim=args.get("limit").and_then(Value::as_u64).unwrap_or(8).clamp(1,20);
            Ok(json!({"hits":kb.search(q,lim as usize),"knowledgebase_version":kb.rules.kb_version,"advisory_only":true}))
        }
        "kb_explain"=>{
            let id=args.get("id").and_then(Value::as_str).ok_or("id must be a string")?;
            if id.len()>64{return Err("ID too long".into());}
            Ok(kb.explain(id))
        }
        "kb_trace"=>{
            let id=args.get("id").and_then(Value::as_str).ok_or("id must be a string")?;
            if id.len()>64{return Err("ID too long".into());}
            Ok(kb.trace(id))
        }
        "kb_assess"=>{
            let facts: Facts=serde_json::from_value(args.get("facts").cloned().ok_or("facts required")?)
                .map_err(|_|"facts must be JSON key/bool map")?;
            serde_json::to_value(kb.evaluate(&facts)?).map_err(|e|e.to_string())
        }
        "kb_ask"=>{
            let q=args.get("question").and_then(Value::as_str).ok_or("question must be string")?;
            let role=args.get("role").and_then(Value::as_str).unwrap_or("general");
            serde_json::to_value(kb.ask_for_role(q,role)?).map_err(|e|e.to_string())
        }
        _=>Err("Unknown or forbidden tool; all tools are read-only".into())
    }
}
fn rpc_error(id:Value,code:i32,msg:&str)->Value {
    json!({"jsonrpc":"2.0","id":id,"error":{"code":code,"message":msg}})
}
fn handle(kb:&KnowledgeBase,msg:Value)->Option<Value>{
    let id=match msg.get("id") {Some(v)=>v.clone(),None=>return None};
    let method=msg.get("method").and_then(Value::as_str).unwrap_or("");
    let params=msg.get("params").cloned().unwrap_or(json!({}));
    match method {
        "initialize"=>Some(json!({"jsonrpc":"2.0","id":id,"result":{
            "protocolVersion":PROTOCOL,"capabilities":{"tools":{"listChanged":false}},
            "serverInfo":{"name":"stm-neurosymbolic","version":"0.1.0"},
            "instructions":"Read-only public recommendation and compliance-support. Never send student or household PII. Rules—not the LLM—determine statuses. Human/legal review required."
        }})),
        "ping"=>Some(json!({"jsonrpc":"2.0","id":id,"result":{}})),
        "tools/list"=>Some(json!({"jsonrpc":"2.0","id":id,"result":tool_list()})),
        "tools/call"=>{
            let name=params.get("name").and_then(Value::as_str).unwrap_or("");
            let args=params.get("arguments").cloned().unwrap_or(json!({}));
            let result=match tool_call(kb,name,&args) {
                Ok(data)=>json!({"content":[{"type":"text","text":data.to_string()}],"isError":false}),
                Err(e)=>json!({"content":[{"type":"text","text":e}],"isError":true}),
            };
            Some(json!({"jsonrpc":"2.0","id":id,"result":result}))
        }
        _=>Some(rpc_error(id,-32601,"Unsupported MCP method"))
    }
}

pub fn serve(kb:&KnowledgeBase)->Result<(),String>{
    let stdin=io::stdin();let mut stdout=io::stdout().lock();
    for line in stdin.lock().lines(){
        let line=line.map_err(|e|e.to_string())?;
        if line.len()>65536 {continue;}
        let message:Value=match serde_json::from_str(&line){Ok(m)=>m,Err(_)=>continue};
        if let Some(response)=handle(kb,message) {
            writeln!(stdout,"{response}").map_err(|e|e.to_string())?;
            stdout.flush().map_err(|e|e.to_string())?;
        }
    }
    Ok(())
}

#[cfg(test)]
mod tests {
    use super::*;
    #[test]
    fn tool_list_is_read_only() {
        let tools=tool_list();
        let names=tools["tools"].as_array().unwrap();
        assert_eq!(names.len(),5);
        for t in names {assert!(t["name"].as_str().unwrap().starts_with("kb_"));}
    }
}
