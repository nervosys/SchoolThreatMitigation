//! A second rule interpreter. It never calls KnowledgeBase::evaluate.
use super::base::*;
use crate::{
    currency::Date,
    engine::KnowledgeBase,
    model::{AssessmentInput, Facts, Rule},
};
use serde_json::{json, Value};
use std::collections::BTreeMap;
pub fn validate(kb: &KnowledgeBase, request: &Value) -> Result<AssessmentInput> {
    let r: AssessmentInput =
        crate::json_input::decode(&canonical(request)).map_err(|_| "Invalid request envelope")?;
    if r.facts.len() > 80
        || r.facts
            .iter()
            .any(|(k, v)| !kb.admissible_facts().contains(k.as_str()) || !v.is_boolean())
    {
        return Err("Unapproved Boolean assertions".into());
    }
    if let Some(s) = r.site_label.as_deref() {
        if ![
            "synthetic",
            "public aggregate",
            "Illustrative district (synthetic data only)",
        ]
        .contains(&s)
        {
            return Err("Unapproved generic label".into());
        }
    }
    if r.expected_kb_version
        .as_deref()
        .is_some_and(|s| s != kb.rules.kb_version)
    {
        return Err("KB version mismatch".into());
    }
    if let Some(s) = r.as_of.as_deref() {
        Date::parse(s)?;
    }
    Ok(r)
}
fn steps(predicates: &[crate::model::Predicate], facts: &Facts) -> Vec<Value> {
    predicates
        .iter()
        .map(|p| {
            let observed = facts.get(&p.fact).cloned().unwrap_or(Value::Null);
            let outcome = if observed.is_null() {
                "unknown"
            } else if observed == p.equals {
                "matched"
            } else {
                "mismatched"
            };
            json!({"fact":p.fact,"expected":p.equals,"observed":observed,"outcome":outcome})
        })
        .collect()
}
pub fn rule(rule: &Rule, facts: &Facts) -> (Value, Vec<String>, Vec<String>) {
    let scope = steps(&rule.when, facts);
    let evaluated = scope.iter().all(|v| v["outcome"] == "matched");
    let requirements = if evaluated {
        steps(&rule.check, facts)
    } else {
        vec![]
    };
    let has = |s: &[Value], state: &str| s.iter().any(|v| v["outcome"] == state);
    let verdict = if has(&scope, "mismatched") {
        "not_applicable"
    } else if has(&scope, "unknown") {
        "scope_unknown"
    } else if has(&requirements, "mismatched") {
        if rule.kind == "safety_guardrail" {
            "deployment_hold"
        } else {
            "gap_for_review"
        }
    } else if has(&requirements, "unknown") {
        "needs_evidence"
    } else {
        "evidence_indicates_satisfied"
    };
    let inspected = if evaluated { &requirements } else { &scope };
    let missing = if verdict == "not_applicable" {
        vec![]
    } else {
        inspected
            .iter()
            .filter(|v| v["outcome"] == "unknown")
            .map(|v| v["fact"].as_str().unwrap().into())
            .collect()
    };
    let bad = requirements
        .iter()
        .filter(|v| v["outcome"] == "mismatched")
        .map(|v| v["fact"].as_str().unwrap().into())
        .collect();
    (
        json!({"rule_id":rule.id,"rule_kind":rule.kind,"applicability_operator":"all","applicability":scope,"requirements_evaluated":evaluated,"requirement_operator":"all","requirements":requirements,"verdict":verdict}),
        missing,
        bad,
    )
}
pub fn reviews(kb: &KnowledgeBase, date: Option<&str>) -> Result<Value> {
    let day = date.unwrap_or(&kb.rules.rules_reviewed_as_of);
    let parsed = Date::parse(day)?;
    let mut checks = vec![];
    for source in &kb.source_reviews.sources {
        let status = if source.status == "reviewed" {
            let start = Date::parse(
                source
                    .reviewed_on
                    .as_deref()
                    .ok_or("Review date required")?,
            )?;
            let end = Date::parse(
                source
                    .valid_through
                    .as_deref()
                    .ok_or("Review expiry required")?,
            )?;
            if parsed > end {
                "expired"
            } else if parsed < start {
                "review_date_in_future"
            } else {
                "current"
            }
        } else {
            source.status.as_str()
        };
        checks.push(json!({"source_id":source.source_id,"status":status,"review_required":status!="current","evidence_locator":source.evidence_locator,"note":source.review_note}));
    }
    Ok(
        json!({"as_of_utc":day,"as_of_basis":if date.is_some(){"explicit_evaluation_date"}else{"knowledgebase_reference_date_not_wall_clock"},"review_required":checks.iter().any(|v|v["review_required"]==true),"independent_acceptance":false,"checks":checks}),
    )
}
pub fn expected(kb: &KnowledgeBase, request: &Value, engine_version: &str) -> Result<Value> {
    let input = validate(kb, request)?;
    let review = reviews(kb, input.as_of.as_deref())?;
    let mut proofs = vec![];
    let mut findings = vec![];
    let mut summary: BTreeMap<String, usize> = BTreeMap::new();
    for r in &kb.rules.rules {
        let (proof, missing, bad) = rule(r, &input.facts);
        let status = proof["verdict"].as_str().unwrap();
        *summary.entry(status.into()).or_default() += 1;
        let sources: Vec<_> = r
            .source_refs
            .iter()
            .map(|id| {
                kb.sources
                    .iter()
                    .find(|s| s.id == *id)
                    .ok_or("Rule source unavailable")
            })
            .collect::<std::result::Result<_, _>>()?;
        findings.push(json!({"rule_id":r.id,"title":r.title,"classification":r.kind,"status":status,"priority":r.priority,"accountable_owner":r.accountable_owner,"missing_facts":missing,"mismatched_facts":bad,"source_refs":r.source_refs,"source_details":sources,"source_review_required":review["checks"].as_array().unwrap().iter().any(|c|c["review_required"]==true&&r.source_refs.iter().any(|id|c["source_id"]==*id)),"recommended_action":r.recommended_action,"rationale":r.rationale}));
        proofs.push(proof);
    }
    Ok(
        json!({"knowledgebase_version":kb.rules.kb_version,"classification":"public_advisory_assessment","legal_certification":false,"deployment_authorization":false,"data_handling":"Whitelisted Boolean self-attestations only; evidence is not authenticated. The engine does not persist supplied facts. Hosts must minimize intake and logging.","findings":findings,"summary":summary,"review_required":"Human/legal verification of evidence, Washington law and campus conditions is mandatory. Unknown is never a compliance pass.","source_review":review,"reasoning_certificate":{"specification":"stm-conjunctive-1","engine_version":engine_version,"knowledgebase_version":kb.rules.kb_version,"knowledge_sha256":json_hash(&knowledge(kb)),"assertions_authenticated":false,"asserted_facts":input.facts,"rule_proofs":proofs}}),
    )
}
pub fn verify(
    kb: &KnowledgeBase,
    request: &Value,
    assessment: &Value,
    version: &str,
) -> Result<Value> {
    if canonical(assessment) != canonical(&expected(kb, request, version)?) {
        return Err("Assessment replay mismatch; content redacted".into());
    }
    Ok(
        json!({"verified":true,"specification":"stm-conjunctive-1","knowledge_sha256":json_hash(&knowledge(kb)),"rule_count":kb.rules.rules.len(),"assertions_authenticated":false,"legal_certification":false,"deployment_authorization":false,"verifier":"independent_rust_interpreter"}),
    )
}
pub fn combinations(names: &[String]) -> Result<Vec<Facts>> {
    if names.len() > 10 {
        return Err("Truth table fact bound".into());
    }
    let count = 3usize.pow(names.len() as u32);
    let mut rows = Vec::with_capacity(count);
    for index in 0..count {
        let mut n = index;
        let mut row = Facts::new();
        for name in names.iter().rev() {
            match n % 3 {
                1 => {
                    row.insert(name.clone(), json!(false));
                }
                2 => {
                    row.insert(name.clone(), json!(true));
                }
                _ => {}
            }
            n /= 3;
        }
        rows.push(row);
    }
    Ok(rows)
}
pub fn knowledge(kb: &KnowledgeBase) -> Value {
    json!({"rule_register":kb.rules,"scenarios":kb.scenarios,"controls":kb.controls,"sources":kb.sources,"relations":kb.relations,"source_reviews":kb.source_reviews,"fact_catalog":kb.fact_catalog})
}
/// Validate proposals under the supported language without requiring a compiled KB ID.
pub fn validate_candidate(kb: &KnowledgeBase) -> Result<()> {
    if kb.rules.kb_version != kb.source_reviews.kb_version
        || kb.rules.kb_version != kb.fact_catalog.kb_version
    {
        return Err("Candidate metadata mismatch".into());
    }
    let mut normalized = kb.clone();
    let current = KnowledgeBase::embedded()?;
    normalized.rules.kb_version = current.rules.kb_version.clone();
    normalized.source_reviews.kb_version = current.rules.kb_version.clone();
    normalized.fact_catalog.kb_version = current.rules.kb_version;
    normalized.validate()
}
pub fn load_candidate(root: &std::path::Path) -> Result<KnowledgeBase> {
    fn parse<T: serde::de::DeserializeOwned>(root: &std::path::Path, name: &str) -> Result<T> {
        crate::json_input::decode(&bytes(&root.join(name), MAX_FILE)?)
            .map_err(|_| "Candidate schema invalid".into())
    }
    let mut kb = KnowledgeBase::embedded()?;
    kb.rules = parse(root, "engine/kb/rules_v17_0.json")?;
    let scenarios: crate::model::ScenarioRegister =
        parse(root, "governance/threat_scenarios_v17_0.json")?;
    kb.scenarios = scenarios.scenarios;
    let controls: crate::model::ControlRegister =
        parse(root, "governance/control_requirements_v17_0.json")?;
    kb.controls = controls.controls;
    let sources: crate::model::SourceRegister =
        parse(root, "governance/public_sources_v17_0.json")?;
    kb.sources = sources.sources;
    let legal: crate::model::LegalRegister = parse(root, "engine/kb/verified_legal_sources.json")?;
    kb.sources.extend(legal.legal_sources);
    if root.join("engine/kb/technology_sources.json").exists() {
        let technology: crate::model::SourceRegister =
            parse(root, "engine/kb/technology_sources.json")?;
        kb.sources.extend(technology.sources);
    }
    let graph: crate::model::RelationRegister = parse(root, "engine/kb/relations_v17_0.json")?;
    if graph.version != kb.rules.kb_version {
        return Err("Candidate relationship register version mismatch".into());
    }
    kb.relations = graph.edges;
    kb.source_reviews = parse(root, "engine/kb/source_reviews.json")?;
    kb.fact_catalog = parse(root, "engine/kb/fact_catalog.json")?;
    validate_candidate(&kb)?;
    Ok(kb)
}

#[cfg(test)]
mod tests {
    use super::*;
    #[test]
    fn every_shipped_truth_assignment_matches_separate_interpreter() {
        let kb = KnowledgeBase::embedded().unwrap();
        let mut count = 0;
        for r in &kb.rules.rules {
            let names: Vec<_> = r
                .when
                .iter()
                .chain(&r.check)
                .map(|p| p.fact.clone())
                .collect::<std::collections::BTreeSet<_>>()
                .into_iter()
                .collect();
            for facts in combinations(&names).unwrap() {
                let req = json!({"facts":facts});
                let actual = serde_json::to_value(kb.evaluate(&facts).unwrap()).unwrap();
                verify(&kb, &req, &actual, env!("CARGO_PKG_VERSION")).unwrap();
                count += 1;
            }
        }
        assert_eq!(count, 582);
    }
    #[test]
    fn changed_proofs_flags_facts_and_context_fail() {
        let kb = KnowledgeBase::embedded().unwrap();
        let request = json!({"facts":{}});
        let original = expected(&kb, &request, env!("CARGO_PKG_VERSION")).unwrap();
        for key in ["legal_certification", "deployment_authorization"] {
            let mut value = original.clone();
            value[key] = json!(true);
            assert!(verify(&kb, &request, &value, env!("CARGO_PKG_VERSION")).is_err());
        }
        let mut altered = original.clone();
        altered["reasoning_certificate"]["rule_proofs"][0]["verdict"] = json!("deployment_hold");
        assert!(verify(&kb, &request, &altered, env!("CARGO_PKG_VERSION")).is_err());
        assert!(verify(
            &kb,
            &json!({"facts":{"wa_public_school":true}}),
            &original,
            env!("CARGO_PKG_VERSION")
        )
        .is_err());
    }
}
