# Native agent integration

Use `stm-tool bridge` as the trusted assessment boundary. Keep source/executable paths and their approved hashes in host configuration, never model-controlled request fields.

```text
stm-tool bridge --root TRUSTED_SOURCE --trusted-manifest-sha256 SOURCE_PIN --binary TRUSTED_ENGINE --trusted-executable-sha256 ENGINE_PIN < REQUEST.json
stm-tool verify-proof --root TRUSTED_SOURCE --trusted-manifest-sha256 SOURCE_PIN --request REQUEST.json --assessment ASSESSMENT.json
```

The Rust bridge authenticates the selected bytes against the externally supplied pins, validates the public request before launch, freezes omitted date/version context, supervises a bounded native child, then replays the complete response with a separate Rust interpreter. Failure returns no assessment and a fixed redacted error. Successful output identifies both checked artifacts and the effective context.

Requests accept only `facts`, an optional approved generic `site_label`, `as_of`, and `expected_kb_version`. Every fact must be a known Boolean; missing is unknown and false requires an explicit assertion. No personal records, raw incident narratives, or campus configurations belong here. Requests cannot replace host paths, pins, tool lists, or limits.

The host preserves original approved requests for in-memory replay, presents source-review limitations with verdicts, and keeps optional model prose separate. Use `kb_assess` for logical judgments; `kb_ask` is retrieval only. Roles such as auditor affect presentation and do not grant authorization. Hosts configure authentication, permissions, logs, and retention separately.

## Lookup citation consistency

Successful `explain` / `kb_explain` results include `source_refs`, resolved `source_details`, and `provenance_scope`. The item inside `trace` / `kb_trace` uses the same explanation. Case aliases resolve to the same canonical record and citations. Source IDs are sorted and deduplicated, matching search and question recommendations.

`declared_rule_sources` and `declared_fact_sources` identify references declared by their respective public registers. `source_record` identifies a source record itself. Scenario and control links use `thematic_governance_trace_not_effectiveness_evidence`; these are governance relationships, not evidence that a proposed intervention works. `no_direct_source_mapping` carries empty citation arrays and requires further human curation. Invalid and unknown IDs return redacted errors without invented citations.

Resolved citations establish consistency with this KB, not independent support for a claim, current applicability, or approval. Lookup results retain `legal_certification=false`; assessment proofs and authorization restrictions are unchanged. The finite regression corpus covers all 113 public record IDs, including 42 fact definitions, through the library and MCP plus representative CLI/search/question workflows.

The bound child receives at most 65,536 bytes and may return at most 1 MiB. Any stderr, excess output, nonzero exit, or 30-second execution/I/O deadline fails the assessment. The supervisor kills and waits for the directly launched engine. The engine spawns no descendants; operating-system containment remains a host responsibility. No request/diagnostic files are written.

Use a trusted installed verifier and immutable approved source/native files during checks. Hashes and replay establish byte identity and logical consistency, not publisher authenticity, evidence truth, legal compliance, or permission to deploy. [Release trust](RELEASE_TRUST.md) describes those separate responsibilities.

For standalone replay of a bridge assessment, preserve the original fact envelope and fill any omitted date/version from the host-approved frozen defaults, checking them against the returned effective context. The bridge sends these defaults explicitly, so its source-review date basis is explicit. Direct engine responses with omitted dates retain the knowledge-reference date basis. Never replace original facts with assertions taken from a response.
