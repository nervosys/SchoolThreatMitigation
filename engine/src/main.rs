use stm_neurosymbolic::{currency, engine, json_input, mcp, model, privacy};

use engine::KnowledgeBase;
use model::{AssessmentInput, Facts};
use serde_json::{json, Value};
use std::env;
use std::fs::File;
use std::io::{self, Read};
use std::path::PathBuf;

fn bounded_input(input: impl Read) -> Result<String, String> {
    let mut data = Vec::new();
    input
        .take((privacy::MAX_REQUEST_BYTES + 1) as u64)
        .read_to_end(&mut data)
        .map_err(|_| "Input unavailable; details redacted")?;
    if data.len() > privacy::MAX_REQUEST_BYTES {
        return Err("Input exceeds byte limit".into());
    }
    String::from_utf8(data).map_err(|_| "Input must be UTF-8".into())
}
fn help() -> &'static str {
    "stm-neurosymbolic 0.4.0 (draft advisory; NOT a legal certification system)
Usage:
  cargo run --manifest-path engine/Cargo.toml -- validate
  cargo run --manifest-path engine/Cargo.toml -- ask \"How can we reduce youth firearm access?\"
  cargo run --manifest-path engine/Cargo.toml -- search \"cybersecurity emergency alert\"
  cargo run --manifest-path engine/Cargo.toml -- trace T01
  cargo run --manifest-path engine/Cargo.toml -- explain T01
  cargo run --manifest-path engine/Cargo.toml -- explain WA-123
  cargo run --manifest-path engine/Cargo.toml -- assess engine/examples/district_aggregate.json
  cargo run --manifest-path engine/Cargo.toml -- sources
  cargo run --manifest-path engine/Cargo.toml -- mcp
  stm-neurosymbolic search-stdin
  stm-neurosymbolic ask-stdin auditor
  stm-neurosymbolic assess -
  stm-neurosymbolic facts
  stm-neurosymbolic explain FACT-WA-PUBLIC-SCHOOL
  stm-neurosymbolic source-check 2026-10-26
Optional prefix: --kb-root <reviewed-public-KB-directory>
Default knowledge is bundled; no checkout path is required.
Use stdin for queries to avoid retaining input in shell command history.
All assessments accept only whitelisted anonymous boolean facts. Never input pupil details.
Assessments include a replayable stm-conjunctive-1 certificate. Optional JSON context:
  as_of: UTC YYYY-MM-DD; expected_kb_version: installed KB version.
Omitted dates use the frozen KB reference date, not an implicit wall clock.
"
}
fn execute() -> Result<(), String> {
    let mut args: Vec<String> = env::args().skip(1).collect();
    if args.is_empty() || args[0] == "help" || args[0] == "--help" {
        println!("{}", help());
        return Ok(());
    }
    let kb = if args.first().map(String::as_str) == Some("--kb-root") {
        let root = PathBuf::from(args.get(1).ok_or("Missing public KB directory")?);
        args.drain(..2);
        KnowledgeBase::load(&root)?
    } else {
        KnowledgeBase::embedded()?
    };
    let command = args.first().ok_or("Missing command")?.as_str();
    let maximum = match command {
        "ask" => 3,
        "ask-stdin" => 2,
        "search" | "trace" | "explain" | "assess" | "source-check" => 2,
        _ => 1,
    };
    if args.len() > maximum {
        return Err("Unexpected arguments; details redacted".into());
    }
    if args[0] == "mcp" {
        return mcp::serve(&kb);
    }
    let result: Value = match args[0].as_str() {
        "validate" => json!({"status":"valid","knowledgebase_version":kb.rules.kb_version,
            "scenarios":kb.scenarios.len(),"controls":kb.controls.len(),"rules":kb.rules.rules.len(),"sources":kb.sources.len(),"trace_edges":kb.relations.len(),
            "legal_review_required":true,"deployment_certified":false}),
        "ask" => {
            let query = args.get(1).ok_or("Missing question")?;
            let role = args.get(2).map(String::as_str).unwrap_or("general");
            serde_json::to_value(kb.ask_for_role(query, role)?).map_err(|e| e.to_string())?
        }
        "search" => {
            let query = args.get(1).ok_or("Missing query")?;
            json!({"hits":kb.search(query,12)?})
        }
        "search-stdin" => {
            let query = bounded_input(io::stdin().lock())?;
            json!({"hits":kb.search(query.trim(),12)?})
        }
        "ask-stdin" => {
            let query = bounded_input(io::stdin().lock())?;
            let role = args.get(1).map(String::as_str).unwrap_or("general");
            serde_json::to_value(kb.ask_for_role(query.trim(), role)?)
                .map_err(|_| "Response serialization failed")?
        }
        "explain" => {
            let id = args.get(1).ok_or("Missing ID")?;
            let result = kb.explain(id);
            if result.get("error").is_some() {
                return Err("Unknown or invalid knowledge ID; input redacted".into());
            }
            result
        }
        "trace" => {
            let id = args.get(1).ok_or("Missing ID")?;
            let result = kb.trace(id);
            if result.get("error").is_some()
                || result.get("item").and_then(|v| v.get("error")).is_some()
            {
                return Err("Unknown or invalid knowledge ID; input redacted".into());
            }
            result
        }
        "sources" => json!({"sources":kb.sources,"legal_review_required":true}),
        "facts" => {
            serde_json::to_value(&kb.fact_catalog).map_err(|_| "Response serialization failed")?
        }
        "source-check" => {
            let today = currency::Date::utc_today()?.iso();
            let as_of = args.get(1).map(String::as_str).unwrap_or(&today);
            let mut report = kb.review_report(Some(as_of))?;
            if args.get(1).is_none() {
                report.as_of_basis = "current_utc_diagnostic".into();
            }
            serde_json::to_value(report).map_err(|_| "Response serialization failed")?
        }
        "assess" => {
            let path = args.get(1).ok_or("Missing JSON input path")?;
            let text = if path == "-" {
                bounded_input(io::stdin().lock())?
            } else {
                bounded_input(
                    File::open(path).map_err(|_| "Assessment input unavailable; path redacted")?,
                )?
            };
            let input: AssessmentInput = json_input::decode(text.as_bytes())
                .map_err(|_| "Invalid assessment input; content redacted")?;
            if let Some(label) = input.site_label.as_deref() {
                if ![
                    "synthetic",
                    "public aggregate",
                    "Illustrative district (synthetic data only)",
                ]
                .contains(&label)
                {
                    return Err(
                        "Use an approved generic site label or omit it; input redacted".into(),
                    );
                }
            }
            let facts: Facts = input.facts;
            let assessment = if input.as_of.is_none() && input.expected_kb_version.is_none() {
                kb.evaluate(&facts)?
            } else {
                kb.evaluate_with_context(
                    &facts,
                    input.as_of.as_deref(),
                    input.expected_kb_version.as_deref(),
                )?
            };
            serde_json::to_value(assessment).map_err(|_| "Response serialization failed")?
        }
        _ => return Err("Unknown command; input redacted. Use --help.".into()),
    };
    println!(
        "{}",
        serde_json::to_string_pretty(&result).map_err(|e| e.to_string())?
    );
    Ok(())
}
fn main() {
    if let Err(e) = execute() {
        eprintln!("ERROR: {e}");
        std::process::exit(2);
    }
}
