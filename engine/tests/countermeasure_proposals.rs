use serde_json::{json, Value};
use stm_neurosymbolic::{engine::KnowledgeBase, tooling::replay};

#[test]
fn requested_proposals_are_searchable_review_only_controls() {
    let kb = KnowledgeBase::embedded().unwrap();
    for (query, id) in [
        ("UxS drones uncrewed observation", "D-02"),
        ("automatic teargas chemical agent", "R-01"),
        ("self sealing hallway sections detention", "F-01"),
    ] {
        assert!(kb.search(query, 20).unwrap().iter().any(|hit| hit.id == id));
    }
    assert_eq!(kb.sources.len(), 20);
    for id in ["SRC-14", "SRC-15"] {
        assert!(kb.sources.iter().any(|source| source.id == id));
        assert_eq!(
            kb.source_reviews
                .sources
                .iter()
                .find(|source| source.source_id == id)
                .unwrap()
                .status,
            "unreviewed"
        );
    }
}

#[test]
fn chemical_force_and_confinement_fail_closed_without_scope_exemptions() {
    let kb = KnowledgeBase::embedded().unwrap();
    for (facts, rule_id) in [
        (
            json!({"automatic_chemical_agent_release_enabled":true,"ai_authorizes_physical_force":false}),
            "G-003",
        ),
        (
            json!({"weaponized_uxs_enabled":true,"ai_authorizes_physical_force":false}),
            "G-003",
        ),
        (
            json!({"automated_confinement_or_detention_enabled":true,"ai_authorizes_physical_force":false}),
            "G-003",
        ),
        (
            json!({"ai_authorizes_physical_force":true,"wa_public_school":false}),
            "G-003",
        ),
        (
            json!({"egress_obstructed_by_security":true,"ai_authorizes_physical_force":false}),
            "G-004",
        ),
    ] {
        let request = json!({"facts":facts});
        let result = serde_json::to_value(
            kb.evaluate(&serde_json::from_value(facts).unwrap())
                .unwrap(),
        )
        .unwrap();
        replay::verify(&kb, &request, &result, env!("CARGO_PKG_VERSION")).unwrap();
        assert_eq!(finding(&result, rule_id)["status"], "deployment_hold");
        assert_eq!(result["legal_certification"], false);
        assert_eq!(result["deployment_authorization"], false);
    }
    assert!(kb
        .evaluate(
            &serde_json::from_value(json!({"human_approved_automatic_detention":true})).unwrap()
        )
        .is_err());
}

#[test]
fn missing_evidence_and_non_force_assertions_never_become_approval() {
    let kb = KnowledgeBase::embedded().unwrap();
    let unknown = serde_json::to_value(kb.evaluate(&Default::default()).unwrap()).unwrap();
    for id in ["G-003", "G-004"] {
        assert_eq!(finding(&unknown, id)["status"], "needs_evidence");
    }
    let facts = serde_json::from_value(
        json!({"ai_authorizes_physical_force":false,"egress_obstructed_by_security":false}),
    )
    .unwrap();
    let declared = serde_json::to_value(kb.evaluate(&facts).unwrap()).unwrap();
    assert_eq!(declared["deployment_authorization"], false);
    assert_eq!(declared["legal_certification"], false);
    assert_eq!(declared["source_review"]["review_required"], true);
}

fn finding<'a>(assessment: &'a Value, id: &str) -> &'a Value {
    assessment["findings"]
        .as_array()
        .unwrap()
        .iter()
        .find(|finding| finding["rule_id"] == id)
        .unwrap()
}
