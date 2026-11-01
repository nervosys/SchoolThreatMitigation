use serde_json::{json, Value};
use std::fs;
use stm_neurosymbolic::tooling::{base::write, validation};

#[test]
fn dependency_evidence_rejects_stale_inputs_ignored_findings_and_self_approval() {
    let dir = tempfile::tempdir().unwrap();
    let root = dir.path();
    fs::create_dir(root.join("engine")).unwrap();
    fs::create_dir(root.join("qa")).unwrap();
    let lock = include_bytes!("../Cargo.lock");
    let policy = include_bytes!("../../deny.toml");
    fs::write(root.join("engine/Cargo.lock"), lock).unwrap();
    fs::write(root.join("deny.toml"), policy).unwrap();
    let report: Value =
        serde_json::from_slice(include_bytes!("../../qa/dependency_review.json")).unwrap();
    let path = root.join("qa/dependency_review.json");
    write(&path, &report).unwrap();
    validation::dependency_snapshot(root).unwrap();
    fs::write(root.join("engine/Cargo.lock"), b"modified public fixture").unwrap();
    assert!(validation::dependency_snapshot(root).is_err());
    fs::write(root.join("engine/Cargo.lock"), lock).unwrap();
    fs::write(root.join("deny.toml"), b"modified public fixture").unwrap();
    assert!(validation::dependency_snapshot(root).is_err());
    fs::write(root.join("deny.toml"), policy).unwrap();
    for (pointer, value) in [
        ("/audit/known_vulnerabilities", json!(1)),
        ("/audit/ignored_advisories", json!(1)),
        ("/license_and_source_policy/source_errors", json!(1)),
        (
            "/license_and_source_policy/license_compatibility_acceptance",
            json!(true),
        ),
        ("/independent_acceptance", json!(true)),
        ("/database/revision", json!("invalid")),
    ] {
        let mut altered = report.clone();
        *altered.pointer_mut(pointer).unwrap() = value;
        write(&path, &altered).unwrap();
        assert!(validation::dependency_snapshot(root).is_err());
    }
}
