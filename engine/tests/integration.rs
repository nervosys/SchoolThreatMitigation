use serde_json::{json, Value};
use std::process::Command;

fn call(args: &[&str]) -> Value {
    let exe = env!("CARGO_BIN_EXE_stm-neurosymbolic");
    let out = Command::new(exe)
        .args(args)
        .output()
        .expect("binary launches");
    assert!(
        out.status.success(),
        "stderr: {}",
        String::from_utf8_lossy(&out.stderr)
    );
    serde_json::from_slice(&out.stdout).expect("valid JSON")
}
#[test]
fn loads_all_core_v17_material() {
    let r = call(&["validate"]);
    assert_eq!(r["status"], "valid");
    assert_eq!(r["scenarios"], 18);
    assert_eq!(r["controls"], 15);
    assert_eq!(r["rules"], 18);
    assert_eq!(r["trace_edges"], 54);
    assert_eq!(r["deployment_certified"], false);
}
#[test]
fn trace_links_prevention_scenario_to_controls_and_safeguards() {
    let t = call(&["trace", "T01"]);
    let edges = t["relations"].as_array().unwrap();
    assert!(edges.iter().any(|r| r["to"] == "P-01"));
    assert!(edges.iter().any(|r| r["to"] == "G-001"));
}
#[test]
fn synthetic_assessment_identifies_gap_without_certification() {
    let fixture = concat!(
        env!("CARGO_MANIFEST_DIR"),
        "/examples/district_aggregate.json"
    );
    let r = call(&["assess", fixture]);
    assert_eq!(r["legal_certification"], false);
    let findings = r["findings"].as_array().unwrap();
    assert!(findings
        .iter()
        .any(|f| f["rule_id"] == "WA-1242" && f["status"] == "gap_for_review"));
    assert!(findings
        .iter()
        .any(|f| f["rule_id"] == "G-001" && f["status"] == "evidence_indicates_satisfied"));
}
#[test]
fn rejects_unapproved_personal_fact_keys() {
    let path = std::env::temp_dir().join(format!("stm_personal_test_{}.json", std::process::id()));
    std::fs::write(
        &path,
        json!({"facts":{"student_name":"A Person"}}).to_string(),
    )
    .unwrap();
    let out = Command::new(env!("CARGO_BIN_EXE_stm-neurosymbolic"))
        .args(["assess", path.to_str().unwrap()])
        .output()
        .unwrap();
    let _ = std::fs::remove_file(path);
    assert!(!out.status.success());
}

fn call_stdin(command: &str, input: &str) -> std::process::Output {
    use std::io::Write;
    let mut child = Command::new(env!("CARGO_BIN_EXE_stm-neurosymbolic"))
        .arg(command)
        .stdin(std::process::Stdio::piped())
        .stdout(std::process::Stdio::piped())
        .stderr(std::process::Stdio::piped())
        .spawn()
        .unwrap();
    child
        .stdin
        .take()
        .unwrap()
        .write_all(input.as_bytes())
        .unwrap();
    child.wait_with_output().unwrap()
}

#[test]
fn cli_errors_redact_unknown_commands_bad_json_and_private_labels() {
    let marker = ["synthetic", "@", "example.invalid"].concat();
    let output = Command::new(env!("CARGO_BIN_EXE_stm-neurosymbolic"))
        .arg(&marker)
        .output()
        .unwrap();
    assert!(!output.status.success());
    assert!(!String::from_utf8_lossy(&output.stderr).contains(&marker));
    for input in [
        format!("{{invalid:{marker}"),
        json!({"site_label":marker,"facts":{}}).to_string(),
        json!({"facts":{marker.clone():true}}).to_string(),
    ] {
        let output = Command::new(env!("CARGO_BIN_EXE_stm-neurosymbolic"))
            .args(["assess", "-"])
            .stdin(std::process::Stdio::piped())
            .stdout(std::process::Stdio::piped())
            .stderr(std::process::Stdio::piped())
            .spawn();
        let mut child = output.unwrap();
        use std::io::Write;
        child
            .stdin
            .take()
            .unwrap()
            .write_all(input.as_bytes())
            .unwrap();
        let output = child.wait_with_output().unwrap();
        assert!(!output.status.success());
        assert!(!String::from_utf8_lossy(&output.stderr).contains(&marker));
        assert!(output.stdout.is_empty());
    }
}

#[test]
fn stdin_queries_work_without_echo_and_search_rejects_identifiers() {
    let output = call_stdin("ask-stdin", "gunfire sensor");
    assert!(output.status.success());
    let response: Value = serde_json::from_slice(&output.stdout).unwrap();
    assert!(!response["question"]
        .as_str()
        .unwrap()
        .contains("gunfire sensor"));
    let output = call_stdin("search-stdin", "AI");
    assert!(output.status.success());
    let output = call_stdin(
        "search-stdin",
        &["synthetic", "@", "example.invalid"].concat(),
    );
    assert!(!output.status.success());
    assert!(output.stdout.is_empty());
}

#[test]
fn every_documented_query_command_returns_structured_data() {
    assert_eq!(call(&["sources"])["sources"].as_array().unwrap().len(), 20);
    for audience in [
        "general",
        "administrator",
        "educator",
        "policymaker",
        "auditor",
    ] {
        assert_eq!(
            call(&["ask", "firearm storage", audience])["audience"],
            audience
        );
    }
    assert!(!call(&["search", "AI"])["hits"]
        .as_array()
        .unwrap()
        .is_empty());
    assert_eq!(call(&["explain", "WA-123"])["kind"], "rule");
}

#[test]
fn binary_runs_outside_checkout_without_creating_intake_files() {
    let directory =
        std::env::temp_dir().join(format!("stm_public_relocation_{}", std::process::id()));
    std::fs::create_dir_all(&directory).unwrap();
    let binary = directory.join(if cfg!(windows) { "stm.exe" } else { "stm" });
    std::fs::copy(env!("CARGO_BIN_EXE_stm-neurosymbolic"), &binary).unwrap();
    let output = Command::new(&binary)
        .arg("validate")
        .current_dir(&directory)
        .output()
        .unwrap();
    assert!(output.status.success());
    assert_eq!(
        serde_json::from_slice::<Value>(&output.stdout).unwrap()["status"],
        "valid"
    );
    assert_eq!(std::fs::read_dir(&directory).unwrap().count(), 1);
    std::fs::remove_file(binary).unwrap();
    std::fs::remove_dir(directory).unwrap();
}

#[test]
#[cfg(windows)]
fn windows_launchers_work_from_paths_with_spaces_and_keep_caller_directory() {
    use std::io::Write;
    let directory =
        std::env::temp_dir().join(format!("stm public launcher {}", std::process::id()));
    let target = directory.join("target/release");
    std::fs::create_dir_all(&target).unwrap();
    let binary = target.join("stm-neurosymbolic.exe");
    std::fs::copy(env!("CARGO_BIN_EXE_stm-neurosymbolic"), &binary).unwrap();
    for launcher in ["RUN_WINDOWS.cmd", "RUN_MCP_WINDOWS.cmd"] {
        std::fs::copy(
            std::path::Path::new(env!("CARGO_MANIFEST_DIR")).join(launcher),
            directory.join(launcher),
        )
        .unwrap();
    }
    let output = Command::new("cmd.exe")
        .args(["/d", "/c", "RUN_WINDOWS.cmd", "validate"])
        .current_dir(&directory)
        .output()
        .unwrap();
    assert!(output.status.success());
    assert_eq!(
        serde_json::from_slice::<Value>(&output.stdout).unwrap()["status"],
        "valid"
    );
    let mut child = Command::new("cmd.exe")
        .args(["/d", "/c", "RUN_MCP_WINDOWS.cmd"])
        .current_dir(&directory)
        .stdin(std::process::Stdio::piped())
        .stdout(std::process::Stdio::piped())
        .stderr(std::process::Stdio::piped())
        .spawn()
        .unwrap();
    child
        .stdin
        .take()
        .unwrap()
        .write_all(b"{\"jsonrpc\":\"2.0\",\"id\":1,\"method\":\"ping\"}\n")
        .unwrap();
    let output = child.wait_with_output().unwrap();
    assert!(output.status.success());
    assert_eq!(
        serde_json::from_slice::<Value>(&output.stdout).unwrap()["id"],
        1
    );
    let caller = directory.join("caller");
    std::fs::create_dir(&caller).unwrap();
    std::fs::write(caller.join("input.json"), b"{\"facts\":{}}").unwrap();
    let output = Command::new("cmd.exe")
        .args(["/d", "/c", "call"])
        .arg(directory.join("RUN_WINDOWS.cmd"))
        .args(["assess", "input.json"])
        .current_dir(&caller)
        .output()
        .unwrap();
    assert!(
        output.status.success(),
        "relative assessment must use caller directory"
    );
    std::fs::remove_file(caller.join("input.json")).unwrap();
    std::fs::remove_dir(caller).unwrap();
    for file in [
        directory.join("RUN_WINDOWS.cmd"),
        directory.join("RUN_MCP_WINDOWS.cmd"),
        binary,
    ] {
        std::fs::remove_file(file).unwrap();
    }
    std::fs::remove_dir(target).unwrap();
    std::fs::remove_dir(directory.join("target")).unwrap();
    std::fs::remove_dir(directory).unwrap();
}
