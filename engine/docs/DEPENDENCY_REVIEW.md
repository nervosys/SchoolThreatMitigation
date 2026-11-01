# Dependency security and declared-license review

The RC7 maintainer review uses cargo-audit 0.22.2, cargo-deny 0.19.0, the exact Cargo.lock bytes and the repository's deny.toml. The retained result is qa/dependency_review.json. It is engineering evidence, not independent security, legal/license compatibility, publisher or release acceptance.

## Findings and changes

The RC6 lockfile contained 194 package records. RustSec flagged five vulnerability advisories and one maintenance warning. RC7 contains 202 records, including development and target-specific packages. The same database snapshot reports zero known vulnerability findings and zero warnings after these changes, with no ignored advisories or severity/target filters:

| Dependency | RC6 | RC7 | Disposition |
| --- | --- | --- | --- |
| quick-xml | 0.38.4 | 0.41.0 | Patched attribute-checking and namespace-allocation advisories |
| zip | 0.6.6 | 9.1.3 | Patched extraction advisories; retains this project's separate extraction planner |
| lopdf | 0.42.0 | 0.46.0 | Disables optional font embedding and removes unmaintained ttf-parser |

Primary records: [RUSTSEC-2026-0194](https://rustsec.org/advisories/RUSTSEC-2026-0194.html), [0195](https://rustsec.org/advisories/RUSTSEC-2026-0195.html), [0367](https://rustsec.org/advisories/RUSTSEC-2026-0367.html), [0368](https://rustsec.org/advisories/RUSTSEC-2026-0368.html), [0369](https://rustsec.org/advisories/RUSTSEC-2026-0369.html), [0192](https://rustsec.org/advisories/RUSTSEC-2026-0192.html).

The old attribute iterator was used by presentation inspection. The namespace-specific path uses NsReader, which this project does not use, but the pinned XML version was upgraded for both findings. The ZIP findings describe upstream bulk-extraction APIs; this project uses its own bounded planner and new-directory writer, rejecting links and applying 0755/0644 rather than preserving special permission bits. Those protections remain; the affected dependency version was upgraded without an exception. The font-parser finding is a maintenance warning, not an identified vulnerability; the dependency was removed rather than suppressed.

Modern ZIP names are fallible and decoding failures now produce redacted errors. Writers explicitly select Unix metadata even on Windows so the pinned native-package contract can verify executable modes on both platforms. XML attributes use the new version-aware normalization API with duplicate checking enabled. A regression covers many attributes, duplicate rejection and encoded metadata. No bitmap rendering or OCR is added.

## Reproducing the audit

Use a dedicated public tool cache without credentials or private registry configuration. Obtain only the public advisory database; no project file or evidence record needs uploading. The recorded snapshot is revision `40f5be6fb12ed93fc591bf4ab23b7d793b3f2239` of [RustSec advisory-db](https://github.com/RustSec/advisory-db), committed 2026-10-28. Retain that revision for reproduction; use an updated database for a new acceptance review.

```text
cargo audit --version
cargo deny --version
git clone https://github.com/RustSec/advisory-db.git output/advisory-db
git -C output/advisory-db checkout 40f5be6fb12ed93fc591bf4ab23b7d793b3f2239
cargo audit --file engine/Cargo.lock --db output/advisory-db --no-fetch --no-yanked --deny warnings --json
cargo deny --manifest-path engine/Cargo.toml --frozen --format json check --config deny.toml --hide-inclusion-graph licenses sources
```

Fetch the locked public crate cache before running the frozen license/source check offline. Do not add audit ignore entries, severity filters, dependency exclusions or private-registry tokens to make a failing check pass. This review deliberately does not check yanked status, avoiding registry lookups during the audit. Zero known findings applies only to the recorded database and resolved versions; it does not establish absence of unknown vulnerabilities or malicious code.

deny.toml permits explicit SPDX alternatives for the configured dependency graph and rejects unapproved registries or Git sources. It uses no per-crate exceptions and retains development dependencies and all target branches. A policy pass checks declared/detected license expressions; it is not counsel's approval of compatibility, notices, patent obligations or redistribution. The SPDX inventory retains licenseConcluded=NOASSERTION. Independent dependency/license acceptance remains open under P7.5.

## Snapshot validation and CI

stm-tool check verifies the retained review's exact Cargo.lock and deny.toml hashes, database revision format, zero-finding/no-ignore settings and non-acceptance flags. It writes a separate qa/dependency_snapshot_validation.json gate result; a failed gate does not overwrite the original review evidence. It does not perform a live advisory lookup or refresh the snapshot. A changed lockfile or policy requires a fresh actual audit, review record and regenerated source-bound release evidence.

The dependency workflow installs the pinned Rust tools, fetches public locked crates, checks current advisories with warnings denied, and runs the license/source check offline. It prints public revision/checksum metadata and fixed summaries; raw diagnostic files remain ignored and are not uploaded. The workflow is configured for pushes, pull requests and manual invocation. No remote CI run or branch-protection setting is claimed by local verification.

Private identities, institutional evidence, raw compiler logs and paths are excluded from the public report. The KB, advisory-rule semantics, non-authorization flags and physical-action restrictions are unchanged.
