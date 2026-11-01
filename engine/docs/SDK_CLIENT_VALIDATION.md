# Rust SDK and native protocol validation

The project has two complementary MCP checks. `stm-tool check-mcp` uses the project-maintained Rust stdio client. `cargo test --locked --manifest-path engine/Cargo.toml --test rust_sdk` uses the official Rust MCP SDK, pinned to `rmcp` 3.5.1 as a development dependency. No Python or network transport is enabled. No SDK tracing subscriber is installed; child environment values are cleared except Windows SystemRoot and child diagnostics are discarded.

The official SDK test uses the server's supported `2025-06-18` protocol and its initialize/initialized lifecycle. It checks five read-only tools, 42 Boolean definitions without defaults, all five tools, eight assessments replayed against their original requests by the separate interpreter, eight rejected calls, and identical empty-fact reasoning across two sessions. It completes 21 tool calls. Unsupported transport/lifecycle/protocol versions and desktop hosts require separate tests.

`stm-tool check --cargo` runs the Cargo test and writes `qa/rust_sdk_validation.json` only when it was actually executed. A failed or missing SDK test fails the check; a successful native protocol check alone is not labeled SDK evidence. `stm-tool check` without `--cargo` runs the native protocol checks, not the SDK integration test. CI's all-target Cargo test includes the SDK test.

`stm-tool check-reasoning` separately checks all 582 local ternary assignments through the actual engine. Results remain in `qa/native_mcp_validation.json` and `qa/reasoning_matrix.json`. These are maintainer engineering tests, not independent evaluation or selected desktop-host acceptance.

The official Python SDK results from 0.3 remain historical evidence in the retained archives. RC1 QA/manifests and package verification are preserved under `qa/baselines/engine_0_4_rc1`. No historical report is relabeled as a current result.

RC10 exercises search with an integral floating representation (8.0), matching the advertised integer schema without changing the 21-call SDK fixture. The separate schema contract regressions cover numeric boundaries, all 42 fact descriptions, 84 valid Boolean assessments with independent replay and 254 malformed fact/argument rejections. Those development tests supplement native/SDK qualification and do not complete independent acceptance.
