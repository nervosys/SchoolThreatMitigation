# NERVOSYS Document Design System — Version 14.5

**Page format:** US Letter, 612 × 792 pt. **Body-page margins:** 0.75 in (54 pt) on every edge. **Body live area:** 7.0 × 9.5 in (504 × 684 pt). Running headers/footers stay in margin bands. **Cover:** illustrated background is full bleed; editable cover text is kept within a minimum 0.75-inch inset.

**Shared identity:** Washington K–12 school safety · NERVOSYS, LLC · Dr. Adam Erickson · https://nervosys.ai. **Typeface:** Inter with Liberation Sans fallback. **Palette:** graphite #15242E, cyan #128EAF, teal #08796E, copper #A66C31, body text #273843 and muted #5B6F7B.

**Components:** document-control kicker, graphite headline and cyan rule; dark standard banner; cyan/teal evidence cards; copper caution/authorization; matching attribution and site footer. The Executive Summary and National School Safety Innovation Forum use the Field Guide design tokens, rather than their own visual treatments.

**Source of truth:** HTML and embedded CSS rendered to PDF through WeasyPrint. The Typst sources are maintained in parallel but independent pagination/compilation is not verified. `PRINT_MARGINS_VERSION_14_5.css` is the final print-geometry override; these rules are also embedded inside each HTML source.
