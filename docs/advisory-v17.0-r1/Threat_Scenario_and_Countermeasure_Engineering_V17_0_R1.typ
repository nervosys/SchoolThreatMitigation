// Editable print source for Version 17.0 Revision 1.
// Shared styles, covers, cards and tables are in publication.typ.
#import "publication.typ": *
#show: publication.with(title: "Threat Scenario and Countermeasure Engineering | Version 17.0 Revision 1", guide: false)

#metadata(none)#label("publication-content")
#hero[
#text-block[
Threat-specific engineering · public research

]
= From Threats to Verified Countermeasures
<from-threats-to-verified-countermeasures>
SchoolThreatMitigation | Version 17.0 Revision 1 | Mass-shooting
prevention and life-safety assurance

#cover-note[
#cover-note[
Publication 17.0 Revision 1. Editorial corrections and verifiable
advisory reasoning; independent acceptance and site validation remain
pending.

]
]
]
#text-block[
A practical specification for translating school mass-shooting hazards
into lawful, auditable, independently testable protective requirements.

]
#text-block[
#strong[18] \ public threat scenarios
]
#text-block[
#strong[15] \ named control families
]
#text-block[
#strong[5] \ mandatory approval gates
]
#callout[
#strong[Scope / non-certification.] Illustrative threat scenarios, not a
threat forecast or campus vulnerability analysis. The publication
includes no site-specific response tactics or sensitive security
layouts. No instrument, armed response, canine or AI product is
considered qualified merely because this document lists it.
]
== 1 · Assurance architecture
<assurance-architecture>
Control evidence is evaluated by provenance: (A) enforceable law/code,
(B) established prevention or professional guidance, (C) component-level
measured performance, (D) credible emerging mechanism, or (E)
unvalidated hypothesis. One control may have multiple labels; each claim
must specify the relevant endpoint. CISA and USSS NTAC recommend
layered, fact-based programs; they do not validate any particular
commercial sensor or individual behavioral prediction system.

=== Public workflow
<public-workflow>
#callout[
Verified concern → protective objective → alternatives including
nontechnology → accountable owner → safe synthetic validation → evidence
review → limited authorization or stop → monitored reassessment.
]
#pagebreak(weak: true)
== 2 · Threat scenario index
<threat-scenario-index>
#figure(
  align(center)[#table(
    columns: (25%, 25%, 25%, 25%),
    align: (auto,auto,auto,auto,),
    table.header([ID], [Threat situation], [Control owner / short
      action], [Evidence basis],),
    table.hline(),
    [T01], [Household firearm accessible to a minor], [Community
    firearm-safety lead / Voluntary locked and unloaded storage
    guidance; protect combinations; discounted safe or lock
    referral], [Research-backed prevention mechanism],
    [T02], [Firearm in relatives', friends', or shared-care
    locations], [Family engagement coordinator / Universal caregiver
    discussion guide; voluntary peer-to-peer secure-storage
    conversation; translated mate], [Research-informed extrapolation],
    [T03], [Unsecured firearm left in a vehicle], [Community retailer
    and caregiver network / Avoid unattended vehicle storage; voluntary
    locked storage education; lawful temporary storage
    referrals], [Research-informed prevention],
    [T04], [Credible communicated threat or planning leakage], [School
    threat assessment chair / Multidisciplinary, behavior-based
    assessment; documented corroboration; supportive interventions;
    emergen], [Supported professional practice, not individual
    prediction],
    [T05], [Malicious, mistaken, or uncorroborated accusation], [Civil
    rights officer / independent reviewer / Separate intake from
    finding; preserve exculpatory information; corrective review, time
    limits and appeal], [Governance / due-process design],
    [T06], [Suspected weapon or violence near school arrival/access
    area], [School incident commander / 911 dispatch / Trained human
    confirmation where safe; dispatch escalation; campus-specific
    protective action; accessible], [Operational guidance; local
    effectiveness unverified],
    [T07], [False or missed acoustic/visual firearm alarm], [Technology
    assurance lead / Independent sensor benchmark; source provenance;
    human verification; alternate reporting
    channel], [Technology-specific evidence required],
    [T08], [Threat reported while groups are in hallways or common
    areas], [Emergency preparedness lead / Preplanned options-based
    training; intelligible multi-channel guidance; trained staff
    judgement], [General emergency-preparedness evidence],
    [T09], [Classroom door hardware fails or impedes
    egress], [Facilities / fire code authority / Code-reviewed listed
    hardware; scheduled inspection; manual opening and release;
    accessibility testing], [Code/engineering requirement],
    [T10], [Person with disability cannot perceive or follow protective
    instruction], [ADA/504 coordinator / Multimodal accessible alerts,
    individualized support planning, accessible refuge/egress
    review], [Accessibility duty; specific benefit must be tested],
    [T11], [Power or communications outage during incident], [Facilities
    \/ IT / incident command / Tested backup power; manual public
    address / radio alternatives; fail-safe access and written
    procedures], [Established resilience practice],
    [T12], [Spoofed alert, ransomware, or compromised access-control
    system], [CISO / physical security owner / MFA; least privilege;
    segmentation; signed updates; manual override; offline incident
    playbook], [NIST/CISA control guidance; site testing required],
    [T13], [Life-threatening bleeding before EMS arrival], [School nurse
    \/ EMS liaison / Bleeding-control kits, trained personnel,
    accessible cache locations, EMS handoff coordination], [Established
    emergency medical preparedness],
    [T14], [Delayed police arrival during an active threat], [District
    emergency lead / law enforcement agency / Protective actions,
    verified alarms, trained communications lead, EMS staging; only
    legally authorized pr], [Operational planning; armed response
    outcome varies],
    [T15], [Canine false indication, injury, or unreliable
    deployment], [Canine program supervisor / independent evaluator /
    Qualified canine/handler credentialing; validated
    application-specific reliability; welfare and student s], [Limited
    context-specific evidence; not proven mass-shooting prevention],
    [T16], [Misidentified person or unauthorized on-site use of
    force], [Authorized law enforcement / independent oversight /
    Qualified law-enforcement coordination; identification and restraint
    standards; independent force review;], [Law/policy gate, not
    demonstrated intervention efficacy],
    [T17], [AI-generated accusation, synthetic media, or automated
    threat score], [AI assurance officer / threat team / Source
    verification, human case review, multiple independent observations
    and challenge process], [Emerging research; model-specific
    validation needed],
    [T18], [After-event reunification confusion or sensitive-data
    leakage], [Reunification coordinator / privacy officer / Single
    authorized family information lead, secure verification, accessible
    multilingual updates], [Emergency management practice],
  )]
  , kind: table
  )

#pagebreak(weak: true)
== 3 · Scenario-specific control cards
<scenario-specific-control-cards>
#card[
=== T01 · Household firearm accessible to a minor
<t01-household-firearm-accessible-to-a-minor>
#text-block[
Established | ACCOUNTABLE: Community firearm-safety lead
]
#strong[Trigger / verification:] Caregiver identifies an unlocked
firearm or accessible key/code.

#strong[Protective objective:] Reduce unauthorized youth access before
an incident.

#strong[Countermeasure:] Voluntary locked and unloaded storage guidance;
protect combinations; discounted safe or lock referral.

#strong[Independent evaluation:] Anonymous opt-in adoption survey, lock
voucher accounting, and caregiver comprehension exercise.

#strong[Metrics and evidence:] Number adopting safeguards;
non-identifying participation rate. #emph[Research-backed prevention
mechanism.]

#strong[Rights/data gate:] Do not collect owner identities, addresses,
serials or storage inventories.

#strong[STOP condition:] Ownership reporting required or security
intervention based solely on ownership.

]
#card[
=== T02 · Firearm in relatives', friends', or shared-care locations
<t02-firearm-in-relatives-friends-or-shared-care-locations>
#text-block[
Established | ACCOUNTABLE: Family engagement coordinator
]
#strong[Trigger / verification:] Caregiver concern about access during
visits or custody transitions.

#strong[Protective objective:] Extend protective practice outside
primary home.

#strong[Countermeasure:] Universal caregiver discussion guide; voluntary
peer-to-peer secure-storage conversation; translated materials.

#strong[Independent evaluation:] Usability test with volunteer
caregivers across household types.

#strong[Metrics and evidence:] Comprehension and voluntary commitment;
language accessibility. #emph[Research-informed extrapolation.]

#strong[Rights/data gate:] Do not infer or disclose custody, family
firearm holdings, or guardian status.

#strong[STOP condition:] Program conditions school access on parental
ownership disclosure.

]
#card[
=== T03 · Unsecured firearm left in a vehicle
<t03-unsecured-firearm-left-in-a-vehicle>
#text-block[
Established | ACCOUNTABLE: Community retailer and caregiver network
]
#strong[Trigger / verification:] Voluntary report that firearm was
previously left accessible in a vehicle.

#strong[Protective objective:] Reduce opportunistic access and theft
exposure.

#strong[Countermeasure:] Avoid unattended vehicle storage; voluntary
locked storage education; lawful temporary storage referrals.

#strong[Independent evaluation:] Anonymized scenario questionnaire and
program distribution audit.

#strong[Metrics and evidence:] Change in storage intent or reported
practice, without individual tracking. #emph[Research-informed
prevention.]

#strong[Rights/data gate:] No vehicle-owner registry or vehicle searches
under education program.

#strong[STOP condition:] Law-enforcement vehicle search derived from
education enrollment data.

]
#card[
=== T04 · Credible communicated threat or planning leakage
<t04-credible-communicated-threat-or-planning-leakage>
#text-block[
Established | ACCOUNTABLE: School threat assessment chair
]
#strong[Trigger / verification:] Specific observed statements or
behavior with corroborating context.

#strong[Protective objective:] Review actionable concern early and
initiate proportionate supports.

#strong[Countermeasure:] Multidisciplinary, behavior-based assessment;
documented corroboration; supportive interventions; emergency referral
only where justified.

#strong[Independent evaluation:] Tabletop case review with synthetic
facts and independent review of proportionality.

#strong[Metrics and evidence:] Evidence quality, triage timeliness,
interventions and overturn rates. #emph[Supported professional practice,
not individual prediction.]

#strong[Rights/data gate:] FERPA purpose limits; protected expression
alone is not sufficient.

#strong[STOP condition:] Unsupported coercion or unsupported record
transfer.

]
#card[
=== T05 · Malicious, mistaken, or uncorroborated accusation
<t05-malicious-mistaken-or-uncorroborated-accusation>
#text-block[
Established | ACCOUNTABLE: Civil rights officer / independent reviewer
]
#strong[Trigger / verification:] Anonymous allegation lacking
independently corroborated conduct.

#strong[Protective objective:] Avoid wrongful labeling and retaliatory
intervention.

#strong[Countermeasure:] Separate intake from finding; preserve
exculpatory information; corrective review, time limits and appeals.

#strong[Independent evaluation:] Synthetic false-report exercise with
review by legal and student representatives.

#strong[Metrics and evidence:] False escalation rate, correction
timeliness and resolution quality. #emph[Governance / due-process
design.]

#strong[Rights/data gate:] Presumption against disciplinary or police
action based solely on allegation.

#strong[STOP condition:] Student punishment, political profiling or
irreversible label without support.

]
#card[
=== T06 · Suspected weapon or violence near school arrival/access area
<t06-suspected-weapon-or-violence-near-school-arrivalaccess-area>
#text-block[
Established | ACCOUNTABLE: School incident commander / 911 dispatch
]
#strong[Trigger / verification:] Direct human report of potential weapon
or danger, not algorithmic inference alone.

#strong[Protective objective:] Communicate credible urgent risk without
exposing additional students.

#strong[Countermeasure:] Trained human confirmation where safe; dispatch
escalation; campus-specific protective action; accessible notification.

#strong[Independent evaluation:] No-live-weapon notification tabletop;
measure decision and alert chain.

#strong[Metrics and evidence:] p50/p95 notification delay and
comprehension; missed recipients. #emph[Operational guidance; local
effectiveness unverified.]

#strong[Rights/data gate:] Avoid publishing campus-sensitive routes or
exploitable access points.

#strong[STOP condition:] Protective action depends entirely on a network
sensor or unvalidated classifier.

]
#card[
=== T07 · False or missed acoustic/visual firearm alarm
<t07-false-or-missed-acousticvisual-firearm-alarm>
#text-block[
Known technology failure class | ACCOUNTABLE: Technology assurance lead
]
#strong[Trigger / verification:] Sensor activates without verified
incident, or misses simulated signal.

#strong[Protective objective:] Avoid harmful false response while
retaining urgent notification.

#strong[Countermeasure:] Independent sensor benchmark; source
provenance; human verification; alternate reporting channel.

#strong[Independent evaluation:] Controlled authorized synthetic tests,
blinded false-positive and false-negative assessments.

#strong[Metrics and evidence:] Sensitivity, specificity, alert latency
and false alarm workload. #emph[Technology-specific evidence required.]

#strong[Rights/data gate:] No automatic suspect identity inference or
use-of-force trigger.

#strong[STOP condition:] Vendor cannot disclose validation data; false
alerts trigger irreversible action.

]
#card[
=== T08 · Threat reported while groups are in hallways or common areas
<t08-threat-reported-while-groups-are-in-hallways-or-common-areas>
#text-block[
Established | ACCOUNTABLE: Emergency preparedness lead
]
#strong[Trigger / verification:] Verified immediate threat with mixed
locations and conflicting movement instructions.

#strong[Protective objective:] Support safer protective action
appropriate to each location.

#strong[Countermeasure:] Preplanned options-based training; intelligible
multi-channel guidance; trained staff judgement.

#strong[Independent evaluation:] Accessible, non-violent exercise with
multiple mobility profiles and observers.

#strong[Metrics and evidence:] Instruction comprehension, conflicts,
accessibility and elapsed communication. #emph[General
emergency-preparedness evidence.]

#strong[Rights/data gate:] No publishable room-by-room tactical
playbook.

#strong[STOP condition:] Single inflexible command unnecessarily exposes
or traps occupants.

]
#card[
=== T09 · Classroom door hardware fails or impedes egress
<t09-classroom-door-hardware-fails-or-impedes-egress>
#text-block[
Established secondary safety hazard | ACCOUNTABLE: Facilities / fire
code authority
]
#strong[Trigger / verification:] Routine inspection finds fault,
incompatible accessory, or emergency release failure.

#strong[Protective objective:] Maintain protective closure while
preserving lawful egress and emergency access.

#strong[Countermeasure:] Code-reviewed listed hardware; scheduled
inspection; manual opening and release; accessibility testing.

#strong[Independent evaluation:] Qualified walk-through under power-off
and simulated panic conditions.

#strong[Metrics and evidence:] Every tested door independently satisfies
egress/accessibility criteria. #emph[Code/engineering requirement.]

#strong[Rights/data gate:] No unsanctioned door lock-in or
incapacitating enclosure.

#strong[STOP condition:] Any tested exit obstruction or inability to
release from inside.

]
#card[
=== T10 · Person with disability cannot perceive or follow protective instruction
<t10-person-with-disability-cannot-perceive-or-follow-protective-instruction>
#text-block[
Established | ACCOUNTABLE: ADA/504 coordinator
]
#strong[Trigger / verification:] Audible-only alert or obstructed
accessible exit.

#strong[Protective objective:] Ensure inclusive, independently usable
emergency action.

#strong[Countermeasure:] Multimodal accessible alerts, individualized
support planning, accessible refuge/egress review.

#strong[Independent evaluation:] Inclusive drill with disabled
participants and voluntary accommodations.

#strong[Metrics and evidence:] Notification reach, support timeliness
and documented accessibility defects. #emph[Accessibility duty; specific
benefit must be tested.]

#strong[Rights/data gate:] Do not expose medical or disability details
in broad alerts.

#strong[STOP condition:] Protective protocol excludes or isolates
disabled occupants.

]
#card[
=== T11 · Power or communications outage during incident
<t11-power-or-communications-outage-during-incident>
#text-block[
Established resilience threat | ACCOUNTABLE: Facilities / IT / incident
command
]
#strong[Trigger / verification:] Loss of power, WAN, cellular, or
security control unit.

#strong[Protective objective:] Maintain minimum alerts, unlocked legal
egress, and command continuity.

#strong[Countermeasure:] Tested backup power; manual public address /
radio alternatives; fail-safe access and written procedures.

#strong[Independent evaluation:] Authorized loss-of-power functional
test with observer and fire authority.

#strong[Metrics and evidence:] Continuity of essential functions;
restoration time and failed transitions. #emph[Established resilience
practice.]

#strong[Rights/data gate:] Backup cannot override life-safety release or
logging rules.

#strong[STOP condition:] Any power loss locks an occupied exit or
disables all emergency notification.

]
#card[
=== T12 · Spoofed alert, ransomware, or compromised access-control system
<t12-spoofed-alert-ransomware-or-compromised-access-control-system>
#text-block[
Emerging and observed cyber threat | ACCOUNTABLE: CISO / physical
security owner
]
#strong[Trigger / verification:] Unexpected vendor login, unsigned
command, inconsistent emergency message.

#strong[Protective objective:] Prevent cyber compromise from creating
unsafe physical behavior.

#strong[Countermeasure:] MFA; least privilege; segmentation; signed
updates; manual override; offline incident playbook.

#strong[Independent evaluation:] Authorized tabletop and isolated
cyber-physical failure injection (no live student impact).

#strong[Metrics and evidence:] Time to detect/contain; uncompromised
exit function; recovery success. #emph[NIST/CISA control guidance; site
testing required.]

#strong[Rights/data gate:] Do not connect surveillance telemetry to
general police databases.

#strong[STOP condition:] Remote operator can close all egress or issue
unverified lethal-threat instructions.

]
#card[
=== T13 · Life-threatening bleeding before EMS arrival
<t13-life-threatening-bleeding-before-ems-arrival>
#text-block[
Established | ACCOUNTABLE: School nurse / EMS liaison
]
#strong[Trigger / verification:] Observed injury requiring immediate
emergency medical response.

#strong[Protective objective:] Make trained assistance and supplies
accessible before professional arrival.

#strong[Countermeasure:] Bleeding-control kits, trained personnel,
accessible cache locations, EMS handoff coordination.

#strong[Independent evaluation:] Skills-based medical training and
equipment inspection; coordinate with qualified clinicians.

#strong[Metrics and evidence:] Training coverage, kit readiness,
performance in safe simulation. #emph[Established emergency medical
preparedness.]

#strong[Rights/data gate:] Do not collect student-specific medical
details beyond lawful operational need.

#strong[STOP condition:] Kits inaccessible or training not sustained.

]
#card[
=== T14 · Delayed police arrival during an active threat
<t14-delayed-police-arrival-during-an-active-threat>
#text-block[
Established operational constraint | ACCOUNTABLE: District emergency
lead / law enforcement agency
]
#strong[Trigger / verification:] Dispatch acknowledges incident but
units are not yet on scene.

#strong[Protective objective:] Reduce dependence on a single external
response timeline.

#strong[Countermeasure:] Protective actions, verified alarms, trained
communications lead, EMS staging; only legally authorized professional
security with oversight.

#strong[Independent evaluation:] Multi-agency tabletop; timed non-weapon
exercise; authority and ID checks.

#strong[Metrics and evidence:] Reliable dispatch interface,
communications robustness, accountable authority. #emph[Operational
planning; armed response outcome varies.]

#strong[Rights/data gate:] No armed deployment outside legal authority,
training and explicit policy.

#strong[STOP condition:] Unqualified staff armed or force authority
delegated to software.

]
#card[
=== T15 · Canine false indication, injury, or unreliable deployment
<t15-canine-false-indication-injury-or-unreliable-deployment>
#text-block[
Specialist capability / uncertain benefit | ACCOUNTABLE: Canine program
supervisor / independent evaluator
]
#strong[Trigger / verification:] Canine proposed for explosives/firearms
screening or a positive indication occurs.

#strong[Protective objective:] Avoid unvalidated claims and secondary
physical harms.

#strong[Countermeasure:] Qualified canine/handler credentialing;
validated application-specific reliability; welfare and student safety
review.

#strong[Independent evaluation:] Double-blind controlled screening
trials; documented incident review.

#strong[Metrics and evidence:] False indication rate, coverage, handler
performance, injury near-misses. #emph[Limited context-specific
evidence; not proven mass-shooting prevention.]

#strong[Rights/data gate:] No random intrusive student search based
solely on dog alert without lawful grounds.

#strong[STOP condition:] Insufficient canine validation or foreseeable
student bite/exposure risk.

]
#card[
=== T16 · Misidentified person or unauthorized on-site use of force
<t16-misidentified-person-or-unauthorized-on-site-use-of-force>
#text-block[
High-consequence human/system failure | ACCOUNTABLE: Authorized law
enforcement / independent oversight
]
#strong[Trigger / verification:] Confusing observations; responder has
incomplete incident picture.

#strong[Protective objective:] Protect innocent people, enforce
constitutional limits and prevent friendly-force errors.

#strong[Countermeasure:] Qualified law-enforcement coordination;
identification and restraint standards; independent force review;
medical response.

#strong[Independent evaluation:] Legal policy review, credentials audit
and scenario-based decision exercise without weapons.

#strong[Metrics and evidence:] Misidentification risks, policy
compliance, reporting completeness. #emph[Law/policy gate, not
demonstrated intervention efficacy.]

#strong[Rights/data gate:] Never provide target selection, automated
force recommendation or unreviewed force authority.

#strong[STOP condition:] Unlawful force policy; missing chain of command
or independent review.

]
#card[
=== T17 · AI-generated accusation, synthetic media, or automated threat score
<t17-ai-generated-accusation-synthetic-media-or-automated-threat-score>
#text-block[
Emerging | ACCOUNTABLE: AI assurance officer / threat team
]
#strong[Trigger / verification:] Suspicious synthetic audio/video or
automated recommendation presents urgent allegation.

#strong[Protective objective:] Require authentic, corroborated evidence
before adverse action.

#strong[Countermeasure:] Source verification, human case review,
multiple independent observations and challenge process.

#strong[Independent evaluation:] Adversarial synthetic exercise,
subgroup error analysis and documentation review.

#strong[Metrics and evidence:] False escalation, reversals, provenance
verification success. #emph[Emerging research; model-specific validation
needed.]

#strong[Rights/data gate:] No student risk scoring, mass surveillance,
or AI-only enforcement.

#strong[STOP condition:] Model recommendation is treated as proof or
enables automatic police action.

]
#card[
=== T18 · After-event reunification confusion or sensitive-data leakage
<t18-after-event-reunification-confusion-or-sensitive-data-leakage>
#text-block[
Established | ACCOUNTABLE: Reunification coordinator / privacy officer
]
#strong[Trigger / verification:] Families receive contradictory or
over-detailed status messages.

#strong[Protective objective:] Accountable reunification, privacy and
trauma-informed communication.

#strong[Countermeasure:] Single authorized family information lead,
secure verification, accessible multilingual updates.

#strong[Independent evaluation:] Family-facing tabletop, multilingual
review, redacted communication audit.

#strong[Metrics and evidence:] Family comprehension, rumor correction
time, unauthorized releases. #emph[Emergency management practice.]

#strong[Rights/data gate:] No public posting of pupil identities or
sensitive medical data.

#strong[STOP condition:] Live roster exposed or misinformation
uncontrolled.

]
#pagebreak(weak: true)
== 4 · Engineering requirements and release gates
<engineering-requirements-and-release-gates>
#figure(
  align(center)[#table(
    columns: (25%, 25%, 25%, 25%),
    align: (auto,auto,auto,auto,),
    table.header([Control], [Intended result], [Qualification
      evidence], [Stop condition],),
    table.hline(),
    [P-01 --- Voluntary safe storage outreach], [Prevent unsupervised
    youth access], [Owner-independent anonymized adoption and
    comprehension audit], [No household ownership registry or mandatory
    disclosure],
    [P-02 --- Temporary secure storage referral network], [Offer lawful
    and voluntary option during acute household
    risk], [Attorney-reviewed transfer/referral workflow; coverage
    audit], [No physical acceptance of firearms by schools],
    [B-01 --- Evidence-based threat assessment], [Differentiate credible
    behavior from stereotypes/rumors], [Independent case review; sampled
    dispositions; appeal test], [No adverse finding solely from
    protected expression or anonymous tip],
    [D-01 --- Verified multi-channel emergency alert], [Warn and
    coordinate without automated irreversible action], [Blinded alert
    tests and accessibility review], [No deployment with single
    unverified sensor failure mode],
    [D-02 --- Sensor validation and provenance], [Understand misses,
    false positives and adversarial input], [Representative independent
    bench testing], [No force or confinement automated by detector],
    [F-01 --- Safe classroom protection and egress], [Allow protection
    without trapping occupants], [AHJ and disability-access review;
    outage tests], [Stop at any fail-to-egress condition],
    [F-02 --- Continuity of critical systems], [Keep alerts and releases
    usable in outages], [Power/WAN outage exercise], [No failure mode
    that disables all emergency communications],
    [M-01 --- Bleeding-control readiness], [Improve immediate medical
    capability], [Training skills test; periodic kit inspection], [No
    inaccessible or unmaintained equipment],
    [R-01 --- Professional coordination and lawful force], [Reduce
    confusion and prevent unauthorized coercion], [MOU, credentialing,
    law review, exercise evaluation], [No unqualified armed staffing or
    AI force authority],
    [K-01 --- Canine use subject to evidence], [Evaluate narrow
    context-specific canine roles], [Independent double-blind tests and
    welfare checks], [No assumed mass-shooting efficacy or dangerous
    unvalidated search],
    [C-01 --- Cyber-physical assurance], [Prevent compromised technology
    from increasing harm], [Segmentation, update policy, outage and
    rollback exercises], [Stop when attackers could remotely lock
    exits],
    [A-01 --- AI decision support gate], [Keep human responsibility over
    judgments], [Bias, error, uncertainty, adversarial testing], [No
    automatic offender profile, adverse action or force],
    [G-01 --- Constitutional and privacy audit], [Prevent abuse,
    retaliation and unlawful transfers], [Independent authority, FERPA
    data-flow, complaint reviews], [Any misuse of authority, retaliation
    or unlawful redisclosure],
    [I-01 --- Accessible and inclusive emergency practice], [Serve all
    students and visitors], [ADA/504 review and inclusive tabletop
    drills], [Failure to provide meaningful emergency access],
    [L-01 --- Shared learning without exposure], [Improve with
    de-identified validated lessons], [Evidence/version audit and
    privacy review], [No security-sensitive blueprints or identifying
    records in public package],
  )]
  , kind: table
  )

== 5 · Acceptance thresholds and test logic
<acceptance-thresholds-and-test-logic>
Set numeric pass criteria #strong[before] testing based on law, AHJ
direction, device criticality and measured baseline. Do not
retroactively select thresholds from results. Use an independent
observer, repeat trials, record failures and quantify uncertainty. Keep
disruptive testing off live student operations unless separately
approved.

#figure(
  align(center)[#table(
    columns: (33.33%, 33.33%, 33.33%),
    align: (auto,auto,auto,),
    table.header([Evidence artifact], [Method / metric], [Mandatory
      suspension],),
    table.hline(),
    [Protected-egress sign-off], [Fire/building AHJ review; accessible
    opening and outage trials], [Any blocked escape or noncompliant
    accessibility condition],
    [Alerting and dispatch record], [p50/p95 end-to-end delay; recipient
    coverage; ambiguous alert study], [Missing life-critical
    destinations or unreliable fallback],
    [Sensor performance report], [Ground-truth blinded false-alarm/miss
    evaluation in approved synthetic conditions], [Irreversible action
    from a model score or insufficient independent testing],
    [Safety/rights impact assessment], [Purpose specification,
    complaints, appeal and redress exercise], [Identity-based targeting,
    coerced participation or unlawful redisclosure],
    [Cyber-physical test record], [Credential isolation, offline
    fallback, patch recovery and vendor access review], [Remote
    compromise can block egress or silently modify emergency alert],
    [Personnel qualification and governance], [Credentials, MOU, policy,
    complaint review and case studies], [Unauthorized armed deployment,
    inappropriate use-of-force procedures],
    [Medical readiness log], [Skill demonstration, kit inspections, EMS
    coordination], [Known unavailable critical kit or expired readiness
    checks],
    [Privacy-safe after-action report], [Redacted aggregate findings,
    versioned fixes and external review], [Student/reporter identity or
    exploitable campus weakness exposed],
  )]
  , kind: table
  )

== 6 · Safeguards for specialized response
<safeguards-for-specialized-response>
#card[
=== Canine applications
<canine-applications>
Separate explosives detection, firearm detection, general patrol, and
victim-location concepts; qualification for one does not establish
effectiveness for another. Require canine and handler credentials,
controlled validation, a documented lawful search basis, injury
prevention, supervision and independent incident reporting. Do not
describe canine deployment as a proven means of interrupting a school
shooting.

]
#card[
=== Authorized on-site intervention
<authorized-on-site-intervention>
Decisions about armed security must be taken through separately reviewed
statutory authority, qualifications, explicit roles, identification
protocols, independent force oversight and integration with dispatch.
The public-facing document provides governance and accountability
requirements, not engagement, weapons, targeting or entry tactics.

]
#card[
=== AI and advanced sensors
<ai-and-advanced-sensors>
Confine early experiments to education, maintenance or synthetic
decision-support cases. For alerts and individual risk assessment,
demonstrate robustness against adversarial and synthetic inputs, human
verification, error disparities, auditability and fail-safe operation.
No AI-only adverse action, confinement, offender labeling or force
decision.

]
== 7 · Adversarial assurance without exposing vulnerabilities
<adversarial-assurance-without-exposing-vulnerabilities>
Red teams should examine failure classes---spoofing, malicious
reporting, outages, social engineering, model hallucination, false
alarms and privacy leakage---in isolated environments with written
permission. Do not publish operationally exploitable site detail. A
second independent team assesses whether the proposed controls
themselves create harm.

#pagebreak(weak: true)
== 8 · Source register and scope boundaries
<source-register-and-scope-boundaries>
#text-block[
#strong[SRC-01] --- USSS NTAC, Protecting America's Schools (2019).
#link("https://www.secretservice.gov/sites/default/files/2020-04/Protecting_Americas_Schools.pdf").
#emph[Historical case analysis and fact-based prevention; not a
predictor for individuals.]

]
#text-block[
#strong[SRC-02] --- CISA K-12 School Security Guide (3rd ed.).
#link("https://www.cisa.gov/resources-tools/resources/k-12-school-security-guide-3rd-edition").
#emph[Layered security and campus assessment; does not validate each
proposed product.]

]
#text-block[
#strong[SRC-03] --- FBI, 2025 Active Shooter Incidents (released
2026-07-30).
#link("https://www.fbi.gov/news/press-releases/fbi-releases-2025-active-shooter-incidents-in-the-united-states-report").
#emph[2025 total across settings; not a K-12 incident rate.]

]
#text-block[
#strong[SRC-04] --- CDC, Preventing Firearm Injury and Death.
#link("https://www.cdc.gov/firearm-violence/prevention/").
#emph[Public-health guidance for secure storage and child access
prevention.]

]
#text-block[
#strong[SRC-05] --- Washington RCW 9.41.360.
#link("https://app.leg.wa.gov/rcw/default.aspx?cite=9.41.360").
#emph[Unsafe-storage liability in specified circumstances; no universal
storage method mandate.]

]
#text-block[
#strong[SRC-06] --- Washington RCW 28A.320.124.
#link("https://app.leg.wa.gov/rcw/default.aspx?cite=28A.320.124").
#emph[School safety staff duties, separation from discipline and family
complaint processes.]

]
#text-block[
#strong[SRC-07] --- Washington RCW 28A.320.1242.
#link("https://app.leg.wa.gov/rcw/default.aspx?cite=28A.320.1242").
#emph[Annual agreements with public involvement.]

]
#text-block[
#strong[SRC-08] --- US Department of Education FERPA threat assessment
FAQ.
#link("https://studentprivacy.ed.gov/faq/does-ferpa-permit-sharing-education-records-outside-law-enforcement-officials-mental-health").
#emph[Purpose limitation and redisclosure conditions.]

]
#text-block[
#strong[SRC-09] --- NIST AI Risk Management Framework.
#link("https://www.nist.gov/itl/ai-risk-management-framework"). #emph[AI
governance/validation; not a certification.]

]
#text-block[
#strong[SRC-10] --- NIST Cybersecurity Framework 2.0.
#link("https://www.nist.gov/cyberframework").
#emph[Govern/identify/protect/detect/respond/recover control outcomes.]

]
#text-block[
#strong[SRC-11] --- CISA Protecting Our Future: Cybersecurity for K-12.
#link("https://www.cisa.gov/protecting-our-future-cybersecurity-k-12").
#emph[MFA, known exploited vulnerabilities, backups and IR exercises.]

]
#text-block[
#strong[SRC-12] --- U.S. Department of Education Active School Shooter
Resources.
#link("https://www.ed.gov/teaching-and-administration/safe-learning-environments/school-safety-and-security/preventing-targeted-violence-and-threat-assessment-resources/active-school-shooter").
#emph[Behavior-based multidisciplinary TAT and avoiding stereotyping.]

]
#text-block[
#strong[SRC-13] --- Washington Department of Commerce Safe Storage
Program.
#link("https://www.commerce.wa.gov/community-safety/safe-storage/").
#emph[Current Washington safe-storage outreach and definitions.]

]
#text-block[
Prepared 26 October 2026. The 2025 FBI active-shooter total covers
multiple site categories, not only schools. Site-specific legal, fire,
disability access, engineering and operational approval are not included
in this documentation release.

]
