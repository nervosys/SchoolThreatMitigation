use serde_json::json;
use std::{
    io::{Read, Write},
    time::{Duration, Instant},
};
use stm_neurosymbolic::tooling::{base::*, process, release};
#[test]
#[ignore]
fn fixture_flood() {
    std::io::stdout().write_all(&vec![b'x'; 65536]).unwrap();
    std::io::stdout().flush().unwrap();
    std::thread::sleep(Duration::from_secs(30));
}
#[test]
#[ignore]
fn fixture_diagnostic() {
    eprintln!("public-synthetic-diagnostic");
    std::thread::sleep(Duration::from_secs(30));
}
#[test]
#[ignore]
fn fixture_sleep() {
    std::thread::sleep(Duration::from_secs(30));
}
#[test]
#[ignore]
fn fixture_echo() {
    let mut input = String::new();
    std::io::stdin().read_to_string(&mut input).unwrap();
    println!("PUBLIC-EOF-{input}");
}
#[test]
fn live_output_and_diagnostics_stop_before_deadline() {
    let exe = std::env::current_exe().unwrap();
    for name in ["fixture_flood", "fixture_diagnostic"] {
        let start = Instant::now();
        let error = process::run(
            &exe,
            &["--ignored", "--exact", name, "--nocapture"],
            b"",
            64,
            Duration::from_secs(10),
        )
        .unwrap_err();
        assert!(start.elapsed() < Duration::from_secs(8));
        assert!(!error.contains("public-synthetic-diagnostic"));
    }
}
#[test]
fn blocked_stdin_and_timeouts_fail_closed() {
    let exe = std::env::current_exe().unwrap();
    let error = process::run(
        &exe,
        &["--ignored", "--exact", "fixture_sleep", "--nocapture"],
        &vec![b'x'; 65536],
        4096,
        Duration::from_millis(150),
    );
    assert!(error.is_err());
}
#[test]
fn request_eof_is_delivered_without_files() {
    let exe = std::env::current_exe().unwrap();
    let out = process::run(
        &exe,
        &["--ignored", "--exact", "fixture_echo", "--nocapture"],
        b"public",
        4096,
        Duration::from_secs(10),
    )
    .unwrap();
    assert!(String::from_utf8(out)
        .unwrap()
        .contains("PUBLIC-EOF-public"));
}
#[test]
fn substituted_executables_and_malformed_pins_fail() {
    let dir = tempfile::tempdir().unwrap();
    let path = dir.path().join("public.bin");
    std::fs::write(&path, b"public fixture").unwrap();
    let pin = hash(b"public fixture");
    process::executable(&path, &pin).unwrap();
    std::fs::write(&path, b"modified fixture").unwrap();
    assert!(process::executable(&path, &pin).is_err());
    assert!(process::executable(&path, "bad").is_err());
}
fn release_fixture(root: &std::path::Path) {
    std::fs::create_dir_all(root.join("scripts")).unwrap();
    for (name, data) in [
        ("RELEASE_MANIFEST.json", b"{}".as_slice()),
        ("SHA256SUMS.txt", b"".as_slice()),
        ("public.txt", b"public synthetic fixture".as_slice()),
        (
            "release.json",
            include_bytes!("../../release.json").as_slice(),
        ),
    ] {
        std::fs::write(root.join(name), data).unwrap();
    }
    write(&root.join("scripts/release_files.json"),&json!({"files":["RELEASE_MANIFEST.json","SHA256SUMS.txt","public.txt","release.json","scripts/release_files.json"]})).unwrap();
    release::refresh(root).unwrap();
}
#[test]
fn an_external_pin_rejects_a_self_consistent_substitution() {
    let dir = tempfile::tempdir().unwrap();
    release_fixture(dir.path());
    let pin = hash(&bytes(&dir.path().join("RELEASE_MANIFEST.json"), 1024 * 1024).unwrap());
    release::verify(dir.path(), Some(&pin)).unwrap();
    std::fs::write(
        dir.path().join("public.txt"),
        b"new public synthetic fixture",
    )
    .unwrap();
    release::refresh(dir.path()).unwrap();
    release::verify(dir.path(), None).unwrap();
    assert!(release::verify(dir.path(), Some(&pin)).is_err());
}
#[test]
fn json_escapes_and_xml_entities_cannot_hide_privacy_patterns() {
    let dir = tempfile::tempdir().unwrap();
    let email = ["synthetic", "@", "example.invalid"].join("");
    let json_path = dir.path().join("public.json");
    let escaped = email
        .chars()
        .map(|c| format!("\\u{:04x}", c as u32))
        .collect::<String>();
    std::fs::write(&json_path, format!("{{\"value\":\"{escaped}\"}}")).unwrap();
    assert!(release::inspect_file(&json_path).is_err());
    let path = dir.path().join("public.pptx");
    let file = std::fs::File::create(&path).unwrap();
    let mut zip = zip::ZipWriter::new(file);
    zip.start_file(
        "ppt/notes.xml",
        zip::write::SimpleFileOptions::default().system(zip::System::Unix),
    )
    .unwrap();
    zip.write_all(format!("<note>{}</note>", email.replace('.', "&#46;")).as_bytes())
        .unwrap();
    zip.finish().unwrap();
    assert!(release::inspect_file(&path).is_err());
}
#[test]
fn utf16_pdf_metadata_is_scanned() {
    use lopdf::{dictionary, Object, StringFormat};
    let dir = tempfile::tempdir().unwrap();
    let path = dir.path().join("public.pdf");
    let mut doc = lopdf::Document::with_version("1.5");
    let pages =
        doc.add_object(dictionary! {"Type"=>"Pages","Kids"=>Vec::<Object>::new(),"Count"=>0});
    let catalog = doc.add_object(dictionary! {"Type"=>"Catalog","Pages"=>pages});
    let email = ["synthetic", "@", "example.invalid"].join("");
    let mut encoded = vec![254, 255];
    encoded.extend(email.encode_utf16().flat_map(u16::to_be_bytes));
    let info =
        doc.add_object(dictionary! {"Author"=>Object::String(encoded,StringFormat::Hexadecimal)});
    doc.trailer.set("Root", catalog);
    doc.trailer.set("Info", info);
    doc.save(&path).unwrap();
    assert!(release::inspect_file(&path).is_err());
}

#[test]
fn comparison_detects_logic_and_metadata_changes_under_new_kb_ids() {
    use stm_neurosymbolic::{engine::KnowledgeBase, tooling::checks};
    let before = KnowledgeBase::embedded().unwrap();
    let mut after = before.clone();
    for value in [
        &mut after.rules.kb_version,
        &mut after.fact_catalog.kb_version,
        &mut after.source_reviews.kb_version,
    ] {
        *value = "17.0-NSAI.proposal".into();
    }
    after.rules.rules[0].check[0].equals =
        json!(!after.rules.rules[0].check[0].equals.as_bool().unwrap());
    let report = checks::compare(&before, &after, "2026-10-27").unwrap();
    assert_eq!(report["knowledge_identical"], false);
    assert!(report["rules"]
        .as_array()
        .unwrap()
        .iter()
        .any(|r| r["verdict_changes"].as_u64().unwrap() > 0));
    assert!(!report["changes"]["rules"]["changed"]
        .as_array()
        .unwrap()
        .is_empty());
    assert!(report["component_changes"].get("source_reviews").is_some());
}

#[test]
fn evaluation_schema_requires_explicit_optional_threshold_fields() {
    use stm_neurosymbolic::{engine::KnowledgeBase, tooling::evaluation};
    let kb = KnowledgeBase::embedded().unwrap();
    let mut fixture: serde_json::Value =
        serde_json::from_slice(include_bytes!("../examples/retrieval_evaluation_v1.json")).unwrap();
    evaluation::parse(&canonical(&fixture), &kb).unwrap();
    fixture["thresholds"]
        .as_object_mut()
        .unwrap()
        .remove("min_mean_precision_at_k");
    assert!(evaluation::parse(&canonical(&fixture), &kb).is_err());
}

#[test]
fn shipped_public_inventory_passes_native_privacy_inspection() {
    let root = std::path::Path::new(env!("CARGO_MANIFEST_DIR"))
        .parent()
        .unwrap();
    release::scan(root).unwrap();
}

#[test]
fn wsl_mount_paths_are_rejected_as_private_artifact_content() {
    let dir = tempfile::tempdir().unwrap();
    let path = dir.path().join("public.txt");
    for name in ["synthetic", "synthetic user", "synthetic-Δ"] {
        let marker = ["/mnt/", "c", "/Users/", name, "/public"].join("");
        std::fs::write(&path, marker).unwrap();
        assert!(release::inspect_file(&path).is_err());
    }
    let public_uri = ["/home/", "http:", "/"].join("");
    std::fs::write(&path, public_uri).unwrap();
    assert!(release::inspect_file(&path).is_ok());
}

#[test]
#[cfg(unix)]
fn extracted_unix_programs_remain_executable() {
    let dir = tempfile::tempdir().unwrap();
    let archive = dir.path().join("public.zip");
    let mut writer = zip::ZipWriter::new(std::fs::File::create(&archive).unwrap());
    writer
        .start_file(
            "public program",
            zip::write::SimpleFileOptions::default()
                .system(zip::System::Unix)
                .unix_permissions(0o755),
        )
        .unwrap();
    writer.write_all(b"#!/bin/sh\nexit 0\n").unwrap();
    writer.finish().unwrap();
    let extracted = dir.path().join("extracted");
    release::extract(&archive, &extracted).unwrap();
    process::run(
        &extracted.join("public program"),
        &[],
        b"",
        1024,
        Duration::from_secs(5),
    )
    .unwrap();
}
