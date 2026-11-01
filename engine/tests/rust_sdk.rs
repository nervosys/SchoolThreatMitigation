//! Official Rust SDK interoperability; public synthetic inputs, no SDK logger.
use rmcp::{
    model::{
        CallToolRequestParams, ClientCapabilities, ClientConfig, Implementation, ProtocolVersion,
    },
    service::RunningService,
    transport::TokioChildProcess,
    RoleClient, ServiceExt,
};
use serde_json::{json, Value};
use std::{process::Stdio, time::Duration};
use stm_neurosymbolic::{
    engine::KnowledgeBase,
    tooling::{base::canonical, process, replay},
};

type Client = RunningService<RoleClient, ClientConfig>;
type Result<T> = std::result::Result<T, &'static str>;

async fn connect() -> Result<Client> {
    let mut command = tokio::process::Command::new(env!("CARGO_BIN_EXE_stm-neurosymbolic"));
    command.arg("mcp").env_clear().kill_on_drop(true);
    #[cfg(windows)]
    {
        if let Some(value) = std::env::var_os("SystemRoot") {
            command.env("SystemRoot", value);
        }
        command.creation_flags(0x08000000);
    }
    let (transport, _) = TokioChildProcess::builder(command)
        .stderr(Stdio::null())
        .spawn()
        .map_err(|_| "SDK child launch failed; diagnostics redacted")?;
    ClientConfig::new(
        ClientCapabilities::default(),
        Implementation::new("public-rust-sdk-check", "1"),
    )
    .with_protocol_version(ProtocolVersion::V_2025_06_18)
    .serve(transport)
    .await
    .map_err(|_| "SDK initialization failed; diagnostics redacted")
}
async fn call(client: &Client, name: &'static str, arguments: Value) -> Result<Value> {
    let params = CallToolRequestParams::new(name).with_arguments(
        arguments
            .as_object()
            .ok_or("SDK argument fixture invalid")?
            .clone(),
    );
    let response = client
        .call_tool(params)
        .await
        .map_err(|_| "SDK tool call failed; diagnostics redacted")?;
    serde_json::to_value(response).map_err(|_| "SDK serialization failed")
}
async fn exercise() -> Result<()> {
    let kb = KnowledgeBase::embedded().map_err(|_| "SDK knowledge fixture invalid")?;
    let client = connect().await?;
    let peer = client.peer_info().ok_or("SDK peer metadata missing")?;
    if peer.protocol_version != ProtocolVersion::V_2025_06_18
        || peer.server_info.as_ref().map(|info| info.version.as_str())
            != Some(env!("CARGO_PKG_VERSION"))
    {
        return Err("SDK negotiated identity mismatch");
    }

    let tools = client
        .list_all_tools()
        .await
        .map_err(|_| "SDK discovery failed")?;
    let discovery = serde_json::to_value(&tools).map_err(|_| "SDK discovery serialization")?;
    let expected = ["kb_search", "kb_explain", "kb_trace", "kb_assess", "kb_ask"];
    if tools.len() != 5
        || expected
            .iter()
            .any(|name| !tools.iter().any(|t| t.name == *name))
    {
        return Err("SDK tool inventory mismatch");
    }
    for tool in discovery.as_array().ok_or("SDK tool array invalid")? {
        let a = &tool["annotations"];
        if a["readOnlyHint"] != true
            || a["destructiveHint"] != false
            || a["idempotentHint"] != true
            || a["openWorldHint"] != false
        {
            return Err("SDK tool annotations mismatch");
        }
    }
    let assessment = discovery
        .as_array()
        .unwrap()
        .iter()
        .find(|t| t["name"] == "kb_assess")
        .ok_or("SDK assessment tool missing")?;
    let properties = assessment["inputSchema"]["properties"]["facts"]["properties"]
        .as_object()
        .ok_or("SDK fact definitions missing")?;
    if properties.len() != 42
        || properties.values().any(|p| {
            p["type"] != "boolean"
                || p.get("default").is_some()
                || p["description"].as_str().is_none_or(str::is_empty)
        })
    {
        return Err("SDK fact definitions mismatch");
    }
    for (name, args) in [
        (
            "kb_search",
            json!({"query":"egress accessibility","limit":8.0}),
        ),
        ("kb_explain", json!({"id":"T01"})),
        ("kb_trace", json!({"id":"T01"})),
        (
            "kb_ask",
            json!({"question":"egress accessibility","role":"auditor"}),
        ),
    ] {
        process::decoded(&call(&client, name, args).await?)
            .map_err(|_| "SDK public response invalid")?;
    }
    let mut requests = vec![json!({"facts":{}})];
    for rule in kb.rules.rules.iter().take(7) {
        let mut facts = serde_json::Map::new();
        for p in rule.when.iter().chain(&rule.check) {
            facts.insert(p.fact.clone(), p.equals.clone());
        }
        requests.push(json!({"facts":facts,"as_of":kb.rules.rules_reviewed_as_of,"expected_kb_version":kb.rules.kb_version}));
    }
    let mut first = None;
    for request in requests {
        let response = process::decoded(&call(&client, "kb_assess", request.clone()).await?)
            .map_err(|_| "SDK assessment invalid")?;
        replay::verify(&kb, &request, &response, env!("CARGO_PKG_VERSION"))
            .map_err(|_| "SDK assessment replay failed")?;
        if first.is_none() {
            first = Some(response);
        }
    }
    let marker = ["public synthetic ", "123", "4567"].join("");
    for (name, args) in [
        (
            "kb_assess",
            json!({"facts":{"unknown_public_fixture":true}}),
        ),
        ("kb_assess", json!({"facts":{"wa_public_school":"true"}})),
        (
            "kb_assess",
            json!({"facts":{},"expected_kb_version":"wrong"}),
        ),
        ("kb_assess", json!({"facts":{},"as_of":"2026-02-30"})),
        ("kb_search", json!({"query":"egress","limit":0})),
        ("kb_ask", json!({"question":"egress","role":"operator"})),
        ("execute", json!({})),
        ("kb_search", json!({"query":marker})),
    ] {
        let response = call(&client, name, args).await?;
        if response["isError"] != true
            || String::from_utf8_lossy(&canonical(&response)).contains("1234567")
        {
            return Err("SDK rejection or redaction failed");
        }
    }
    client.cancel().await.map_err(|_| "SDK shutdown failed")?;
    let second = connect().await?;
    let repeated = process::decoded(&call(&second, "kb_assess", json!({"facts":{}})).await?)
        .map_err(|_| "SDK restart response invalid")?;
    if first.as_ref() != Some(&repeated) {
        return Err("SDK restart reasoning changed");
    }
    second
        .cancel()
        .await
        .map_err(|_| "SDK restart shutdown failed")?;
    Ok(())
}

#[test]
fn official_rust_sdk_stdio_discovery_replay_rejections_and_restart() {
    let runtime = tokio::runtime::Builder::new_multi_thread()
        .worker_threads(2)
        .enable_all()
        .build()
        .expect("public SDK runtime available");
    let result =
        runtime.block_on(async { tokio::time::timeout(Duration::from_secs(90), exercise()).await });
    assert!(
        matches!(result, Ok(Ok(()))),
        "Official Rust SDK check failed; diagnostics redacted"
    );
}
