use super::base::*;
use std::{
    io::{Read, Write},
    path::Path,
    process::{Command, Stdio},
    sync::mpsc,
    thread,
    time::{Duration, Instant},
};
pub fn run(
    executable: &Path,
    args: &[&str],
    data: &[u8],
    limit: usize,
    timeout: Duration,
) -> Result<Vec<u8>> {
    if data.len() > 4 * 1024 * 1024 || limit > 80 * 1024 * 1024 {
        return Err("Process size limit".into());
    }
    let mut command = Command::new(executable);
    command.env_clear();
    #[cfg(windows)]
    if let Some(system_root) = std::env::var_os("SystemRoot") {
        command.env("SystemRoot", system_root);
    }
    command
        .args(args)
        .stdin(Stdio::piped())
        .stdout(Stdio::piped())
        .stderr(Stdio::piped());
    #[cfg(windows)]
    {
        use std::os::windows::process::CommandExt;
        command.creation_flags(0x08000000);
    }
    let start = Instant::now();
    let mut child = command
        .spawn()
        .map_err(|_| "Process launch failed; details redacted")?;
    let mut input = child.stdin.take().ok_or("Process input unavailable")?;
    let mut output = child.stdout.take().ok_or("Process output unavailable")?;
    let mut diagnostic = child
        .stderr
        .take()
        .ok_or("Process diagnostic unavailable")?;
    let (sender, receiver) = mpsc::channel::<Result<Option<Vec<u8>>>>();
    let payload = data.to_vec();
    let s = sender.clone();
    thread::spawn(move || {
        let result = input
            .write_all(&payload)
            .map(|_| None)
            .map_err(|_| "Process input failed".into());
        drop(input);
        let _ = s.send(result);
    });
    let s = sender.clone();
    thread::spawn(move || {
        let mut result = Vec::new();
        let mut buffer = [0u8; 4096];
        let value = (|| {
            loop {
                let n = output.read(&mut buffer).map_err(|_| "Output read failed")?;
                if n == 0 {
                    break;
                }
                if result.len() + n > limit {
                    return Err("Process output limit".into());
                }
                result.extend_from_slice(&buffer[..n]);
            }
            Ok(Some(result))
        })();
        let _ = s.send(value);
    });
    thread::spawn(move || {
        let mut b = [0u8; 1];
        let value = match diagnostic.read(&mut b) {
            Ok(0) => Ok(None),
            _ => Err("Process diagnostics rejected".into()),
        };
        let _ = sender.send(value);
    });
    let mut completed = 0;
    let mut bytes = None;
    let mut failure = false;
    let result = loop {
        while let Ok(event) = receiver.try_recv() {
            completed += 1;
            match event {
                Ok(Some(v)) => bytes = Some(v),
                Ok(None) => {}
                Err(_) => failure = true,
            }
        }
        if failure || start.elapsed() >= timeout {
            break Err("Process failed; output and diagnostics redacted".into());
        }
        match child.try_wait() {
            Ok(Some(status)) if completed == 3 => {
                if status.success() {
                    break bytes.take().ok_or_else(|| "Process output missing".into());
                }
                break Err("Process exit failed; diagnostics redacted".into());
            }
            Ok(_) => {}
            Err(_) => break Err("Process supervision failed".into()),
        }
        thread::sleep(Duration::from_millis(2));
    };
    if child.try_wait().ok().flatten().is_none() {
        let _ = child.kill();
    }
    let _ = child.wait();
    result
}
pub fn executable(path: &Path, pin: &str) -> Result<std::path::PathBuf> {
    if pin.len() != 64
        || !pin
            .bytes()
            .all(|c| c.is_ascii_digit() || (b'a'..=b'f').contains(&c))
    {
        return Err("Trusted executable SHA-256 required".into());
    }
    regular(path)?;
    if !path.is_file() {
        return Err("Native executable file required".into());
    }
    if hash(&bytes(path, 64 * 1024 * 1024)?) != pin {
        return Err("Executable pin mismatch".into());
    }
    path.canonicalize()
        .map_err(|_| "Executable unavailable".into())
}
pub fn mcp(executable: &Path, calls: &[serde_json::Value]) -> Result<Vec<serde_json::Value>> {
    use serde_json::json;
    let mut data = Vec::new();
    let init = json!({"jsonrpc":"2.0","id":1,"method":"initialize","params":{"protocolVersion":"2025-06-18","capabilities":{},"clientInfo":{"name":"public-rust-check","version":"1"}}});
    for request in [
        init,
        json!({"jsonrpc":"2.0","method":"notifications/initialized"}),
    ]
    .iter()
    .chain(calls)
    {
        data.extend(canonical(request));
        data.push(b'\n');
    }
    let output = run(
        executable,
        &["mcp"],
        &data,
        80 * 1024 * 1024,
        Duration::from_secs(120),
    )?;
    let responses = output
        .split(|b| *b == b'\n')
        .filter(|s| !s.is_empty())
        .map(|line| crate::json_input::value(line).map_err(|_| "MCP response invalid".to_string()))
        .collect::<Result<Vec<_>>>()?;
    if responses.len() != calls.len() + 1
        || responses
            .iter()
            .enumerate()
            .any(|(i, v)| v["id"] != json!(i + 1) || v.get("error").is_some())
    {
        return Err("MCP correlation failure".into());
    }
    if responses[0]["result"]["protocolVersion"] != "2025-06-18" {
        return Err("MCP protocol mismatch".into());
    }
    Ok(responses
        .into_iter()
        .skip(1)
        .map(|r| r["result"].clone())
        .collect())
}
pub fn call(id: usize, name: &str, args: serde_json::Value) -> serde_json::Value {
    serde_json::json!({"jsonrpc":"2.0","id":id,"method":"tools/call","params":{"name":name,"arguments":args}})
}
pub fn decoded(result: &serde_json::Value) -> Result<serde_json::Value> {
    if result["isError"] != false
        || result["content"].as_array().map(Vec::len) != Some(1)
        || result["content"][0]["type"] != "text"
    {
        return Err("Tool response rejected".into());
    }
    crate::json_input::value(text(&result["content"][0], "text")?.as_bytes())
        .map_err(|_| "Tool JSON rejected".into())
}
