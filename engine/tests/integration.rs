use serde_json::{json, Value};
use std::process::Command;

fn call(args:&[&str])->Value{
    let exe=env!("CARGO_BIN_EXE_stm-neurosymbolic");
    let out=Command::new(exe).args(args).output().expect("binary launches");
    assert!(out.status.success(),"stderr: {}",String::from_utf8_lossy(&out.stderr));
    serde_json::from_slice(&out.stdout).expect("valid JSON")
}
#[test]
fn loads_all_core_v17_material(){
    let r=call(&["validate"]);
    assert_eq!(r["status"],"valid");
    assert_eq!(r["scenarios"],18);
    assert_eq!(r["controls"],15);
    assert_eq!(r["rules"],18);
    assert_eq!(r["trace_edges"],54);
    assert_eq!(r["deployment_certified"],false);
}
#[test]
fn trace_links_prevention_scenario_to_controls_and_safeguards(){
    let t=call(&["trace","T01"]);
    let edges=t["relations"].as_array().unwrap();
    assert!(edges.iter().any(|r|r["to"]=="P-01"));
    assert!(edges.iter().any(|r|r["to"]=="G-001"));
}
#[test]
fn synthetic_assessment_identifies_gap_without_certification(){
    let fixture=concat!(env!("CARGO_MANIFEST_DIR"),"/examples/district_aggregate.json");
    let r=call(&["assess",fixture]);
    assert_eq!(r["legal_certification"],false);
    let findings=r["findings"].as_array().unwrap();
    assert!(findings.iter().any(|f|f["rule_id"]=="WA-1242" && f["status"]=="gap_for_review"));
    assert!(findings.iter().any(|f|f["rule_id"]=="G-001" && f["status"]=="evidence_indicates_satisfied"));
}
#[test]
fn rejects_unapproved_personal_fact_keys(){
    let path=std::env::temp_dir().join(format!("stm_personal_test_{}.json",std::process::id()));
    std::fs::write(&path, json!({"facts":{"student_name":"A Person"}}).to_string()).unwrap();
    let out=Command::new(env!("CARGO_BIN_EXE_stm-neurosymbolic"))
        .args(["assess",path.to_str().unwrap()]).output().unwrap();
    let _=std::fs::remove_file(path);
    assert!(!out.status.success());
}
