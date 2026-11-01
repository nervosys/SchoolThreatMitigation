use serde_json::{json, Value};
use std::{
    collections::BTreeMap,
    env,
    path::{Path, PathBuf},
    time::Duration,
};
use stm_neurosymbolic::{
    engine::KnowledgeBase,
    tooling::{
        adversarial, archive, base::*, checks, evaluation, process, release, replay, review,
        validation,
    },
};
fn execute() -> Result<()> {
    let args: Vec<_> = env::args().skip(1).collect();
    if args.is_empty() || ["help", "--help"].contains(&args[0].as_str()) {
        println!("stm-tool 0.4.0 -- native Rust verification and release tools\nCommands: validate, bridge, verify-proof, check, check-mcp, check-reasoning, check-adversarial, retrieval-evaluate, compare, compare-fixture, review-build, review-verify, release-refresh, release-verify, privacy, pack-source, pack-native, verify-native, extract-native, extract, sbom, publications, render-publications\nCommon: --root SOURCE_DIRECTORY (default current directory)\nBridge: --trusted-manifest-sha256 PIN --binary ENGINE --trusted-executable-sha256 PIN; request on stdin\nVerify: --request FILE --assessment FILE --trusted-manifest-sha256 PIN\nReview: --as-of YYYY-MM-DD --trusted-manifest-sha256 PIN --output NEW_JSON / --packet FILE\nExternal retrieval: --dataset FILE --dataset-sha256 PIN --trusted-manifest-sha256 PIN --binary ENGINE --trusted-executable-sha256 PIN\nMaintainer checks: check [--cargo]; retrieval-evaluate --fixture\nAll errors redact submitted values and paths. No Python runtime is used.");
        return Ok(());
    }
    let command = &args[0];
    let mut flags = BTreeMap::new();
    let mut i = 1;
    while i < args.len() {
        let key = args[i]
            .strip_prefix("--")
            .ok_or("Named tool options required")?;
        let value = if ["fixture", "cargo", "require-identical"].contains(&key) {
            "true".to_string()
        } else {
            i += 1;
            args.get(i).ok_or("Tool option value missing")?.clone()
        };
        if flags.insert(key.to_owned(), value).is_some() {
            return Err("Duplicate tool option".into());
        }
        i += 1;
    }
    let root = flags
        .get("root")
        .or_else(|| flags.get("kb-root"))
        .map(PathBuf::from)
        .unwrap_or(env::current_dir().map_err(|_| "Working directory unavailable")?);
    let root = root.canonicalize().map_err(|_| "Source root unavailable")?;
    #[cfg(windows)]
    let root = {
        let value = root.to_str().ok_or("Source root encoding unsupported")?;
        PathBuf::from(if let Some(unc) = value.strip_prefix(r"\\?\UNC\") {
            format!(r"\\{unc}")
        } else {
            value.strip_prefix(r"\\?\").unwrap_or(value).to_owned()
        })
    };
    let allowed: &[&str] = match command.as_str() {
        "bridge" => &[
            "trusted-manifest-sha256",
            "trusted-executable-sha256",
            "binary",
        ],
        "verify-proof" => &["trusted-manifest-sha256", "request", "assessment"],
        "release-verify" => &["trusted-manifest-sha256"],
        "pack-source" | "pack-native" => &["output"],
        "extract" => &["archive", "output"],
        "verify-native" | "extract-native" => &[
            "archive",
            "trusted-archive-sha256",
            "trusted-manifest-sha256",
            "platform",
            "architecture",
            "output",
        ],
        "check" => &["binary", "cargo"],
        "check-mcp" | "check-reasoning" | "check-adversarial" => &["binary"],
        "retrieval-evaluate" => &[
            "fixture",
            "dataset",
            "dataset-sha256",
            "binary",
            "trusted-manifest-sha256",
            "trusted-executable-sha256",
        ],
        "compare" => &[
            "baseline-root",
            "baseline-manifest-sha256",
            "trusted-manifest-sha256",
            "as-of",
            "require-identical",
        ],
        "review-build" => &["trusted-manifest-sha256", "as-of", "output"],
        "review-verify" => &["trusted-manifest-sha256", "as-of", "packet"],
        _ => &[],
    };
    if flags
        .keys()
        .any(|k| !["root", "kb-root"].contains(&k.as_str()) && !allowed.contains(&k.as_str()))
        || flags.contains_key("root") && flags.contains_key("kb-root")
    {
        return Err("Unknown or conflicting tool option".into());
    }
    let get = |key: &str| {
        flags
            .get(key)
            .map(String::as_str)
            .ok_or_else(|| "Required tool option missing".to_string())
    };
    let native = || -> Result<PathBuf> {
        Ok(flags
            .get("binary")
            .map(PathBuf::from)
            .unwrap_or(root.join(format!(
                "engine/target/release/stm-neurosymbolic{}",
                env::consts::EXE_SUFFIX
            ))))
    };
    let payload = |key: &str, limit: usize| -> Result<Value> {
        let name = get(key)?;
        let data = if name == "-" {
            input(limit)?
        } else {
            bytes(Path::new(name), limit)?
        };
        stm_neurosymbolic::json_input::value(&data)
            .map_err(|_| "Invalid input JSON; contents redacted".into())
    };
    let trust = || release::verify(&root, Some(get("trusted-manifest-sha256")?));
    let value = match command.as_str() {
        "validate" => validation::knowledge(&root)?,
        "privacy" => release::scan(&root)?,
        "release-refresh" => release::refresh(&root)?,
        "release-verify" => release::verify(
            &root,
            flags.get("trusted-manifest-sha256").map(String::as_str),
        )?,
        "pack-source" | "pack-native" => {
            release::pack(&root, Path::new(get("output")?), command == "pack-native")?
        }
        "verify-native" | "extract-native" => {
            if command == "verify-native" && flags.contains_key("output") {
                return Err("Verify is read-only".into());
            }
            archive::native(
                &root,
                Path::new(get("archive")?),
                get("trusted-archive-sha256")?,
                get("trusted-manifest-sha256")?,
                get("platform")?,
                get("architecture")?,
                if command == "extract-native" {
                    Some(Path::new(get("output")?))
                } else {
                    None
                },
            )?
        }
        "extract" => {
            let target = Path::new(get("output")?);
            if target.exists() {
                return Err("Extraction requires new directory".into());
            }
            release::extract(Path::new(get("archive")?), target)?;
            json!({"extracted":true})
        }
        "sbom" => {
            let v = validation::sbom(&root)?;
            write(&root.join("qa/dependencies.spdx.json"), &v)?;
            json!({"sbom_written":true,"package_count":arr(&v,"packages")?.len()})
        }
        "publications" => validation::publications(&root)?,
        "render-publications" => stm_neurosymbolic::tooling::render::publications(&root)?,
        "check" => {
            let v = validation::run(&root, &native()?, flags.contains_key("cargo"))?;
            if v["all_checks_passed"] != true {
                return Err("Native checks failed; consult path-free QA report".into());
            }
            v
        }
        "check-mcp" => checks::client(&KnowledgeBase::load(&root)?, &native()?)?,
        "check-adversarial" => adversarial::check(&KnowledgeBase::load(&root)?, &native()?)?,
        "check-reasoning" => checks::matrix(&KnowledgeBase::load(&root)?, &native()?)?,
        "verify-proof" => {
            trust()?;
            let kb = KnowledgeBase::load(&root)?;
            let mut v = replay::verify(
                &kb,
                &payload("request", 65536)?,
                &payload("assessment", 1024 * 1024)?,
                text(&metadata(&root)?, "engine_version")?,
            )?;
            v["release_manifest_sha256"] = json!(get("trusted-manifest-sha256")?);
            v
        }
        "bridge" => {
            trust()?;
            let kb = KnowledgeBase::load(&root)?;
            let mut request = stm_neurosymbolic::json_input::value(&input(65536)?)
                .map_err(|_| "Request JSON invalid")?;
            replay::validate(&kb, &request)?;
            if request["as_of"].is_null() {
                request["as_of"] = json!(kb.rules.rules_reviewed_as_of);
            }
            if request["expected_kb_version"].is_null() {
                request["expected_kb_version"] = json!(kb.rules.kb_version);
            }
            replay::validate(&kb, &request)?;
            let binary = process::executable(&native()?, get("trusted-executable-sha256")?)?;
            let output = process::run(
                &binary,
                &["assess", "-"],
                &canonical(&request),
                1024 * 1024,
                Duration::from_secs(30),
            )?;
            let assessment = stm_neurosymbolic::json_input::value(&output)
                .map_err(|_| "Response JSON invalid")?;
            let mut verified = replay::verify(
                &kb,
                &request,
                &assessment,
                text(&metadata(&root)?, "engine_version")?,
            )?;
            verified["release_manifest_sha256"] = json!(get("trusted-manifest-sha256")?);
            verified["executable_sha256"] = json!(get("trusted-executable-sha256")?);
            json!({"verification":verified,"effective_context":{"as_of":request["as_of"],"expected_kb_version":request["expected_kb_version"]},"assessment":assessment})
        }
        "retrieval-evaluate" => {
            let fixture = flags.contains_key("fixture");
            if !fixture {
                trust()?;
            }
            let kb = KnowledgeBase::load(&root)?;
            let path = if fixture {
                root.join("engine/examples/retrieval_evaluation_v1.json")
            } else {
                PathBuf::from(get("dataset")?)
            };
            let data = bytes(&path, 1024 * 1024)?;
            if !fixture && hash(&data) != get("dataset-sha256")? {
                return Err("Frozen dataset pin mismatch".into());
            }
            let binary = if fixture {
                native()?
            } else {
                process::executable(&native()?, get("trusted-executable-sha256")?)?
            };
            let mut report = evaluation::evaluate(&kb, &data, &binary)?;
            if !fixture {
                report["source_manifest_sha256"] = json!(get("trusted-manifest-sha256")?);
            }

            report
        }
        "compare" => {
            let before = PathBuf::from(get("baseline-root")?);
            release::verify(&before, Some(get("baseline-manifest-sha256")?))?;
            trust()?;
            let mut report = checks::compare(
                &replay::load_candidate(&before)?,
                &replay::load_candidate(&root)?,
                get("as-of")?,
            )?;
            report["baseline_manifest_sha256"] = json!(get("baseline-manifest-sha256")?);
            report["candidate_manifest_sha256"] = json!(get("trusted-manifest-sha256")?);
            report
        }
        "compare-fixture" => {
            let kb = KnowledgeBase::load(&root)?;
            let baseline = read(&root.join("qa/baselines/engine_0_4_rc6/knowledge_snapshot.json"))?;
            json!({"knowledge_identical":baseline["knowledge_sha256"]==kb.knowledge_sha256(),"baseline":baseline["knowledge_sha256"],"candidate":kb.knowledge_sha256(),"independent_acceptance":false})
        }
        "review-build" => {
            let packet = review::packet(&root, get("trusted-manifest-sha256")?, get("as-of")?)?;
            export(&root, Path::new(get("output")?), &packet)?;
            json!({"packet_created":true,"review_item_count":arr(&packet,"review_items")?.len(),"synthetic_case_count":packet["synthetic_case_count"],"acceptance_state":"unaccepted","independent_acceptance":false})
        }
        "review-verify" => review::verify(
            &root,
            get("trusted-manifest-sha256")?,
            get("as-of")?,
            &payload("packet", 4 * 1024 * 1024)?,
        )?,
        _ => return Err("Unknown native tool command".into()),
    };
    println!(
        "{}",
        serde_json::to_string_pretty(&value).map_err(|_| "Result serialization")?
    );
    if command == "retrieval-evaluate" && value["thresholds_met"] != true {
        return Err("Retrieval gate failed".into());
    }
    if command == "compare"
        && flags.contains_key("require-identical")
        && value["knowledge_identical"] != true
    {
        return Err("Knowledge identity gate failed".into());
    }
    Ok(())
}
fn main() {
    if execute().is_err() {
        eprintln!("ERROR: native workflow failed; input, paths, and diagnostics redacted");
        std::process::exit(2);
    }
}
