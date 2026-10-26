# SchoolThreatMitigation — Version 17.0

**One current public research release (26 October 2026)** · **GNU AGPLv3**.

## Core proposal

Version 17.0 bridges general school security principles to **18 specific, non-site-specific mass-shooting-related threat scenarios** and **15 assurance controls**, each with measurable verification, accountable ownership and a mandatory stop condition.

The Field Guide carries forward the prior research into a new Section 20. The companion engineering specification and machine-readable registers are the authoritative threat-to-control mappings. It is a **public defensive analysis, not an operational site-security plan or certification**.

## New: Rust neuro-symbolic recommendation and compliance-support engine

The optional `engine/` subproject adds a **versioned threat/control knowledge graph**, 18 declarative advisory rules, a **three-valued deterministic evaluator**, official-source citations, and five read-only **Model Context Protocol (MCP)** tools for an external agentic AI assistant. It is intended for administrators, educators, policymakers and independent auditors. It does not profile students, certify legal compliance or operate real-world security systems. Read [engine/README.md](engine/README.md) for architecture, examples and build instructions.

**Engine release:** prototype 0.1 over the existing Version 17.0 field guide; the public advisory document revision remains **17.0**. Static knowledge checks passed. Rust compilation could not be run in the development environment and must pass the provided Cargo/CI tests before use.

## Navigate

- `docs/advisory-v17.0/School_Safety_Field_Guide_V17_0.pdf` — integrated Field Guide and Section 20.
- `docs/advisory-v17.0/Threat_Scenario_and_Countermeasure_Engineering_V17_0.pdf` — complete scenario and assurance cards.
- `docs/advisory-v17.0/Executive_Decision_Brief_V17_0.pdf` — leadership decisions.
- `docs/advisory-v17.0/Ninety_Day_Qualification_Pilot_V17_0.pdf` — safe evaluation plan.
- `docs/advisory-v17.0/Constitutional_Governance_and_Public_Trust_V17_0.pdf` — G0 non-waivable governance.
- `docs/advisory-v17.0/Threat_Driven_Technology_and_AI_V17_0.pdf` — AI/sensors/cyber/canine qualification.
- `governance/*v17_0.json` and `governance/*v17_0.csv` — machine-readable traceability.
- `media/v17.0/SchoolThreatMitigation_Briefing_V17_0.pptx` — editable presentation.
- `qa/` — publication and manifest checks.

## Protective and legal limits

No school firearm-ownership registries; no AI-driven offender predictions; no automatic use of force; no disabled emergency exits; no publication of tactical vulnerabilities, personal case details, passwords, student records or private information. Armed personnel and any consequential school restrictions require separate current legal, training, independent oversight and local approvals. Canine and sensor applications remain unvalidated unless individually qualified.

## Evidence caveat

The FBI 2025 active-shooter report counted **34 incidents across multiple categories of locations**, not 34 K–12 attacks. The release does not claim a predictive profile, quantitative lives-saved results, or that 90-day validation is sufficient to approve operational use of a high-consequence system.

## Use and license

Code and editable publication sources: GNU AGPL-3.0-or-later, subject to third-party material rights as identified in `NOTICE.md`. External linked references are not relicensed. Consult qualified Washington attorneys and relevant authorities before deployment.
