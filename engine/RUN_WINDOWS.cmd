@echo off
setlocal
cd /d "%~dp0"
where cargo >nul 2>&1
if errorlevel 1 (
  echo Rust/Cargo is not installed. Install via https://rustup.rs/
  exit /b 1
)
cargo run --manifest-path Cargo.toml -- %*
exit /b %ERRORLEVEL%
