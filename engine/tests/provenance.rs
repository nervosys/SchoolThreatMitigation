use serde_json::{json, Value};
use std::{collections::BTreeSet, path::Path, time::Duration};
use stm_neurosymbolic::{engine::KnowledgeBase, tooling::process};

fn ids(kb: &KnowledgeBase) -> Vec<String> {
    kb.scenarios
        .iter()
        .map(|r| r.id.clone())
        .chain(kb.controls.iter().map(|r| r.id.clone()))
        .chain(kb.rules.rules.iter().map(|r| r.id.clone()))
        .chain(kb.sources.iter().map(|r| r.id.clone()))
        .chain(
            kb.fact_catalog
                .facts
                .iter()
                .map(|r| format!("FACT-{}", r.fact.replace('_', "-"))),
        )
        .collect()
}

#[test]
fn every_public_lookup_has_consistent_case_independent_resolved_provenance() {
    let kb = KnowledgeBase::embedded().unwrap();
    let known = ids(&kb);
    assert_eq!(known.len(), 113);
    for id in known {
        let canonical = kb.explain(&id);
        assert!(canonical.get("error").is_none());
        assert_eq!(canonical["legal_certification"], false);
        assert_eq!(canonical, kb.explain(&id.to_ascii_lowercase()));
        assert_eq!(canonical, kb.explain(&id.to_ascii_uppercase()));
        assert_eq!(kb.trace(&id.to_ascii_lowercase())["item"], canonical);
        let refs: Vec<String> = serde_json::from_value(canonical["source_refs"].clone()).unwrap();
        let unique: Vec<_> = refs
            .iter()
            .cloned()
            .collect::<BTreeSet<_>>()
            .into_iter()
            .collect();
        assert_eq!(refs, unique);
        let expected: Vec<_> = refs.iter().map(|id| kb.source(id).unwrap()).collect();
        assert_eq!(canonical["source_details"], json!(expected));
    }
    for id in ["T01", "P-01"] {
        let explanation = kb.explain(id);
        assert_eq!(explanation["source_refs"], json!(["SRC-04", "SRC-05"]));
        assert_eq!(
            explanation["provenance_scope"],
            "thematic_governance_trace_not_effectiveness_evidence"
        );
    }
    assert_eq!(kb.explain("L-01")["source_refs"], json!([]));
    assert_eq!(
        kb.explain("L-01")["provenance_scope"],
        "no_direct_source_mapping"
    );
    assert_eq!(
        kb.explain("g-001")["source_refs"],
        json!(["SRC-04", "SRC-05"])
    );
    assert_eq!(
        kb.explain("g-001")["provenance_scope"],
        "declared_rule_sources"
    );
    assert_eq!(kb.explain("src-04")["source_refs"], json!(["SRC-04"]));
    assert_eq!(kb.explain("src-04")["provenance_scope"], "source_record");
    for definition in &kb.fact_catalog.facts {
        let id = format!("FACT-{}", definition.fact.replace('_', "-"));
        let expected: BTreeSet<_> = definition.source_refs.iter().collect();
        let explanation = kb.explain(&id);
        assert_eq!(explanation["source_refs"], json!(expected));
        assert_eq!(explanation["provenance_scope"], "declared_fact_sources");
    }
    assert_eq!(
        kb.knowledge_sha256(),
        "2bcb941487fb138f3e014ff57a71140fcecd8e6bbe7fef5496abef2188b1f34c"
    );
}

#[test]
fn cli_mcp_search_and_ask_return_matching_lookup_citations() {
    let kb = KnowledgeBase::embedded().unwrap();
    let binary = Path::new(env!("CARGO_BIN_EXE_stm-neurosymbolic"));
    let known = ids(&kb);
    let calls: Vec<_> = known
        .iter()
        .enumerate()
        .map(|(index, id)| {
            process::call(
                index + 2,
                "kb_explain",
                json!({"id":id.to_ascii_lowercase()}),
            )
        })
        .collect();
    let responses = process::mcp(binary, &calls).unwrap();
    assert_eq!(responses.len(), 113);
    for (id, response) in known.iter().zip(responses) {
        assert_eq!(process::decoded(&response).unwrap(), kb.explain(id));
    }
    for id in ["t01", "p-01", "fact-ai-authorizes-physical-force"] {
        let bytes = process::run(
            binary,
            &["explain", id],
            &[],
            1024 * 1024,
            Duration::from_secs(30),
        )
        .unwrap();
        let cli: Value = serde_json::from_slice(&bytes).unwrap();
        assert_eq!(cli, kb.explain(id));
    }
    let search = kb.search("storage", 20).unwrap();
    assert!(!search.is_empty());
    for hit in search {
        let lookup = kb.explain(&hit.id);
        assert_eq!(lookup["source_refs"], json!(hit.source_refs));
        assert_eq!(lookup["source_details"], json!(hit.source_details));
        assert_eq!(lookup["provenance_scope"], hit.provenance_scope);
    }
    for audience in [
        "general",
        "administrator",
        "educator",
        "policymaker",
        "auditor",
    ] {
        let answer = kb.ask_for_role("storage", audience).unwrap();
        assert!(!answer.logical_verdicts_included);
        for hit in answer.recommendations {
            assert_eq!(
                kb.explain(&hit.id)["source_details"],
                json!(hit.source_details)
            );
        }
    }
}

#[test]
fn invalid_and_unknown_lookup_ids_do_not_echo_input_or_invent_sources() {
    let kb = KnowledgeBase::embedded().unwrap();
    for id in [
        ["synthetic", "@", "example.invalid"].concat(),
        "X".repeat(4096),
        "SYNTHETIC-MISSING".into(),
        "FACT-UNKNOWN-FACT".into(),
    ] {
        let explanation = kb.explain(&id);
        assert!(explanation.get("error").is_some());
        assert!(!explanation.to_string().contains(&id));
        assert!(explanation.get("source_details").is_none());
        let (refs, details, scope) = kb.provenance_for(&id);
        assert!(refs.is_empty() && details.is_empty());
        assert_eq!(scope, "no_direct_source_mapping");
    }
}
