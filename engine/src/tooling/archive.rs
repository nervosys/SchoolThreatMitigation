//! Bounded, portable ZIP planning and pinned native-package verification.
use super::{base::*, release};
use serde::Deserialize;
use serde_json::{json, Value};
use std::{
    collections::BTreeSet,
    fs,
    io::{Cursor, Read, Write},
    path::Path,
};

const MAX_ARCHIVE: usize = 80 * 1024 * 1024;
pub(crate) struct Member {
    name: String,
    data: Vec<u8>,
    directory: bool,
    executable: bool,
}
fn portable_name(name: &str, directory: bool) -> Result<String> {
    let value = if directory {
        name.strip_suffix('/').ok_or("Invalid ZIP directory")?
    } else {
        name
    };
    if value.is_empty() || value.len() > 240 || value.split('/').count() > 32 {
        return Err("ZIP path limit".into());
    }
    for part in value.split('/') {
        if part.is_empty()
            || part == "."
            || part == ".."
            || part.len() > 128
            || part.ends_with(['.', ' '])
            || !part
                .bytes()
                .all(|c| c.is_ascii_alphanumeric() || b"._- ".contains(&c))
        {
            return Err("Nonportable ZIP name".into());
        }
        let stem = part
            .split('.')
            .next()
            .unwrap()
            .trim_end_matches(' ')
            .to_ascii_uppercase();
        if ["CON", "PRN", "AUX", "NUL"].contains(&stem.as_str())
            || stem.len() == 4
                && (stem.starts_with("COM") || stem.starts_with("LPT"))
                && matches!(stem.as_bytes()[3], b'1'..=b'9')
        {
            return Err("Reserved ZIP name".into());
        }
    }
    Ok(value.to_owned())
}
pub(super) fn preflight(data: &[u8]) -> Result<usize> {
    if data.len() < 22 || !data.starts_with(b"PK\x03\x04") {
        return Err("Standard ZIP required".into());
    }
    let start = data.len().saturating_sub(65557);
    let at = (start..=data.len() - 22)
        .rev()
        .find(|i| {
            data[*i..].starts_with(b"PK\x05\x06")
                && *i + 22 + u16::from_le_bytes([data[*i + 20], data[*i + 21]]) as usize
                    == data.len()
        })
        .ok_or("ZIP trailer invalid")?;
    let word = |i| u16::from_le_bytes([data[at + i], data[at + i + 1]]);
    let number = |i| u32::from_le_bytes(data[at + i..at + i + 4].try_into().unwrap());
    let count = word(10) as usize;
    if word(4) != 0
        || word(6) != 0
        || word(8) != word(10)
        || !(1..=4096).contains(&count)
        || number(12) > 8 * 1024 * 1024
        || number(16) as u64 + number(12) as u64 != at as u64
        // The ZIP reader otherwise prefers ZIP64 counts over the bounded footer.
        || at >= 20 && data[at - 20..].starts_with(b"PK\x06\x07")
    {
        return Err("ZIP layout or entry limit".into());
    }
    Ok(count)
}
pub(crate) fn plan(data: &[u8]) -> Result<Vec<Member>> {
    if data.len() > MAX_ARCHIVE {
        return Err("Archive size limit".into());
    }
    let count = preflight(data)?;
    let mut archive = zip::ZipArchive::new(Cursor::new(data)).map_err(|_| "Invalid ZIP")?;
    if archive.len() != count {
        return Err("ZIP entry count mismatch".into());
    }
    let mut names = BTreeSet::new();
    let mut files = BTreeSet::new();
    let mut required_directories = BTreeSet::new();
    let mut total = 0u64;
    let mut result = Vec::new();
    for i in 0..count {
        let entry = archive.by_index(i).map_err(|_| "Invalid ZIP entry")?;
        let directory = entry.is_dir();
        let decoded_name = entry.name().map_err(|_| "ZIP name decoding failed")?;
        let name = portable_name(&decoded_name, directory)?;
        let folded = name.to_ascii_lowercase();
        if !names.insert(folded.clone()) {
            return Err("ZIP alias or duplicate".into());
        }
        if let Some(mode) = entry.unix_mode() {
            let kind = mode & 0o170000;
            if kind != 0 && kind != if directory { 0o040000 } else { 0o100000 } {
                return Err("ZIP special file rejected".into());
            }
        }
        let mut parent = folded.as_str();
        while let Some((next, _)) = parent.rsplit_once('/') {
            required_directories.insert(next.to_owned());
            parent = next;
        }
        if directory {
            required_directories.insert(folded);
        } else {
            files.insert(folded);
        }
        let executable = entry.unix_mode().is_some_and(|mode| mode & 0o111 != 0);
        let declared = entry.size();
        total = total.checked_add(declared).ok_or("ZIP expansion limit")?;
        if declared > MAX_FILE as u64 || total > MAX_ARCHIVE as u64 || directory && declared != 0 {
            return Err("ZIP expansion limit".into());
        }
        let mut content = Vec::new();
        entry
            .take((MAX_FILE + 1) as u64)
            .read_to_end(&mut content)
            .map_err(|_| "ZIP content or CRC invalid")?;
        if content.len() as u64 != declared {
            return Err("ZIP size mismatch".into());
        }
        result.push(Member {
            name,
            data: content,
            directory,
            executable,
        });
    }
    if files.iter().any(|file| required_directories.contains(file)) {
        return Err("ZIP file/directory collision".into());
    }
    Ok(result)
}
pub(crate) fn write_plan(members: &[Member], target: &Path) -> Result<()> {
    if target.exists() {
        return Err("New extraction directory required".into());
    }
    if let Some(parent) = target.parent() {
        if !parent.as_os_str().is_empty() {
            fs::create_dir_all(parent).map_err(|_| "Extraction parent unavailable")?;
        }
    }
    fs::create_dir(target).map_err(|_| "New extraction directory unavailable")?;
    for entry in members {
        let out = target.join(&entry.name);
        if entry.directory {
            fs::create_dir_all(&out).map_err(|_| "Extraction directory failed")?;
            continue;
        }
        if let Some(parent) = out.parent() {
            fs::create_dir_all(parent).map_err(|_| "Extraction directory failed")?;
        }
        let mut file = fs::OpenOptions::new()
            .write(true)
            .create_new(true)
            .open(&out)
            .map_err(|_| "Extraction file unavailable")?;
        file.write_all(&entry.data)
            .map_err(|_| "Extraction write failed")?;
        #[cfg(unix)]
        {
            use std::os::unix::fs::PermissionsExt;
            fs::set_permissions(
                &out,
                fs::Permissions::from_mode(if entry.executable { 0o755 } else { 0o644 }),
            )
            .map_err(|_| "Extraction permissions failed")?;
        }
    }
    Ok(())
}
#[derive(Deserialize)]
#[serde(deny_unknown_fields)]
struct Manifest {
    engine_version: String,
    kb_version: String,
    platform: String,
    architecture: String,
    source_manifest_sha256: String,
    status: String,
    files: Vec<Record>,
}
#[derive(Deserialize)]
#[serde(deny_unknown_fields)]
struct Record {
    path: String,
    sha256: String,
}
fn digest(value: &str) -> bool {
    value.len() == 64
        && value
            .bytes()
            .all(|c| c.is_ascii_digit() || (b'a'..=b'f').contains(&c))
}
fn header(data: &[u8], platform: &str) -> bool {
    if platform == "linux" {
        data.len() >= 64
            && data.starts_with(b"\x7fELF")
            && data[4] == 2
            && data[5] == 1
            && [2u16, 3u16].contains(&u16::from_le_bytes([data[16], data[17]]))
            && data[18..20] == [62, 0]
    } else {
        if data.len() < 64 || !data.starts_with(b"MZ") {
            return false;
        }
        let offset = u32::from_le_bytes(data[60..64].try_into().unwrap()) as usize;
        offset.checked_add(26).is_some_and(|end| end <= data.len())
            && data[offset..offset + 4] == *b"PE\0\0"
            && data[offset + 4..offset + 6] == [0x64, 0x86]
            && data[offset + 24..offset + 26] == [0x0b, 0x02]
    }
}
pub fn native(
    root: &Path,
    archive: &Path,
    archive_pin: &str,
    source_pin: &str,
    platform: &str,
    architecture: &str,
    output: Option<&Path>,
) -> Result<Value> {
    if !digest(archive_pin)
        || !digest(source_pin)
        || !["windows", "linux"].contains(&platform)
        || architecture != "x86_64"
    {
        return Err("Native trust or target configuration invalid".into());
    }
    regular(archive)?;
    let data = bytes(archive, MAX_ARCHIVE)?;
    if hash(&data) != archive_pin {
        return Err("Native archive pin mismatch".into());
    }
    release::verify(root, Some(source_pin))?;
    let members = plan(&data)?;
    if members.len() != 5 || members.iter().any(|member| member.directory) {
        return Err("Native inventory invalid".into());
    }
    let metadata = metadata(root)?;
    let manifest = members
        .iter()
        .find(|m| m.name == "BINARY_MANIFEST.json")
        .ok_or("Native manifest missing")?;
    let m: Manifest =
        crate::json_input::decode(&manifest.data).map_err(|_| "Native manifest invalid")?;
    if m.engine_version != text(&metadata, "engine_version")?
        || m.kb_version != text(&metadata, "kb_version")?
        || m.platform != platform
        || m.architecture != architecture
        || m.source_manifest_sha256 != source_pin
        || m.status != "candidate_independent_acceptance_pending"
        || m.files.len() != 4
    {
        return Err("Native manifest binding mismatch".into());
    }
    let suffix = if platform == "windows" { ".exe" } else { "" };
    let engine = format!("stm-neurosymbolic{suffix}");
    let verifier = format!("stm-tool{suffix}");
    let expected: BTreeSet<_> = [engine.as_str(), verifier.as_str(), "LICENSE", "NOTICE.md"]
        .into_iter()
        .collect();
    let actual: BTreeSet<_> = m.files.iter().map(|r| r.path.as_str()).collect();
    if expected != actual {
        return Err("Native records invalid".into());
    }
    for record in &m.files {
        let member = members
            .iter()
            .find(|e| e.name == record.path)
            .ok_or("Native member missing")?;
        if !digest(&record.sha256) || hash(&member.data) != record.sha256 {
            return Err("Native member digest mismatch".into());
        }
        let binary = record.path == engine || record.path == verifier;
        if member.executable != binary || binary && !header(&member.data, platform) {
            return Err("Native binary target or mode mismatch".into());
        }
        release::inspect_bytes(&member.data)?;
    }
    if manifest.executable {
        return Err("Native manifest mode invalid".into());
    }
    if let Some(target) = output {
        write_plan(&members, target)?;
    }
    Ok(
        json!({"verified":true,"extracted":output.is_some(),"platform":platform,"architecture":architecture,"source_manifest_sha256":source_pin,"archive_sha256":archive_pin,"files_verified":4,"executable_sha256":m.files.iter().find(|r|r.path==engine).unwrap().sha256,"verifier_sha256":m.files.iter().find(|r|r.path==verifier).unwrap().sha256,"binary_header_consistent":true,"privacy_findings":0,"independent_acceptance":false,"deployment_authorization":false}),
    )
}
