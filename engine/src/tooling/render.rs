//! Rebuild the six checked-in Typst publications with bounded native processes.
use super::{base::*, process};
use serde_json::{json, Value};
use std::{fs, path::Path, time::Duration};

pub fn publications(root: &Path) -> Result<Value> {
    let meta = metadata(root)?;
    let public_directory = text(&meta, "publication_directory")?;
    let dir = safe(root, public_directory)?;
    let output = root.join("output/pdf-rust");
    fs::create_dir_all(&output).map_err(|_| "Render output unavailable")?;
    let style_hash = hash(&bytes(
        &safe(root, &format!("{public_directory}/publication.typ"))?,
        MAX_FILE,
    )?);
    let fonts = dir.join("assets/fonts");
    for name in [
        "Inter-Regular.ttf",
        "Inter-Italic.ttf",
        "Inter-Bold.ttf",
        "Inter-BoldItalic.ttf",
        "OFL.txt",
    ] {
        bytes(
            &safe(root, &format!("{public_directory}/assets/fonts/{name}"))?,
            MAX_FILE,
        )?;
    }
    // HTML names identify the public document set; HTML is never flattened into Typst.
    let mut sources: Vec<_> = fs::read_dir(&dir)
        .map_err(|_| "Publication sources unavailable")?
        .filter_map(|e| e.ok().map(|e| e.path()))
        .filter(|p| p.extension().is_some_and(|s| s == "html"))
        .collect();
    sources.sort();
    if sources.len() != 6 {
        return Err("Expected six render sources".into());
    }
    let mut documents = vec![];
    for source in sources {
        let stem = source
            .file_stem()
            .and_then(|s| s.to_str())
            .ok_or("Render name")?;
        let input = safe(root, &format!("{public_directory}/{stem}.typ"))?;
        let input_hash = hash(&bytes(&input, MAX_FILE)?);
        let pdf = output.join(format!("{stem}.pdf"));
        // Limit Typst file access to the public publication directory, excluding
        // repository configuration, credentials and unrelated workspace files.
        let args = [
            "compile",
            "--creation-timestamp",
            "1793664000",
            "--root",
            dir.to_str().ok_or("Root encoding")?,
            "--font-path",
            fonts.to_str().ok_or("Font path encoding")?,
            "--ignore-system-fonts",
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
        documents.push(
            json!({"name":stem,"source_sha256":input_hash,"sha256":hash(&bytes(&pdf,MAX_FILE)?)}),
        );
    }
    Ok(
        json!({"rendered":documents,"shared_style_sha256":style_hash,
        "output_directory":"output/pdf-rust","source_format":"checked_in_typst",
        "font_profile":"Inter_4.1_bundled_no_system_fonts","creation_timestamp":1793664000u64,
        "python_required":false,"visual_QA_required":true,"independent_acceptance":false}),
    )
}
