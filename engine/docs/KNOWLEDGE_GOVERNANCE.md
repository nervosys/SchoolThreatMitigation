# Knowledge governance, legal status, and release management

## Authority hierarchy

1. **Current authoritative law and binding local obligations**, interpreted by qualified counsel with jurisdiction, effective dates, exceptions, decisions and official sources reviewed.
2. **Recognized engineering and educational standards**, distinguished from laws unless incorporated by law or contract.
3. **Validated independent field evidence** with methodology, limitations and population context.
4. **Research-backed guidance** from public authorities and peer-reviewed studies, with explicit uncertainty.
5. **Version 17.0 proposals and hypotheses**, not legal mandates or certified effective measures.
6. **AI synthesis** as a non-authoritative explanation, never a primary source.

Every rule must record source references, scope, rationale, owner, review date, when predicates, required predicates and proposed human action. Contradictory official sources or stale law must result in review, not forced conclusions.

## Workflow for a proposed knowledge change

1. A maintainer submits a pull request referencing a concrete threat scenario and objective.
2. A technical reviewer checks the source, validation evidence, and alternatives, including no-tech options.
3. A privacy/civil rights reviewer checks due process, disproportionate impact, access control, surveillance and redress.
4. A domain expert checks life-safety, fire code, accessibility and emergency service implications.
5. Washington-qualified counsel checks legal applicability for any `statutory_reference` changes.
6. Automated tests check schema, rule and graph consistency, regressions, and prohibited conclusions.
7. A designated release authority signs, dates and archives the approved knowledgebase; new release gets new immutable ID and checksum.

**An LLM can draft a proposal but may not approve or directly deploy a KB change.** Do not ingest unverified web pages or police intelligence automatically.

## Legislative freshness

The knowledge reference date is **2026-10-26**; all source approvals are currently unreviewed. They should be rechecked before an institutional use or any legal conclusion. A check referencing RCW 28A.320.124 applies conditionally when relevant safety and security staff are present; an agreement-specific check references RCW 28A.320.1242. RCW 28A.320.123 applies to school-based threat assessment programs; RCW 28A.210.440 includes medical equipment and staffing thresholds that depend on school size. Do not flatten conditional language into a universal legal claim.

## Ethics and privacy

- No student identifiers, school incident descriptions naming individuals, protected student records, custody status, firearm ownership lists, serial numbers, home addresses or private access codes.
- Aggregate/de-identified public assessment facts only. Use synthetic examples in documentation/tests.
- Separate agency accountability and lawful reporting duties from prohibited general-purpose student surveillance or unapproved record disclosures.
- Preserve correction rights, appeals, protected speech, nonretaliation and independent reviews.
- Report honest model limitations, false confidence, missing evidence and legal scope uncertainties.

## Reproducibility

- `governance/*.json` are the original Version 17.0 materials.
- `engine/kb/*.json` contain additional draft conditional rules, legal source links and traceability edges.
- Git history and checksum manifests form the revision audit trail; the current prototype does **not** cryptographically sign releases.
- CI should run the Rust tests and cross-reference validator on every PR.


## Candidate knowledge version

KB 17.0-NSAI.4 uses schema 2.0 and `review_status=draft_independent_review_pending`. Added scopes describe the existing applicability predicates; they are not fresh legal approvals. Historical review dates remain in baseline records. The current frozen knowledge reference date is 2026-10-28; this is not an independent source approval. Independent source and per-rule review remains open. The runtime rejects incompatible versions and empty scopes. Source expiry, conflict, withdrawal, and future-review evaluation is implemented separately from logical verdicts. The default reasoning date is frozen to the KB reference date; explicit current-date context and independent source approval remain required for institutional acceptance. Identifier namespaces are defined in `governance/identifier_namespaces.json` at the repository root.

## Automated change impact

Before reviewing a proposed KB update, compare the baseline and candidate with [the bounded change-impact tool](KNOWLEDGE_CHANGES.md). Review changed definitions, sources, actions, and traceability even when verdicts match. Reusing a KB version for changed fingerprinted content fails the local version gate. The tool does not approve or deploy changes. Current baseline and MCP truth-table evidence is stored under `qa/`; independent change review remains required.

## Independent review evidence

Generate a [pinned review packet](INDEPENDENT_REVIEW.md) before arranging acceptance review. Its knowledge records, synthetic truth tables, publication identities, criteria, and pending gates form an immutable snapshot. Qualified reviewers retain authenticated responses separately, using review IDs and record hashes. The verifier detects altered snapshots; it cannot approve material interpretations, reviewer independence, or a release.

The [First and Second Amendment review standard](../../docs/CONSTITUTIONAL_RIGHTS.md) adds explicit editorial safeguards and evidence requirements. Broader rights review remains a human responsibility; new executable predicates require versioned change control and independent acceptance.
