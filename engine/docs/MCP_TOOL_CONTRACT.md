# MCP read-only tool contract

The executable supports baseline newline-delimited JSON-RPC over stdio. Target protocol version is `2025-06-18`, intentionally minimal; production clients must negotiate and test their protocol compatibility. No network listeners or outbound model calls are provided.

## Initialize

```json
{"jsonrpc":"2.0","id":1,"method":"initialize","params":{"protocolVersion":"2025-06-18","capabilities":{},"clientInfo":{"name":"local-demo","version":"1"}}}
```

Then issue `notifications/initialized` (no response expected), followed by `tools/list`.

## Tool invocations

```json
{"jsonrpc":"2.0","id":2,"method":"tools/list","params":{}}
```

```json
{"jsonrpc":"2.0","id":3,"method":"tools/call","params":{"name":"kb_ask","arguments":{"question":"How should a school evaluate gunfire sensors?","role":"administrator"}}}
```

```json
{"jsonrpc":"2.0","id":4,"method":"tools/call","params":{"name":"kb_trace","arguments":{"id":"T07"}}}
```

```json
{"jsonrpc":"2.0","id":5,"method":"tools/call","params":{"name":"kb_assess","arguments":{"facts":{"wa_public_school":true,"bleeding_control_equipment_accessible":true}}}}
```

The last example intentionally omits staffing and inspection facts. It **must** return `needs_evidence`, not compliance. `kb_assess` is an anonymous public rule checker only; it does not authenticate documents or sign decisions.

Supported methods: `kb_search`, `kb_explain`, `kb_trace`, `kb_assess`, `kb_ask`. All return JSON-serialized read-only findings inside MCP text content blocks. No other methods or write tools are available. The host must separately implement strong authentication, legal reviewer approval, tenant isolation, audit logging of *non-sensitive metadata*, and human confirmation if this prototype is integrated into a real workflow.
