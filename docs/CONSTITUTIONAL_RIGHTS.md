# First and Second Amendment safeguards

Editorial policy refinement, 4 November 2026. This is a proposed public review standard. Qualified independent legal, privacy, editorial and accessibility acceptance remains pending. It applies consistently across political viewpoints and administrations.

## First Amendment protections

Protect lawful speech and press, religious freedom, peaceful assembly, association and petitions. Require legal review of both religious neutrality and free-exercise protections in the actual setting. Criticism of officials, lawful advocacy, religious belief, party affiliation and participation in lawful civic activity alone must not become threat indicators, surveillance targets, eligibility penalties or grounds for an adverse finding. Preserve the ability to report misconduct and seek a remedy without retaliation.

Evaluate specific conduct and corroborated evidence under applicable law. Record the distinction between a protected viewpoint, an allegation, a credible threat and a proven violation. Keep exculpatory material and provide an accessible correction and appeal route. Use qualified human review before consequential decisions; AI output is never the sole basis for an adverse action.

## Second Amendment protections

Respect lawful keeping and bearing of arms. Use universal, voluntary safe-storage education and anonymous aggregate outcomes. Do not create school firearm-owner lists, infer dangerousness from lawful ownership or advocacy alone, or condition ordinary services on disclosing lawful household ownership.

Apply current school-weapons law and its specific exceptions, including Washington RCW 9.41.280. Require qualified counsel to review the actual setting and proposed authority. This project grants no carrying, search, seizure or force authority. Record any claimed legal basis and its limits rather than treating a constitutional reference as blanket permission or a blanket prohibition.

## Required review record

Before consequential use, document the following in the controlled review system. Publish only sanitized counts and outcomes.

- Specific observable conduct, corroboration, uncertainty and exculpatory evidence; protected identity, belief and lawful ownership alone cannot supply the basis.
- Applicable legal authority, rights at stake, purpose, scope, least intrusive alternatives, necessity and proportionality.
- A qualified reviewer independent of the originating allegation; documented decision, reasons, correction/appeal route and non-retaliation safeguards.
- Data minimization, access restrictions, retention/deletion rules and restricted redisclosure. Exclude political/religious risk profiles and household ownership registers from school-safety program records.
- Suspension and remediation when a rights safeguard fails. Preserve lawful emergency response and accessible egress; automatic force, chemical release and confinement remain blocked.

Define any lawful emergency procedure and its limits with qualified counsel before program use. Require timely independent review afterward when immediate action lawfully prevents prior review. This proposal creates no emergency, search, seizure or force authority.

## Verification scope

The existing engine can check only its approved anonymous Boolean assertions. G-001 checks `firearm_owner_registry_created == false`; G-002 checks `demographic_or_political_risk_profiling == false`; both G-001 and G-002 have an empty applicability clause and apply to every assessment. G-008 checks `ai_can_edit_approved_rules == false`. G-010 applies when `armed_response_program_planned == true` and requires both `qualified_response_authorized_by_law == true` and `independent_force_oversight == true`. Missing facts remain unknown.

These predicates do not establish the truth of an assertion or complete First/Second Amendment compliance. The broader editorial safeguards above require authenticated evidence and qualified review. Do not invent new fact keys, convert political views into facts, or silently expand the approved rules. A future executable extension requires a versioned fact/rule proposal and separate acceptance. The current 18 rules and KB version remain unchanged.

Use public synthetic fixtures to test a request for an ownership registry, an unsupported political-profile fact, unauthorized rule editing, and missing armed-response authority. Keep real people, allegations, affiliations and school details outside the public repository. Replay any promoted assessment against its original request using the separate Rust proof interpreter.

## Primary legal references

- [National Archives: Bill of Rights transcription](https://www.archives.gov/founding-docs/bill-of-rights-transcript): primary text of Amendments I and II.
- [Washington Legislature: RCW 9.41.280](https://app.leg.wa.gov/rcw/default.aspx?cite=9.41.280): school-facility weapons restrictions and exceptions.

References checked 4 November 2026 for this editorial refinement. This limited check does not independently approve the existing legal register, resolve fact-specific exceptions or certify deployment. Engine source-review records remain unreviewed until their defined review process is completed.
