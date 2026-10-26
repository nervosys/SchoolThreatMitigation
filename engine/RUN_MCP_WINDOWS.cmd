@echo off
setlocal
cd /d "%~dp0"
REM stdout is reserved for MCP JSON-RPC; Cargo diagnostics go to stderr.
cargo run --quiet --release --manifest-path Cargo.toml -- mcp
exit /b %ERRORLEVEL%
