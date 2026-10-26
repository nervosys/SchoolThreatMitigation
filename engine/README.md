# SchoolThreatMitigation Neurosymbolic AI Engine

**Status:** Version 0.1 developer prototype over **Version 17.0** public recommendations. **AGPL-3.0-or-later**. Rust 2021.

A read-only, provenance-aware safety-policy and compliance-support engine designed for administrators, educators, policymakers and auditors. It does **not** predict student violence, inspect private records, authorize enforcement or force, issue real-world alerts, control doors, or certify legal compliance.

The *symbolic* side is a versioned knowledge graph, declarative three-valued rules, source registry and deterministic explanations. The *neural/agentic* side is any separately hosted AI agent using the MCP tools to search, connect evidence and draft readable advice. A safe built-in planner provides question answering without any LLM or network dependency. **LLM text cannot alter rule verdicts or evidence.**

## Build and run

Install stable Rust and Cargo from <https://rustup.rs/>. From the **repository root**:

```bash
cargo check --manifest-path engine/Cargo.toml --all-targets
cargo test --manifest-path engine/Cargo.toml --all-targets
cargo run --manifest-path engine/Cargo.toml -- validate
cargo run --manifest-path engine/Cargo.toml -- search "unsecured firearm storage"
cargo run --manifest-path engine/Cargo.toml -- trace T01
cargo run --manifest-path engine/Cargo.toml -- explain WA-123
cargo run --manifest-path engine/Cargo.toml -- ask "What is needed to verify a gunfire sensor?" administrator
cargo run --manifest-path engine/Cargo.toml -- assess engine/examples/district_aggregate.json
cargo run --quiet --release --manifest-path engine/Cargo.toml -- mcp
```

On Windows, use `engine\RUN_WINDOWS.cmd validate` or `engine\RUN_WINDOWS.cmd ask "How can we prevent youth firearm access?" educator`. The MCP launcher is `engine\RUN_MCP_WINDOWS.cmd`. The included `mcp-client-example.json` needs your *actual full local path*. Never point it to an Internet-facing unauthenticated service.

The first Cargo run may require Internet access to download the two Rust libraries, `serde` and `serde_json`. The engine itself makes **no network calls**.

## End-to-end workflow

1. **Curate:** Only authorized maintainers edit the reviewed JSON source and rule registers in Git. Changes require independent legal/safety review and tests.
2. **Retrieve:** Query public threat scenarios, proposed controls, official sources, and conditional statutory references.
3. **Infer:** Evaluate only whitelisted anonymous Boolean facts, with explicit `not_applicable`, `scope_unknown`, `needs_evidence`, `evidence_indicates_satisfied`, `gap_for_review`, and `deployment_hold` outcomes.
4. **Explain:** `trace T01` returns the threat, proposed mitigations, graph edges, and governance constraints. `explain WA-123` resolves official legal sources.
5. **Review:** A credentialed administrator, counsel or auditor verifies source applicability and independent evidence. No automated deployment authorization is available.

**Important:** `evidence_indicates_satisfied` means only that supplied Boolean assertions are consistent with the rule. The system **does not authenticate those assertions** or check underlying evidence. No returned result is a compliance certification.

## Knowledgebase inventory

| Component | Size | Source |
| --- | ---: | --- |
| Concrete defensive threat scenarios | 18 | `governance/threat_scenarios_v17_0.json` |
| Proposed engineering controls | 15 | `governance/control_requirements_v17_0.json` |
| Threat → control / rule graph edges | 54 | `engine/kb/relations_v17_0.json` |
| Executable reviewed rules | 18 | `engine/kb/rules_v17_0.json` |
| Public-source citations | 13 + 5 primary WA provisions | `governance/public_sources_v17_0.json` and `engine/kb/verified_legal_sources.json` |

The five conditional statutory-reference checks address RCW 28A.320.123, .124, .1241, .1242 and 28A.210.440, based on the text reviewed 2026-10-26. They do not resolve changing applicability, exceptions, or actual compliance. See `docs/ARCHITECTURE.md`.

## MCP agent tools

The executable implements newline-delimited JSON-RPC over stdio using a compatible baseline MCP tools interface (`initialize`, `tools/list`, `tools/call`, `ping`). Available **read-only** tools: `kb_search`, `kb_explain`, `kb_trace`, `kb_assess`, `kb_ask`.

Typical agent procedure:

1. `kb_search` the user's *generic* policy question.
2. `kb_trace` a relevant scenario to surface its controls and safety requirements.
3. `kb_explain` an individual rule to obtain the cited official sources.
4. Ask authorized staff for **anonymous, aggregate Boolean facts** if a rule assessment is needed.
5. `kb_assess` those facts and state any unknowns, conflicts, required human review and caveats. Never issue commands to police, locks, sensors or school systems.

A client must show source IDs, require human review for any consequential use, and separate the model's natural-language summary from symbolic output. The included MCP endpoint exposes no write tools.

## Privacy and safety boundaries

- Public, aggregate facts only. Unknown keys and all non-Boolean fact values are rejected. No student profiles, household identifiers, ownership registries, or incident intelligence belong in this application.
- A basic question filter rejects several obvious identifiers. **It is not a full PII detection system.** Host applications must perform stronger intake safeguards and authenticated authorization.
- No automatic adverse student actions, physical force, emergency dispatch or changes to doors and barriers.
- No student personal histories, political/ideological profiles, gun-owner registries, protected student records, or exact building weaknesses in the public knowledgebase.
- Rules never infer compliance from missing data. Guardrail failures result in a `deployment_hold` advisory for human action.
- No production identity provider, encryption/key management, policy approvals, continuous ingestion, or independent site evaluation is claimed in this prototype.

## Testing and reproducibility

`cargo test` covers graph completeness, rule evaluation including unknown facts, synthetic advisory findings, privacy rejection, and read-only agent tool listings. CI compiles and tests using a current stable Rust toolchain. See `docs/VERIFICATION_PLAN.md`.

> Release transparency: Rust tooling was unavailable in the creation environment, so `cargo check` and `cargo test` could **not** be executed here. The package includes static JSON/reference validation and reproducible Rust build instructions, but **compilation and runtime behavior are not yet independently verified**.

## Documents

- [`docs/ARCHITECTURE.md`](docs/ARCHITECTURE.md) — complete design and trust boundaries
- [`docs/KNOWLEDGE_GOVERNANCE.md`](docs/KNOWLEDGE_GOVERNANCE.md) — change control and normative authority hierarchy
- [`docs/VERIFICATION_PLAN.md`](docs/VERIFICATION_PLAN.md) — safety, cybersecurity, testing, deployment gates
- [`docs/MCP_TOOL_CONTRACT.md`](docs/MCP_TOOL_CONTRACT.md) — MCP read-only interface and sample calls
- `examples/district_aggregate.json` — **entirely synthetic data** to demonstrate an annual-MOU review gap

Maintainers must retain AGPLv3 notices and original source attribution. This project is independent research and is not an agency-issued security certification.
