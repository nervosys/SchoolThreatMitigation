use serde_json::{json, Value};
use sha2::{Digest, Sha256};
use std::{
    fs,
    io::{Read, Write},
    path::{Component, Path, PathBuf},
};
pub type Result<T> = std::result::Result<T, String>;
pub const MAX_FILE: usize = 20 * 1024 * 1024;
pub fn bytes(path: &Path, limit: usize) -> Result<Vec<u8>> {
    let mut data = Vec::new();
    fs::File::open(path)
        .map_err(|_| "File unavailable; path redacted")?
        .take((limit + 1) as u64)
        .read_to_end(&mut data)
        .map_err(|_| "File read failed")?;
    if data.len() > limit {
        return Err("File size limit".into());
    }
    Ok(data)
}
pub fn input(limit: usize) -> Result<Vec<u8>> {
    let mut data = Vec::new();
    std::io::stdin()
        .take((limit + 1) as u64)
        .read_to_end(&mut data)
        .map_err(|_| "Input unavailable")?;
    if data.len() > limit {
        return Err("Input size limit".into());
    }
    Ok(data)
}
pub fn read(path: &Path) -> Result<Value> {
    crate::json_input::value(&bytes(path, MAX_FILE)?)
        .map_err(|_| "Invalid JSON; content redacted".into())
}
pub fn canonical(value: &Value) -> Vec<u8> {
    serde_json::to_vec(value).expect("JSON serializes")
}
pub fn hash(data: &[u8]) -> String {
    format!("{:x}", Sha256::digest(data))
}
pub fn json_hash(value: &Value) -> String {
    hash(&canonical(value))
}
pub fn regular(path: &Path) -> Result<()> {
    let m = fs::symlink_metadata(path).map_err(|_| "File unavailable")?;
    if m.file_type().is_symlink() {
        return Err("Linked file rejected".into());
    }
    #[cfg(windows)]
    {
        use std::os::windows::fs::MetadataExt;
        if m.file_attributes() & 0x400 != 0 {
            return Err("Reparse point rejected".into());
        }
    }
    Ok(())
}
pub fn safe(root: &Path, name: &str) -> Result<PathBuf> {
    if name.is_empty()
        || name.contains(['\\', ':'])
        || name
            .split('/')
            .any(|s| s.is_empty() || s == "." || s == "..")
        || Path::new(name).is_absolute()
    {
        return Err("Unsafe inventory path".into());
    }
    let mut path = root.to_path_buf();
    for part in Path::new(name).components() {
        if let Component::Normal(p) = part {
            path.push(p);
            regular(&path)?;
        } else {
            return Err("Unsafe path component".into());
        }
    }
    if !path
        .canonicalize()
        .map_err(|_| "File unavailable")?
        .starts_with(root.canonicalize().map_err(|_| "Root unavailable")?)
    {
        return Err("Path escapes root".into());
    }
    Ok(path)
}
pub fn text<'a>(v: &'a Value, key: &str) -> Result<&'a str> {
    v.get(key)
        .and_then(Value::as_str)
        .ok_or_else(|| "Required string missing".into())
}
pub fn arr<'a>(v: &'a Value, key: &str) -> Result<&'a Vec<Value>> {
    v.get(key)
        .and_then(Value::as_array)
        .ok_or_else(|| "Required array missing".into())
}
pub fn write(path: &Path, value: &Value) -> Result<()> {
    if let Some(p) = path.parent() {
        fs::create_dir_all(p).map_err(|_| "Output unavailable")?;
    }
    let mut data = serde_json::to_vec_pretty(value).map_err(|_| "Serialization failed")?;
    data.push(b'\n');
    fs::write(path, data).map_err(|_| "Output write failed".into())
}
pub fn export(root: &Path, path: &Path, value: &Value) -> Result<()> {
    let out = root.join("output");
    fs::create_dir_all(&out).map_err(|_| "Output unavailable")?;
    regular(&out)?;
    let target = if path.is_absolute() {
        path.to_path_buf()
    } else {
        root.join(path)
    };
    let parent = target.parent().ok_or("Output parent required")?; // Reject traversal before creating a directory.
    if target
        .components()
        .any(|c| matches!(c, Component::ParentDir))
        || !target.starts_with(&out)
        || target.extension().and_then(|s| s.to_str()) != Some("json")
    {
        return Err("Use new JSON under workspace output".into());
    }
    let mut directory = out.clone();
    for part in parent
        .strip_prefix(&out)
        .map_err(|_| "Output escapes workspace")?
        .components()
    {
        if let Component::Normal(name) = part {
            directory.push(name);
            if !directory.exists() {
                fs::create_dir(&directory).map_err(|_| "Output unavailable")?;
            }
            regular(&directory)?;
        } else {
            return Err("Unsafe output component".into());
        }
    }
    if !parent
        .canonicalize()
        .map_err(|_| "Output unavailable")?
        .starts_with(out.canonicalize().map_err(|_| "Output unavailable")?)
    {
        return Err("Output escapes workspace".into());
    }
    let data = serde_json::to_vec_pretty(value).map_err(|_| "Output serialization failed")?;
    if data.len() > 4 * 1024 * 1024 {
        return Err("Output limit".into());
    }
    let mut f = fs::OpenOptions::new()
        .write(true)
        .create_new(true)
        .open(target)
        .map_err(|_| "New output file required")?;
    f.write_all(&data).map_err(|_| "Output failed".into())
}
pub fn utc_date() -> Result<String> {
    Ok(crate::currency::Date::utc_today()?.iso())
}
pub fn metadata(root: &Path) -> Result<Value> {
    let m = read(&root.join("release.json"))?;
    if m["independent_acceptance"] != false {
        return Err("Generated acceptance prohibited".into());
    }
    Ok(m)
}
pub fn unaccepted() -> Value {
    json!({"independent_acceptance":false,"deployment_authorization":false})
}
