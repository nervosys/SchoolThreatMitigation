# Repository agent instructions

These instructions apply throughout this repository. Follow the user's current
scope and existing authorization. Continue reversible engineering and diagnostics
when ownership is TBD; keep actual owner assignments and acceptance decisions
pending rather than inventing them or repeatedly requesting the same information.

## Use the neurosymbolic engine

- Read `README.md`, `release.json`, and the relevant engine contracts first.
- Use the engine for recommendations within its knowledge scope. Query through
  `ask-stdin auditor` or MCP `kb_ask`; inspect canonical IDs with `explain` or
  `trace`. Treat retrieval scores as relevance, not probabilities, evidence of
  effectiveness, logical verdicts, or permission to execute an intervention.
- Use the pinned `stm-tool bridge` for logical assessments. Configure trusted
  source-manifest and executable hashes outside request JSON. Authenticate the
  verifier and source, or build from controlled, verified source, before use.
  A digest calculated from an unauthenticated download cannot authenticate it.
- Supply an explicit evaluation date and expected KB version. Use only defined
  anonymous Boolean facts supported by the applicable assertion/evidence process.
  Omit unknown facts; never default missing values to false or infer compliance
  from a passing software test. Do not convert project staffing into school facts.
- Preserve the original approved request and verify the complete assessment with
  the separate Rust proof interpreter. Keep private requests in a controlled
  workflow; only public/synthetic fixtures may become repository evidence.
- Keep engine findings separate from agent planning. The current 18 rules assess
  school-safety assertions, not a general project backlog or staffing decisions.
  For software tasks, use relevant governance guidance and actual technical
  checks; label agent-selected actions and record their engine references.
- Execute authorized automated checks that follow from the recommendations.
  Report missing facts, source-review limitations and unresolved gaps alongside
  results. A replayable proof does not authenticate assertions or approve use.

Typical commands, using separately trusted host configuration:

```text
stm-neurosymbolic --kb-root TRUSTED_SOURCE ask-stdin auditor
stm-tool bridge --root TRUSTED_SOURCE --trusted-manifest-sha256 SOURCE_PIN --binary TRUSTED_ENGINE --trusted-executable-sha256 ENGINE_PIN
stm-tool verify-proof --root TRUSTED_SOURCE --trusted-manifest-sha256 SOURCE_PIN --request PUBLIC_REQUEST.json --assessment PUBLIC_ASSESSMENT.json
```

Pass queries and assessment input through stdin. See
`engine/docs/AGENT_INTEGRATION.md` and `engine/docs/REASONING_CONTRACT.md`.

## Preserve the advisory boundary

- Keep the implementation and supported verification tooling in Rust. Do not
  reintroduce a Python runtime, SDK or implementation path.
- Preserve read-only MCP tools, constrained predicates, independent replay,
  bounded subprocesses, redacted errors and fixed non-authorization flags.
- Preserve mandatory G-003/G-004 protections. Do not implement autonomous force,
  automatic chemical-agent release, weaponized UxS, automatic confinement or
  detention, or obstructed emergency egress. Proposal records are review-only.
- Do not claim independent source approval, legal certification, protective
  effectiveness, publisher authentication or deployment authorization from tests.
  Do not fabricate reviewers, evidence, signatures, funding or owner assignments.
- Version rule/KB changes and retain prior evidence. User-authorized engineering
  changes do not themselves constitute independent rule or release acceptance.

## Protect private data

- Follow `SECURE_INFORMATION_HANDLING.md` and
  `engine/docs/PRIVACY_BOUNDARIES.md`. Never collect or publish identifying
  student/household records, reporting identities, sensitive campus details,
  credentials, host-specific paths or local application/account exports.
- Keep caches, builds, raw diagnostics and local experiment output under ignored
  workspace directories. Do not force-add ignored files to publish results.
  Promote only an explicit allowlist of sanitized public evidence into `qa/`.
- Do not copy local configuration directories or authentication material into
  source, fixtures, reports or logs. Use existing authentication clients without
  printing credential values. Prefer the authenticated account's GitHub noreply
  identity for authorized commits to avoid exposing a personal email.
- Reports should contain public IDs, hashes, counts, outcomes and limitations.
  Scan decoded supported document formats as well as text. Automated scans are
  heuristic; they do not replace review of images, context or arbitrary encodings.
- Keep actual review responses and private evidence in the controlled review
  system. Public packets remain immutable, unaccepted preparation artifacts.

## Validate changes and publication

- Fetch the complete locked dependency graph before offline metadata/SBOM work:
  `cargo fetch --locked --manifest-path engine/Cargo.toml`. Host-only builds may
  leave dependencies for other targets uncached.
- Set `CARGO_TARGET_DIR` explicitly to a workspace build directory. Use locked
  dependencies and offline checks once the public dependency cache is prepared.
- Run checks appropriate to the change. Rust behavior changes require relevant
  regressions, formatting, warning-denied lint and all-target tests. Documentation
  and evidence changes require integrity/privacy checks and replay of any
  promoted assessments; do not invent fresh test runs or mirror implementation
  with unnecessary tests.
- Keep `scripts/release_files.json` explicit, sorted and public-only. Refresh
  `RELEASE_MANIFEST.json` and `SHA256SUMS.txt` after source changes using the
  trusted Rust tool, then verify the resulting snapshot.
- Preserve Git-stable text bytes, Windows launchers, historical baseline hashes
  and publication source/PDF bindings. Do not modify rendered assets merely to
  silence generated-file whitespace. Historical results retain their original
  source/commit/executable bindings and must not be relabeled as new evidence.
- Before an authorized push, review exact outgoing paths, inspect the public
  inventory and other outgoing files, and run a secret scan of the candidate
  and staged changes. Check scanner errors as well as exit codes; an empty
  finding list is not evidence of success if the scan failed.
- Verify staged blobs match audited bytes. Commit only reviewed public files.
  Verify the intended remote/branch, use a normal fast-forward push, and confirm
  the remote SHA. Never force-push or activate/deploy a candidate by inference.
- Report GitHub workflow results for the exact commit. Preserve failed runs as
  history, fix actual causes, and distinguish local checks from remote CI and
  from independent acceptance. Keep the working tree clean after publication.

Public engine-guided evidence and its provenance are documented in
`qa/agentic/2026-11-01/README.md`. Owner and independent acceptance remain pending.
