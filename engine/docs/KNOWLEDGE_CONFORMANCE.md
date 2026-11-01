# Knowledge register loading and shared fixtures

The runtime rejects missing or unsupported register metadata before reasoning. Scenario and control registers require publication version `17.0`; scenarios also require `public_release=true` and `deployment_certified=false`. Source retrieval and legal-register review dates must be valid supported calendar dates. Relationship registers must identify the same KB version as their rule register. Unexpected fields in these register objects are rejected, matching the existing strict rule, fact and source-review objects.

Both embedded knowledge and disk loading use these typed register checks. Candidate comparison also checks graph/rule version agreement while allowing matching proposed KB versions under the supported reasoning language. Such a proposal can be compared without becoming supported runtime knowledge or receiving approval. Errors from disk loading omit submitted values and paths.

These checks establish format and compatibility, not source currency or approval. A valid retrieval/review date does not establish that anyone reviewed a source, that an interpretation is correct, or that a deployment is authorized. Existing source-review states and the mandatory force and egress safeguards remain separate.

## Shared fixture contract

`engine/tests/fixtures/knowledge_conformance.json` declares 72 mutations across ten public knowledge documents: 69 invalid authoring cases and three accepted leap-date cases. The integration test stages only the public inputs needed by the existing production authoring validator. Each fixture is checked against strict JSON parsing plus its document schema, the runtime loader, and the combined `tooling::validation::knowledge` gate. The original document is restored between cases, and the restored baseline must retain its knowledge fingerprint.

Coverage includes missing fields, nonmatching versions, wrong types, unexpected register and record fields, invalid publication flags, duplicate JSON keys, malformed calendar dates, unknown predicate facts, and dangling graph references. Separate regressions check error redaction and matching/mismatched candidate KB versions.

The layers remain complementary. Qualification-gate documents are checked by authoring schemas and are not runtime rule registers. Some structurally valid JSON, such as a nonexistent graph endpoint or an invalid calendar date string, fails runtime semantic validation. Every invalid fixture must fail the combined production authoring gate; direct runtime loading does not replace that gate.

Run the corpus with:

```text
cargo test --offline --locked --manifest-path engine/Cargo.toml --test knowledge_conformance
```

The ordinary all-target Rust test suite also runs it. The finite corpus does not prove exhaustive schema/runtime language equivalence or authenticate asserted evidence. No private records or external model calls are used.

## Development and release identity

This hardening is RC8 after the frozen RC7 package. The RC7 archives and their companion Codex/conformance evidence describe their original bytes. Do not apply RC7's manifest pin to RC8 source. Final RC8 package and selected-host checks are retained as separate companion reports after execution, bound to the new source and executable hashes. Original RC7 evidence remains under `qa/baselines/engine_0_4_rc7/`.

The supported rules, their knowledge fingerprint and all six advisory outcomes are unchanged. Register envelope metadata is checked before it is discarded; exact source-manifest and executable pins continue to bind the complete release bytes independently of the logical knowledge fingerprint.
