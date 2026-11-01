# Engine-guided agent test evidence

These are sanitized maintainer observations from published commit
[`7ce8159`](https://github.com/nervosys/SchoolThreatMitigation/commit/7ce8159a027d962726ca5f634134c73d86505163),
whose source manifest is
`d58d39b95061c93c64af5fa71947efae07a7fdbe0f331bb8a3b808a55b2b27d2`.
The evaluation date is 2026-11-01 UTC. Adding these records and agent instructions
changes the enclosing source snapshot; these results retain their original
bindings. They are not relabeled as a new release qualification.

The agent used the recommendation engine, inspected governance rule G-008,
submitted no unverified school facts, and verified the assessment through the
pinned bridge and separate Rust interpreter. Its recommendations guided
automated reasoning, mutation-boundary and privacy checks.

| Observation | Recorded outcome |
| --- | --- |
| Anonymous facts asserted | 0; missing facts remained unknown |
| Assessment | 12 `scope_unknown`, 6 `needs_evidence` |
| Independent proof replay | All 18 rule findings verified |
| Per-rule reasoning matrix | 582 complete assessments replayed; all six outcomes observed |
| Adversarial authority checks | 10 forged calls and 6 altered/substituted proofs rejected; tool catalog and assessments unchanged |
| Source inventory privacy inspection | 312 files inspected; zero heuristic findings |
| Local exported-report privacy inspection | 13 diagnostic reports inspected; zero heuristic findings |
| Source review | All 20 source records unreviewed; no approval inferred |
| GitHub CI for the bound commit | Source integrity, dependency policy, and Windows/Linux native workflow passed |

`agent_actions.json` records selected engine references and actual automated
checks. `request.json`, `assessment.json`, `bridge_verification.json` and
`proof_verification.json` preserve the logical replay case. `ci_results.json`
contains the exact GitHub run links. `provenance.json` records original and
published payload hashes; publication only normalizes text line endings to LF.
`report_privacy.json` concerns the original 13 local diagnostic exports, not a
fresh scan of every future checkout.

To reproduce the recorded proof, obtain a separately authenticated checkout of
the bound commit in another directory, verify its manifest using the externally
trusted pin, and use a trusted verifier:

```text
stm-tool release-verify --root BASELINE_SOURCE --trusted-manifest-sha256 BASELINE_PIN
stm-tool verify-proof --root BASELINE_SOURCE --trusted-manifest-sha256 BASELINE_PIN --request PUBLISHED_EVIDENCE/request.json --assessment PUBLISHED_EVIDENCE/assessment.json
```

Raw build output, stderr, local paths, credentials, account configuration and
private records are excluded. Only public knowledge, anonymous assertions and
sanitized measurements are included. No native executable is distributed here.

The current rules address school-safety assertions, not project staffing or an
arbitrary engineering backlog. Relevance ranking is not operational authority;
agent-selected checks are not new logical verdicts. Technical checks were not
converted into human policy attestations. All records remain unaccepted;
publisher authentication, independent review and deployment authorization are
not established. Owner remains TBD and all ten acceptance gates remain pending.
