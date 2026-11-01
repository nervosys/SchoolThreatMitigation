use super::{base::*, process, replay};
use crate::engine::KnowledgeBase;
use serde_json::{json, Value};
use std::{collections::BTreeSet, path::Path};
pub fn matrix(kb: &KnowledgeBase, binary: &Path) -> Result<Value> {
    let mut requests = vec![];
    for rule in &kb.rules.rules {
        let names: Vec<_> = rule
            .when
            .iter()
            .chain(&rule.check)
            .map(|p| p.fact.clone())
            .collect::<BTreeSet<_>>()
            .into_iter()
            .collect();
        for facts in replay::combinations(&names)? {
            requests.push(json!({"facts":facts,"as_of":kb.rules.rules_reviewed_as_of,"expected_kb_version":kb.rules.kb_version}));
        }
    }
    if requests.len() > 200000 {
        return Err("Matrix total limit".into());
    }
    let calls: Vec<_> = requests
        .iter()
        .enumerate()
        .map(|(i, r)| process::call(i + 2, "kb_assess", r.clone()))
        .collect();
    let responses = process::mcp(binary, &calls)?;
    let mut outcomes = BTreeSet::new();
    for (req, response) in requests.iter().zip(responses) {
        let assessment = process::decoded(&response)?;
        replay::verify(kb, req, &assessment, env!("CARGO_PKG_VERSION"))?;
        for f in arr(&assessment, "findings")? {
            outcomes.insert(text(f, "status")?.to_string());
        }
    }
    if outcomes.len() != 6 {
        return Err("Outcome coverage incomplete".into());
    }
    Ok(
        json!({"passed":true,"check":"exhaustive_per_rule_mcp_truth_tables","assignments_checked":requests.len(),"complete_assessments_independently_verified":requests.len(),"knowledge_sha256":kb.knowledge_sha256(),"outcomes_observed":outcomes,"verifier":"independent_rust_interpreter","independent_acceptance":false}),
    )
}
pub fn client(kb: &KnowledgeBase, binary: &Path) -> Result<Value> {
    let inputs = [
        ("kb_search", json!({"query":"AI","limit":8.0})),
        ("kb_explain", json!({"id":"WA-123"})),
        ("kb_trace", json!({"id":"T01"})),
        ("kb_ask", json!({"question":"AI","role":"auditor"})),
        ("kb_assess", json!({"facts":{}})),
        ("kb_explain", json!({"id":"FACT-WA-PUBLIC-SCHOOL"})),
    ];
    let mut calls = vec![json!({"jsonrpc":"2.0","id":2,"method":"tools/list","params":{}})];
    for (i, (name, args)) in inputs.iter().enumerate() {
        calls.push(process::call(i + 3, name, args.clone()));
    }
    for (i, (name, args)) in [
        ("forbidden_mutation", json!({})),
        ("kb_assess", json!({"facts":{"unapproved_fact":true}})),
        ("kb_assess", json!({"facts":{"wa_public_school":"invalid"}})),
        ("kb_assess", json!({"facts":{},"as_of":"2026-02-30"})),
        (
            "kb_assess",
            json!({"facts":{},"expected_kb_version":"unsupported"}),
        ),
        ("kb_search", json!({"query":"AI","limit":0})),
        ("kb_explain", json!({"id":"SYNTHETIC-REJECTED-ID"})),
        ("kb_ask", json!({"question":"AI","role":"unsupported"})),
    ]
    .into_iter()
    .enumerate()
    {
        calls.push(process::call(i + 9, name, args));
    }
    let responses = process::mcp(binary, &calls)?;
    let tools = arr(&responses[0], "tools")?;
    if tools.len() != 5 {
        return Err("Tool discovery mismatch".into());
    }
    for tool in tools {
        let annotations = &tool["annotations"];
        if annotations["readOnlyHint"] != true
            || annotations["destructiveHint"] != false
            || annotations["idempotentHint"] != true
            || annotations["openWorldHint"] != false
        {
            return Err("Tool annotations invalid".into());
        }
    }
    let assessment_tool = tools
        .iter()
        .find(|t| t["name"] == "kb_assess")
        .ok_or("Assessment tool missing")?;
    let props = assessment_tool["inputSchema"]["properties"]["facts"]["properties"]
        .as_object()
        .ok_or("Fact definitions missing")?;
    if props.len() != kb.fact_catalog.facts.len()
        || props
            .values()
            .any(|v| v["type"] != "boolean" || v.get("default").is_some())
    {
        return Err("Fact definition defaults or types invalid".into());
    }
    for response in &responses[1..7] {
        process::decoded(response)?;
    }
    let actual = process::decoded(&responses[5])?;
    replay::verify(kb, &json!({"facts":{}}), &actual, env!("CARGO_PKG_VERSION"))?;
    if responses[7..].iter().any(|r| r["isError"] != true) {
        return Err("Rejected tool call accepted".into());
    }
    let second = process::mcp(
        binary,
        &[process::call(2, "kb_assess", json!({"facts":{}}))],
    )?;
    if canonical(&actual) != canonical(&process::decoded(&second[0])?) {
        return Err("Restart reasoning drift".into());
    }
    Ok(
        json!({"passed":true,"client":"native_rust_stdio","protocol":"2025-06-18","tool_count":5,"fact_definitions_checked":props.len(),"rejected_calls":8,"sessions_completed":2,"restart_reasoning_identical":true,"python_required":false,"independent_acceptance":false,"desktop_client_acceptance":false}),
    )
}
pub fn compare(before: &KnowledgeBase, after: &KnowledgeBase, date: &str) -> Result<Value> {
    crate::currency::Date::parse(date)?;
    replay::validate_candidate(before)?;
    replay::validate_candidate(after)?;
    let mut rows = vec![];
    let mut total = 0;
    let ids: BTreeSet<_> = before
        .rules
        .rules
        .iter()
        .chain(&after.rules.rules)
        .map(|r| r.id.clone())
        .collect();
    for id in ids {
        let left = before.rules.rules.iter().find(|r| r.id == id);
        let right = after.rules.rules.iter().find(|r| r.id == id);
        let names: Vec<_> = left
            .into_iter()
            .chain(right)
            .flat_map(|r| r.when.iter().chain(&r.check))
            .map(|p| p.fact.clone())
            .collect::<BTreeSet<_>>()
            .into_iter()
            .collect();
        let cases = replay::combinations(&names)?;
        total += cases.len();
        if total > 200000 {
            return Err("Comparison budget exceeded".into());
        }
        let mut verdicts = 0;
        let mut proofs = 0;
        let mut evidence = 0;
        let mut witnesses = vec![];
        for facts in &cases {
            let a = left.map(|r| replay::rule(r, facts));
            let b = right.map(|r| replay::rule(r, facts));
            let av = a
                .as_ref()
                .map(|r| r.0["verdict"].clone())
                .unwrap_or(Value::Null);
            let bv = b
                .as_ref()
                .map(|r| r.0["verdict"].clone())
                .unwrap_or(Value::Null);
            if av != bv {
                verdicts += 1;
                if witnesses.len() < 3 {
                    witnesses.push(json!({"synthetic_facts":facts,"baseline_verdict":av,"candidate_verdict":bv}));
                }
            }
            if a.as_ref().map(|r| &r.0) != b.as_ref().map(|r| &r.0) {
                proofs += 1;
            }
            if a.as_ref().map(|r| (&r.1, &r.2)) != b.as_ref().map(|r| (&r.1, &r.2)) {
                evidence += 1;
            }
        }
        rows.push(json!({"rule_id":id,"assignments_checked":cases.len(),"verdict_changes":verdicts,"proof_changes":proofs,"evidence_request_changes":evidence,"synthetic_verdict_witnesses":witnesses}));
    }
    let a = replay::knowledge(before);
    let b = replay::knowledge(after);
    let mut changes = serde_json::Map::new();
    for key in a.as_object().unwrap().keys() {
        if a[key] != b[key] {
            changes.insert(
                key.clone(),
                json!({"baseline_sha256":json_hash(&a[key]),"candidate_sha256":json_hash(&b[key])}),
            );
        }
    }
    let component_changes = changes.clone();
    for (key, a_values, b_values, id) in [
        ("scenarios", &a["scenarios"], &b["scenarios"], "id"),
        ("controls", &a["controls"], &b["controls"], "id"),
        ("sources", &a["sources"], &b["sources"], "id"),
        (
            "rules",
            &a["rule_register"]["rules"],
            &b["rule_register"]["rules"],
            "id",
        ),
        (
            "facts",
            &a["fact_catalog"]["facts"],
            &b["fact_catalog"]["facts"],
            "fact",
        ),
        (
            "source_reviews",
            &a["source_reviews"]["sources"],
            &b["source_reviews"]["sources"],
            "source_id",
        ),
    ] {
        let left: std::collections::BTreeMap<_, _> = a_values
            .as_array()
            .ok_or("Comparison array")?
            .iter()
            .map(|v| Ok((text(v, id)?.to_owned(), v)))
            .collect::<Result<_>>()?;
        let right: std::collections::BTreeMap<_, _> = b_values
            .as_array()
            .ok_or("Comparison array")?
            .iter()
            .map(|v| Ok((text(v, id)?.to_owned(), v)))
            .collect::<Result<_>>()?;
        let mut added = vec![];
        let mut removed = vec![];
        let mut changed = vec![];
        for name in left.keys() {
            if !right.contains_key(name) {
                removed.push(name.clone());
            }
        }
        for (name, value) in &right {
            if let Some(old) = left.get(name) {
                if old != value {
                    let fields: Vec<_> = old
                        .as_object()
                        .ok_or("Record object")?
                        .keys()
                        .chain(value.as_object().ok_or("Record object")?.keys())
                        .collect::<BTreeSet<_>>()
                        .into_iter()
                        .filter(|k| old[*k] != value[*k])
                        .collect();
                    changed.push(json!({"id":name,"fields":fields}));
                }
            } else {
                added.push(name.clone());
            }
        }
        changes.insert(key.into(),json!({"added":added,"removed":removed,"changed":changed,"order_changed":a_values.as_array().unwrap().iter().map(|v|&v[id]).collect::<Vec<_>>()!=b_values.as_array().unwrap().iter().map(|v|&v[id]).collect::<Vec<_>>()}));
    }
    let identical = before.knowledge_sha256() == after.knowledge_sha256();
    Ok(
        json!({"report_specification":"stm-knowledge-impact-1","as_of_utc":date,"knowledge_identical":identical,"same_version_content_changed":!identical&&before.rules.kb_version==after.rules.kb_version,"baseline":{"kb_version":before.rules.kb_version,"knowledge_sha256":before.knowledge_sha256()},"candidate":{"kb_version":after.rules.kb_version,"knowledge_sha256":after.knowledge_sha256()},"component_changes":component_changes,"changes":changes,"rules":rows,"assignments_checked":total,"exhaustive_within_supported_rule_language":true,"source_review":{"baseline":replay::reviews(before,Some(date))?,"candidate":replay::reviews(after,Some(date))?},"human_change_review_required":!identical,"independent_acceptance":false,"deployment_authorization":false}),
    )
}
