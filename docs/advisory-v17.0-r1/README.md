# Editable publication sources

The six `*_V17_0_R1.typ` files in this directory are the editable print sources for the Version 17.0 Revision 1 PDFs. `publication.typ` supplies the shared cover, typography, cards, tables, headers and footers. The sibling HTML files remain the editable web edition. Editing one format does not automatically synchronize the other; review both when changing content.

Use Typst **0.15.1**. Inter **4.1** is included in `assets/fonts/` under the SIL Open Font License in `OFL.txt`. The original conceptual illustration is `assets/cover_background.png`. No remote Typst packages or network resources are needed to compile.

From the repository root, after building the Rust tools:

```text
engine/target/release/stm-tool render-publications
```

Add `.exe` on Windows. The command compiles all six checked-in documents to the ignored `output/pdf-rust/` directory. It fixes the creation timestamp, supplies bundled fonts, ignores system fonts, and limits Typst file access to this public publication directory. It does not overwrite the published PDFs or approve their content.

To compile an individual document directly, create the ignored `output/` directory if it is absent:

```text
typst compile --root docs/advisory-v17.0-r1 --font-path docs/advisory-v17.0-r1/assets/fonts --ignore-system-fonts --creation-timestamp 1793664000 docs/advisory-v17.0-r1/Executive_Decision_Brief_V17_0_R1.typ output/Executive_Decision_Brief_V17_0_R1.pdf
```

Before promoting a rebuild, render and inspect every page, check tables and links, compare text with the web source, scan decoded document data for private information, and update the source/PDF/asset hashes in `qa/publication_revision.json`. Then run `stm-tool publications`, refresh the explicit release inventory and manifests, and verify the candidate. Automated checks and agent visual inspection do not constitute independent editorial, accessibility, legal or operational acceptance.

The 3 November 2026 layout repair preserves the R1 corrections while restoring the cover illustration, summary cards, navigation, table styling and page divisions lost by the previous HTML-flattening pipeline. Earlier QA remains under `qa/baselines/publication_17_0_r1_before_layout_repair/` with its original hashes. The original Version 17.0 PDFs remain historical artifacts.
