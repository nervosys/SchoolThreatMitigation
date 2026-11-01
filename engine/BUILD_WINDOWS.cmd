@echo off
setlocal
cd /d "%~dp0.."
set "CARGO_TARGET_DIR=engine\target"
set "CARGO_BUILD_JOBS=1"
if not defined CARGO_ENCODED_RUSTFLAGS set "CARGO_ENCODED_RUSTFLAGS=--remap-path-prefix=%CD%=/source"
cargo build --locked --release --manifest-path engine\Cargo.toml --bins
exit /b %ERRORLEVEL%
