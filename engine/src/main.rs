mod model;
mod engine;
mod search;
mod agent;
mod mcp;

use engine::KnowledgeBase;
use model::{AssessmentInput, Facts};
use serde_json::{json, Value};
use std::env;
use std::fs;
use std::path::PathBuf;

fn repo_root()->PathBuf {PathBuf::from(env!("CARGO_MANIFEST_DIR")).join("..")}
fn help()->&'static str {
"stm-neurosymbolic 0.1.0 (read-only; NOT a legal certification system)
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
All assessments accept only whitelisted anonymous boolean facts. Never input pupil details.
"
}
fn execute()->Result<(),String>{
    let args:Vec<String>=env::args().skip(1).collect();
    if args.is_empty() || args[0]=="help" || args[0]=="--help" {println!("{}",help());return Ok(());}
    let kb=KnowledgeBase::load(&repo_root())?;
    if args[0]=="mcp" {return mcp::serve(&kb);}
    let result:Value=match args[0].as_str(){
        "validate"=>json!({"status":"valid","knowledgebase_version":kb.rules.kb_version,
            "scenarios":kb.scenarios.len(),"controls":kb.controls.len(),"rules":kb.rules.rules.len(),"sources":kb.sources.len(),"trace_edges":kb.relations.len(),
            "legal_review_required":true,"deployment_certified":false}),
        "ask"=>{let query=args.get(1).ok_or("Missing question")?;
            let role=args.get(2).map(String::as_str).unwrap_or("general");
            serde_json::to_value(kb.ask_for_role(query,role)?).map_err(|e|e.to_string())?},
        "search"=>{let query=args.get(1).ok_or("Missing query")?;json!({"hits":kb.search(query,12)})},
        "explain"=>{let id=args.get(1).ok_or("Missing ID")?;kb.explain(id)},
        "trace"=>{let id=args.get(1).ok_or("Missing ID")?;kb.trace(id)},
        "sources"=>json!({"sources":kb.sources,"legal_review_required":true}),
        "assess"=>{
            let path=args.get(1).ok_or("Missing JSON input path")?;
            let input:AssessmentInput=serde_json::from_str(&fs::read_to_string(path).map_err(|e|e.to_string())?)
                .map_err(|e|format!("Invalid assessment input: {e}"))?;
            if let Some(label)=input.site_label.as_deref() {
                if label.len()>80 || label.contains('@') {return Err("Site label must be generic and non-identifying".into());}
            }
            let facts:Facts=input.facts;
            serde_json::to_value(kb.evaluate(&facts)?).map_err(|e|e.to_string())?
        },
        _=>return Err(format!("Unknown command: {}\n{}",args[0],help()))
    };
    println!("{}",serde_json::to_string_pretty(&result).map_err(|e|e.to_string())?);
    Ok(())
}
fn main(){if let Err(e)=execute(){eprintln!("ERROR: {e}");std::process::exit(2);}}
