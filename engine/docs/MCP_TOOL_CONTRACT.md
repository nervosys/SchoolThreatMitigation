# MCP Read Only Tool Contract

Engine 0.4.0 RC10 implements serial, newline-delimited UTF-8 JSON-RPC over stdio, with protocol baseline `2025-06-18`. There are no network listeners, outbound requests, background logs, or mutable tools. The client launches the already-built binary with `mcp`; normal startup does not compile code.

## Initialization

Send `initialize` with a string `protocolVersion`, object `capabilities`, and `clientInfo` containing string `name` and `version` fields. The server returns its supported protocol version; a client that does not support that version must disconnect. Then send `notifications/initialized` before listing or calling tools. Ping is available before initialization. A second initialization is rejected. Notifications receive no response.

```json
{"jsonrpc":"2.0","id":1,"method":"initialize","params":{"protocolVersion":"2025-06-18","capabilities":{},"clientInfo":{"name":"public-demo","version":"1"}}}
{"jsonrpc":"2.0","method":"notifications/initialized"}
{"jsonrpc":"2.0","id":2,"method":"tools/list","params":{}}
```

## Tools

| Tool | Arguments | Result |
| --- | --- | --- |
| `kb_search` | Public `query`; optional integer `limit` from 1 to 20 | Ranked public records |
| `kb_explain` | Known engine `id` | Record and available provenance |
| `kb_trace` | Known engine `id` | Direct adjacent relationships; not recursive traversal |
| `kb_assess` | Whitelisted Boolean `facts` map | Evidence-limited advisory findings |
| `kb_ask` | Public `question`; optional supported `role` | Deterministic retrieval and human-review guidance |

Every tool advertises read-only, nondestructive, idempotent, closed-world annotations. Additional tool arguments are rejected at runtime. `_meta` is accepted at the request-parameter level. Audience names affect presentation only. Tools cannot authorize deployment, certify compliance, edit rules, dispatch responders, or operate equipment.

Tool results contain JSON serialized inside MCP text content. Tool validation failures have `isError=true`; invalid requests use JSON-RPC errors. Unknown lookup values, parser contents, rejected fact keys, and host paths are not reflected. Valid request IDs are echoed for correlation: use opaque numeric IDs or bounded alphanumeric/hyphen strings without personal information.

## Limits and failures

Each line is bounded to 65,536 bytes including the delimiter while reading. Oversized input receives a generic error and closes the session. Malformed JSON receives a parse error without original contents. Questions are limited to 2,400 Unicode characters; facts to 80 approved Boolean entries. Empty, sensitive-looking, and invalidly typed inputs are rejected. EOF ends the process. Requests execute serially; no asynchronous or cancellation capability is advertised. Configure client timeouts and terminate/restart the process when necessary.

Only the selected baseline is advertised; compatibility with other protocol versions and actual clients requires testing. Current checks use both a project-maintained Rust stdio client and the official Rust MCP SDK 3.5.1 at this protocol baseline. Python SDK results from 0.3 are historical; independent evaluation and selected desktop/client-host acceptance remain separate. See [privacy boundaries](PRIVACY_BOUNDARIES.md) for intake and host-retention responsibilities.

Specification references: [stdio transport](https://modelcontextprotocol.io/specification/2025-06-18/basic/transports) and [initialization and lifecycle](https://modelcontextprotocol.io/specification/2025-06-18/basic/lifecycle).

For trusted-host assessment verification, use the pinned bridge described in [agent integration](AGENT_INTEGRATION.md). Direct MCP transport does not independently authenticate the installed executable or its bundle; the host must establish those trust boundaries before launching the server.

See [SDK client validation](SDK_CLIENT_VALIDATION.md) for native protocol negotiation, tool discovery, fact meanings, independent assessment replay, rejected calls, restart behavior, and evidence scope.


Search limits follow JSON Schema integer semantics: integral numeric representations such as 2, 2.0 and 2e0 are equivalent within 1..20. Fractions, numeric strings, booleans, null and out-of-range numbers are rejected. The three-valued fact map still accepts only the advertised Boolean properties, with no defaults; missing facts stay unknown.
