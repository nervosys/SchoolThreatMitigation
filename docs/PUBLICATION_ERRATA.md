# Version 17 Publication Errata

These corrections are integrated into publication 17.0 Revision 1, with six locally rendered HTML/PDF pairs. Local page and semantic checks are recorded under `qa/`; independent editorial, accessibility, source, and acceptance reviews remain pending. The original edition is preserved as historical source.

| Location | Correction for implementation |
| --- | --- |
| Field Guide Section 16 document controls | The inherited Version 14.3 label is superseded by the cover and release metadata: Version 17.0, 26 October 2026. |
| Field Guide Section 2 | The reference to Consolidated Edition 12.0 is historical text, not a separate current release. |
| ASCS specialist subsystem section | `SOURCES_VERSION_15_2.md` is absent. Use the current annotated bibliography and source register; independently verify material interpretations. |
| Assurance and rights cross-references | Named standalone assurance reports and MOU addenda are not supplied as completed signed approvals. Use the engineering companion and governance charter for proposed requirements; obtain actual local agreements separately. |
| Field Guide Sections 2 and 8 evidence levels | Two different E-level definitions are present. For software implementation use the evidence ladder below and explicit descriptions, never an unqualified inherited E-number. |
| Field Guide Section 5 timing protocols | Two incompatible T-number sequences are present. Use the unified measurement sequence below and identify the starting cue and event definitions in each exercise. |
| Legacy hazard and capability identifiers | Legacy `T01` through `T08` have different meanings from current engine scenarios. `M01` is not the same ID as `M-01`. Qualify cross-document references using the namespace policy. |
| Packaged engine QA and build notices | References to unavailable Rust tooling describe the creation environment for engine 0.1.0. Use the new implementation validation record for current local results. |

## Unified evidence descriptions

Use `unassessed`, `documented`, `inspected`, `exercised within stated conditions`, and `independently verified within stated scope`. These are distinct evidence descriptions, not interchangeable proofs of operational effectiveness. A Boolean asserted to the engine is a self-attestation until separately authenticated. A critical failure cannot be offset by evidence for unrelated controls.

## Unified event measurements

Use the Field Guide's more detailed first-minutes protocol: T0 initial credible cue; T1 authorized acknowledgment; T2 warning issued; T3 warning received and understood; T4 appropriate protective action initiated; T5 qualified aid available when safe; T6 PSAP acknowledgment; T7 external arrival and command integration. Record actual timestamps and uncertainty. This vocabulary does not prescribe a universal deadline or require events to occur in numeric order. Keep campus-specific timing and configuration records outside the public repository.

## Identifier handling

The machine-readable [namespace policy](../governance/identifier_namespaces.json) distinguishes legacy hazards and capabilities from engine scenarios, controls, and rules. The CLI and MCP resolve only engine IDs. No automated mapping establishes equivalence or expands the engine to all 56 hazards.

## Briefing metadata

The working briefing archive has had local printer settings and authorship/timestamp metadata removed. All slide XML is unchanged. Its historical hash remains in the baseline manifest; the candidate manifest records the sanitized archive. This metadata change does not establish a fresh visual or independent content review.

## Rust tooling correction (engine 0.4.0)

The R1 publications predate the Rust tooling correction. Any software instructions referring to Python scripts are superseded by the native commands in engine/README.md. The initial Rust migration retained the earlier six R1 HTML/PDF pairs. A separate layout repair on 3 November 2026 rebuilds the PDFs from checked-in Typst sources; see the source guide and current render evidence. Use the 0.4 source manifest and native QA for current software evidence.

## KB 17.0-NSAI.4 countermeasure restrictions

Current proposal coverage is in engine/docs/COUNTERMEASURE_PROPOSALS.md. Non-force UxS may be reviewed with privacy and operating-authority safeguards. Automatic teargas/chemical-agent release and self-sealing hallway use for automatic confinement/detention are blocked concepts. Earlier publication references are not deployment approval. The layout repair changes presentation, not these restrictions; independent medical, fire/building, accessibility, rights and legal review is still required.

## Layout repair and editable print sources (3 November 2026)

The former authoring pipeline removed HTML styles and images before converting to Typst. The current six checked-in `.typ` documents and shared `publication.typ` restore cover art, styled cards, navigation, table formatting and page divisions while retaining the R1 corrections. The README now displays the current field-guide cover, rather than Version 14.5 artwork. See the [source and build guide](advisory-v17.0-r1/README.md) and [source/PDF bindings](../qa/publication_revision.json). Prior QA is preserved under `qa/baselines/publication_17_0_r1_before_layout_repair/`. Agent layout review does not establish independent editorial or accessibility acceptance.
