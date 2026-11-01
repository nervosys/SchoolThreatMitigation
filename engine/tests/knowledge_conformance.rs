use serde_json::{json, Value};
use std::{collections::BTreeMap, fs, path::Path};
use stm_neurosymbolic::{engine::KnowledgeBase, tooling::validation};

const FIXTURES: &str = include_str!("fixtures/knowledge_conformance.json");
const KNOWLEDGE: &str = "2bcb941487fb138f3e014ff57a71140fcecd8e6bbe7fef5496abef2188b1f34c";

fn stage(root: &Path, target: &Path, fixtures: &Value) -> BTreeMap<String, Vec<u8>> {
    let mut original = BTreeMap::new();
    for document in fixtures["documents"].as_array().unwrap() {
        let path = document["path"].as_str().unwrap();
        assert!(path.starts_with("governance/") || path.starts_with("engine/kb/"));
        assert!(!path.contains("..") && !path.contains('\\'));
        let schema = document["schema"].as_str().unwrap();
        assert!(schema.bytes().all(|c| c.is_ascii_lowercase() || c == b'_'));
        let data = fs::read(root.join(path)).unwrap();
        original.insert(document["id"].as_str().unwrap().to_owned(), data);
        for member in [
            path.to_owned(),
            format!("engine/schemas/{schema}.schema.json"),
        ] {
            let destination = target.join(&member);
            fs::create_dir_all(destination.parent().unwrap()).unwrap();
            fs::copy(root.join(member), destination).unwrap();
        }
    }
    for member in [
        "governance/threat_to_countermeasure_v17_0.csv",
        "governance/coverage_roles.json",
    ] {
        fs::copy(root.join(member), target.join(member)).unwrap();
    }
    original
}

fn mutate(data: &[u8], case: &Value) -> Vec<u8> {
    let pointer = case["pointer"].as_str().unwrap();
    if case["operation"] == "duplicate_key" {
        assert_eq!(pointer, "schema_version");
        let raw = std::str::from_utf8(data).unwrap();
        let opening = raw.find('{').unwrap();
        return format!(
            "{}\"schema_version\":\"2.0\",{}",
            &raw[..opening + 1],
            &raw[opening + 1..]
        )
        .into_bytes();
    }
    let mut value: Value = serde_json::from_slice(data).unwrap();
    match case["operation"].as_str().unwrap() {
        "replace" => *value.pointer_mut(pointer).unwrap() = case["value"].clone(),
        "remove" | "add" => {
            let (parent, key) = pointer.rsplit_once('/').unwrap();
            let object = value.pointer_mut(parent).unwrap().as_object_mut().unwrap();
            if case["operation"] == "remove" {
                assert!(object.remove(key).is_some());
            } else {
                assert!(object.insert(key.into(), case["value"].clone()).is_none());
            }
        }
        _ => panic!("Unsupported fixture operation"),
    }
    serde_json::to_vec(&value).unwrap()
}

#[test]
fn authoring_and_runtime_share_positive_and_malformed_knowledge_fixtures() {
    let root = Path::new(env!("CARGO_MANIFEST_DIR")).parent().unwrap();
    let fixtures: Value = serde_json::from_str(FIXTURES).unwrap();
    assert_eq!(fixtures["documents"].as_array().unwrap().len(), 10);
    let temporary = tempfile::tempdir().unwrap();
    let target = temporary.path();
    let original = stage(root, target, &fixtures);
    let mut validators = BTreeMap::new();
    for document in fixtures["documents"].as_array().unwrap() {
        let id = document["id"].as_str().unwrap();
        let schema: Value = serde_json::from_slice(
            &fs::read(target.join(format!(
                "engine/schemas/{}.schema.json",
                document["schema"].as_str().unwrap()
            )))
            .unwrap(),
        )
        .unwrap();
        let validator = jsonschema::validator_for(&schema).unwrap();
        assert!(validator.is_valid(&serde_json::from_slice(&original[id]).unwrap()));
        validators.insert(id, validator);
    }
    assert_eq!(
        KnowledgeBase::embedded().unwrap().knowledge_sha256(),
        KNOWLEDGE
    );
    assert_eq!(
        KnowledgeBase::load(target).unwrap().knowledge_sha256(),
        KNOWLEDGE
    );
    assert_eq!(validation::knowledge(target).unwrap()["passed"], true);
    let cases = fixtures["cases"].as_array().unwrap();
    assert_eq!(cases.len(), 72);
    assert_eq!(
        cases.iter().filter(|c| c["gate_valid"] == false).count(),
        69
    );
    for case in cases {
        let id = case["id"].as_str().unwrap();
        let document = case["document"].as_str().unwrap();
        let declaration = fixtures["documents"]
            .as_array()
            .unwrap()
            .iter()
            .find(|d| d["id"] == document)
            .unwrap();
        let path = target.join(declaration["path"].as_str().unwrap());
        let changed = mutate(&original[document], case);
        fs::write(&path, &changed).unwrap();
        let schema_valid = stm_neurosymbolic::json_input::value(&changed)
            .is_ok_and(|v| validators[document].is_valid(&v));
        assert_eq!(case["schema_valid"], schema_valid, "schema fixture {id}");
        assert_eq!(
            case["runtime_valid"],
            KnowledgeBase::load(target).is_ok(),
            "runtime fixture {id}"
        );
        assert_eq!(
            case["gate_valid"],
            validation::knowledge(target).is_ok(),
            "combined gate fixture {id}"
        );
        if case["runtime_valid"] == true {
            assert_eq!(
                KnowledgeBase::load(target).unwrap().knowledge_sha256(),
                KNOWLEDGE,
                "metadata must not alter predicate content: {id}"
            );
        }
        fs::write(path, &original[document]).unwrap();
    }
    assert_eq!(
        KnowledgeBase::load(target).unwrap().knowledge_sha256(),
        KNOWLEDGE
    );
    assert_eq!(validation::knowledge(target).unwrap()["passed"], true);
}

#[test]
fn rejected_register_metadata_does_not_escape_in_loader_errors() {
    let root = Path::new(env!("CARGO_MANIFEST_DIR")).parent().unwrap();
    let fixtures: Value = serde_json::from_str(FIXTURES).unwrap();
    let temporary = tempfile::tempdir().unwrap();
    let original = stage(root, temporary.path(), &fixtures);
    let marker = ["synthetic", "@", "example.invalid"].concat();
    for (document, pointer) in [
        ("scenarios", "/version"),
        ("controls", "/version"),
        ("sources", "/retrieved"),
        ("technology_sources", "/retrieved"),
        ("legal_sources", "/reviewed_on"),
        ("relations", "/version"),
    ] {
        let declaration = fixtures["documents"]
            .as_array()
            .unwrap()
            .iter()
            .find(|d| d["id"] == document)
            .unwrap();
        let path = temporary.path().join(declaration["path"].as_str().unwrap());
        fs::write(
            &path,
            mutate(
                &original[document],
                &json!({"operation":"replace","pointer":pointer,"value":marker}),
            ),
        )
        .unwrap();
        let error = KnowledgeBase::load(temporary.path())
            .err()
            .expect("Invalid metadata rejected");
        assert!(!error.contains(&marker));
        assert!(matches!(
            error.as_str(),
            "Knowledge file does not match the required schema"
                | "Relationship register version mismatch"
        ));
        fs::write(path, &original[document]).unwrap();
    }
}

#[test]
fn candidate_comparison_accepts_matching_versions_and_rejects_mixed_registers() {
    let root = Path::new(env!("CARGO_MANIFEST_DIR")).parent().unwrap();
    let fixtures: Value = serde_json::from_str(FIXTURES).unwrap();
    let temporary = tempfile::tempdir().unwrap();
    let original = stage(root, temporary.path(), &fixtures);
    for (document, field) in [
        ("rules", "kb_version"),
        ("facts", "kb_version"),
        ("source_reviews", "kb_version"),
        ("relations", "version"),
    ] {
        let declaration = fixtures["documents"]
            .as_array()
            .unwrap()
            .iter()
            .find(|d| d["id"] == document)
            .unwrap();
        fs::write(
            temporary.path().join(declaration["path"].as_str().unwrap()),
            mutate(
                &original[document],
                &json!({"operation":"replace","pointer":format!("/{field}"),"value":"17.0-NSAI.5"}),
            ),
        )
        .unwrap();
    }
    // Proposals can be compared without granting support to the runtime engine.
    let candidate = stm_neurosymbolic::tooling::replay::load_candidate(temporary.path()).unwrap();
    assert_eq!(candidate.rules.kb_version, "17.0-NSAI.5");
    assert!(KnowledgeBase::load(temporary.path()).is_err());
    fs::write(
        temporary.path().join("engine/kb/relations_v17_0.json"),
        &original["relations"],
    )
    .unwrap();
    assert!(stm_neurosymbolic::tooling::replay::load_candidate(temporary.path()).is_err());
}
