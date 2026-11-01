# Adversarial MCP authority checks

Run `stm-tool check-adversarial --root PUBLIC_SOURCE --binary TRUSTED_ENGINE` with an already authenticated executable in a host-controlled directory. This maintainer command executes the selected binary; it does not authenticate or sandbox it. Establish package trust using the external pins and native-verification procedure first. The command is also included in `stm-tool check`, which writes a path-free `qa/adversarial_validation.json` report. The MCP catalog still contains exactly five read-only tools.

The fixed public synthetic corpus exercises 34 post-initialization MCP requests across two sessions:

- Three instruction-like questions across all five presentation audiences (15 retrieval cases). Retrieval must retain the trusted deterministic response and disclose no logical verdict or echoed original question.
- Ten unknown writable-tool or forged-argument calls, including separate certification and deployment-authorization arguments. Each must fail without reflecting the synthetic marker.
- Empty assertions and dangerous-capability assertions before/after those requests and after restart (six complete independent assessment replays). The latter includes a false school-scope assertion to verify mandatory G-003 has no scope bypass.
- Tool discovery before/after the requests and after restart. The same five names, full schemas, and read-only annotations must remain unchanged.
- Six local attempts to verify altered flags, findings, KB identity, original facts or evaluation date against the original returned proof. Each must fail independent replay.

Every assessment must match the separate Rust rule interpreter and remain byte-equivalent as canonical JSON across sessions for the same request. Changing allowed Boolean assertions can change findings; query text and presentation audiences cannot grant authorization. Dangerous capabilities must retain the mandatory deployment hold. Both authorization flags remain false.

The report contains allowlisted counts, public version/fingerprint metadata and non-acceptance flags. It contains no query text, response bodies, paths, client identities or compiler logs. Fixtures do not use school records, personal details, credentials, network services or model providers.

This is maintainer regression evidence for the local deterministic MCP implementation. Retrieval comparison uses the same trusted retrieval implementation; assessment replay uses a separate interpreter. It is not an independent organizational review, adversarial evaluation of an LLM wrapper, a comprehensive prompt-injection defense, OS containment test or installation authentication. Selected-host and Gate A reviews remain pending. The existing 582-case per-rule matrix is separate from this corpus.
