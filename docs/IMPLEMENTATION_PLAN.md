# SchoolThreatMitigation Implementation and Completion Plan

Planning baseline: 26 October 2026. Publication baseline: Version 17.0. Engine baseline: 0.1.0 and knowledgebase 17.0-NSAI.1.

Complete a coherent, reproducible public research package and a tested advisory engine first. Advance to a supervised pilot only after independent content and integration review. An institutional service requires a separately accepted deployment scope, secure hosting, verified evidence workflows, and operational ownership. Software completion does not establish a school's protective readiness.

Unchecked items are work to complete. Check an item only when its evidence is linked in the completion record. Roles below are proposed responsibilities; named people, availability, and funding remain to be assigned. This plan authorizes no live school exercise, data collection, external communication, or deployment.

## Implementation evidence

The first implementation pass is recorded in [implementation status](IMPLEMENTATION_STATUS.md) and [local validation results](../qa/implementation_validation.json). Checked tasks below indicate implemented engineering work for the candidate, with local evidence; they do not imply independent acceptance or a passing remote CI run. Required external reviews remain open; the R1 candidate has been rendered locally. The original release baseline is retained in Git at commit `a028be0d52acc74d2bdb2b712841b26425555d9c` and its original manifest/checksum records remain under `qa/baselines/`.

The current working target is Gate A. Engine 0.4.0 RC10 uses KB 17.0-NSAI.4 and schema 2.0 with publication 17.0 Revision 1 and consistent lookup provenance. Windows and Linux are CI targets; only locally executed platform results may be reported as passed. The 18-scenario scope and offline CLI/stdio boundary are retained. Institutional hosting and the inherited 56-hazard expansion remain separate scope decisions.

## Rust implementation requirement

- [x] Keep the rule engine, knowledgebase interfaces, CLI and MCP implementation in Rust.
- [x] Replace Python bridge, proof replay, evaluation, review and release tooling with `stm-tool`.
- [x] Remove Python scripts and requirements from the supported source inventory and CI.
- [x] Preserve prior releases and their QA as historical evidence without relabeling results.
- [x] Add a separate Rust rule interpreter and subprocess/privacy regression tests.
- [x] Complete the final native checks and extracted-package verification for 0.4 RC1; see implementation status and current native QA.
- [ ] Obtain independent source, logic, privacy, accessibility, dependency, release and selected-host acceptance.
## Completion targets

| Gate | Completed outcome | Required evidence | Decision authority |
| --- | --- | --- | --- |
| A Public reference release | Corrected publications and reproducible CLI and MCP release suitable for public evaluation | Reviewed content, passing build and behavioral tests, tested installation, reconciled manifests, release notes | Project owner and independent technical and editorial reviewers |
| B Reviewed advisory pilot | Human-supervised public or synthetic-data workflow with measured usefulness and documented limitations | Source and rule review, retrieval evaluation, client interoperability, pilot results, remediation decisions | Pilot sponsor and independent domain, privacy, and technical reviewers |
| C Institutional advisory service | Supported service for an explicitly approved institution and jurisdiction | Accepted threat model, access controls, evidence verification, audit and recovery tests, deployment approvals, support handoff | Institution owner, security and privacy leads, counsel, independent acceptance reviewer |

Gate A is the minimum project completion target. Gate B demonstrates suitability for a stated advisory workflow. Gate C is required if institutional production use is selected. Decide that scope in Phase 0; do not describe an unevaluated prototype or pilot as a production service.

Preserve the read-only advisory boundary at every gate. Student violence prediction, ownership registries, autonomous adverse actions, dispatch commands, physical-security actuation, and force authorization remain outside this project.

## Original planning baseline (historical)

The following records the original review before implementation. Historical Python references in this plan describe retired tooling; use the current Rust commands in engine/README.md. Current results are recorded separately in IMPLEMENTATION_STATUS.md.

- [x] Six publication PDF and HTML pairs are present; the Field Guide PDF has 98 pages.
- [x] The briefing has 14 slides and a corresponding PDF.
- [x] Governance records contain 18 scenarios and 15 controls; scenario JSON and CSV records match when decoded as UTF-8.
- [x] Engine records contain 18 rules, 54 relationships, and 18 source records.
- [x] Existing release-structure and Python knowledge checks pass.
- [x] All 61 release-manifest entries and 62 checksum entries match their files.
- [ ] Resolve the required Rust `Rule.scope` field missing from all 18 supplied rule records.
- [ ] Correct the privacy scanner's treatment of the checkout's own `.git` directory; the review run produced 164 findings, all in `.git`.
- [ ] Establish actual Rust build, integration-test, and MCP runtime results. Rust is available on this workstation; packaged QA describes the original creation environment.
- [ ] Reconcile inherited publication versions, source references, evidence terminology, timing protocols, and identifier namespaces.
- [ ] Obtain independent rule, source, usability, and deployment reviews appropriate to the selected completion gate.

Evidence: [project overview](../README.md), [release manifest](../RELEASE_MANIFEST.json), [publication QA](../qa/validation_v17_0.json), [engine QA](../qa/neurosymbolic_validation_v17_0.json), and [verification plan](../engine/docs/VERIFICATION_PLAN.md). The packaged QA records are historical; subsequent results need their own dated records.

## Ownership and tracking

| Role | Accountability |
| --- | --- |
| Project owner | Scope, budget, priorities, named owners, final release disposition |
| Rust maintainer | Core implementation, build portability, CLI and MCP behavior |
| Knowledge curator | Schemas, identifiers, graph coverage, source provenance, rule revisions |
| Domain and legal reviewers | Applicability, claim strength, institutional authority, rights and medical or facilities questions within their qualifications |
| Security and privacy lead | Threat model, intake and logging boundaries, dependency review, secure deployment |
| Publication editor | Consistent terminology, source links, accessible publications, rendering |
| Independent evaluator | Reproducible acceptance tests, adverse results, pilot findings |
| Institution operations owner | Gate C hosting, support, incident response, recovery, reauthorization |

One person may hold compatible implementation roles. Authors must not provide the sole independent acceptance of their own high-consequence work.

- [ ] Assign a named accountable owner and reviewer to each phase.
- [ ] Track each task using its phase and checkbox label; add issue links as implementation begins.
- [ ] Maintain a completion record with task, owner, status, dependency, evidence path, tested commit and KB version, reviewer, date, unresolved defects, and next action.
- [ ] Record scope decisions, exceptions, and deferred features with reasons and an owner. An unchecked prerequisite cannot be closed merely by deferring it.
- [ ] Record funding and reviewer availability before committing to release or pilot dates.

## Phase 0 Scope and release baseline

Owner: project owner. Dependency: none. Target effort: 2 to 3 working days, subject to reviewer availability.

- [ ] P0.1 Select completion target A, B, or C and identify the intended users and exact supported workflows.
- [ ] P0.2 Define initial deployment modes: local CLI, local stdio MCP, and any approved host application. Choose Windows and Linux support commitments.
- [ ] P0.3 Decide whether the engine supports only the 18 newer scenarios or must eventually cover the inherited 56-hazard register. Keep expansion outside the immediate release unless resourced and reviewed.
- [ ] P0.4 Define the release version policy for publications, engine, schemas, and KB; retain a machine-readable compatibility matrix.
- [ ] P0.5 Preserve the present release and hashes as an immutable baseline. Assign corrected content a new revision rather than overwriting historical evidence.
- [ ] P0.6 Define supported data classes and explicitly exclude student records, household ownership information, live incident intake, and sensitive campus details from the public reference implementation.
- [ ] P0.7 Set defect priorities and release blockers. Schema/load failure, false certification, unknown treated as satisfied, unauthorized functionality, and privacy leakage block release.
- [ ] P0.8 Approve a release backlog, reviewer assignments, and the evidence locations used to close tasks.

Exit evidence: scope decision, version policy, owner roster, baseline archive, and prioritized backlog.

## Phase 1 Core loading and build reliability

Owner: Rust maintainer. Dependency: Phase 0. Target effort: 3 to 5 working days.

- [ ] P1.1 Resolve `Rule.scope` deliberately: define meaningful reviewed scope for every rule and validate it, or explicitly redesign the schema. Do not hide missing scope with an empty default.
- [x] P1.2 Add a regression test that loads the actual shipped KB through Rust and verifies required metadata. A parallel Python interpretation alone is insufficient.
- [ ] P1.3 Compile all targets and run the existing tests on Windows and Linux; fix every failure and retain logs tied to the commit and toolchain.
- [ ] P1.4 Commit `Cargo.lock` for the executable; document the supported toolchain and use locked dependencies in release builds.
- [x] P1.5 Run formatting and lint checks; resolve warnings or document narrow justified exceptions.
- [x] P1.6 Test every documented CLI command, including the synthetic assessment and audience variants, using expected behavior assertions.
- [ ] P1.7 Test malformed input, absent files, invalid KB data, unknown commands and IDs, and clear exit/error behavior.
- [x] P1.8 Make KB discovery configurable or package-relative. Verify a distributed binary works outside the source checkout and without its compile-time directory.
- [x] P1.9 Test Windows launchers from the repository root, another working directory, and a path containing spaces. Resolve relative assessment-file paths consistently with the documentation.
- [x] P1.10 Separate build, install, and launch steps so normal MCP startup does not compile code or require network access.

Exit evidence: clean builds and behavioral tests on both platforms; all commands and installed launchers operate using the packaged KB.

## Phase 2 Knowledge schemas and traceability

Owner: knowledge curator. Dependencies: Phase 0; validate the Rust implementation after Phase 1. Target effort: 5 to 8 working days.

- [x] P2.1 Publish versioned schemas for scenarios, controls, sources, qualification gates, rules, and relationships; require meaningful fields, supported types, and valid enumerations.
- [x] P2.2 Check Rust deserialization and authoring validation against the same accepted fixtures. Include malformed and incompatible-version fixtures; see [the shared fixture contract](../engine/docs/KNOWLEDGE_CONFORMANCE.md) and `engine/tests/knowledge_conformance.rs`. Independent interpretation review remains separate.
- [x] P2.3 Establish namespaces for the inherited 56 hazards, newer scenarios, controls, and rules. Publish a crosswalk and migration policy for overlapping `T01` through `T08` and similar identifiers.
- [ ] P2.4 Confirm every scenario maps to relevant controls and applicable governance. Identify unused controls and rules; either connect them with reviewed rationale or document their independent role.
- [x] P2.5 Validate edge direction and endpoint types, duplicate edges, valid relation kinds, and required coverage rather than only checking that IDs exist.
- [ ] P2.6 Add specific source support and evidence classification to material scenario and control claims. Keep thematic graph relationships distinct from demonstrated effectiveness.
- [ ] P2.7 Record rule ownership, scope, jurisdiction, review date, source passage or locator, interpretation, exceptions, and next-review trigger.
- [ ] P2.8 Independently review all 18 rules and their action text. Preserve the distinction between statutory references, project safeguards, qualification requirements, and voluntary recommendations.
- [ ] P2.9 Review fact names and definitions with intended users. Explain exactly what each Boolean assertion means and which supporting evidence a reviewer would need.
- [ ] P2.10 Define behavior for expired, missing, contradictory, or withdrawn sources. Expose review-needed status separately from predicate results and prevent affected institutional acceptance.
- [x] P2.11 Generate scenario CSV and repeated publication tables from an authoritative register where practical; otherwise enforce semantic equality in CI.
- [ ] P2.12 Produce a reviewed change report for every KB release, including changed conclusions and incompatible fact or identifier changes.

Exit evidence: schema-valid registers, complete reviewed mappings, an identifier crosswalk, per-rule review records, and a source-currency policy that the software can represent.

## Phase 3 Assessment correctness and input boundaries

Owner: Rust maintainer with security and privacy lead. Dependencies: Phases 1 and 2. Target effort: 5 to 8 working days.

- [x] P3.1 Define and test all six outcomes: `not_applicable`, `scope_unknown`, `needs_evidence`, `evidence_indicates_satisfied`, `gap_for_review`, and `deployment_hold`.
- [x] P3.2 Exercise each rule with satisfying assertions, each required mismatch, missing applicability, missing requirements, and definitively inapplicable scope where supported.
- [x] P3.3 Test mixed missing and mismatched predicates and requirements that expect `false`. Missing evidence must never become a satisfied assertion.
- [x] P3.4 Ensure all successful assessment paths retain `legal_certification=false` and `deployment_authorization=false`; test CLI and MCP serialization.
- [x] P3.5 Distinguish supplied assertions from independently verified evidence in output and host presentation. Do not label self-attested results as verified compliance.
- [x] P3.6 Apply a consistent public-input policy across CLI search, question mode, MCP search, assessment labels, errors, diagnostics, and any host wrapper.
- [x] P3.7 Reject unknown fact keys and non-Boolean values; define and enforce limits on request bytes, text lengths, nesting, and fact counts before expensive processing.
- [x] P3.8 Minimize free-text input and avoid reflecting rejected sensitive values in errors or logs. Treat heuristic identifier filters as one limited safeguard.
- [ ] P3.9 Verify the runtime creates no intake files, unexpected network traffic, or personal-input logs during supported public workflows; document host responsibilities separately.
- [x] P3.10 Test malicious text, misleading instructions, unsupported assessment claims, and attempts to introduce tools or rewrite rule outcomes in the local deterministic MCP implementation; see engine/docs/ADVERSARIAL_VALIDATION.md and qa/adversarial_validation.json.
- [x] P3.11 Maintain regression cases for egress, force, records sharing, profiling, ownership registries, and rule mutation safeguards.

Exit evidence: a passing behavioral matrix covering every rule and outcome, explicit evidence limitations, and consistent input and output boundaries.

## Phase 4 Retrieval and agent workflow

Owner: Rust maintainer and independent evaluator. Dependencies: Phases 1 and 2; use Phase 3 boundaries. Target effort: 4 to 7 working days.

- [ ] P4.1 Create an independently labeled evaluation set spanning the 18 scenarios, control families, source questions, audiences, ambiguous queries, and unsupported requests. Freeze it before tuning.
- [ ] P4.2 Set retrieval acceptance criteria before evaluation, including relevant results, citation correctness, appropriate abstention, and critical misleading-answer failures. Choose numeric targets with the evaluator rather than inventing them here.
- [x] P4.3 Correct short-token handling so terms such as `AI` can be searched and expanded. Test synonyms, punctuation, capitalization, and no-match cases.
- [ ] P4.4 Evaluate ranking against the labeled set and record per-topic failures. Add more complex retrieval only if it materially improves measured results.
- [x] P4.5 Define whether tracing returns direct relationships or multiple hops. Match implementation, output, cycle/size limits, and documentation to that definition.
- [x] P4.6 Display supporting source IDs and resolved provenance alongside advice; distinguish proposed controls from legal references and guardrails. See [lookup citation consistency](../engine/docs/AGENT_INTEGRATION.md) and `engine/tests/provenance.rs`; independent claim/source review remains open.
- [x] P4.7 Make unsupported questions return an explicit limitation and next human step rather than unrelated recommendations.
- [x] P4.8 Keep audience selection separate from authorization and verify no audience gains different tool permissions.
- [x] P4.9 Describe the built-in workflow accurately as deterministic retrieval. If an external LLM demonstration is in scope, choose its host and provider through a separate decision record.
- [ ] P4.10 For any selected LLM wrapper, use public or synthetic inputs, isolate retrieved text as data, show tool activity and sources, and test injection, fabricated citations, timeout, and model unavailability.

Exit evidence: a reproducible retrieval report, corrected edge cases, useful sourced outputs, and any wrapper evaluated separately from symbolic rule correctness.

## Phase 5 MCP interoperability

Owner: Rust maintainer. Dependencies: Phases 1 and 3; integrate Phase 4 behavior. Target effort: 4 to 6 working days.

- [x] P5.1 Select and document supported MCP protocol versions against the official specification at implementation time; implement compatible initialization and version handling.
- [x] P5.2 Validate JSON-RPC envelopes and tool arguments at runtime, including required fields, types, ranges, unsupported properties, and forbidden tool names.
- [x] P5.3 Bound input while reading; the current line-length check occurs after allocating the line. Avoid unbounded buffering and define oversized-request behavior.
- [x] P5.4 Return appropriate errors for malformed requests rather than silently discarding requests that require a response. Handle notifications according to the selected protocol.
- [x] P5.5 Test initialization, ping, listing, all five tools, unknown IDs, invalid arguments, EOF, restart, multiple requests, and request-ID correspondence.
- [x] P5.6 Define supported request scheduling and concurrency; test that behavior and document limits.
- [x] P5.7 Confirm stdout contains protocol responses only; diagnostics belong on stderr and must avoid sensitive input.
- [x] P5.8 Set supported tool annotations and capability declarations accurately. Demonstrate that the client sees only the intended read-only tools.
- [ ] P5.9 Test installation and the complete workflow in at least one selected real MCP client on each supported platform; record client versions and traces using synthetic inputs.
- [x] P5.10 Supply a configurable client example without personal paths, embedded credentials, or an unauthenticated public endpoint.

Exit evidence: automated protocol tests and a successful installed-client demonstration with reproducible setup instructions.

## Phase 6 Publications and source review

Owner: publication editor and knowledge curator. Dependency: Phase 0; final content depends on Phases 2 through 5. Target effort: 5 to 10 working days plus external review.

- [ ] P6.1 Reconcile all version labels, provenance dates, contents entries, cross-references, source IDs, and absent companion-file references.
- [ ] P6.2 Adopt one defined evidence hierarchy or explicitly distinguish separate hierarchies. Map inherited labels to the adopted definitions.
- [ ] P6.3 Adopt one event-time vocabulary for first-minutes measurements; update examples and tables that currently assign different meanings to timestamps.
- [x] P6.4 Explain the relationship between the 56-hazard framework and the 18-scenario release, including their identifier namespaces and engine coverage.
- [ ] P6.5 Recheck material external claims against primary sources. Record actual retrieval dates, source passages, authority type, applicability, and unresolved interpretation.
- [ ] P6.6 Obtain qualified review of legal interpretations and medical, fire/egress, accessibility, canine, and professional-response claims within their respective scopes. Track reviewer findings and dispositions.
- [ ] P6.7 Audit the statistical claims and denominators, including national versus school-specific incident counts. Remove unsupported effectiveness, endorsement, and certification language.
- [ ] P6.8 Align the Field Guide, engineering companion, executive brief, pilot plan, governance charter, technology report, and briefing with accepted registers and implemented software behavior.
- [ ] P6.9 Preserve the proposed status of the national forum. Treat forum operations and any new narration/video as separately selected deliverables with owners and funding.
- [x] P6.10 Verify license notices and dependency attribution; resolve the scanner's `AGPL-3.0-only` identifier against the project's stated `AGPL-3.0-or-later` policy.
- [ ] P6.11 Document rendering dependencies and versions; regenerate PDF and briefing outputs from the corrected editable sources.
- [ ] P6.12 Inspect every rendered page and slide for clipped text, table breaks, legibility, navigation, and consistency. Check document language, headings, reading order, contrast, links, and alternative text or provide an accessible companion.
- [ ] P6.13 Review public files, slide notes, metadata, images, and archive paths for prohibited identifying or campus-sensitive information. Automated text scanning alone cannot close this item.

Exit evidence: a reconciled publication set, source-review ledger, specialist dispositions, complete rendering review, and accessible reading options.

## Phase 7 CI packaging and Gate A release

Owner: Rust maintainer and release owner. Dependencies: Phases 1 through 6. Target effort: 3 to 5 working days.

- [x] P7.1 Make privacy scans operate on an explicit source or staged-release inventory. Exclude VCS and build metadata without excluding publishable sensitive files; test both clean and deliberately contaminated packages.
- [x] P7.2 Add Git ignore rules for Rust outputs and local review artifacts. Keep private-data exclusions effective.
- [x] P7.3 Run schema validation, JSON/CSV equality, graph checks, Rust tests, formatting, linting, and protocol tests in required CI jobs.
- [x] P7.4 Use Windows and Linux build/test jobs and appropriate path triggers. Include workflow, validator, packaging, and schema changes so required checks cannot be skipped accidentally.
- [ ] P7.5 Review dependencies for vulnerabilities and license compatibility; record dispositions, pin release build inputs, and produce an SBOM.
- [x] P7.6 Build a release archive containing the correct binary, KB, licenses, documentation, configuration examples, and installation instructions.
- [ ] P7.7 Test the archive on clean supported environments without source-tree dependencies; confirm ordinary operation works offline after installation.
- [x] P7.8 Generate manifests and checksums from staged final contents with explicit inclusion rules. Check for missing and unexpected files as well as hash mismatches.
- [ ] P7.9 Test integrity verification after archive extraction on both platforms and address line-ending differences deliberately.
- [ ] P7.10 Produce authenticated release provenance or signatures and document verification and key ownership. Distinguish authenticity from byte integrity.
- [ ] P7.11 Record dated build/test results, environment, versions, commit, KB hash, remaining limitations, and independent reviewer dispositions. Keep historical QA intact.
- [ ] P7.12 Publish migration notes, supported versions, known limitations, vulnerability-reporting route, rollback instructions, and release acceptance record.
- [ ] P7.13 Obtain Gate A acceptance and publish only the reviewed staged artifact.

Exit evidence: independently accepted, reproducible public release with passing required checks and verified installation on both platforms.

## Phase 8 Independent advisory pilot and Gate B

Owner: pilot sponsor and independent evaluator. Dependencies: Gate A and accepted pilot charter. Suggested observation window: up to 90 days; acceptance depends on evidence rather than elapsed time.

- [ ] P8.1 Select a small set of representative advisory workflows and define participant roles, public/synthetic inputs, objectives, funding, and authorized tools.
- [ ] P8.2 Agree on success criteria and stop conditions before enrollment. Measure task accuracy, citation use, missed evidence, misleading confidence, usability, and reviewer workload against the existing manual process.
- [ ] P8.3 Obtain required participant, privacy, and institutional approvals before collecting observations. Keep this software pilot separate from any physical school exercise.
- [ ] P8.4 Exercise true gaps, missing facts, inapplicable rules, contradictory sources, false allegations, and technology limitations using synthetic cases.
- [ ] P8.5 Observe whether users understand the difference between assertions, evidence, rule findings, and authorized decisions; revise confusing outputs.
- [ ] P8.6 Evaluate accessibility and the needs of administrators, educators, policymakers, and auditors without treating those audiences as security roles.
- [ ] P8.7 Collect de-identified issues and adverse results with controlled access and a retention period. Do not ingest individual student or ownership records.
- [ ] P8.8 Independently review critical failures; suspend the affected workflow when it produces prohibited conclusions, leaks data, or encourages unsupported consequential action.
- [ ] P8.9 Remediate findings, repeat affected evaluations, and document remaining scope limitations.
- [ ] P8.10 Publish an aggregate pilot report with methods, denominators, limitations, costs, and continue/modify/discontinue decisions. Claim only the advisory outcomes measured.
- [ ] P8.11 Obtain Gate B acceptance for explicitly named workflows and versions.

Exit evidence: independent pilot report and a scoped acceptance decision. Physical protective capability and casualty outcomes require separate evidence.

## Phase 9 Institutional service and Gate C

Owner: institution operations owner with security/privacy lead. Dependencies: Gate B, selected institutional scope, funding, and approvals. Estimate after the hosting and evidence architecture is accepted.

These tasks apply only if Phase 0 selects institutional production use. A local public-reference release can complete Gate A without building an enterprise platform.

- [ ] P9.1 Accept the hosting boundary, jurisdiction, tenant model, users, data flows, threat model, service objectives, and operator responsibilities.
- [ ] P9.2 Implement institutional authentication, least-privilege authorization, tenant isolation, reviewer separation, and session controls at the trusted host boundary.
- [ ] P9.3 Keep the engine's public Boolean fact interface constrained. If evidence documents are required, store them in a separate institution-controlled service with explicit legal basis and restricted access.
- [ ] P9.4 Add evidence identifiers, provenance, authorized verification, review dates, expiration, disputes, and revocation. Ensure the displayed assessment identifies its evidence and KB versions.
- [ ] P9.5 Implement encryption, managed secrets, retention/deletion controls, minimum-necessary audit records, protected backups, and tested restoration for the selected data classes.
- [ ] P9.6 Require human source approval, technical review, integrity verification, version compatibility, and rollback for KB updates. Handle stale or conflicting legal material explicitly.
- [ ] P9.7 Test tenant and role isolation, malicious uploads where supported, injection, replay/tampering, error leakage, model-provider outage, corrupted updates, and recovery.
- [ ] P9.8 If an external model is used, approve provider data handling, routing, retention, and logging; limit inputs to approved data and test fallback without the model.
- [ ] P9.9 Define monitored service objectives and capacity from expected workload; run availability and load tests against those requirements.
- [ ] P9.10 Complete an independent security assessment and remediate release-blocking findings; retain scoped acceptance for any residual issues.
- [ ] P9.11 Complete institution-specific domain, legal, privacy, accessibility, and procurement reviews. Keep advisory approval separate from physical-safety or operational authorization.
- [ ] P9.12 Establish incident response, complaint/correction procedures, support ownership, escalation contacts, maintenance funding, and a tested recovery runbook.
- [ ] P9.13 Conduct a restricted production rollout, review observations, verify rollback, and obtain Gate C acceptance before expanding users or data scope.

Exit evidence: accepted deployment dossier, independent assessments, recovery demonstration, support handoff, and a dated institutional authorization covering the actual service.

## Phase 10 Maintenance and project handoff

Owner: release owner; institution operations owner also participates for Gate C. Dependency: selected release gate.

- [ ] P10.1 Assign ongoing owners for software, KB, publications, source currency, security reports, and support.
- [ ] P10.2 Define review cadence and immediate triggers for source changes, dependency vulnerabilities, model or client changes, material defects, and misleading outputs.
- [ ] P10.3 Reopen affected acceptance decisions when a material change invalidates prior evidence; require relevant retesting and renewed review.
- [ ] P10.4 Archive releases, review records, checksums, signatures, test logs, and migration instructions with access appropriate to their contents.
- [ ] P10.5 Publish support and end-of-life policy, including client/KB compatibility and withdrawal of unsafe versions.
- [ ] P10.6 Transfer unresolved low-priority work to an owned maintenance backlog; prohibit silent acceptance of release blockers.
- [ ] P10.7 Record final acceptance against target A, B, or C, including actual delivered scope, remaining exclusions, evidence, approvers, and maintenance funding.

Exit evidence: signed handoff and sustainable maintenance ownership for the selected completion target.

## Delivery sequence and planning estimates

The following windows are planning assumptions for a small team with Rust, publication, and review capacity. They are not commitments or evidence of qualification. Some phases can overlap, but their exit dependencies remain mandatory.

| Window | Main work | Milestone |
| --- | --- | --- |
| Week 1 | Scope, required-field repair, actual build results, scanner correction | Agreed scope and functioning development baseline |
| Weeks 2 to 3 | Schemas, source/rule review, assessment tests, publication reconciliation | Reviewed knowledge and consistent decision semantics |
| Weeks 3 to 5 | Retrieval evaluation, protocol hardening, client trials, rendering | Candidate public release |
| Weeks 5 to 6 | CI matrix, clean installation, package verification, independent acceptance | Gate A, if all prerequisites pass |
| Following approved pilot window | Supervised evaluation and remediation | Gate B when evidence is accepted |
| Separately estimated | Institutional hosting, evidence workflows, security review, operations | Gate C when institutional requirements are accepted |

Critical dependency chain: scope -> schema/load repair -> reviewed KB and rule behavior -> installed CLI/MCP verification -> final publications and package -> Gate A -> approved advisory pilot -> Gate B -> institutional implementation and acceptance, if selected.

Reviewer procurement, source corrections, security remediation, and institutional approvals may extend the schedule. Gate dates move when evidence is incomplete.

## Immediate implementation checklist

Complete these before expanding features:

- [ ] Select the completion gate and assign named phase owners.
- [ ] Fix and test the missing `scope` data against the Rust loader.
- [ ] Run and record the first complete Windows and Linux build/test results.
- [ ] Fix the privacy scan inventory and test it against a real checkout and contaminated release fixtures.
- [ ] Establish the lockfile, toolchain policy, and CI build matrix.
- [ ] Add required-field and behavior regressions to prevent another static-check-only release.
- [ ] Resolve identifier namespaces and approve the authoritative KB schemas.
- [ ] Open publication corrections for stale references, evidence levels, and event-time definitions.
- [ ] Define the installed package layout and selected MCP client for interoperability testing.
- [ ] Schedule qualified source/rule reviews before treating the candidate KB as accepted.

## Final acceptance checklist

- [ ] The selected completion target and supported scope are explicit.
- [ ] Every prerequisite for that target has evidence and an accountable reviewer.
- [ ] Every scenario, rule, and material source interpretation has the required review record.
- [ ] Missing facts and unsupported questions produce transparent uncertainty.
- [ ] Guardrail failures and unresolved critical defects prevent the affected release or workflow.
- [ ] Published claims match demonstrated software and evidence.
- [ ] Installation, normal operation, integrity checks, and recovery work under supported conditions.
- [ ] Public artifacts contain no identifying or exploitable campus information.
- [ ] Release artifacts, provenance, documentation, and maintenance ownership are complete.
- [ ] The release owner records acceptance for the actual delivered gate and scope.

## Supporting project references

- [Architecture and trust boundaries](../engine/docs/ARCHITECTURE.md)
- [Knowledge governance and authority hierarchy](../engine/docs/KNOWLEDGE_GOVERNANCE.md)
- [Verification and acceptance requirements](../engine/docs/VERIFICATION_PLAN.md)
- [MCP tool contract](../engine/docs/MCP_TOOL_CONTRACT.md)
- [Public information handling](../SECURE_INFORMATION_HANDLING.md)
- [Scenario register](../governance/threat_scenarios_v17_0.json)
- [Control register](../governance/control_requirements_v17_0.json)
- [Qualification gates](../governance/qualification_gates_v17_0.json)
- [Current release notes](../RELEASE_NOTES.md)

## Verifiable reasoning implementation

- [x] Define the `stm-conjunctive-1` logic and all six outcomes in the reasoning contract.
- [x] Publish 39 Boolean fact definitions and validate every rule predicate.
- [x] Bind complete rule proofs to the knowledge SHA-256 and original asserted facts.
- [x] Independently replay certificates in Python and reject tampering or substituted requests.
- [x] Provide an agent bridge that fails closed on bundle or proof mismatch.
- [x] Keep source currency separate from logical conclusions, with explicit dates and no invented approvals.
- [ ] Obtain independent semantic, source, and agent-host acceptance.

Evidence: [reasoning contract](../engine/docs/REASONING_CONTRACT.md), [agent integration](../engine/docs/AGENT_INTEGRATION.md), and [local checks](../qa/implementation_validation.json). Earlier baseline checklists retain review-dependent prerequisites; current implementation evidence is consolidated in the status record.

## Trusted release host integration

- [x] Require an external manifest pin before agent invocation and standalone proof verification.
- [x] Test rejection of self-consistent substituted bundles and ensure the engine is not started on pin failure.
- [x] Document verifier bootstrap, executable trust, update review, and rollback.
- [ ] Assign release approval and pin-distribution ownership; establish authenticated distribution and any signing-key policy.

Evidence: [release trust](../engine/docs/RELEASE_TRUST.md) and [local checks](../qa/implementation_validation.json). This implements the local verification path; it does not close P7.10 publisher-authentication and ownership acceptance.

## Knowledge change predictability

- [x] Implement exhaustive per-rule absent/false/true comparison across two trusted bundles.
- [x] Report changed verdicts, evidence requests, proofs, definitions, sources, metadata, and graph identity; include generated counterexamples.
- [x] Reject unsupported or oversized comparisons without claiming partial equivalence; flag changed content under an unchanged KB version.
- [x] Preserve the pinned public RC2 snapshot and record current change impact.
- [x] Cross-check all 504 shipped per-rule cases through Rust MCP with independent replay and add local/CI gates.
- [ ] Obtain independent interpretation, fact-definition, source, and change-report review before approving a KB update.

Evidence: [knowledge change contract](../engine/docs/KNOWLEDGE_CHANGES.md), [change report](../qa/knowledge_impact.json), and [MCP truth-table results](../qa/reasoning_matrix.json). The engineering portion of P2.12 is implemented; its independent reviewed-change requirement remains open.

## Enforced native host trust

- [x] Require an external executable hash pin as well as the source manifest pin for verified assessments.
- [x] Validate public request envelopes and context before forwarding data to the engine.
- [x] Reject executable substitution, non-regular or linked files, and oversized artifacts before launch; return both checked artifact identities.
- [x] Add no-process-start regressions and extracted-package checks for bad executable pins.
- [ ] Establish independently approved pin distribution, immutable installation permissions, publisher authenticity, and release acceptance.

Evidence: [release trust](../engine/docs/RELEASE_TRUST.md), [host integration](../engine/docs/AGENT_INTEGRATION.md), and [local validation](../qa/implementation_validation.json).

## Bounded verified execution

- [x] Limit subprocess stdout during reading and reject stderr without retaining diagnostic text.
- [x] Bound input delivery and output completion; stop and reap the supervised child on violations or timeout.
- [x] Return only clean, complete, independently replayed assessments; redact launch, protocol, and decoding failures.
- [x] Test output/stderr rejection before the deadline, blocked stdin, timeout cleanup, nonzero exit, and malformed responses using public synthetic processes.
- [ ] Complete independent host containment, permission, logging, and release review for the selected deployment.

Evidence: [process boundaries](../engine/docs/PRIVACY_BOUNDARIES.md), `scripts/tests/test_bounded_process.py`, and [local validation](../qa/implementation_validation.json).

## Official SDK interoperability

- [x] Exercise the shipped server with official Python MCP SDK 1.23.3 using local public/synthetic stdio workflows.
- [x] Verify tool discovery, fact meanings, all five tools, eight full assessment replays, rejected calls, and deterministic restart across two SDK sessions.
- [x] Pin the check dependency, suppress diagnostics and optional environment inheritance, and add local/CI plus extracted-package checks.
- [ ] Record Linux SDK results and independently accept the selected desktop/client hosts and their logging settings.

Evidence: [SDK integration guide](../engine/docs/SDK_CLIENT_VALIDATION.md), [SDK report](../qa/mcp_sdk_validation.json), and [full local validation](../qa/implementation_validation.json). This supplies real SDK interoperability evidence for P5.9; its selected-host and platform acceptance requirement remains open.

## Independent review preparation

- [x] Assemble all knowledge records and publication identities in a dated packet bound to an external source-manifest pin.
- [x] Include record hashes, required criteria/roles, 504 synthetic rule cases, current QA references, and ten pending release gates.
- [x] Verify complete packet content and reject changed coverage, dates, or invented approvals.
- [x] Preserve privacy by accepting no personal reviewer identities, private assessments, signatures, or institutional evidence; export only a new bounded JSON file under output.
- [ ] Assign qualified independent reviewers, collect authenticated controlled responses, resolve findings, and obtain Gate A acceptance.

Evidence: [review guide](../engine/docs/INDEPENDENT_REVIEW.md), `scripts/review_packet.py`, and `scripts/tests/test_review_packet.py`. Packet construction is preparation for the outstanding reviews, not completion of them.

## Frozen retrieval evaluation infrastructure

- [x] Require explicit labeled data, frozen dataset SHA-256, source/executable pins, and provided thresholds for external evaluation.
- [x] Report hit rate, recall, reciprocal rank, supported precision, negative behavior, and exact returned-source consistency.
- [x] Omit queries and case identifiers from reports; reject unsafe/malformed data and changing labels or thresholds before launching the client.
- [x] Preserve existing maintainer expectations and add local/CI, extracted-package, and review-packet evidence.
- [ ] Obtain independently curated public/synthetic questions, reviewed relevance judgments, preregistered thresholds, and authenticated evaluation acceptance.

Evidence: [retrieval evaluator](../engine/docs/RETRIEVAL_EVALUATION.md), [maintainer metric report](../qa/retrieval_evaluation.json), and `scripts/tests/test_retrieval_evaluation.py`. This implements the evaluation machinery; P4.1/P4.2 independent labeling and acceptance remain open.

## RC2 SDK and platform verification

- [x] Add an official Rust SDK integration test without introducing a Python runtime or production SDK dependency.
- [x] Run discovery, 39 fact definitions, 21 tool calls, eight independent assessment replays, eight rejections and restart consistency through the official SDK.
- [x] Preserve RC1 archives, manifests, QA and package verification as historical evidence.
- [x] Reject private WSL mount paths, including spaces and Unicode, during public artifact inspection; document source/cache path remapping.
- [x] Identify native packages by OS, architecture and matching source manifest.
- [x] Complete final Debian WSL Rust/SDK checks; see qa/linux_validation.json and qa/rust_sdk_validation_linux.json.
- [x] Inspect and reverify the remapped Linux native package; extracted executables, pins, proof replay and review packet passed.
- [ ] Obtain independent platform and selected desktop-host acceptance, along with the remaining Gate A human reviews.
## RC3 proposal and logical-guardrail work

- [x] Make UxS, automatic teargas and self-sealing hallway proposals searchable under D-02, R-01 and F-01 with explicit review-only and blocked-use boundaries.
- [x] Add explicit capability flags for automatic chemical release, weaponized UxS and automated confinement/detention; enforce deployment_hold with no scope or human-approval bypass.
- [x] Keep permitted UxS roles non-force, retain emergency egress, preserve existing professional coordination and classroom protection, and expose no physical actuation tools.
- [x] Add the two dated public hazard/egress sources while retaining unreviewed statuses and qualified applicability review.
- [x] Bump the KB to 17.0-NSAI.4 and expose the semantic/predicate changes; preserve the prior release rather than relabeling its evidence.
- [x] Pass 43 Rust tests and 582 complete independent replays on Windows and Debian WSL; do not treat unknown flags as false or certify asserted evidence.
- [x] Reverify the current source/native packages and regenerate the source-bound review packet.
- [ ] Obtain independent clinical, fire/building, accessibility, privacy/rights, legal, source and selected-host review; the software grants no deployment authority.
## RC4 native package verification

- [x] Require external archive/source pins and explicit OS/architecture in Rust native verification.
- [x] Enforce exact native manifest/member hashes, executable modes and binary-header consistency without executing candidates.
- [x] Prevalidate every bounded ZIP entry and CRC before creating extraction output; reject unsafe paths, aliases, collisions, links and special files.
- [x] Preserve RC3 release evidence and compare the unchanged KB against its snapshot.
- [x] Pass the Windows and Debian WSL Rust suites, including seven adversarial archive tests, official SDK checks and 582 independent rule replays.
- [x] Complete Debian WSL and final extracted source/Windows/Linux package checks.
- [ ] Obtain independent security, source/domain, privacy and selected-client acceptance through Gate A.
## RC5 presentation privacy inspection

- [x] Inspect every bounded decoded presentation part and its filename, including non-XML metadata; validate every CRC.
- [x] Reuse ZIP preflight before parser allocation; reject ambiguous paths, links and special/executable members.
- [x] Decode SVG entities in addition to XML and relationship text without rendering or external access.
- [x] Add synthetic regressions for compressed binary metadata, CRC corruption, entity hiding, unsafe members and resource limits.
- [x] Complete final Windows/Debian WSL qualification and extracted package verification; retain source-bound companion evidence.
- [ ] Complete independent rendered-file/privacy review and remaining Gate A acceptance.
## RC6 adversarial authority regression

- [x] Add a bounded fixed public synthetic MCP corpus without a model provider or private inputs.
- [x] Exercise instruction-like text across all five presentation audiences and reject ten attempted writable-tool or forged-argument calls.
- [x] Verify unchanged tool schemas, assessments and KB fingerprint before/after the probes and across restart; independently replay six assessments and reject six proof substitutions/tamperings.
- [x] Integrate path-free adversarial QA into the Rust check command and document its limits; keep the 582-case matrix separate.
- [x] Complete final Windows/Debian WSL and extracted package checks with source-bound evidence.
- [ ] Obtain independent security/domain/selected-host and remaining Gate A acceptance; any external LLM wrapper needs its own evaluation.
## RC7 dependency remediation and evidence binding

- [x] Audit the full lockfile with pinned Rust tools and a recorded public RustSec database revision; retain findings without ignores.
- [x] Upgrade ZIP/XML/PDF dependencies to remove five reported vulnerability matches and the unmaintained font parser; record exact version changes and applicability limits.
- [x] Add declared-license/registry policy and CI configuration; retain NOASSERTION legal conclusions and independent review requirements.
- [x] Bind the retained dependency review to exact Cargo.lock and deny.toml hashes; reject stale/failing/self-approved evidence without overwriting the original review.
- [x] Preserve extraction guards and cross-platform executable modes; retain attribute duplicate checking and add regression coverage.
- [x] Complete final Windows/Debian WSL and extracted package checks for the upgraded dependencies.
- [ ] Obtain independent dependency security/license compatibility and remaining Gate A acceptance; P7.5 is not closed by automated checks alone.

## RC10 MCP schema conformance

- [x] Reproduce an integer-schema/runtime mismatch for integral JSON representations.
- [x] Accept integral search limits within 1..20 while rejecting fractions, nonnumbers and outliers.
- [x] Test all fact definitions, 84 valid Boolean calls with replay and 254 malformed fact/argument calls.
- [x] Exercise an integral floating representation through the official Rust SDK in isolated Windows checks.
- [x] Complete full Windows/Debian WSL Rust, SDK and native development checks for RC10.
- [x] Provide source/native package and selected Codex host qualification workflows, retaining final artifact bindings in separate companion records.
- [ ] Obtain independent content, privacy, accessibility, dependency, release and supported-host acceptance; ownership remains TBD.
