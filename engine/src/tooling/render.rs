//! Optional document authoring: Rust orchestrates Pandoc and Typst; no Python.
use super::{base::*, process};
use serde_json::{json, Value};
use std::{collections::BTreeSet, fs, path::Path, time::Duration};
fn attrs(value: &mut Value, seen: &mut BTreeSet<String>) {
    match value {
        Value::Object(map) => {
            for v in map.values_mut() {
                attrs(v, seen)
            }
        }
        Value::Array(list) => {
            let attribute = list.len() == 3
                && list[0].is_string()
                && list[1].is_array()
                && list[2].is_array()
                && list[1].as_array().unwrap().iter().all(Value::is_string)
                && list[2]
                    .as_array()
                    .unwrap()
                    .iter()
                    .all(|v| v.as_array().is_some_and(|a| a.len() == 2));
            if attribute {
                let original = list[0].as_str().unwrap().to_string();
                if !original.is_empty() {
                    let mut name = original.clone();
                    let mut n = 1;
                    while !seen.insert(name.clone()) {
                        n += 1;
                        name = format!("{original}-rust-{n}");
                    }
                    list[0] = json!(name);
                }
            } else {
                for v in list {
                    attrs(v, seen)
                }
            }
        }
        _ => {}
    }
}
pub fn publications(root: &Path) -> Result<Value> {
    let meta = metadata(root)?;
    let dir = root.join(text(&meta, "publication_directory")?);
    let output = root.join("output/pdf-rust");
    fs::create_dir_all(&output).map_err(|_| "Render output unavailable")?;
    let style = fs::read_to_string(root.join("scripts/publication.typ"))
        .map_err(|_| "Typst template unavailable")?;
    let strip=regex::Regex::new(r"(?is)<(?:style|script|iframe|object|embed)\b[^>]*>.*?</(?:style|script|iframe|object|embed)>").map_err(|_|"Render pattern")?;
    let images = regex::Regex::new(r"(?is)<img\b[^>]*>").map_err(|_| "Render image pattern")?;
    let alt = regex::Regex::new(r#"(?is)alt=[\"']([^\"']*)[\"']"#)
        .map_err(|_| "Render alternative pattern")?;
    let mut documents = vec![];
    let mut sources: Vec<_> = fs::read_dir(dir)
        .map_err(|_| "Publication sources unavailable")?
        .filter_map(|e| e.ok().map(|e| e.path()))
        .filter(|p| p.extension().is_some_and(|s| s == "html"))
        .collect();
    sources.sort();
    for source in sources {
        let raw = String::from_utf8(bytes(&source, MAX_FILE)?).map_err(|_| "HTML encoding")?;
        let raw = strip.replace_all(&raw, "");
        let html = images.replace_all(&raw, |cap: &regex::Captures<'_>| {
            alt.captures(&cap[0])
                .map(|a| a[1].to_string())
                .unwrap_or_else(|| "Decorative publication image.".into())
        });
        let ast = process::run(
            Path::new("pandoc"),
            &["--sandbox", "--from=html", "--to=json"],
            html.as_bytes(),
            20 * 1024 * 1024,
            Duration::from_secs(90),
        )?;
        let mut ast = crate::json_input::value(&ast).map_err(|_| "Pandoc JSON invalid")?;
        attrs(&mut ast, &mut BTreeSet::new());
        let typst = process::run(
            Path::new("pandoc"),
            &["--sandbox", "--from=json", "--to=typst"],
            &canonical(&ast),
            20 * 1024 * 1024,
            Duration::from_secs(90),
        )?;
        let stem = source
            .file_stem()
            .and_then(|s| s.to_str())
            .ok_or("Render name")?;
        let input = output.join(format!("{stem}.typ"));
        let pdf = output.join(format!("{stem}.pdf"));
        let mut data = style.as_bytes().to_vec();
        data.extend_from_slice(b"\n#set document(author: \"NERVOSYS, LLC\")\n");
        data.extend_from_slice(&typst);
        fs::write(&input, data).map_err(|_| "Typst source write")?;
        let args = [
            "compile",
            "--creation-timestamp",
            "1792972800",
            "--root",
            root.to_str().ok_or("Root encoding")?,
            input.to_str().ok_or("Typst input encoding")?,
            pdf.to_str().ok_or("PDF output encoding")?,
        ];
        process::run(
            Path::new("typst"),
            &args,
            b"",
            1024 * 1024,
            Duration::from_secs(120),
        )?;
        documents.push(json!({"name":stem,"sha256":hash(&bytes(&pdf,MAX_FILE)?)}));
    }
    if documents.len() != 6 {
        return Err("Expected six render sources".into());
    }
    Ok(
        json!({"rendered":documents,"output_directory":"output/pdf-rust","python_required":false,"visual_QA_required":true,"independent_acceptance":false}),
    )
}
