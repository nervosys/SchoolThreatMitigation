use super::{base::*, process, replay};
use crate::engine::KnowledgeBase;
use serde::{Deserialize, Serialize};
use serde_json::{json, Value};
use std::{collections::BTreeSet, path::Path};
#[derive(Clone, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct Thresholds {
    pub min_hit_rate_at_k: f64,
    pub min_mean_recall_at_k: f64,
    pub min_mean_reciprocal_rank_at_k: Option<f64>,
    pub min_mean_precision_at_k: Option<f64>,
}
#[derive(Clone, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct Case {
    pub case_id: String,
    pub behavior: String,
    pub relevant_ids: Vec<String>,
    pub forbidden_ids: Vec<String>,
    pub query: Option<String>,
    pub synthetic_probe: Option<String>,
}
#[derive(Clone, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct Dataset {
    pub evaluation_specification: String,
    pub classification: String,
    pub top_k: u8,
    pub judgments_exhaustive: bool,
    pub thresholds: Thresholds,
    pub cases: Vec<Case>,
}
pub fn parse(data: &[u8], kb: &KnowledgeBase) -> Result<Dataset> {
    let raw = crate::json_input::value(data).map_err(|_| "Invalid dataset JSON")?;
    let schema: Value = serde_json::from_str(include_str!(
        "../../schemas/retrieval_evaluation.schema.json"
    ))
    .map_err(|_| "Dataset schema invalid")?;
    let validator = jsonschema::validator_for(&schema).map_err(|_| "Dataset schema invalid")?;
    if !validator.is_valid(&raw) {
        return Err("Invalid dataset schema".into());
    }
    let d: Dataset = crate::json_input::decode(data).map_err(|_| "Invalid evaluation schema")?;
    if d.evaluation_specification != "stm-retrieval-evaluation-1"
        || !["maintainer_fixture", "external_labels_unverified"]
            .contains(&d.classification.as_str())
        || !(1..=20).contains(&d.top_k)
        || d.cases.is_empty()
        || d.cases.len() > 200
    {
        return Err("Unsupported evaluation limits".into());
    }
    for value in [
        Some(d.thresholds.min_hit_rate_at_k),
        Some(d.thresholds.min_mean_recall_at_k),
        d.thresholds.min_mean_reciprocal_rank_at_k,
        d.thresholds.min_mean_precision_at_k,
    ]
    .into_iter()
    .flatten()
    {
        if !value.is_finite() || !(0.0..=1.0).contains(&value) {
            return Err("Invalid evaluation threshold".into());
        }
    }
    if !d.judgments_exhaustive && d.thresholds.min_mean_precision_at_k.is_some() {
        return Err("Precision requires exhaustive labels".into());
    }
    let ids: BTreeSet<_> = kb
        .scenarios
        .iter()
        .map(|r| r.id.clone())
        .chain(kb.controls.iter().map(|r| r.id.clone()))
        .chain(kb.sources.iter().map(|r| r.id.clone()))
        .chain(kb.rules.rules.iter().map(|r| r.id.clone()))
        .collect();
    let mut seen = BTreeSet::new();
    let mut positive = 0;
    for c in &d.cases {
        if c.case_id.is_empty()
            || c.case_id.len() > 64
            || !c
                .case_id
                .bytes()
                .all(|b| b.is_ascii_alphanumeric() || b"_.-".contains(&b))
            || !seen.insert(c.case_id.clone())
        {
            return Err("Invalid evaluation case identifier".into());
        }
        let relevant: BTreeSet<_> = c.relevant_ids.iter().collect();
        let forbidden: BTreeSet<_> = c.forbidden_ids.iter().collect();
        if relevant.len() != c.relevant_ids.len()
            || forbidden.len() != c.forbidden_ids.len()
            || !relevant.is_disjoint(&forbidden)
            || c.relevant_ids
                .iter()
                .chain(&c.forbidden_ids)
                .any(|id| !ids.contains(id))
        {
            return Err("Invalid evaluation labels".into());
        }
        match c.behavior.as_str() {
            "reject" => {
                if c.query.is_some()
                    || c.synthetic_probe.as_deref() != Some("identifier_marker")
                    || !relevant.is_empty()
                    || !forbidden.is_empty()
                {
                    return Err("Only fixed synthetic rejection probe allowed".into());
                }
            }
            "retrieve" | "abstain" => {
                if c.synthetic_probe.is_some() {
                    return Err("Unexpected probe".into());
                }
                crate::privacy::public_query(c.query.as_deref().ok_or("Public query required")?)?;
                if c.behavior == "retrieve" {
                    if relevant.is_empty() {
                        return Err("Relevant judgments required".into());
                    }
                    positive += 1;
                } else if !relevant.is_empty() {
                    return Err("Abstention judgment inconsistent".into());
                }
            }
            _ => return Err("Unknown evaluation behavior".into()),
        }
    }
    if positive == 0 {
        return Err("Positive cases required".into());
    }
    Ok(d)
}
pub fn evaluate(kb: &KnowledgeBase, data: &[u8], binary: &Path) -> Result<Value> {
    let d = parse(data, kb)?;
    let mut calls = vec![process::call(2, "kb_assess", json!({"facts":{}}))];
    for (i, c) in d.cases.iter().enumerate() {
        let query = if c.behavior == "reject" {
            "student id 1234567"
        } else {
            c.query.as_deref().ok_or("Query missing")?
        };
        calls.push(process::call(
            i + 3,
            "kb_search",
            json!({"query":query,"limit":d.top_k}),
        ));
    }
    let results = process::mcp(binary, &calls)?;
    replay::verify(
        kb,
        &json!({"facts":{}}),
        &process::decoded(&results[0])?,
        env!("CARGO_PKG_VERSION"),
    )?;
    let ids: BTreeSet<_> = kb
        .scenarios
        .iter()
        .map(|r| r.id.as_str())
        .chain(kb.controls.iter().map(|r| r.id.as_str()))
        .chain(kb.sources.iter().map(|r| r.id.as_str()))
        .chain(kb.rules.rules.iter().map(|r| r.id.as_str()))
        .collect();
    let mut rows = vec![];
    let (mut positives, mut hit, mut recall, mut rr, mut precision) = (0, 0.0, 0.0, 0.0, 0.0);
    let (mut negative_fail, mut forbidden, mut unexpected, mut redact, mut abstain, mut reject) =
        (0, 0, 0, 0, 0, 0);
    for (i, (c, result)) in d.cases.iter().zip(&results[1..]).enumerate() {
        let rejected = result["isError"] == true;
        let mut returned = vec![];
        if !rejected {
            let response = process::decoded(result)?;
            if response["knowledgebase_version"] != kb.rules.kb_version
                || response["advisory_only"] != true
            {
                return Err("Search envelope mismatch".into());
            }
            for h in arr(&response, "hits")? {
                let id = text(h, "id")?;
                if !ids.contains(id) || returned.contains(&id.to_string()) {
                    return Err("Unknown or repeated search record".into());
                }
                let refs = arr(h, "source_refs")?;
                let mut sources = vec![];
                let mut seen = BTreeSet::new();
                for r in refs {
                    let name = r.as_str().ok_or("Source ID invalid")?;
                    if !seen.insert(name) {
                        return Err("Repeated source reference".into());
                    }
                    sources.push(
                        kb.sources
                            .iter()
                            .find(|s| s.id == name)
                            .ok_or("Unknown source citation")?,
                    );
                }
                if canonical(&h["source_details"]) != canonical(&json!(sources))
                    || h["relevance"].as_u64().is_none()
                {
                    return Err("Citation consistency failed".into());
                }
                returned.push(id.to_string());
            }
            if returned.len() > d.top_k as usize {
                return Err("Search size limit".into());
            }
        }
        let found = returned
            .iter()
            .filter(|id| c.relevant_ids.contains(id))
            .count();
        forbidden += returned
            .iter()
            .filter(|id| c.forbidden_ids.contains(id))
            .count();
        unexpected += usize::from(rejected && c.behavior != "reject");
        redact += usize::from(
            c.behavior == "reject" && canonical(result).windows(7).any(|w| w == b"1234567"),
        );
        let mut row = json!({"case_number":i+1,"behavior":c.behavior,"returned_ids":returned});
        if c.behavior == "retrieve" {
            positives += 1;
            let h = if found > 0 { 1.0 } else { 0.0 };
            let r = found as f64 / c.relevant_ids.len() as f64;
            let rank = returned
                .iter()
                .position(|id| c.relevant_ids.contains(id))
                .map(|n| 1.0 / (n + 1) as f64)
                .unwrap_or(0.0);
            let p = found as f64 / d.top_k as f64;
            hit += h;
            recall += r;
            rr += rank;
            precision += p;
            row["hit_at_k"] = json!(h);
            row["recall_at_k"] = json!(r);
            row["reciprocal_rank_at_k"] = json!(rank);
            row["precision_at_k"] = if d.judgments_exhaustive {
                json!(p)
            } else {
                Value::Null
            };
        } else {
            let correct = if c.behavior == "reject" {
                reject += 1;
                rejected
            } else {
                abstain += 1;
                !rejected && returned.is_empty()
            };
            negative_fail += usize::from(!correct);
            row["negative_correct"] = json!(correct);
        }
        rows.push(row);
    }
    let n = positives as f64;
    let precision_value = if d.judgments_exhaustive {
        json!(precision / n)
    } else {
        Value::Null
    };
    let checks = json!({"min_hit_rate_at_k":hit/n>=d.thresholds.min_hit_rate_at_k,"min_mean_recall_at_k":recall/n>=d.thresholds.min_mean_recall_at_k,"min_mean_reciprocal_rank_at_k":d.thresholds.min_mean_reciprocal_rank_at_k.is_none_or(|v|rr/n>=v),"min_mean_precision_at_k":d.thresholds.min_mean_precision_at_k.is_none_or(|v|precision/n>=v),"no_negative_failures":negative_fail==0,"no_forbidden_hits":forbidden==0,"no_unexpected_rejections":unexpected==0,"no_redaction_failures":redact==0});
    Ok(
        json!({"evaluation_specification":d.evaluation_specification,"dataset_classification":d.classification,"dataset_sha256":hash(data),"top_k":d.top_k,"judgments_exhaustive":d.judgments_exhaustive,"thresholds":d.thresholds,"checks":checks,"thresholds_met":checks.as_object().unwrap().values().all(|v|v==true),"metrics":{"hit_rate_at_k":hit/n,"mean_recall_at_k":recall/n,"mean_reciprocal_rank_at_k":rr/n,"mean_precision_at_k":precision_value,"positive_case_count":positives,"abstention_case_count":abstain,"rejection_probe_count":reject,"negative_failure_count":negative_fail,"forbidden_hit_count":forbidden,"unexpected_rejection_count":unexpected,"redaction_failure_count":redact},"results":rows,"knowledge_sha256":kb.knowledge_sha256(),"returned_citations_checked":true,"independent_evaluation":false,"release_acceptance":false,"client":"native_rust_stdio"}),
    )
}
#[cfg(test)]
mod tests {
    use super::*;
    #[test]
    fn partial_labels_cannot_claim_precision_and_private_queries_fail() {
        let kb = KnowledgeBase::embedded().unwrap();
        let mut data: Value =
            serde_json::from_str(include_str!("../../examples/retrieval_evaluation_v1.json"))
                .unwrap();
        parse(&canonical(&data), &kb).unwrap();
        data["thresholds"]["min_mean_precision_at_k"] = json!(0.5);
        assert!(parse(&canonical(&data), &kb).is_err());
        data["thresholds"]["min_mean_precision_at_k"] = Value::Null;
        data["cases"][0]["query"] = json!(["synthetic", "@", "example.invalid"].join(""));
        assert!(parse(&canonical(&data), &kb).is_err());
    }
}
