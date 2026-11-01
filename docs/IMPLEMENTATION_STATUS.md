# Implementation status

Current candidate: engine 0.4.0 RC10, KB 17.0-NSAI.4, schema 2.0, publication 17.0-r1. RC9 archives and their original evidence remain historical records. The supported implementation and development/release tooling are Rust. Gate A public-reference acceptance remains pending. Institutional hosting and live exercises are separate scope decisions.

## Implemented

- [x] Offline CLI and read-only stdio MCP with embedded public knowledge: 18 rules, 42 Boolean facts, 18 scenarios, 15 controls, 20 sources and 54 relationships.
- [x] Bounded three-valued conjunction, six deterministic outcomes, explicit predicate proofs, knowledge fingerprint and fixed non-authorization flags.
- [x] Separate Rust proof interpreter bound to the original request; fail-closed bridge requiring external source-manifest and executable pins.
- [x] Bounded subprocess input/output, deadlines, stderr rejection, generic errors and no intake files.
- [x] Native knowledge/schema/CSV validation, exhaustive local truth tables, MCP checks and frozen retrieval evaluation.
- [x] Native change-impact comparison, immutable review-packet generation/verification, SPDX inventory, privacy inspection and deterministic packaging.
- [x] Rust Windows/Linux CI configuration and Windows build/check/launch wrappers; no Python runtime or requirements in the supported workflow.
- [x] Exercise the official Rust MCP SDK as a development-only integration test; retain separate SDK and native protocol evidence.
- [x] Retain prior archives and original QA as historical evidence. Prior official Python SDK results are not current Rust SDK acceptance.
- [x] Preserve the R1 publication assets and their existing revision evidence; native structural checks do not constitute a new visual review.

Current executed outcomes belong in [native validation](../qa/implementation_validation.json), [reasoning matrix](../qa/reasoning_matrix.json), [retrieval evaluation](../qa/retrieval_evaluation.json), [privacy validation](../qa/privacy_validation.json) and [native MCP checks](../qa/native_mcp_validation.json). Only a passing final report establishes an executed check; implemented features alone do not.

## Remaining acceptance

- [ ] Assign accountable owners, funding, qualified independent reviewers and release authority.
- [ ] Review all source interpretations, applicability, fact definitions and logical rules independently; all source approvals remain unreviewed.
- [ ] Obtain independent retrieval labels, frozen thresholds and evaluation appropriate to the selected advisory use.
- [ ] Complete public-file privacy, editorial, accessibility, dependency security and license review.
- [ ] Establish authenticated release distribution, signing/pin custody, installation/update/rollback acceptance.
- [ ] Obtain independent supported-platform and selected desktop/client-host acceptance; local WSL engineering results and CI configuration are not independent approval.
- [ ] Record independent Gate A disposition. Pilot/institutional deployment requires its own separately accepted scope.

The supported workflows are local public/synthetic-data advisory interfaces. A proof verifies deterministic derivation from assertions; it neither authenticates assertions nor establishes legal compliance, protective effectiveness or deployment authority. No human approval or field evidence is invented.

## RC10 MCP numeric schema conformance

Search limits now accept integral JSON numbers such as 2.0 and 2e0, matching the advertised integer schema. Fractional, nonnumeric and out-of-range values remain rejected. Missing limits still default to eight and the maximum remains twenty. Fact definitions were already exposed; new regressions verify every definition, 84 Boolean assessments with independent replay, and 254 malformed fact/argument rejections.

Windows and Debian WSL development checks each passed 67 active Rust tests, formatting and warning-free linting; four ignored helper fixtures are exercised by parent tests. The native and official SDK fixtures both exercise integral floating search limits. Final RC10 source/native package and selected-host checks have separate companion records in output/; only passing final records bound to matching source and executable hashes establish those checks. RC9 source, QA and native release artifacts remain historical evidence under qa/baselines/engine_0_4_rc9/ and output/. Logical knowledge, ranking, privacy and physical-action restrictions are unchanged. Independent acceptance and Gate A ownership remain pending.

## RC9 consistent lookup provenance

Scenario, control, rule, fact and source explanations now expose consistent resolved citations and provenance labels. Trace uses the same explanation; ID case aliases preserve canonical output. Missing mappings remain empty and thematic governance links remain distinct from protective-effectiveness evidence. Search ranking, logical knowledge and physical-action restrictions are unchanged. See [agent integration](../engine/docs/AGENT_INTEGRATION.md) and `engine/tests/provenance.rs`.

Windows and Debian WSL development checks each passed 64 active Rust tests, formatting and warning-free linting; four ignored helper fixtures are exercised by parent tests. The new lookup regressions cover all 113 public record IDs, including 42 fact definitions, and 113 MCP explanation calls per platform. Original RC8 QA and selected-host evidence remain under `qa/baselines/engine_0_4_rc8/`. Final RC9 source/native package, review-packet and selected-host checks have separate companion records in `output/`; only passing records with matching source and executable hashes establish executed release checks. Independent acceptance remains pending.

## RC8 register metadata and shared fixtures

Typed loading now rejects unsupported publication versions, missing or invalid register dates, unexpected register fields, inconsistent graph/rule versions, and scenario flags that contradict the public advisory contract. Matching proposed KB versions remain comparable without granting runtime support. The logical knowledge and all physical-action restrictions are unchanged.

The [shared fixture suite](../engine/docs/KNOWLEDGE_CONFORMANCE.md) contains 72 cases across ten documents, including 69 invalid cases and three accepted leap-date cases. Separate regressions cover error redaction and candidate comparison. Windows and Debian WSL development checks passed 61 active Rust tests, formatting and warning-free linting. Four ignored helper fixtures are exercised by parent tests. Retained RC7 QA and selected-host evidence are preserved under `qa/baselines/engine_0_4_rc7/`. Final RC8 source/native packages, review packet and selected-host qualification have separate companion records in `output/`; only passing records with matching source and executable pins establish executed release checks. Independent acceptance remains pending.

## Local 0.4 RC1 verification (historical)

Windows validation passed: 38 active Rust tests, formatting and warning-free linting, 504 complete runtime assessments replayed by the separate interpreter, all six outcomes, five MCP tools, and the 20-case frozen maintainer evaluation. Four ignored test functions are subprocess fixtures exercised by the active supervisor tests.

Both release archives were extracted and their manifests/hashes verified. The extracted Rust source passed an offline all-target compile check. The extracted native engine/tool passed MCP, reasoning, retrieval, pinned bridge, standalone proof and review-packet tests. Incorrect pins and altered proofs/review packets were rejected. A synthetic failing retrieval gate printed its metrics and exited nonzero. The source archive reproduced byte-for-byte; its inventory contained no Python source or requirements. Automated source and extracted-source privacy checks reported zero findings. Knowledge remained identical to retained 0.3 RC8.

The final archive measurements and extracted-package results are companion records in the local output directory, outside the source manifest to avoid recursive hash dependencies. These are unsigned maintainer measurements. Human, Linux and selected-host acceptance remain pending.

## Local 0.4 RC2 verification (historical)

Windows and Debian WSL x86_64 each passed 40 active Rust tests with Rust 1.99.1, formatting, warning-free linting, the official Rust SDK integration test, 504 runtime assessments replayed independently, all 20 frozen retrieval cases, and the 83-page publication checks. Four ignored subprocess fixtures are exercised by active supervisor tests. The platform-specific launcher and Unix extraction tests differ; the total is 40 on each platform.

Current SDK evidence is in qa/rust_sdk_validation.json and qa/rust_sdk_validation_linux.json; the Linux execution record is qa/linux_validation.json. Each SDK run completes two sessions and 21 calls, replaying eight assessments and rejecting eight invalid calls. The native rule and protocol checks remain separate. No Python requirement or production SDK dependency is introduced.

Artifact inspection caught WSL build paths before distribution. The Linux build remaps both checkout and crate-cache paths, and the scanner now detects WSL mount paths including spaces and Unicode. Unix extraction preserves executable permission while stripping special permission bits. Native manifests identify OS, architecture and source-manifest hash. Final package inspection remains a separate check from compilation.

These are maintainer engineering results from Windows and Debian WSL, not a clean-machine or selected desktop-host acceptance decision. Independent platform, source/domain, privacy, editorial/accessibility, dependency, signing/distribution and Gate A approvals remain pending. The KB fingerprint and all six advisory semantics are unchanged.

Both RC2 native packages passed extraction and runtime verification. The Linux checks executed the extracted binaries, verified the pinned bridge and standalone proof, rejected wrong source/executable pins, and verified the same source-bound review packet. Native privacy inspection passed after path remapping. Source packaging is reproducible; final archive hashes and package results remain separate companion records in output, avoiding recursive manifest hashes. No independent acceptance is implied.

## RC3 countermeasure proposal coverage

- [x] Include non-force UxS observation, alerts and communications as review-only scope in D-02, preserving independent sensor testing and privacy restrictions.
- [x] Explicitly record automatic teargas and chemical-agent systems as blocked proposals in R-01, preserving professional coordination, credentials and MOU requirements.
- [x] Explicitly record self-sealing hallway use for automatic confinement/detention as blocked in F-01, preserving classroom protection and accessible emergency departure.
- [x] Add three Boolean capability assertions to G-003. Any automatic chemical release, weaponized UxS or automated confinement/detention yields deployment_hold even with AI force authority false; missing assertions stay unknown.
- [x] Preserve mandatory G-004 egress protection, fixed non-authorization flags and the absence of device-control interfaces or human-approval overrides.
- [x] Add CDC hazard context and general OSHA employee-egress references as SRC-14/SRC-15. Both remain unreviewed; no school-specific legal applicability, protective effectiveness or deployment approval is claimed.
- [x] Version the changed knowledge as 17.0-NSAI.4. Preserve RC2's source, QA and knowledge snapshot; reject old expected-KB pins. The changed meanings and stronger predicate checks require independent review.
- [x] Pass 43 active Rust tests on both Windows and Debian WSL, official SDK checks over 42 fact definitions, and 582 independently replayed local ternary cases. All 20 existing retrieval cases and the 83-page structural publication checks passed.
- [x] Complete updated source/native package and immutable review-packet verification.

The rules now contain stronger checks, so some conclusions intentionally differ from KB3. Source and executable pins must be reviewed together; no automatic update or acceptance is performed. The earlier R1 publications remain unchanged and are supplemented by engine/docs/COUNTERMEASURE_PROPOSALS.md and the publication errata. Independent source, clinical/public-health, fire/building, accessibility, rights and legal review remains open.
RC3 source and Windows/Linux native packages passed extracted-runtime verification, pinned bridge/proof checks, wrong-pin rejection, and immutable review-packet verification. The packet contains 128 pending review items and 582 synthetic cases. The KB3-to-KB4 comparison records 45 changed G-003 outcomes across the supported comparison assignments and explicitly requires independent change review. The source archive reproduces byte-for-byte; public-source inspection reports zero findings. These checks do not approve the proposed technologies or authorize physical actions.

## RC4 native trust and extraction

The Rust verifier now accepts separately supplied archive/source pins and configured Windows/Linux x86_64 targets. It checks the exact package inventory, all member hashes, strict manifest bindings, executable modes and platform headers before optional staging. Both extraction commands validate every member and CRC before writing; malformed late entries cannot leave earlier files behind. Existing destinations are rejected. I/O failures can leave a new partial staging directory; activation and trust updates remain host responsibilities. See engine/docs/NATIVE_PACKAGES.md.

Windows and Debian WSL qualification each passed 50 active Rust tests (four ignored subprocess fixtures are exercised by parent tests), official SDK integration and all 582 independent local rule assignments. KB 17.0-NSAI.4 is identical to preserved RC3; prior semantic/source reviews remain outstanding. The final source and Windows/Linux packages passed pinned verification and extracted-runtime checks. The source archive reproduces byte-for-byte; 206 public inventory files and native payloads passed heuristic privacy inspection with zero findings. The source-bound packet retains 128 pending review items, 582 synthetic cases and 10 pending release gates. Unsigned archive measurements and package evidence are separate companion files in output; independent acceptance is still pending.
## RC5 presentation privacy inspection

Presentation inspection reads every decoded part, checks its CRC and size, scans readable non-XML metadata and names, and decodes SVG entities alongside XML/relationships. ZIP limits are checked before parser construction; ambiguous paths, links and special/executable members fail closed. No parts are written to disk. This adds four synthetic regression tests and retains RC4 as the unchanged-KB comparison baseline. Image rendering/OCR and independent public-file review remain outside the automated scan. Windows and Debian WSL each passed 54 active Rust tests, official SDK integration, 582 independently replayed rule assignments and the expanded privacy scan. Final source/Windows/Linux packages passed pinned verification and extracted-runtime checks; source packaging reproduces byte-for-byte. The 219-file public inventory and native payloads report zero heuristic findings. The source-bound review packet retains 128 pending items, 582 synthetic cases and 10 pending gates. Independent rendered-file/privacy review and Gate A acceptance remain pending.
## RC6 adversarial authority checks

The Rust check-adversarial command exercises instruction-like text across all five presentation audiences, forbidden writable tools/arguments, before/after assessment identity, restart consistency and proof tampering. The fixed corpus contains 34 post-initialization MCP requests in two sessions, 15 retrieval cases, ten rejected calls, six complete independent assessment replays and six rejected proof alterations/substitutions. It preserves mandatory G-003 force holds under false school scope and the same five read-only tool schemas. Reports contain public counts and fingerprints, not query text, response bodies or paths. See engine/docs/ADVERSARIAL_VALIDATION.md for limitations. The KB, 582-case matrix and all physical-action restrictions remain unchanged. Windows and Debian WSL each passed 56 active Rust tests, official SDK checks, the new adversarial probe and all 582 independent per-rule replays. Final source/Windows/Linux packages passed pinned and extracted-runtime verification, including the adversarial probe; source packaging reproduces byte-for-byte. The 236-file public inventory and native payloads report zero heuristic privacy findings. Source-bound companion records retain 128 pending review items and ten pending gates. Independent security/domain/selected-host and Gate A acceptance remain pending.
## RC7 dependency remediation

The maintainer audit found five RustSec version matches in RC6's quick-xml/zip dependencies and one unmaintained ttf-parser warning. RC7 pins quick-xml 0.41.0, zip 9.1.3 and lopdf 0.46.0 with font embedding disabled, removing ttf-parser. The updated 202-package lockfile passes the recorded advisory snapshot with zero findings/warnings and no ignores. The declared-license/source policy also passes. These are scoped automated results; license compatibility, unknown vulnerabilities, publisher authenticity and independent acceptance remain unapproved. Yanked status was not checked.

A separate native gate validates retained audit evidence against Cargo.lock/deny.toml and preserves the original report on failure. CI configuration performs fresh checks using pinned Rust audit tools; no remote CI run is claimed. ZIP/XML API changes preserve bounded extraction, redacted name errors, explicit Unix metadata and duplicate-attribute checks. See engine/docs/DEPENDENCY_REVIEW.md and qa/dependency_review.json. KB semantics, 582 rule cases and all physical-action restrictions are unchanged. Windows and Debian WSL each passed 58 active Rust tests, the dependency-snapshot gate, official SDK/adversarial checks and all 582 independent rule cases. Final source/Windows/Linux packages passed pinned and extracted-runtime verification; source packaging reproduces byte-for-byte. The 257-file public inventory and native payloads report zero heuristic privacy findings. The updated SPDX inventory has 202 package records and no ttf-parser. Source-bound companion evidence retains 128 pending review items and ten pending gates. Independent dependency security/license compatibility and Gate A acceptance remain pending.
