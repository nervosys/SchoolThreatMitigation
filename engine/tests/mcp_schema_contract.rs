use serde_json::{json, Value};
use std::io::Cursor;
use stm_neurosymbolic::{engine::KnowledgeBase, mcp, tooling::replay};

fn exchange(kb: &KnowledgeBase, name: &str, args: &[Value]) -> (Value, Vec<Value>) {
    let mut requests = vec![
        json!({"jsonrpc":"2.0","id":1,"method":"initialize","params":{"protocolVersion":"2025-06-18","capabilities":{},"clientInfo":{"name":"synthetic-schema-check","version":"1"}}}),
        json!({"jsonrpc":"2.0","method":"notifications/initialized"}),
        json!({"jsonrpc":"2.0","id":2,"method":"tools/list","params":{}}),
    ];
    requests.extend(args.iter().enumerate().map(|(i, arg)| json!({"jsonrpc":"2.0","id":i+3,"method":"tools/call","params":{"name":name,"arguments":arg}})));
    let input = requests
        .iter()
        .map(|r| format!("{r}\n"))
        .collect::<String>();
    let mut output = Vec::new();
    mcp::run(kb, Cursor::new(input.as_bytes()), &mut output).unwrap();
    let responses = output
        .split(|b| *b == b'\n')
        .filter(|r| !r.is_empty())
        .map(|r| serde_json::from_slice::<Value>(r).unwrap())
        .collect::<Vec<_>>();
    assert_eq!(responses.len(), args.len() + 2);
    for (i, response) in responses.iter().enumerate() {
        assert_eq!(response["id"], i + 1);
        assert!(response.get("error").is_none());
    }
    let schema = responses[1]["result"]["tools"]
        .as_array()
        .unwrap()
        .iter()
        .find(|t| t["name"] == name)
        .unwrap()["inputSchema"]
        .clone();
    (
        schema,
        responses
            .into_iter()
            .skip(2)
            .map(|r| r["result"].clone())
            .collect(),
    )
}

#[test]
fn advertised_search_integer_schema_matches_runtime_numeric_boundaries() {
    let kb = KnowledgeBase::embedded().unwrap();
    let literals = [
        "1", "1.0", "2", "2.0", "2e0", "20.00", "8e0", "2.5", "0", "0.0", "-1", "21", "1e100",
        "\"2\"", "true", "null", "[]", "{}",
    ];
    let arguments = literals
        .iter()
        .map(|limit| {
            serde_json::from_str::<Value>(&format!("{{\"query\":\"AI\",\"limit\":{limit}}}"))
                .unwrap()
        })
        .collect::<Vec<_>>();
    let (schema, results) = exchange(&kb, "kb_search", &arguments);
    let validator = jsonschema::validator_for(&schema).unwrap();
    for (i, (argument, result)) in arguments.iter().zip(&results).enumerate() {
        let valid = validator.is_valid(argument);
        assert_eq!(valid, i < 7, "Synthetic numeric schema fixture differs");
        assert_eq!(
            result["isError"], !valid,
            "Advertised schema and numeric runtime validation disagree for fixture {i}"
        );
    }
    assert_eq!(results[2], results[3]);
    assert_eq!(results[2], results[4]);
}

#[test]
fn every_advertised_boolean_fact_has_exact_definitions_and_replayable_results() {
    let kb = KnowledgeBase::embedded().unwrap();
    let arguments = kb
        .fact_catalog
        .facts
        .iter()
        .flat_map(|f| {
            [
                json!({"facts":{f.fact.clone():false}}),
                json!({"facts":{f.fact.clone():true}}),
            ]
        })
        .collect::<Vec<_>>();
    let (schema, results) = exchange(&kb, "kb_assess", &arguments);
    let validator = jsonschema::validator_for(&schema).unwrap();
    let definitions = schema["properties"]["facts"]["properties"]
        .as_object()
        .unwrap();
    assert_eq!(definitions.len(), 42);
    assert_eq!(schema["properties"]["facts"]["additionalProperties"], false);
    for fact in &kb.fact_catalog.facts {
        let definition = &definitions[&fact.fact];
        assert_eq!(definition["type"], "boolean");
        assert!(definition.get("default").is_none());
        assert_eq!(
            definition["description"],
            format!(
                "True: {} False: {} Evidence: {}",
                fact.true_means, fact.false_means, fact.evidence_required
            )
        );
    }
    assert_eq!(results.len(), 84);
    for (argument, result) in arguments.iter().zip(&results) {
        assert!(validator.is_valid(argument));
        assert_eq!(result["isError"], false);
        let assessment: Value =
            serde_json::from_str(result["content"][0]["text"].as_str().unwrap()).unwrap();
        replay::verify(&kb, argument, &assessment, env!("CARGO_PKG_VERSION")).unwrap();
    }
}

#[test]
fn fact_schemas_and_runtime_reject_nonbooleans_and_unknown_fields() {
    let kb = KnowledgeBase::embedded().unwrap();
    let invalid = [
        Value::Null,
        json!("synthetic"),
        json!(0),
        json!(0.5),
        json!([]),
        json!({}),
    ];
    let mut arguments = kb
        .fact_catalog
        .facts
        .iter()
        .flat_map(|fact| {
            invalid
                .iter()
                .map(move |value| json!({"facts":{fact.fact.clone():value}}))
        })
        .collect::<Vec<_>>();
    arguments.push(json!({"facts":{"synthetic_unknown_fact":true}}));
    arguments.push(json!({"facts":{},"synthetic_override":true}));
    let (schema, results) = exchange(&kb, "kb_assess", &arguments);
    let validator = jsonschema::validator_for(&schema).unwrap();
    assert_eq!(results.len(), 254);
    for (argument, result) in arguments.iter().zip(&results) {
        assert!(!validator.is_valid(argument));
        assert_eq!(result["isError"], true);
        let message = result["content"][0]["text"].as_str().unwrap();
        assert!(
            !message.contains("synthetic_unknown_fact") && !message.contains("synthetic_override")
        );
    }
}
