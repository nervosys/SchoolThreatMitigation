# Frozen retrieval evaluation

The evaluator measures retrieval against an explicit labeled dataset and frozen thresholds. It does not authenticate label quality, reviewer independence, threshold-registration chronology, legal applicability, protective effectiveness, or release acceptance. Every report keeps `independent_evaluation=false` and `release_acceptance=false`.

## Existing maintainer fixture

```text
stm-tool retrieval-evaluate --fixture
```

This runs the existing 20 maintainer cases through the project-maintained native Rust MCP client and prints a JSON report; `stm-tool check` saves `qa/retrieval_evaluation.json`. The new fixture preserves their original expectations: all 18 positive cases must retrieve the declared scenario within the first eight results; one unsupported topic must abstain and one fixed synthetic identifier probe must be rejected. Hit-rate and mean-recall thresholds are 1.0 because each original positive case supplied one required ID. No new ranking or precision target has been invented. Earlier retrieval reports remain historical evidence in the retained 0.3 archives.

The fixture labels are incomplete: additional returned records may also be relevant. The evaluator therefore reports precision as null and refuses a precision threshold unless exhaustive judgments are explicitly supplied. This maintainer fixture is not an independently labeled quality study.

## An externally frozen dataset

Use a trusted verifier installation, approved public/synthetic data, and externally configured source, executable, and dataset pins:

```text
stm-tool retrieval-evaluate --dataset APPROVED_DATASET.json --dataset-sha256 FROZEN_DATASET_SHA256 --kb-root TRUSTED_SOURCE_DIRECTORY --trusted-manifest-sha256 TRUSTED_MANIFEST_SHA256 --binary TRUSTED_EXECUTABLE --trusted-executable-sha256 TRUSTED_EXECUTABLE_SHA256
```

The source bundle is verified first. The exact dataset bytes must match the configured SHA-256 before labels are parsed. The selected executable must match its separate external pin before launch. An empty-fact assessment is independently replayed to bind the runtime to the expected knowledge fingerprint before retrieval cases execute. See [release trust](RELEASE_TRUST.md) for pin custody and verifier bootstrap.

The dataset schema is `engine/schemas/retrieval_evaluation.schema.json`. It accepts at most 200 cases, top K from 1 to 20, a declared judgment-completeness flag, and explicit thresholds. It requires at least one positive case. Relevant and forbidden IDs must exist in the shipped knowledge and must not overlap. Case identifiers must be unique. Unknown fields, unsupported schemas, invalid labels, nonfinite values, and unsafe query shapes fail validation before the client starts.

Positive and abstention cases may contain only approved generic public topics under the same basic identifier/credential/path limits as the engine. These heuristics are not complete PII detection: reviewers and hosts must approve the dataset as public or synthetic before choosing its pin. Rejection cases cannot supply free-text input; they select the fixed `identifier_marker` synthetic probe. Never place actual student, household, campus-sensitive, or incident records in an evaluation dataset.

A supplied hash binds dataset contents, including labels, case order, and thresholds. It does not prove that thresholds were chosen before results were examined. Qualified evaluators must retain their authenticated preregistration, labels, qualifications, and acceptance decisions in a separate controlled process. The supported external classification is deliberately `external_labels_unverified`.

## Metrics and gates

For positive cases, hit@K is 1 when any declared relevant ID appears; recall@K is the fraction of declared relevant IDs returned; reciprocal rank is 1 divided by the first relevant rank, or 0 if none appears. Reports give the mean of each across all positive cases. When judgments are exhaustive, precision@K is relevant returned IDs divided by K, including empty result slots in the denominator. Otherwise it is unavailable.

The report checks every supplied numeric minimum against the unrounded metric. Optional ranking/precision targets may be null. Any forbidden result, incorrect abstention/rejection behavior, unexpected rejection of a positive/abstention case, or echoed synthetic rejection probe fails a critical gate even if numeric targets are met. Case counts expose which negative behaviors were actually tested; absence of a case type is not coverage of it.

Every returned record must have a known unique KB ID. Returned source references and source details must resolve exactly to the known source records. This verifies citation data consistency, not whether a source supports a substantive claim. The matching knowledge hash and artifact identities are recorded. Transport, protocol, unknown-record, and citation-corruption failures return no metric report.

## Privacy and interpretation

Reports contain case numbers, behaviors, known KB record IDs, metrics, frozen thresholds, counts, and content hashes. They omit raw queries and original dataset case identifiers. Child environment values are cleared apart from Windows SystemRoot. Any child stderr causes failure and is discarded without being printed. No remote model or network endpoint is configured; evaluation runs locally through stdio.

Successful external evaluation prints a JSON report. A valid report whose thresholds fail still prints its metrics and exits nonzero. Configuration, trust, protocol, or runtime failure prints a fixed redacted failure instead of partial metrics. External reports are not automatically saved or uploaded; the operator controls any approved destination and its logging policy.

The local fixture mode is engineering evidence for the current build, not external source/dataset approval. Local checks, CI configuration, extracted-package smoke tests, and the independent-review packet include the new evidence. Independent topic coverage, labels, threshold review, source interpretations, desktop/Linux acceptance, and Gate A approval remain open.
