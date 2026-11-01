//! Public-input safeguards. Heuristics supplement data minimization, not a PII guarantee.
use std::io::BufRead;

pub const MAX_REQUEST_BYTES: usize = 65_536;
pub const MAX_QUERY_CHARS: usize = 2_400;

pub fn public_query(text: &str) -> Result<(), String> {
    let text = text.trim();
    if text.is_empty() || text.chars().count() > MAX_QUERY_CHARS {
        return Err("Public query must contain 1 to 2400 characters".into());
    }
    let lower = text.to_lowercase();
    let markers = [
        "student id",
        "student name",
        "pupil id",
        "social security",
        "date of birth",
        "home address",
        "serial number",
        "password",
        "api_key",
        "api key",
        "access_token",
        "private key",
        concat!("/", "users/"),
        concat!("/", "home/"),
        "http://",
        "https://",
    ];
    let digit_count = text.chars().filter(char::is_ascii_digit).count();
    if text.contains('\\')
        || text.contains('@')
        || text.contains('\0')
        || text.chars().any(|c| c.is_control())
        || digit_count >= 7
        || markers.iter().any(|m| lower.contains(m))
    {
        return Err(
            "Public topics only; remove identifying, credential, and site-specific information"
                .into(),
        );
    }
    Ok(())
}

pub fn knowledge_id(id: &str) -> bool {
    !id.is_empty() && id.len() <= 64 && id.bytes().all(|c| c.is_ascii_alphanumeric() || c == b'-')
}

/// Read at most limit+1 bytes into memory, even without a newline. An overlong
/// message terminates the stream; no unbounded allocation or input echo occurs.
pub fn bounded_line<R: BufRead>(reader: &mut R, limit: usize) -> Result<Option<Vec<u8>>, String> {
    let mut bytes = Vec::new();
    loop {
        let buf = reader.fill_buf().map_err(|_| "Input stream unavailable")?;
        if buf.is_empty() {
            return if bytes.is_empty() {
                Ok(None)
            } else {
                Ok(Some(bytes))
            };
        }
        let count = buf
            .iter()
            .position(|c| *c == b'\n')
            .map_or(buf.len(), |n| n + 1);
        if count > limit.saturating_sub(bytes.len()) {
            return Err("Request exceeds byte limit".into());
        }
        let done = buf[count - 1] == b'\n';
        bytes.extend_from_slice(&buf[..count]);
        reader.consume(count);
        if done {
            return Ok(Some(bytes));
        }
    }
}
