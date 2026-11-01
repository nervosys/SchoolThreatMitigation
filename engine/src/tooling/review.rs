use super::{base::*, release, replay};
use crate::engine::KnowledgeBase;
use serde_json::{json, Value};
use std::{collections::BTreeSet, path::Path};
pub fn packet(root: &Path, pin: &str, date: &str) -> Result<Value> {
    release::verify(root, Some(pin))?;
    let kb = KnowledgeBase::load(root)?;
    let meta = metadata(root)?;
    if meta["kb_version"] != kb.rules.kb_version {
        return Err("Packet KB version mismatch".into());
    }
    let source = replay::knowledge(&kb);
    let rubric: Value = crate::json_input::value(include_bytes!("../../kb/review_rubric.json"))
        .map_err(|_| "Review rubric invalid")?;
    let manifest = read(&root.join("RELEASE_MANIFEST.json"))?;
    let mut items = vec![];
    for (kind, values, key, pointer) in [
        (
            "rule",
            source["rule_register"]["rules"].as_array().unwrap(),
            "id",
            "/rule_register/rules",
        ),
        (
            "fact",
            source["fact_catalog"]["facts"].as_array().unwrap(),
            "fact",
            "/fact_catalog/facts",
        ),
        (
            "source",
            source["sources"].as_array().unwrap(),
            "id",
            "/sources",
        ),
        (
            "scenario",
            source["scenarios"].as_array().unwrap(),
            "id",
            "/scenarios",
        ),
        (
            "control",
            source["controls"].as_array().unwrap(),
            "id",
            "/controls",
        ),
    ] {
        for (index, record) in values.iter().enumerate() {
            let id = text(record, key)?;
            let mut roles = vec!["independent_domain", "privacy_and_rights"];
            if kind == "rule" {
                roles.push("technical_reasoning");
            }
            if kind == "source" || (kind == "rule" && record["kind"] == "statutory_reference") {
                roles.push("qualified_authority_or_counsel");
            }
            items.push(json!({"review_id":format!("{kind}:{id}"),"kind":kind,"record_id":id,"knowledge_pointer":format!("{pointer}/{index}"),"record_sha256":json_hash(record),"required_roles":roles,"required_checks":rubric["checks"][kind],"review":pending()}));
        }
    }
    let records = arr(&manifest, "files")?;
    let prefix = format!("{}/", text(&meta, "publication_directory")?);
    let mut count = 0;
    for record in records {
        let name = text(record, "path")?;
        if (name.starts_with(&prefix) || name.starts_with("media/v17.0/"))
            && ["pdf", "html", "png", "pptx"].contains(
                &Path::new(name)
                    .extension()
                    .and_then(|s| s.to_str())
                    .unwrap_or(""),
            )
        {
            count += 1;
            items.push(json!({"review_id":format!("publication:{count:02}"),"kind":"publication","record_id":name,"artifact":record,"required_roles":["independent_editorial","accessibility","privacy_and_rights"],"required_checks":rubric["checks"]["publication"],"review":pending()}));
        }
    }
    items.sort_by_key(|v| v["review_id"].as_str().unwrap().to_string());
    let mut tables = vec![];
    let mut total = 0;
    for r in &kb.rules.rules {
        let names: Vec<_> = r
            .when
            .iter()
            .chain(&r.check)
            .map(|p| p.fact.clone())
            .collect::<BTreeSet<_>>()
            .into_iter()
            .collect();
        let cases = replay::combinations(&names)?;
        total += cases.len();
        if total > 200000 {
            return Err("Review case limit".into());
        }
        let rows:Vec<_>=cases.iter().map(|facts|{let(p,m,b)=replay::rule(r,facts);json!({"synthetic_facts":facts,"rule_proof":p,"missing_facts":m,"mismatched_facts":b})}).collect();
        tables.push(json!({"rule_id":r.id,"classification":"synthetic_rule_truth_table","fact_names":names,"cases":rows}));
    }
    let evidence: Vec<_> = records
        .iter()
        .filter(|r| {
            text(r, "path").is_ok_and(|s| {
                s.starts_with("qa/")
                    && !s.starts_with("qa/baselines/")
                    && !s.contains("validation_v17_0")
            })
        })
        .collect();
    let mut version = serde_json::Map::new();
    for key in [
        "publication_id",
        "engine_version",
        "candidate_label",
        "kb_version",
        "schema_version",
    ] {
        version.insert(key.into(), meta[key].clone());
    }
    let gates: Vec<_> = arr(&rubric, "gates")?
        .iter()
        .map(|id| json!({"gate_id":id,"review":pending()}))
        .collect();
    Ok(
        json!({"packet_specification":"stm-independent-review-packet-1","source_manifest_sha256":pin,"release":version,"as_of_utc":date,"knowledge_sha256":kb.knowledge_sha256(),"knowledge":source,"source_review":replay::reviews(&kb,Some(date))?,"check_definitions":rubric["criteria"],"review_items":items,"synthetic_rule_truth_tables":tables,"synthetic_case_count":total,"engineering_evidence_artifacts":evidence,"release_gates":gates,"acceptance_state":"unaccepted","independent_acceptance":false,"deployment_authorization":false,"instructions":"Immutable public evidence packet. Keep authenticated human responses in a separate controlled record using opaque references. No private assessments, reviewer identities, approvals, source passages, or signatures have been invented. Verification proves release/date/content binding only."}),
    )
}
fn pending() -> Value {
    json!({"status":"pending","reviewer_ref":null,"evidence_ref":null})
}
pub fn verify(root: &Path, pin: &str, date: &str, provided: &Value) -> Result<Value> {
    let expected = packet(root, pin, date)?;
    if canonical(&expected) != canonical(provided) {
        return Err("Review packet mismatch".into());
    }
    Ok(
        json!({"packet_verified":true,"packet_sha256":json_hash(provided),"review_item_count":arr(provided,"review_items")?.len(),"release_gate_count":arr(provided,"release_gates")?.len(),"synthetic_case_count":provided["synthetic_case_count"],"acceptance_state":"unaccepted","independent_acceptance":false,"deployment_authorization":false}),
    )
}
