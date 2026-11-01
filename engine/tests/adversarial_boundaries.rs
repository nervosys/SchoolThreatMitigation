use stm_neurosymbolic::{engine::KnowledgeBase, tooling::adversarial};

#[test]
fn actual_mcp_preserves_authority_after_adversarial_requests_and_restart() {
    let kb = KnowledgeBase::embedded().unwrap();
    let result = adversarial::check(
        &kb,
        std::path::Path::new(env!("CARGO_BIN_EXE_stm-neurosymbolic")),
    )
    .unwrap();
    assert_eq!(result["passed"], true);
    assert_eq!(result["assessments_independently_replayed"], 6);
    assert_eq!(result["tampered_or_substituted_proofs_rejected"], 6);
    assert_eq!(result["forged_tool_or_argument_calls_rejected"], 10);
    assert_eq!(result["retrieval_injection_cases"], 15);
    assert_eq!(result["independent_acceptance"], false);
}
