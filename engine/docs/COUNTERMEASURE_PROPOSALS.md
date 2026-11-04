# UxS, chemical-agent and hallway-compartmentation proposals

KB 17.0-NSAI.4 explicitly records these requested concepts as review-only material. The software is an offline advisory engine, with no device-control, chemical-release, targeting, pursuit or detention interface. It never authorizes deployment or legal compliance.

| Concept | Searchable control | Recorded scope and restriction |
| --- | --- | --- |
| UxS: uncrewed systems, including aerial drones/UAV/UAS and ground/UGV platforms | D-02 | Review non-force observation, warning and communications only. Privacy, accessibility, operating authority and accountable human oversight require independent review. No weaponized payload, autonomous targeting/pursuit, chemical release, confinement or detention. |
| Automatic teargas / tear gas or chemical-agent system | R-01 | Explicitly recorded as a blocked proposal for hazard review. No release mechanism, dosing, delivery, placement or trigger logic is provided. Human review does not override the project's prohibition on automatic chemical-agent discharge. |
| Self-sealing hallway sections proposed to contain/detain attackers | F-01 | Automatic entrapment/detention is blocked. Only non-trapping, egress-preserving life-safety compartmentation is within the review scope. No person is classified as an attacker by this engine; no closure sequence, corridor layout or actuation control is supplied. |

The project does not endorse combining chemical exposure with confinement. Professional emergency response, public-health, fire/building, accessibility, privacy/rights and qualified legal review remain separate prerequisites. These records contain no campus layouts, surveillance feeds, identifying records or operational plans.

## Deterministic logical treatment

G-003 remains a mandatory safety guardrail. The new keys are `automatic_chemical_agent_release_enabled`, `weaponized_uxs_enabled` and `automated_confinement_or_detention_enabled`. Any true value yields `deployment_hold`, including when AI force authority is explicitly false. The absence of a new key remains unknown; all four G-003 assertions must be explicitly false to satisfy that guardrail, and doing so still grants no deployment authority.

The existing `ai_authorizes_physical_force=true` means AI, software, detectors or any automation can initiate/authorize force, including automatic chemical release, weaponized UxS action or automatic confinement/detention. The historical key name does not exclude non-AI automation. Such an assertion yields `deployment_hold`; omitting it yields `needs_evidence`.

G-004 remains a mandatory egress guardrail. `egress_obstructed_by_security=true` includes a self-sealing section that obstructs emergency departure or can trap/detain an occupant; it yields `deployment_hold`. An omitted assertion yields `needs_evidence`. Neither guardrail has a school-type exemption or a human-approval override.

Explicit false assertions describe the absence of these conditions; they are not permission to deploy a technology. Both authorization flags remain false, source interpretations remain unreviewed, and the rest of the advisory requirements still apply. Agents must retain and replay the original approved Boolean assertions rather than infer evidence from a proposal's name.

## Source context and limits

SRC-14 is the [CDC CTTL overview of riot control agents](https://www.cdc.gov/chemical-threats-and-toxins-laboratory/php/laboratory-capabilities-and-methods/riot-control-agents.html). It describes the possibility of severe harm from chemical irritants, particularly in enclosed settings. This is hazard context, not evidence that a proposed system is protective or suitable for schools.

SRC-15 is [OSHA's exit-route design and construction eTool](https://www.osha.gov/etools/evacuation-plans-procedures/emergency-standards/design-construction). It supplies general employee-egress context. Actual jurisdiction, applicability, exceptions and building-system designs require qualified review; this project makes no blanket finding about a school's legal obligations.

The two public pages were consulted on 2026-10-28 UTC. `technology_sources.json` records these additions separately from the inherited source-register retrieval date. Both source-review entries remain `unreviewed` with no invented reviewer or approval.

## Version and publication boundary

The KB version changed because control text, fact meanings, source links and the frozen knowledge reference date changed. Existing callers must review the revised definitions and explicitly pin 17.0-NSAI.4; old KB pins are rejected. The 18 rules now use 42 Boolean keys under the same ternary operators. Three explicit blocked-capability predicates strengthen G-003, so its truth table and the complete assessment results intentionally change. The exhaustive local matrix grows from 504 to 582 assignments. A comparison report must expose changed conclusions as well as changed meanings and sources.

This guide supplements the earlier R1 publications. The later 3 November 2026 layout repair changes presentation only and does not independently reapprove these proposals. Historical references to automatic chemical release or trapping concepts do not establish present project approval. The independent review packet remains unaccepted.
