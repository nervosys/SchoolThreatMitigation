use super::base::*;
use regex::bytes::Regex;
use serde_json::{json, Value};
use std::{
    collections::BTreeSet,
    fs,
    io::{Cursor, Read, Write},
    path::Path,
};
pub fn inventory(root: &Path) -> Result<Vec<String>> {
    let value = read(&root.join("scripts/release_files.json"))?;
    let names = arr(&value, "files")?
        .iter()
        .map(|v| {
            v.as_str()
                .map(str::to_owned)
                .ok_or_else(|| "Inventory name invalid".into())
        })
        .collect::<Result<Vec<_>>>()?;
    if names
        != names
            .iter()
            .cloned()
            .collect::<BTreeSet<_>>()
            .into_iter()
            .collect::<Vec<_>>()
    {
        return Err("Inventory must be sorted and unique".into());
    }
    for name in &names {
        safe(root, name)?;
    }
    Ok(names)
}
pub fn refresh(root: &Path) -> Result<Value> {
    let meta = metadata(root)?;
    let mut records = vec![];
    for name in inventory(root)? {
        if ["RELEASE_MANIFEST.json", "SHA256SUMS.txt"].contains(&name.as_str()) {
            continue;
        }
        let data = bytes(&safe(root, &name)?, MAX_FILE)?;
        records.push(json!({"path":name,"bytes":data.len(),"sha256":hash(&data)}));
    }
    let manifest = json!({"release":format!("SchoolThreatMitigation {} with Engine {} {}",text(&meta,"publication_id")?,text(&meta,"engine_version")?,text(&meta,"candidate_label")?),"date":meta["candidate_date"],"license":"AGPL-3.0-or-later","status":"release_candidate_independent_acceptance_pending","doc_version":meta["publication_id"],"engine_version":meta["engine_version"],"kb_version":meta["kb_version"],"deployment_certified":false,"legal_certification":false,"toolchain":"rust_only","files":records});
    write(&root.join("RELEASE_MANIFEST.json"), &manifest)?;
    let mut sums = records
        .iter()
        .map(|r| Ok((text(r, "path")?.to_owned(), text(r, "sha256")?.to_owned())))
        .collect::<Result<Vec<_>>>()?;
    sums.push((
        "RELEASE_MANIFEST.json".into(),
        hash(&bytes(&root.join("RELEASE_MANIFEST.json"), MAX_FILE)?),
    ));
    sums.sort();
    fs::write(
        root.join("SHA256SUMS.txt"),
        sums.into_iter()
            .map(|(name, digest)| format!("{digest}  {name}\n"))
            .collect::<String>(),
    )
    .map_err(|_| "Checksum write failed")?;
    verify(root, None)
}
pub fn verify(root: &Path, pin: Option<&str>) -> Result<Value> {
    if let Some(pin) = pin {
        if pin.len() != 64
            || !pin
                .bytes()
                .all(|c| c.is_ascii_digit() || (b'a'..=b'f').contains(&c))
            || hash(&bytes(&root.join("RELEASE_MANIFEST.json"), 1024 * 1024)?) != pin
        {
            return Err("Trusted manifest mismatch".into());
        }
    }
    let names = inventory(root)?;
    let manifest = read(&root.join("RELEASE_MANIFEST.json"))?;
    let meta = metadata(root)?;
    for (key, other) in [
        ("engine_version", "engine_version"),
        ("kb_version", "kb_version"),
        ("doc_version", "publication_id"),
    ] {
        if manifest[key] != meta[other] {
            return Err("Release version mismatch".into());
        }
    }
    let records = arr(&manifest, "files")?;
    let expected: BTreeSet<_> = names
        .iter()
        .filter(|n| !["RELEASE_MANIFEST.json", "SHA256SUMS.txt"].contains(&n.as_str()))
        .cloned()
        .collect();
    if records.len() != expected.len()
        || records
            .iter()
            .filter_map(|r| r["path"].as_str().map(str::to_owned))
            .collect::<BTreeSet<_>>()
            != expected
    {
        return Err("Manifest inventory mismatch".into());
    }
    let mut checksum = std::collections::BTreeMap::new();
    for r in records {
        let name = text(r, "path")?;
        let data = bytes(&safe(root, name)?, MAX_FILE)?;
        if r["bytes"] != json!(data.len()) || r["sha256"] != hash(&data) {
            return Err("Release byte integrity mismatch".into());
        }
        checksum.insert(name.to_string(), hash(&data));
    }
    checksum.insert(
        "RELEASE_MANIFEST.json".into(),
        hash(&bytes(&root.join("RELEASE_MANIFEST.json"), MAX_FILE)?),
    );
    let sums = String::from_utf8(bytes(&root.join("SHA256SUMS.txt"), 1024 * 1024)?)
        .map_err(|_| "Checksum encoding")?;
    let mut seen = BTreeSet::new();
    for line in sums.lines() {
        let (digest, name) = line.split_once("  ").ok_or("Invalid checksum record")?;
        if !seen.insert(name.to_owned()) || checksum.get(name).map(String::as_str) != Some(digest) {
            return Err("Checksum mismatch".into());
        }
    }
    if seen.len() != checksum.len() {
        return Err("Checksum coverage mismatch".into());
    }
    Ok(
        json!({"verified":true,"file_count":names.len(),"manifest_sha256":checksum["RELEASE_MANIFEST.json"],"independent_acceptance":false}),
    )
}
fn patterns() -> Vec<Regex> {
    [r"-----BEGIN (?:[A-Z ]+ )?PRIVATE KEY-----",r"\b(?:ghp_|gho_|ghs_|ghu_|github_pat_)[A-Za-z0-9_]{10,}",r"\b(?:AKIA|ASIA)[A-Z0-9]{16}\b",r"\bsk-(?:proj-)?[A-Za-z0-9_-]{20,}",r#"(?i)(?:[A-Z]:[\\/]+Users[\\/]+[^\\/\r\n\"'<>]+[\\/]|/(?:mnt/[a-z]/Users|Users|home)/[^/:\\\r\n"'<>]+/)"#,r"\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}\b",r#"(?im)\b(?:api[_-]?key|access[_-]?token|secret[_-]?key|password|client[_-]?secret)\s*[:=]\s*[\"'][^\"']{8,}[\"']"#].iter().map(|p|Regex::new(p).expect("static pattern")).collect()
}
fn inspect(data: &[u8], rules: &[Regex]) -> Result<()> {
    if rules.iter().any(|p| p.is_match(data)) {
        return Err("Privacy pattern finding; values and paths redacted".into());
    }
    Ok(())
}
pub(super) fn inspect_bytes(data: &[u8]) -> Result<()> {
    inspect(data, &patterns())
}
fn xml(data: &[u8]) -> Result<Vec<u8>> {
    use quick_xml::{events::Event, Reader, XmlVersion};
    let mut reader = Reader::from_reader(data);
    let mut output = String::new();
    let mut version = XmlVersion::Implicit1_0;
    loop {
        match reader.read_event().map_err(|_| "Malformed XML")? {
            Event::Text(t) => output.push_str(&t.decode().map_err(|_| "XML text")?),
            Event::CData(t) => output.push_str(&t.decode().map_err(|_| "XML CDATA")?),
            Event::GeneralRef(r) => {
                let name = r.decode().map_err(|_| "XML reference")?;
                let value = if let Some(n) = name.strip_prefix("#x") {
                    char::from_u32(u32::from_str_radix(n, 16).map_err(|_| "XML code point")?)
                        .ok_or("XML code point")?
                } else if let Some(n) = name.strip_prefix('#') {
                    char::from_u32(n.parse().map_err(|_| "XML code point")?)
                        .ok_or("XML code point")?
                } else {
                    match name.as_ref() {
                        "amp" => '&',
                        "lt" => '<',
                        "gt" => '>',
                        "quot" => '"',
                        "apos" => '\'',
                        _ => return Err("Unsupported XML entity".into()),
                    }
                };
                output.push(value);
            }
            Event::Start(e) | Event::Empty(e) => {
                output.push(' ');
                for a in e.attributes() {
                    let a = a.map_err(|_| "XML attribute")?;
                    output.push_str(
                        &a.decoded_and_normalized_value(version, reader.decoder())
                            .map_err(|_| "XML attribute")?,
                    );
                    output.push(' ');
                }
            }
            Event::End(_) => output.push(' '),
            Event::Decl(declaration) => {
                version = declaration.xml_version().map_err(|_| "XML declaration")?;
            }
            Event::DocType(_) => return Err("XML document type rejected".into()),
            Event::Eof => break,
            _ => {}
        }
    }
    Ok(output.into_bytes())
}
fn pdf_strings(object: &lopdf::Object, rules: &[Regex]) -> Result<()> {
    match object {
        lopdf::Object::String(data, _) => {
            inspect(data, rules)?;
            if data.starts_with(&[254, 255]) || data.starts_with(&[255, 254]) {
                let little = data[0] == 255;
                let units: Vec<_> = data[2..]
                    .as_chunks::<2>()
                    .0
                    .iter()
                    .map(|b| {
                        if little {
                            u16::from_le_bytes([b[0], b[1]])
                        } else {
                            u16::from_be_bytes([b[0], b[1]])
                        }
                    })
                    .collect();
                inspect(String::from_utf16_lossy(&units).as_bytes(), rules)?;
            }
        }
        lopdf::Object::Array(values) => {
            for value in values {
                pdf_strings(value, rules)?;
            }
        }
        lopdf::Object::Dictionary(dict) => {
            for (_, value) in dict.iter() {
                pdf_strings(value, rules)?;
            }
        }
        lopdf::Object::Stream(stream) => {
            pdf_strings(&lopdf::Object::Dictionary(stream.dict.clone()), rules)?;
            if stream.dict.get(b"Type").ok().and_then(|o| o.as_name().ok()) == Some(b"Metadata") {
                let data = stream
                    .decompressed_content()
                    .unwrap_or_else(|_| stream.content.clone());
                if data.len() > MAX_FILE {
                    return Err("PDF metadata expansion limit".into());
                }
                inspect(&data, rules)?;
            }
        }
        _ => {}
    }
    Ok(())
}
pub fn inspect_file(path: &Path) -> Result<()> {
    regular(path)?;
    let data = bytes(path, MAX_FILE)?;
    let rules = patterns();
    inspect(&data, &rules)?;
    let suffix = path
        .extension()
        .and_then(|s| s.to_str())
        .unwrap_or("")
        .to_lowercase();
    if [
        "pem", "key", "pfx", "p12", "p8", "env", "db", "sqlite", "jsonl", "log",
    ]
    .contains(&suffix.as_str())
        || path
            .file_name()
            .and_then(|s| s.to_str())
            .is_some_and(|s| s == ".env")
    {
        return Err("Private file class rejected".into());
    }
    match suffix.as_str() {
        "json" => {
            let parsed = crate::json_input::value(&data).map_err(|_| "Malformed public JSON")?;
            inspect(
                &serde_json::to_vec(&parsed).map_err(|_| "JSON serialization")?,
                &rules,
            )?;
        }
        "pdf" => {
            let doc = lopdf::Document::load_mem(&data).map_err(|_| "PDF parsing failed")?;
            if doc.trailer.has(b"Encrypt") {
                return Err("Encrypted PDF rejected".into());
            }
            for obj in doc.objects.values() {
                pdf_strings(obj, &rules)?;
                if let Ok(d) = obj.as_dict() {
                    if d.has(b"EmbeddedFiles") || d.has(b"EF") {
                        return Err("PDF attachment rejected".into());
                    }
                }
            }
            inspect(format!("{:?}", doc.trailer).as_bytes(), &rules)?;
            for object in doc.objects.values() {
                if let lopdf::Object::Dictionary(dict) = object {
                    inspect(format!("{dict:?}").as_bytes(), &rules)?;
                }
            }
            let pages: Vec<_> = doc.get_pages().keys().copied().collect();
            inspect(
                doc.extract_text(&pages)
                    .map_err(|_| "PDF text extraction failed")?
                    .as_bytes(),
                &rules,
            )?;
        }
        "pptx" => {
            let count = super::archive::preflight(&data)?;
            if count > 2000 {
                return Err("Presentation entry limit".into());
            }
            let mut archive =
                zip::ZipArchive::new(Cursor::new(data)).map_err(|_| "Presentation ZIP invalid")?;
            if archive.len() != count {
                return Err("Presentation entry count mismatch".into());
            }
            let mut total = 0u64;
            let mut names = BTreeSet::new();
            for i in 0..archive.len() {
                let file = archive
                    .by_index(i)
                    .map_err(|_| "Presentation entry invalid")?;
                let declared = file.size();
                total = total
                    .checked_add(declared)
                    .ok_or("Presentation expansion limit")?;
                if total > 40 * 1024 * 1024
                    || declared > MAX_FILE as u64
                    || file.enclosed_name().is_none()
                {
                    return Err("Presentation expansion rejected".into());
                }
                let decoded_name = file
                    .name()
                    .map_err(|_| "Presentation name decoding failed")?;
                let name = decoded_name.to_lowercase();
                if name.is_empty()
                    || name.contains(['\\', ':', '\0'])
                    || name
                        .strip_suffix('/')
                        .unwrap_or(&name)
                        .split('/')
                        .any(|part| part.is_empty() || part == "." || part == "..")
                    || !names.insert(name.clone())
                {
                    return Err("Presentation ambiguous path rejected".into());
                }
                if let Some(mode) = file.unix_mode() {
                    let kind = mode & 0o170000;
                    let expected = if file.is_dir() { 0o040000 } else { 0o100000 };
                    if kind != 0 && kind != expected || !file.is_dir() && mode & 0o111 != 0 {
                        return Err("Presentation special or executable member rejected".into());
                    }
                }
                if name.ends_with(".bin") || name.ends_with(".exe") {
                    return Err("Presentation executable rejected".into());
                }
                inspect(decoded_name.as_bytes(), &rules)?;
                let directory = file.is_dir();
                let mut content = Vec::new();
                file.take((MAX_FILE + 1) as u64)
                    .read_to_end(&mut content)
                    .map_err(|_| "Presentation content or CRC invalid")?;
                if content.len() > MAX_FILE
                    || content.len() as u64 != declared
                    || directory && !content.is_empty()
                {
                    return Err("Presentation content limit".into());
                }
                inspect(&content, &rules)?;
                if name.ends_with(".xml") || name.ends_with(".rels") || name.ends_with(".svg") {
                    inspect(&xml(&content)?, &rules)?;
                }
            }
        }
        _ => {}
    }
    Ok(())
}
pub fn scan(root: &Path) -> Result<Value> {
    let names = inventory(root)?;
    for (index, name) in names.iter().enumerate() {
        inspect_file(&safe(root, name)?)
            .map_err(|e| format!("Public inventory item {index}: {e}"))?;
    }
    Ok(
        json!({"passed":true,"files_inspected":names.len(),"findings":0,"method":"rust_raw_json_pdf_xml_all_presentation_parts","independent_review":false}),
    )
}
pub fn pack(root: &Path, output: &Path, native: bool) -> Result<Value> {
    verify(root, None)?;
    let meta = metadata(root)?;
    let mut entries = vec![];
    let mut extra: Option<Value> = None;
    if native {
        let mut records = vec![];
        for name in [
            format!("stm-neurosymbolic{}", std::env::consts::EXE_SUFFIX),
            format!("stm-tool{}", std::env::consts::EXE_SUFFIX),
        ] {
            let file = root.join("engine/target/release").join(&name);
            inspect_file(&file)?;
            let data = bytes(&file, 64 * 1024 * 1024)?;
            records.push(json!({"path":name,"sha256":hash(&data)}));
            entries.push((name, data));
        }
        for name in ["LICENSE", "NOTICE.md"] {
            let data = bytes(&safe(root, name)?, MAX_FILE)?;
            records.push(json!({"path":name,"sha256":hash(&data)}));
            entries.push((name.into(), data));
        }
        extra = Some(
            json!({"engine_version":meta["engine_version"],"kb_version":meta["kb_version"],"platform":std::env::consts::OS,"architecture":std::env::consts::ARCH,"source_manifest_sha256":hash(&bytes(&root.join("RELEASE_MANIFEST.json"),MAX_FILE)?),"status":"candidate_independent_acceptance_pending","files":records}),
        );
    } else {
        super::validation::knowledge(root)?;
        scan(root)?;
        for name in inventory(root)? {
            if name.ends_with(".py") || name.starts_with("requirements-") {
                return Err("Python dependency in supported inventory".into());
            }
            entries.push((name.clone(), bytes(&safe(root, &name)?, MAX_FILE)?));
        }
    }
    if let Some(v) = extra {
        entries.push(("BINARY_MANIFEST.json".into(), canonical(&v)));
    }
    let outdir = root.join("output");
    fs::create_dir_all(&outdir).map_err(|_| "Output directory")?;
    regular(&outdir)?;
    let target = if output.is_absolute() {
        output.to_path_buf()
    } else {
        root.join(output)
    };
    if !target.starts_with(&outdir)
        || target
            .components()
            .any(|c| matches!(c, std::path::Component::ParentDir))
    {
        return Err("Archive output outside workspace".into());
    }
    let parent = target
        .parent()
        .ok_or("Archive parent unavailable")?
        .canonicalize()
        .map_err(|_| "Archive parent unavailable")?;
    if !parent.starts_with(
        outdir
            .canonicalize()
            .map_err(|_| "Output directory unavailable")?,
    ) || target.exists() && regular(&target).is_err()
    {
        return Err("Archive output escaped workspace".into());
    }
    let file = fs::File::create(&target).map_err(|_| "Archive output unavailable")?;
    let mut writer = zip::ZipWriter::new(file);
    let options = zip::write::SimpleFileOptions::default()
        .system(zip::System::Unix)
        .compression_method(zip::CompressionMethod::Deflated)
        .last_modified_time(
            zip::DateTime::from_date_and_time(2026, 10, 26, 0, 0, 0).map_err(|_| "ZIP date")?,
        )
        .unix_permissions(0o100644);
    entries.sort_by(|a, b| a.0.cmp(&b.0));
    for (name, data) in entries {
        let options = if native && name.starts_with("stm-") {
            options.unix_permissions(0o100755)
        } else {
            options
        };
        writer.start_file(name, options).map_err(|_| "ZIP record")?;
        writer.write_all(&data).map_err(|_| "ZIP write")?;
    }
    writer.finish().map_err(|_| "ZIP completion")?;
    Ok(
        json!({"packaged":true,"sha256":hash(&bytes(&target,80*1024*1024)?),"independent_acceptance":false}),
    )
}
pub fn extract(archive: &Path, target: &Path) -> Result<()> {
    regular(archive)?;
    let data = bytes(archive, 80 * 1024 * 1024)?;
    let members = super::archive::plan(&data)?;
    super::archive::write_plan(&members, target)
}
