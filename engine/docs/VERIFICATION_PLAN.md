# Verification and acceptance plan

## Stage 0 — Source and build integrity

- Confirm the Version 17.0 source JSON and statute link IDs exist and are unique; all 18 threat scenarios map to at least one countermeasure; graph edges have existing targets; each rule has citations.
- Build and test on stable Rust (Linux and Windows). Produce `Cargo.lock`, audited dependencies, deterministic binary provenance and SBOM before production.
- Verify ZIP hash and source checkout. Any unaudited policy or dependency change blocks production release.

## Stage 1 — Rule accuracy and evidence handling

- **Unknown ≠ compliant:** Missing applicability or requirement facts must yield `scope_unknown` / `needs_evidence`.
- **Guardrail failure:** If egress is obstructed or AI is permitted to authorize force, status must be `deployment_hold`.
- **Scope:** External-provider MOU check is `not_applicable` if there is no such provider (known false) and `scope_unknown` if the fact is absent.
- **Conditional legal check:** Verified as source-linked and always `legal_certification=false`.
- **Privacy:** Rejected PII keys/nonboolean inputs; no local persistent intake; synthetic tests only.
- **Integrity:** Unsafe or dangling graph edges / nonexistent official citations fail KB load.

## Stage 2 — Agent integration security

- Test MCP initialize, list, call, malformed JSON, oversized input, disallowed tools, errors, concurrent calls and process restart.
- Test prompt injection via retrieved document text; an AI wrapper must never alter rules, claim legal signoff, expose private facts or create tools.
- Test role-specific user explanations without ever mistaking presentation role for authorization. The current process has no authentication: deployment requires enterprise SSO/ABAC at a trusted boundary.
- Check failure on missing/untrusted source, out-of-date statutes and model timeout; all return explanatory gaps rather than fabricated evidence.

## Stage 3 — Independent suitability review

- Blindly score retrieval across questions spanning youth firearm access, threats, sensor limitations, egress, accessibility, canines, medical, cyber, AI risk and constitutional safeguards.
- Independent reviewers audit 100% of rules that touch legal duties, force, data privacy, student discipline or physical barriers.
- Require human-verified evidence and recorded disputes/redress processes before institution-specific compliance use.
- Adopt acceptance criteria in advance; do not invent effectiveness percentages or claim reduction in mass-shooting casualties from a prototype knowledge engine.

## Release stop conditions

1. Source tampering or missing reference.
2. Inability to reproduce build/test results.
3. Unknown facts treated as compliance evidence.
4. LLM-induced rule or tool mutation.
5. False claim of agency endorsement, legal certification or independent evaluation.
6. Leakage of student, gun-owner or campus-sensitive information.
7. Unreviewed functionality controlling physical security equipment or authorizing physical force.

### Current validation status

Static knowledge and source links were checked during packaging. The development container has no `rustc` or `cargo`, so Rust compilation, integration tests and runtime MCP interoperability could **not** be executed in that environment. The engine is a source-complete prototype, not a verified deployed service.
