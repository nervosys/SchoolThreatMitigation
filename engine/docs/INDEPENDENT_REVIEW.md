# Independent review packet

The packet assembles immutable public evidence for qualified reviewers. It is bound to one externally pinned source release, one knowledge fingerprint, and an explicit date. It does not approve the knowledge, authenticate assertions, sign a release, or establish institutional readiness. Every generated review and release-gate status remains pending.

## Build and verify

Use a trusted verifier installation and an externally approved manifest pin. Obtain the matching source/native candidate through the release process described in [release trust](RELEASE_TRUST.md). No native executable is needed to generate or verify this packet.

```text
stm-tool review-build --trusted-manifest-sha256 TRUSTED_MANIFEST_SHA256 --as-of 2026-10-27 --output output/review/public-review-packet.json
stm-tool review-verify --trusted-manifest-sha256 TRUSTED_MANIFEST_SHA256 --as-of 2026-10-27 --packet output/review/public-review-packet.json
```

Add `--kb-root TRUSTED_SOURCE_DIRECTORY` to select another verified source bundle. The output must be a new `.json` file under the trusted tool workspace's `output` directory. Existing files are never overwritten. The packet is limited to 4 MiB; generation and verification errors print fixed redacted messages without packet contents or paths.

The verifier reconstructs the entire expected packet from the trusted release and explicit date, then compares its canonical JSON. A changed record, hash, fact, proof, required criterion, publication asset, review status, source pin, date, or coverage fails verification. Changing whitespace or JSON object-key order does not change the canonical content identity. Duplicate keys and nonfinite JSON values are rejected while reading.

## Included evidence

- All 18 rules, 42 fact definitions, 20 source records, 18 scenarios, 15 controls, and 54 relationships in the fingerprinted knowledge payload.
- The current layout-repair snapshot has 129 review items: 113 knowledge records and 16 publication artifacts, covering six HTML/PDF pairs, the cover illustration, the current cover preview, and the briefing PDF/PPTX. The six Typst print sources, shared style, fonts and license are also bound by the release manifest; review them alongside their PDFs using the [publication source guide](../../docs/advisory-v17.0-r1/README.md).
- The retained sealed RC10 packet has its original 128 items and 15 publication assets. Its source and asset bindings remain historical, and its acceptance remains pending; it does not cover the refreshed layout snapshot.
- Record hashes and JSON pointers into the packet's knowledge payload. Publication items identify relative public release paths and exact file hashes; their file content remains in the matching source distribution.
- All 582 local per-rule absent/false/true combinations, with predicate proofs, missing facts, and mismatched facts. The same supported-language bounds as the change-impact tool apply; oversized comparisons fail before any packet is exported.
- Current source-review status for the explicitly selected date. Existing approvals remain unreviewed; a historical knowledge reference date is not a new source review.
- Definitions for the required review checks, proposed qualified-review roles, current engineering-evidence artifact hashes, and ten pending release gates.

Synthetic truth tables show the evaluator's behavior for anonymous combinations. They are not statements about a school, authenticated evidence, or a prediction of effectiveness. The packet's current QA references exclude historical baseline reports. Older QA remains separately preserved in the source distribution.

## Reviewer workflow

1. Confirm the packet's release/date binding against the independently obtained source pin. Verify the matching source files and publications before relying on them.
2. The project owner assigns qualified, independent reviewers for each required domain. No names, credentials, availability, funding, or approvals are supplied by the generator.
3. For each review item, follow the knowledge pointer or relative publication path, inspect its required checks, and record findings against the review ID and record hash.
4. Obtain actual authoritative passages, applicability/exception analysis, source retrieval dates, and re-review triggers from qualified reviewers. Review all pages/slides, images, notes, and metadata in the matching publications. Automated checks do not close these tasks.
5. Keep authenticated human responses, identity/qualification evidence, signatures, and supporting records in a separate institution-controlled review system. Use opaque references in public dispositions. Do not add student details, live incident narratives, private contact information, credentials, or campus configurations to this packet or repository.
6. Resolve findings through reviewed changes, a new KB/release identity where required, and a fresh packet. The designated release authority separately decides acceptance after the required evidence and reviews exist.

The packet is an evidence snapshot rather than an editable approval form. Editing its pending fields to claim approval makes it fail verification. Keep human responses as separate records bound to the original packet/source hashes. The verifier reports `packet_verified=true` only for an unchanged snapshot; `independent_acceptance=false`, `deployment_authorization=false`, and `acceptance_state=unaccepted` remain fixed.

## Release gates still open

The packet includes pending ownership/funding, qualified source review, independent rule/fact review, retrieval evaluation, public-file privacy review, editorial/accessibility review, dependency security/license review, release authenticity/installation, Windows/Linux runtime evidence, and selected-client-host acceptance. The generator neither assigns people nor satisfies these gates. Current local engineering evidence remains in `qa/implementation_validation.json`; independent review and Gate A acceptance require their own controlled records.

The packet deliberately remains outside the source archive: it contains the final source-manifest hash, so including it in that same manifest would create a recursive hash dependency. Distribution of the packet must preserve its matching source bundle and externally configured trust pin.
