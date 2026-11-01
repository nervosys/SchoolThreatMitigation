# Knowledge change impact and regression gates

A knowledge update can change verdicts, evidence requests, explanations, fact meanings, or source limitations independently. The comparison tool reports those differences without approving or deploying an update. It accepts only the supported `stm-conjunctive-1` language under schema 2.0; incompatible logic must receive a separately reviewed comparator.

## Comparing two trusted bundles

Use a trusted installation of the comparator and independently obtained manifest pins for both source bundles. Both bundles are checked before their knowledge is loaded. No executable from either bundle is launched by the comparator. See [release trust](RELEASE_TRUST.md) for verifier bootstrap and pin custody.

```text
stm-tool compare --baseline-root BASELINE_DIRECTORY --root CANDIDATE_DIRECTORY --baseline-manifest-sha256 BASELINE_TRUSTED_SHA256 --trusted-manifest-sha256 CANDIDATE_TRUSTED_SHA256 --as-of 2026-10-26
```

The report is UTF-8 JSON on stdout; no assessment history is loaded. Redirect it only to an approved public or controlled review destination. Validation errors return a fixed redacted error without a partial report. `--require-identical` returns exit code 2 when knowledge differs, while still emitting the comparison report. This flag requires exact knowledge identity, including metadata and ordering, rather than merely equivalent verdicts.

## Exhaustive within the supported rule language

For each rule ID in either bundle, enumerate every absent/false/true assignment over the union of its baseline and candidate predicate facts. Absence remains unknown. The supported language has no cross-rule inference, so facts outside that union cannot affect that rule's verdict. The tool checks all assignments within this precisely stated scope; it does not enumerate the global product over all 42 facts or authenticate assertions.

The tool reports added/removed/changed records, changed record field names, record ordering, component/graph hashes, and knowledge fingerprints. For every rule it counts changed verdicts, changed missing/mismatched fact lists, and changed predicate proofs. Up to three generated Boolean witnesses illustrate changed verdicts; omitted witness facts are unknown. These are synthetic combinations, never recorded school assessments. Record changes show IDs and field names rather than copying old and new free-text passages.

Comparisons are limited to ten distinct facts per rule union and 200,000 total assignments. Exceeding either bound fails the comparison before enumeration; no partial or sampled result is called equivalent. Duplicate IDs, malformed schemas, contradictory predicates, incompatible versions, dangling references, incomplete fact definitions, and malformed dates are rejected.

Changes to fact meanings or sources require review even when every verdict is unchanged. Reordering predicates may preserve verdicts while changing their proof representation. Added or removed rules are explicit; absence of a rule is represented by null in synthetic verdict witnesses. Using the same KB version for changed fingerprinted content sets `same_version_content_changed=true` and requires a new version before acceptance.

## Current release evidence

`stm-tool compare-fixture` compares current knowledge against the preserved engine 0.4.0 RC2 / KB3 snapshot. Its snapshot was captured only after checking the retained RC2 archive against its recorded manifest pin. The baseline fingerprint and source-manifest identity remain in the preserved record. This is maintainer regression evidence, not independent acceptance of RC2 or a substitute for an authenticated distribution channel.

The report in `qa/knowledge_impact.json` is bound by the current release manifest. It intentionally does not embed the current manifest hash, avoiding a recursive hash dependency. The generic comparison CLI includes both externally configured manifest pins in its output.

`stm-tool check-reasoning` generates all local ternary fact assignments for the shipped rules, sends them through one Rust MCP session, and independently replays every complete returned assessment. It records counts, outcome coverage, and the knowledge fingerprint in `qa/reasoning_matrix.json`. Requests and full assessment streams remain in memory and are not written to files or echoed on failure. This checks a separate Rust rule interpreter against the Rust runtime, including scope and guardrail behavior.

Local checks and Windows/Linux CI include both checks. Remote CI success, real-client acceptance, source interpretations, fact definitions, and release approval still require their separate evidence. A passing change report never authorizes institutional deployment.
