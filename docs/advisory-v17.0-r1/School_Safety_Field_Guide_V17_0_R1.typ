// Editable print source for Version 17.0 Revision 1.
// Shared styles, covers, cards and tables are in publication.typ.
#import "publication.typ": *
#show: publication.with(title: "School Safety Field Guide | Version 17.0 Revision 1", guide: true)

#metadata(none)#label("publication-content")
#coverpage(background: image("assets/cover_background.png", width: 100%, height: 100%, fit: "cover", alt: "Decorative conceptual campus illustration"))[
#metadata(none)#label("cover-page")
#cover-line[
#grid(columns: (1fr, auto), [INDEPENDENT SCHOOL SAFETY ANALYSIS / WASHINGTON K--12], [Version 17.0 Revision 1])
]
#cover-main[
#text-block[
SYSTEMS-BASED SECURITY REFERENCE

]
= SCHOOL SAFETY \ & LAYERED THREAT \ MITIGATION
<school-safety-layered-threat-mitigation>
#text-block[
#emph[]
]
#text-block[
GOVERNING-BOARD DECISIONS · OPERATIONAL PROTECTION · FIELD ASSURANCE

]
#cover-description[
A defense-in-depth policy and operational guide for Washington K--12
schools, integrating prevention, protective action, technology
assurance, legal compliance and official-source research. Includes
threat-driven technology adoption, continuous testing, cyber-physical
safety assurance and constitutional safeguards (V17.0).

]
]
#cover-bottom[
#cover-tag[
PUBLIC REFERENCE READINESS STATUS: NOT VALIDATED
]
Courtesy of #strong[NERVOSYS, LLC] ~·~ Contact: #strong[Dr. Adam
Erickson]

#link("https://nervosys.ai")

Independent school-safety research. Not issued or endorsed by CISA or
any U.S. Government agency.
]
#cover-note[
#cover-note[
Publication 17.0 Revision 1. Editorial corrections and verifiable
advisory reasoning; independent acceptance and site validation remain
pending.

]
]
]
#frontpage[
#metadata(none)#label("executive-summary-one-page")
#text-block[
BOARD-LEVEL BRIEF / WASHINGTON K--12 Version 17.0 Revision 1
]
= Executive summary
<executive-summary>
#text-block[
A credible school-shooting prevention program starts before a weapon
reaches campus: restrict unauthorized youth access to firearms, assess
concerning behavior fairly, protect occupants immediately and deliver
lifesaving care while responders are en route.

]
#decision-strip[
#text-block[
GOVERNING PLANNING STANDARD
]
Do not assume outside responders arrive within five minutes. Protect
students before an incident by reducing access to unsecured firearms;
during a credible incident, initiate safe, accessible protective and
medical actions without waiting for external aid.

]
#card-grid(
[
#card[
#text-block[
01 Prevent firearm access
]
Provide universal safe-storage education, optional locks and equipment
vouchers, and lawful temporary-storage referrals. Keep firearms unloaded
and locked with ammunition separately secured. Do not collect household
ownership lists.

]
],
[
#card[
#text-block[
02 Verify threats without profiling
]
Use multidisciplinary behavioral assessment and trusted reporting.
Corroborate allegations, separate urgency from culpability, and
coordinate lawful intervention when credible danger exists.

]
],
[
#card[
#text-block[
03 Protect and treat in the first minutes
]
Test accessible alerts, safe shelter or evacuation, emergency access,
backup communications and trauma response. Meet Washington
bleeding-control equipment, training and inspection duties.

]
],
[
#card[
#text-block[
04 Prove results and partner responsibly
]
Authorize a 90-day program with schools, families, firearm owners,
retailers, healthcare and law enforcement. Use privacy-protective
metrics, independent evaluation and transparent corrective actions.

]
],
)
== Decision requested from district leadership
<decision-requested-from-district-leadership>
#card[
#text-block[
Technology modernization · mandatory cybersecurity gate
]
#strong[Prioritize protective technology only when established or
credibly emerging threats expose a documented gap; experiment early but
never deploy unverified.] Attacker and defender methods can adapt
rapidly; every trial therefore requires a repeatable cycle of
evaluation, challenge, hardening, limited pilot, monitoring, and
revision. Every connected safety technology - cameras, sensors, alarms,
door controllers, communications, cloud consoles and AI models - may be
compromised. Cybersecurity is a top-level life-safety function, and
cyber failure must never create confinement, loss of free egress,
autonomous force, or uncontrolled student surveillance.

#text-block[
V17.0 / proposed policy and engineering requirements; no campus
certification. Sources:
#link("https://www.nist.gov/publications/nist-cybersecurity-framework-csf-20")[NIST CSF 2.0],
#link("https://csrc.nist.gov/pubs/sp/800/82/r3/final")[NIST SP 800-82r3],
#link("https://www.cisa.gov/protecting-our-future-cybersecurity-k-12")[CISA K-12 guidance],
#link("https://csrc.nist.gov/pubs/sp/800/218/final")[NIST SSDF 1.1].

]
]
#text-block[
Authorize a 90-day ASCS-00/01--04 prevention and prearrival protection
pilot: name owners, establish voluntary partnerships, audit egress-safe
barriers and alerting, independently assess canine and qualified
responder proposals, remediate mandatory safety gaps and measure
first-minutes performance.
]
#text-block[
#strong[Evidence standard:] documented → inspected → exercised →
independently verified. #strong[Rights and legitimacy:] respect
constitutional protections, student privacy, individualized due process,
and legal limits on force and surveillance. Neither an accusation nor an
AI alert is a finding of wrongdoing. #strong[Current readiness:]
unassessed.

]
#text-block[
COURTESY OF NERVOSYS, LLC ~·~ DR. ADAM
ERICKSON · #link("https://nervosys.ai") · 02
]
#strong[Rights and public trust:] Every ASCS subsystem must satisfy the
G0 legality, non-retaliation, data-minimization and
independent-accountability gates before deployment. Lawful ownership or
political expression alone is never a credible threat indicator.

]
#tocpage[
#metadata(none)#label("TOC")
#text-block[
#strong[Version 17.0 Revision 1] · #strong[Courtesy of NERVOSYS, LLC] ·
Publication contact: #strong[Dr. Adam Erickson] · Independent
school-safety research · Website: #link("https://nervosys.ai")

]
#text-block[
SYSTEMS-BASED SECURITY REFERENCE

]
= Contents
<contents>
#block(height: 2.7in)[#columns(2, gutter: 18pt)[
- #link(<0-youth-firearm-access-prevention>)[0. Youth firearm-access prevention & community partnerships]
- #link(<executive-summary-one-page>)[Executive summary]
- #link(<field-guide-at-a-glance>)[Implementation at a glance]
- #link(<administrator-safety-innovation-charter>)[Administrator ownership and innovation mandate]
- #link(<national-school-safety-innovation-forum>)[National innovation forum and federal technical review]
- #link(<readiness-release-decision-sheet>)[Readiness release decision sheet]
- #link(<how-to-read-this-document>)[How to read this document]
- #link(<1-executive-decisions-and-immediate-priorities>)[1. Executive decisions and immediate priorities]
- #link(<2-threat-model-and-decision-logic>)[2. Threat model and decision logic]
- #link(<3-prevention-behavioral-assessment-reporting-and-online-harm>)[3. Prevention: behavioral assessment, reporting and online harm]
- #link(<4-physical-protection-entry-screening-and-technology>)[4. Physical protection, entry screening and technology]
- #link(<5-first-minutes-protective-action-responders-and-force-limits>)[5. First minutes: protective action, responders and force limits]
- #link(<6-incident-specific-protective-decision-guides>)[6. Incident-specific protective decision guides]
- #link(<7-constitutional-and-civil-liberties-constraints-that-improve-safety>)[7. Constitutional and civil-liberties constraints that improve safety]
- #link(<8-implementation-assurance-and-governance>)[8. Implementation, assurance and governance]
- #link(<9-further-research-agenda>)[9. Further-research agenda]
- #link(<10-glossary-and-evidence-hierarchy>)[10. Glossary and evidence hierarchy]
- #link(<11-campus-field-verification-and-independent-assurance>)[11. Campus field verification and independent assurance]
- #link(<12-integrated-threat-vector-register-and-countermeasure-crosswalk>)[12. Integrated threat vector register and countermeasure crosswalk]
- #link(<13-protective-capability-assurance-catalogue>)[13. Protective capability assurance catalogue]
- #link(<14-washington-compliance-and-legal-approval-checklist>)[14. Washington compliance and legal approval checklist]
- #link(<15-representative-field-sampling-exercises-and-remediation>)[15. Representative field sampling, exercises and remediation]
- #link(<16-annotated-research-bibliography-and-further-reading>)[16. Annotated research bibliography and further reading]
- #link(<ascs-governance-and-public-trust>)[G0. Constitutional governance and public trust]
- #link(<17-accelerated-technology-and-cybersecurity-assurance>)[17. Rapid technology integration and cybersecurity assurance]
- #link(<threat-driven-modernization-revc>)[18. Threat-driven protective technology]
- #link(<ai-promise-v16-0-revd>)[19. The promise and limits of AI for school safety]
- #link(<20-threat-specific-assurance>)[20. Threat-specific safeguards and qualification]
- #link(<logical-advisory-reasoning>)[21. Verifiable advisory reasoning]

]]

]
#frontpage[
#metadata(none)#label("field-guide-at-a-glance")
== Implementation at a glance
<implementation-at-a-glance>
#text-block[
A practical decision sequence for school boards, superintendents, and
safety teams. Prioritize protections that operate before outside help
arrives; require independent evidence before claiming readiness.

]
#card-grid(
[
#card[
P0 / FIRST 30 DAYS
=== Protect life immediately
<protect-life-immediately>
Verify accessible alerts, egress and shelter options, dispatch contacts,
bleeding-control compliance, and trauma-response coverage. Record every
critical deficiency with an owner and interim measure.

]
],
[
#card[
P1 / BY DAY 90
=== Demonstrate functionality
<demonstrate-functionality>
Test classrooms, portable buildings, outdoor activities, transportation,
accessibility, and communications outages. Collect timed results from
authorized, independently witnessed exercises.

]
],
[
#card[
P2 / CONDITIONAL
=== Approve specialized systems
<approve-specialized-systems>
Screening, AI cameras, armed personnel, canines, and counter-UxS require
a site-specific gap, legal authority, evaluation of adverse effects, and
demonstrated protective benefit.

]
],
)
#text-block[
Evidence ladder --- procurement is not proof of readiness
]
#decision-strip[
#text-block[
01 \ Documented
]
#text-block[
02 \ Inspected
]
#text-block[
03 \ Exercised
]
#text-block[
04 \ Independently verified
]
]
#text-block[
#strong[NO OFFSETTING CRITICAL FAILURE.] A blocked accessible exit,
failed emergency warning, unaddressed serious safeguarding gap, or other
life-safety defect cannot be concealed by a favorable average score.
Maintain campus status as #strong[NOT VALIDATED] until the specific
deficiency is addressed and retested.

]
#text-block[
How this publication distinguishes authority
]
#figure(
  align(center)[#table(
    columns: (50%, 50%),
    align: (auto,auto,),
    [LAW], [Constitutional, statutory, or regulatory requirement; verify
    applicability and current legal text.],
    [GUIDANCE], [Federal or state recommended practice; not
    independently a grant of search, surveillance, or force authority.],
    [EVIDENCE], [Research or independently observed performance; report
    limitations and uncertainty.],
    [PROPOSAL], [District policy choice requiring legal, community, and
    operational review.],
  )]
  , kind: table
  )

#text-block[
This is an independent public research guide, not an official CISA
publication or a campus assessment. Detailed configurations, sensor
locations, and response arrangements belong in access-controlled
district records.

]
]
#frontpage[
#metadata(none)#label("administrator-safety-innovation-charter")
#text-block[
DISTRICT LEADERSHIP / ADMINISTRATOR DELEGATION / PROPOSED POLICY
]
== Administrator ownership and innovation mandate
<administrator-ownership-and-innovation-mandate>
#text-block[
#strong[Compliance is the floor. Effective protection is the objective.]
Principals and school administrators are expected to challenge
assumptions, identify campus-specific hazards, and develop better means
of protecting students and staff---not merely demonstrate that
prescribed paperwork has been completed.

]
#decision-strip[
#strong[GOVERNING-BOARD DIRECTIVE]
Delegate responsibility, defined decision rights, protected time and
resources to each campus safety lead. Require the leader to identify
measurable safety gaps, invite staff and responder ideas, propose
low-cost or novel solutions, test results safely, and report both
successes and failures. Never penalize truthful reporting of weaknesses.

]
#card-grid(
[
#card[
=== 01 / Own the outcome
<own-the-outcome>
Name a campus owner for alert reach, protective actions, accessible
egress, medical readiness and coordination. Give that owner resources, a
district sponsor and a method to escalate urgent barriers.

]
],
[
#card[
=== 02 / Challenge the baseline
<challenge-the-baseline>
Compare the school\'s documented procedures against observed
performance. Invite ideas from educators, students, families, custodial
staff, disability specialists and first responders without assuming any
group knows every failure mode.

]
],
[
#card[
=== 03 / Pilot responsibly
<pilot-responsibly>
Start with reversible, low-risk improvements: clearer warning
instructions, redundant communications, accessible signage, better
handoffs, substitute-staff orientation and trauma-care access. Obtain
required district and partner approvals before live tests.

]
],
[
#card[
=== 04 / Prove and share
<prove-and-share>
State a measurable hypothesis; record baseline, benefits, missed alerts,
delay and unintended harms; use independent witnesses; then adopt,
revise or stop. Share proven practices across schools while withholding
sensitive layouts and vulnerabilities.

]
],
)
=== Administrator-led improvement cycle
<administrator-led-improvement-cycle>
#text-block[
FIND GAP DESIGN OPTION AUTHORIZE PILOT MEASURE SCALE OR STOP
]
#text-block[
#strong[Limits and accountability]
Innovation does not waive federal or Washington law, fire/ADA
obligations, student privacy, constitutional rights, due process or
collective agreements. No administrator may unilaterally authorize
weapons, force, drone interdiction, invasive surveillance, unsafe drills
or other restricted activities. The district must fund oversight and
expedite lawful review rather than shift responsibility without
authority.

]
#text-block[
Board oversight: quarterly campus improvement reviews; a written
decision on unresolved high-risk gaps; protected escalation for
principals; evidence of measured results; and review of discontinued or
harmful pilots. This is a #strong[proposed district leadership policy],
informed by
#link("https://www.cisa.gov/sites/default/files/publications/k12-school-security-guide-3rd-edition-022022-508.pdf")[CISA\'s site-adapted security guidance],
#link("https://www.secretservice.gov/sites/default/files/reports/2020-06/USSS_NTAC_Enhancing_School_Safety_Guide_7.11.18.pdf")[USSS NTAC\'s adaptable prevention guidance],
and
#link("https://app.leg.wa.gov/rcw/default.aspx?cite=28A.320.125")[RCW 28A.320.125]\;
it is not an additional statutory mandate.

]
]
#frontpage[
#metadata(none)#label("national-school-safety-innovation-forum")
#text-block[
NATIONAL COLLABORATION / PROPOSED PROGRAM / VOLUNTARY FEDERAL ADVICE
]
== National School Safety Innovation Forum
<national-school-safety-innovation-forum-rust-2>
#text-block[
#strong[Local innovation should produce national learning.] Establish a
moderated, nationwide community of practice in which school
administrators publish documented safety improvements, unsuccessful
approaches, measured tradeoffs, and lessons learned. Build on existing
DOJ STOP School Violence technical-assistance and peer-learning work
rather than duplicating it.

]
#decision-strip[
GOVERNANCE RECOMMENDATION
#strong[School-led, federally advised, independently evaluated.] Invite
federal agencies to review technical methods and issue nonbinding
recommendations. School districts retain legal authority for campus
decisions; agency participation and sponsorship require formal agreement
and do not imply federal certification.

]
#card-grid(
[
=== 01 / Network and access
<network-and-access>
Provide verified membership for public, Tribal, territorial, charter and
private school leaders; include rural and urban districts, educators,
families, accessibility specialists, responders and researchers. Offer
moderated discussion, regional peer groups, quarterly workshops and an
annual evidence review.

],
[
=== 02 / Federal technical review
<federal-technical-review>
Request CISA advice on physical and cyber protection; USSS NTAC on
behavioral threat assessment; DOJ BJA/NIJ on evaluations and
replication; Education on student privacy and civil rights; and FEMA on
exercises. Involve state education and safety agencies, including
Washington OSPI.

],
[
=== 03 / Evidence-based case library
<evidence-based-case-library>
Use a standard entry: problem, setting, countermeasure, lawful
approvals, baseline, cost, implementation limits, test methods,
outcomes, adverse effects and reproducibility. Label #emph[proposed],
#emph[locally tested], #emph[independently replicated] or #emph[not
recommended]. Publish useful failures as well as successes.

],
[
=== 04 / Security, rights and trust
<security-rights-and-trust>
Separate public summaries from tightly restricted professional
materials. Exclude identifiable student records, live incidents, floor
plans, sensor gaps, armed-staff deployments and exploitable
vulnerabilities. Require moderation, independent conflict-of-interest
declarations, privacy review, correction and appeal procedures.

],
)
#text-block[
RECOMMENDED SHARING WORKFLOW
]
#text-block[
Submit Screen Federal / peer review Evaluate Publish / replicate
]
#text-block[
#strong[Launch proposal:] Convene a 90-day charter group; invite written
agency recommendations; pilot a secure case library and administrator
peer-review program within six months; publish an annual public findings
report and a restricted practitioner supplement. Measure independently
verified improvements, adoption, cost, safety incidents and unintended
effects---not message volume or product sales.

]
#text-block[
Basis:
#link("https://bja.ojp.gov/funding/webinar/fy23-stop-tta-recording")[DOJ BJA STOP TTA (2023): communities of practice and dissemination]\;
#link("https://bja.ojp.gov/program/stop-school-violence-program/overview")[DOJ STOP School Violence Program]\;
#link("https://www.cisa.gov/sites/default/files/2022-11/k12-school-security-guide-3rd-edition-022022-508.pdf")[CISA K--12 School Security Guide (2022)]\;
#link("https://www.secretservice.gov/sites/default/files/reports/2020-06/USSS_NTAC_Enhancing_School_Safety_Guide_7.11.18.pdf")[USSS NTAC (2018)].
This forum is proposed, not an existing federally approved program.

]
#text-block[
Courtesy of NERVOSYS, LLC Contact: Dr. Adam Erickson
]
]
#frontpage[
#metadata(none)#label("readiness-release-decision-sheet")
#text-block[
BOARD ACTION / CONTROL ASSURANCE
]
== Readiness release decision sheet
<readiness-release-decision-sheet-rust-2>
#text-block[
Use at district review gates and after a material campus change.
#strong[Readiness is a scoped finding, not a general certification.]
Record the exact campus, buildings, people, operating conditions,
reviewer and test date in a restricted evidence packet; report findings
and decisions at board level without publishing sensitive
vulnerabilities.

]
#card-grid(
[
#card[
01 / LEGAL BASELINE
=== Prove mandatory duties
<prove-mandatory-duties>
Verify drills, accessible procedures, bleeding-control coverage,
emergency-response agreements, training and privacy duties. Cite the
governing rule and current record.

]
],
[
#card[
02 / REACH
=== Reach every occupied setting
<reach-every-occupied-setting>
Demonstrate warnings and protective instructions in classrooms, outdoor
programs, transport and accessible scenarios; document measured coverage
and fallback.

]
],
[
#card[
03 / PROTECTION
=== Demonstrate immediate action
<demonstrate-immediate-action>
Observe safe protective decisions, egress, shelter and accountability
before outside responders arrive; record event times from one defined
time origin.

]
],
[
#card[
04 / MEDICAL
=== Prove lifesaving readiness
<prove-lifesaving-readiness>
Inspect required supplies and staffing, then observe a safe simulated
traumatic-injury response and timely EMS coordination.

]
],
[
#card[
05 / INTEROPERABILITY
=== Confirm first-responder handoff
<confirm-first-responder-handoff>
Confirm dispatch verification, backup communications, scene information
sharing and command transfer with the participating agencies.

]
],
[
#card[
06 / ASSURANCE
=== Independently review limitations
<independently-review-limitations>
Document misses, false alerts, accessibility gaps, maintenance needs and
corrective actions; retest before claiming closure.

]
],
)
#decision-strip[
=== Decision outcomes
<decision-outcomes>
#strong[NOT ASSESSED] --- evidence is absent or testing was not
authorized. ~ #strong[CONDITIONAL] --- a defined protective function was
demonstrated, but material limitations remain. ~ #strong[VERIFIED IN
SCOPE] --- the specified capability, conditions and evidence were
independently accepted. ~ #strong[CRITICAL FAILURE] --- do not describe
the campus as ready; apply interim protective measures and retest.

]
#text-block[
Decision ownership: district executive and campus lead. Technical
review: independent evaluator, fire/EMS, dispatch, law enforcement and
district counsel as applicable. Never average away blocked egress, a
failed accessible warning or a required statutory control. The scorecard
is a #strong[proposed governance aid], not a new legal standard or
federal certification.

]
]
== How to read this document
<how-to-read-this-document>
- #strong[Executive decisions and core countermeasures:] Sections 1--10;
  recommended actions and evidence obligations.
- #strong[Campus field protocol:] Section 11; authorization, safe
  sampling, evidence levels and independent review.
- #strong[Operational reference registers:] Sections 12--15; all 56
  vector entries, 15 candidate capabilities, Washington compliance
  requirements and field sampling.
- #strong[Annotated research bibliography:] Section 16; official
  federal, state, constitutional and regulatory sources with links and
  limitations.

#strong[Authority key:] #strong[LAW] = binding law; #strong[GUIDANCE] =
nonbinding agency advice; #strong[RESEARCH] = empirical/descriptive
evidence; #strong[WARNING] = agency warning, not local verification;
#strong[PROPOSAL] = district option requiring review and testing.

#divider()

#pagebreak(weak: true)
== 1. Executive decisions and immediate priorities
<1-executive-decisions-and-immediate-priorities>
=== Decision requested
<decision-requested>
Empower every campus principal to own protective outcomes and propose
safe, measurable improvements beyond mandated minimums. Grant time,
resources, decision rights and a fast district review path. Approve a
90-day districtwide baseline program with one accountable owner,
campus-level inspections, independently witnessed #emph[in-scope]
demonstrations of life-safety capability, documented interagency
coordination, and independently verified closure of critical
deficiencies. Require a campus-specific evidence packet and a
governing-board exception report at days 30, 60, and 90; aggregate
dashboards may not conceal any open life-safety finding. Do #strong[not]
authorize major advanced screening, AI, counter-UxS, canine or
armed-personnel procurements based on demonstrations or marketing claims
alone. Apply a common test: #strong[specific hazard → protective purpose
→ legal basis → reliable detection/response → measured performance →
unintended harm → fallback]. \[F01\] \[F07\] \[W01\]

=== Priority gates: protect people first
<priority-gates-protect-people-first>
#figure(
  align(center)[#table(
    columns: (33.33%, 33.33%, 33.33%),
    align: (left,left,left,),
    table.header(table.cell(align: left)[Priority], table.cell(align: left)[Required
      decision or capability], table.cell(align: left)[Minimum
      completion evidence],),
    table.hline(),
    table.cell(align: left)[#strong[P0 ·
    immediate]], table.cell(align: left)[Emergency warning and backup
    channels; clear evacuation/lockdown/shelter choices; working
    egress/access controls], table.cell(align: left)[Timed, accessible
    tests including buses, fields and after-hours activities;
    deficiencies owned and dated],
    table.cell(align: left)[#strong[P0 ·
    immediate]], table.cell(align: left)[Washington bleeding-control
    compliance; first-aid/AED/EMS
    interface], table.cell(align: left)[Verified kits, employee training
    coverage and annual/post-use inventories under RCW 28A.210.440],
    table.cell(align: left)[#strong[P0 ·
    immediate]], table.cell(align: left)[PSAP, fire/EMS and police
    coordination; incident leadership and
    reunification], table.cell(align: left)[Current contacts, joint
    review, responder access arrangements and documented functional
    exercises],
    table.cell(align: left)[#strong[P0 ·
    immediate]], table.cell(align: left)[Behavioral reporting, triage
    and student safeguarding], table.cell(align: left)[Multidisciplinary
    case-management team, follow-up procedures, privacy and
    malicious-report controls],
    table.cell(align: left)[#strong[P1 · near
    term]], table.cell(align: left)[Entry screening, targeted cameras,
    cybersecurity and identity
    protection], table.cell(align: left)[Site-specific gap analysis and
    measured reliability, false positives, accessibility and privacy],
    table.cell(align: left)[#strong[P2 ·
    conditional]], table.cell(align: left)[Authorized protective
    personnel, detection canines, counter-UxS
    specialists], table.cell(align: left)[Independent legal
    authorization, evidence-based benefit, qualification and exercise
    validation],
  )]
  , kind: table
  )

#strong[Compliance note.] Washington's #emph[safe school plan] and
emergency-response-system statutes are binding, and bleeding-control
readiness became a specific statutory requirement beginning in the
2026--27 school year. Reconcile district policy and evidence with RCW
28A.320.125, \.126 and 28A.210.440. \[W01--W03\]

=== Compliance details administrators must not miss
<compliance-details-administrators-must-not-miss>
- #strong[Drills and documentation --- LAW.] RCW 28A.320.125 calls for
  at least one safety-related drill per month #strong[while school is in
  session with students], covering shelter-in-place, lockdown and
  evacuation functional responses; it also requires drill date, time and
  type to be recorded, relevant earthquake and mapped-hazard exercises,
  and age-appropriate, trauma-informed lockdown drills.
- #strong[Principal incident command --- LAW.] The safe school plan must
  require the building principal to be certified on the incident command
  system. Check substitutes, staff with accessibility needs, and
  students at off-site events. \[W01\]
- #strong[Response system --- LAW.] RCW 28A.320.126 requires district
  collaboration with local law enforcement, public safety answering
  points and safety/security staff to develop a qualifying emergency
  response system. The statute specifies #strong[at least one] listed
  response-system capability; it does not require each school to buy
  every listed product. The statutory progress-report deadline was
  October 1, 2025: audit submissions and existing implementation, not a
  fictional new 2026 deadline. \[W02\]
- #strong[Bleeding control --- LAW.] Verify each campus\'s physical
  equipment, required contents, trained-staff coverage and inspection
  records individually. A district purchase order is not evidence of
  campus compliance. \[W03\]

#strong[Decision rule:] a safety control with an uninspected site,
expired training, unknown backup performance or missing records remains
#strong[UNASSESSED] or #strong[NONCOMPLIANT], not \'operational\' merely
because a policy or equipment inventory exists.

=== Legal compliance is a separate gate from operational effectiveness
<legal-compliance-is-a-separate-gate-from-operational-effectiveness>
#strong[LAW / implementation interpretation.] Verify legal duties
individually. A successful alert test does not prove that monthly drills
were documented; a purchased bleeding-control kit does not establish
statutory contents, training or inspections; and an effective security
officer does not cure a missing annual agreement. RCW 28A.320.125
requires safe school plans, accessibility and reunification provisions,
principal incident-command certification, staff/temporary-worker
communications, and monthly drills when students are in session. RCW
28A.320.126 requires an emergency response system developed with law
enforcement, PSAPs and safety/security staff; a single qualifying
statutory technology can satisfy the listed-system element, but the
district must still demonstrate the full coordination requirement. RCW
28A.210.440 applies for the 2026--27 year and specifies equipment
contents, staff coverage and annual/after-use inspections. \[W01--W03\]

#strong[Security staffing and records.] Where the district deploys
safety/security personnel, RCW 28A.320.124 requires a duties/complaints
policy; RCW 28A.320.1242 requires annual adoption of applicable provider
agreements with training and community involvement; RCW 28A.320.1241
requires specific yearly collection/submission of staffing,
force-related incidents and complaints. Verify each provision rather
than inferring authority or readiness from a contract alone.
\[W06--W08\]

#strong[Privacy and student allegations.] School-based threat assessment
must concern individual behavior and context rather than demographic
profiling. When FERPA\'s health/safety emergency exception is used to
disclose protected educational records, log the articulable and
significant threat and disclosure recipients. Urgent precautionary
protection is distinct from an adjudicated disciplinary finding.
\[W04--W05\] \[F25\]

For an inspectable baseline, use the accompanying #strong[statutory
compliance matrix], recording campus, obligation, evidence location,
authorized reviewer, gap, interim measure and retest date. An unassessed
statutory obligation must be escalated; it must not be marked compliant
or treated as proof of a violation without fact gathering.

=== Decision gate: no critical gap can be averaged away
<decision-gate-no-critical-gap-can-be-averaged-away>
#strong[PROPOSAL.] Treat any verified failure of an accessible
emergency-warning route, required egress, campus bleeding-control
coverage, life-safety communications fallback, or an applicable
mandatory school plan as a #strong[critical open finding]. A favorable
overall score does not offset it. Assign a responsible owner, an interim
protective measure, a repair date, and independent retest. When evidence
is absent, mark #strong[UNASSESSED], not failed or passed.

#strong[Approval sequence:] identify site risk and legal requirements;
verify the existing baseline; correct P0 failures; perform controlled
exercises; quantify residual deficiencies; only then consider advanced
screening, AI analytics, armed staffing, working canines or counter-UxS
procurement. This sequence prioritizes physical protection, not the
volume of technology purchased. \[F01\] \[F07\] \[W01--W03\]

=== Acceptance logic: what must be true before a campus is called ready
<acceptance-logic-what-must-be-true-before-a-campus-is-called-ready>
#strong[PROPOSAL --- board-adopted assurance standard, not a statutory
certification.] For each campus and time period (school hours,
extracurricular events, transport, summer programs), evaluate
#emph[coverage] separately from #emph[equipment condition]. A
districtwide system can be functional while a portable classroom,
athletic field, bus route, or accessible entrance remains unprotected.

Use the decision sequence #strong[applicable → assigned → inspected →
exercised → independently corroborated → sustained]. A control may be
reported as #emph[locally demonstrated] only when a named evaluator has
documented its operating conditions, participant accessibility, test
outcome and next retest. Do not use an average score to close an
emergency-alert failure, impaired egress, unavailable required medical
resources, or other critical deficiency. Record unavailable evidence as
#strong[UNASSESSED], not as zero risk or compliance. This is an added
district policy, not a statutory declaration of campus readiness.
\[F01\] \[F07\] \[F24\] \[F29\]

#strong[Minimum evidence bundle] for each control: campus identifier;
relevant buildings and activities; accountable owner; legal basis; risk
addressed; test script/version; date and witness; quantitative
observations where meaningful; accessible alternatives; whether normal
services were disrupted; actual-versus-expected result;
privacy/discipline collateral effects; corrective-action ticket; and
retest/expiry date. Maintain operational diagrams and sensitive security
configurations in restricted local records rather than the board-facing
report.

#figure(
  align(center)[#table(
    columns: (33.33%, 33.33%, 33.33%),
    align: (left,left,left,),
    table.header(table.cell(align: left)[Assurance
      decision], table.cell(align: left)[Sufficient
      basis], table.cell(align: left)[What it does #strong[not]
      establish],),
    table.hline(),
    table.cell(align: left)[#strong[Not
    assessed]], table.cell(align: left)[Evidence absent, expired, or
    outside test scope], table.cell(align: left)[Does not mean an
    imminent threat exists],
    table.cell(align: left)[#strong[Installed, not
    proven]], table.cell(align: left)[Inventory or physical inspection
    only], table.cell(align: left)[Does not establish alerts reach
    occupants or staff can respond],
    table.cell(align: left)[#strong[Demonstrated with
    limitations]], table.cell(align: left)[Controlled, witnessed
    exercise within stated settings], table.cell(align: left)[Does not
    generalize to power loss, weekends or every disability
    accommodation],
    table.cell(align: left)[#strong[Verified for defined
    scope]], table.cell(align: left)[Repeatable field exercise or
    suitable incident evidence, with independent review and active
    maintenance], table.cell(align: left)[Does not predict every
    real-world attack or certify an entire district],
    table.cell(align: left)[#strong[Critical
    failure]], table.cell(align: left)[Mandatory life-safety provision
    absent or a necessary barrier demonstrably
    fails], table.cell(align: left)[Cannot be averaged away; interim
    protection and follow-up required],
  )]
  , kind: table
  )

#strong[Sampling rule:] test the #emph[hardest representative
conditions], not only the easiest demonstration---e.g., a classroom far
from main administration, a noisy assembly, an accessible alternative
route, a school bus, and a case with degraded IT or power. Expand the
sample where buildings, populations or equipment configurations differ
materially. Never test an actual emergency by dispatching false alerts
or obstructing life-safety functions. FEMA\'s HSEEP exercise framework
supports objective-based evaluation followed by an After-Action
Report/Improvement Plan (AAR/IP). \[F29\]

=== The school safety operating concept
<the-school-safety-operating-concept>
#block[
#set enum(numbering: "1.", start: 1)
+ #strong[Prevent:] intervene on credible behavior and support
  vulnerable students; reduce access and cyber vulnerabilities.
+ #strong[Detect and verify:] observe hazards using people and
  appropriately tested sensors; corroborate without delaying protection.
+ #strong[Protect:] communicate, separate from danger, shelter or
  evacuate as appropriate, preserve accessible egress.
+ #strong[Respond:] qualified personnel act strictly within authority;
  school staff account for people and render feasible first aid;
  coordinate with police/fire/EMS.
+ #strong[Recover and learn:] reunify families, support victims,
  preserve records, independently review errors, close deficiencies,
  revise plans. \[F01\] \[F07\] \[F10\]
]

#pagebreak(weak: true)
== 2. Threat model and decision logic
<2-threat-model-and-decision-logic>
CISA's 2022 K--12 School Security Guide addresses #strong[crime and
violence], not every natural or public-health hazard; pair it with
federal emergency-operations-planning guidance for all-hazards coverage.
\[F01\] \[F07\]

The #strong[56-vector companion register] remains the detailed hazard
index; its scenarios are not incident-frequency estimates. Use seven
broad groups to avoid a brittle list of purportedly exhaustive attacks.
Each local campus assigns severity, plausible exposure, vulnerable
populations, protective controls, decision owner and validation status.
\[F01\] \[F07\]

#figure(
  align(center)[#table(
    columns: (33.33%, 33.33%, 33.33%),
    align: (left,left,left,),
    table.header(table.cell(align: left)[Threat
      family], table.cell(align: left)[Representative
      examples], table.cell(align: left)[Defensive planning response],),
    table.hline(),
    table.cell(align: left)[Targeted
    violence], table.cell(align: left)[Firearms, edged weapons,
    explosives, arson, vehicle incursion, unauthorized entry, attacks
    during transit or events], table.cell(align: left)[Access controls,
    location-appropriate protection, rapid notification, qualified
    response, hemorrhage control],
    table.cell(align: left)[Information, cyber and
    deception], table.cell(align: left)[Swatting, forged allegations,
    credential compromise, extortion, cyberbullying, AI-generated
    harassment, ransomware], table.cell(align: left)[Source
    authentication, PSAP coordination, child protection, backups,
    evidence provenance and fair investigation],
    table.cell(align: left)[Targeted coercion and
    abduction], table.cell(align: left)[Custody disputes, luring,
    virtual kidnapping, trafficking, foreign-state intimidation,
    organized criminal recruitment], table.cell(align: left)[Verified
    release and custody protocols, welfare checks, safe disclosures,
    specialist referrals, victim services],
    table.cell(align: left)[Environmental and
    medical], table.cell(align: left)[Wildfire/smoke, earthquake, severe
    weather, hazmat exposure, epidemic, medical mass
    casualty], table.cell(align: left)[Hazard-specific
    shelter/evacuation, air systems, supplies, EMS interface,
    continuity],
    table.cell(align: left)[Unmanned systems and
    animals], table.cell(align: left)[Unexpected UAS/UGV presence,
    hazardous drone activity, aggressive dogs, specialized working
    canines], table.cell(align: left)[Safe observation, indoor
    protection, specialist coordination, lawful mitigation and
    ADA-conscious handling],
    table.cell(align: left)[Infrastructure and
    transport], table.cell(align: left)[Power/IT failure, water failure,
    communications outage, bus disruption, supply-chain
    outage], table.cell(align: left)[Redundant channels, alternative
    locations, manual modes, continuity and alternate transport],
    table.cell(align: left)[Compound and
    unknown], table.cell(align: left)[False alert masking a genuine
    event, cyber-physical disruption, previously unclassified
    method], table.cell(align: left)[Multiple independent observations,
    flexible incident command, escalation pathways, register update],
  )]
  , kind: table
  )

=== Assurance-case method for all 56 threat vectors
<assurance-case-method-for-all-56-threat-vectors>
For #strong[each vector] in the companion data register, document: (1)
the observed hazard or credible warning; (2) the control IDs meant to
prevent, detect, protect or recover; (3) required evidence; (4) the
named school/district owner; (5) whether all students and locations can
benefit; (6) failure interactions with other hazards; and (7) a retest
date. The companion #strong[threat-to-control crosswalk] provides a
first-pass mapping. Consolidated Edition 12.0 adds a field-test plan
that separates measured campus coverage from mere equipment presence. It
is a #emph[proposed assessment map], not proof of local applicability or
control effectiveness.

A school may face a severe harm mechanism with little incidence
evidence. In that case, evaluate whether existing measures already
mitigate it before introducing a dedicated sensor or tactic. Conversely,
recurrent low-tech failures---unreachable emergency messaging, unsecured
releases, misconfigured access doors---deserve remediation even if no
sensational incident triggered concern. \[F01\] \[F07\]

=== Campus prioritization: avoid false precision
<campus-prioritization-avoid-false-precision>
Assess each campus by #strong[credible exposure, vulnerability of
occupants, likely consequence, protective capability, and confidence in
the evidence]. Do not assign invented numerical probabilities to
politically motivated attacks, advanced drones, or rare scenarios. Use
four decision states:

#figure(
  align(center)[#table(
    columns: (33.33%, 33.33%, 33.33%),
    align: (left,left,left,),
    table.header(table.cell(align: left)[State], table.cell(align: left)[Meaning], table.cell(align: left)[District
      action],),
    table.hline(),
    table.cell(align: left)[#strong[Known statutory
    gap]], table.cell(align: left)[Requirement is confirmed and required
    evidence is missing or fails
    inspection], table.cell(align: left)[Correct immediately; document
    interim protection and legal review],
    table.cell(align: left)[#strong[Measured protective
    deficiency]], table.cell(align: left)[A controlled test or
    documented incident demonstrates an operational
    failure], table.cell(align: left)[Assign accountable owner, due date
    and retest],
    table.cell(align: left)[#strong[Plausible exposure,
    untested]], table.cell(align: left)[Hazard could apply locally, but
    effectiveness or frequency is
    unknown], table.cell(align: left)[Assess site, use proportional
    interim measures, do not procure on assumptions],
    table.cell(align: left)[#strong[Emerging / not established
    locally]], table.cell(align: left)[Government warning or
    hypothetical mechanism without local supporting
    evidence], table.cell(align: left)[Track updates and test existing
    defenses before adding technology],
  )]
  , kind: table
  )

Record #strong[source strength], #strong[local applicability],
#strong[coverage gaps], and #strong[effect on other hazards]\; for
example, screening queues cannot impair fire egress or emergency
reunification. \[F01\] \[F24\]

=== Prioritization without invented probability or compensating scores
<prioritization-without-invented-probability-or-compensating-scores>
#strong[PROPOSAL.] Use a non-compensatory decision order: #strong[\(1)
imminent protective deficiency; (2) binding legal duty; (3) demonstrable
exposure and absence of backup; (4) effect on occupants with
disabilities, transportation and off-hours activities; (5) evidence of a
locally relevant threat; (6) cost, opportunity cost and testability.] An
unknown likelihood must remain #strong[UNKNOWN] rather than being filled
with arbitrary numeric threat probabilities or sensational national
incidents. CISA\'s school-security method is site-specific; federal
targeted-violence cases and warnings do not provide a reliable
probability of an event on a named campus. \[F01--F04\]

Require two independently assigned judgments: the #strong[operations
owner] documents present exposure and action; the #strong[independent
reviewer] checks the evidence and whether any residual critical gap
remains. Human safety, nondiscrimination, accessible egress, and
mandatory medical/communications requirements are #strong[hard gates],
not weights in a total score. A proposed purchase must be compared with
feasible lower-complexity alternatives, including staffing and
procedural changes.

=== Evidence and action must run on separate tracks
<evidence-and-action-must-run-on-separate-tracks>
#strong[Track A --- immediate protection.] When articulable
circumstances indicate a credible immediate danger, an authorized leader
may take a proportionate protective action while verification continues.
Communicate uncertainty to dispatch and occupants; monitor reversibility
and collateral risk. #strong[Track B --- findings and adverse actions.]
Attribution, discipline, exclusion, public identification and criminal
referral each demand their own lawful evidence, review and notice
processes. An anonymous tip, AI alert, partisan accusation or screenshot
is #strong[not] proof of guilt. \[F05\] \[F06\] \[F11\] \[W04\]
\[W12--W14\]

Use evidence labels #strong[direct observation; independently
corroborated; unverified; contradicted; adjudicated fabrication].
Preserve originals and access logs. Do not infer a knowingly false or
malicious report merely because evidence was insufficient. Investigate
credible indicators of manipulation, coordinated retaliation and
impersonation without discouraging good-faith disclosures. \[W05\]

#callout[
#metadata(none)#label("v16-release-decision")
#strong[EDITORIAL CANDIDATE - INDEPENDENT ACCEPTANCE PENDING.] This
revision links targeted hazards to owners, evidence, rights, and
suspension criteria. See the Threat Scenario and Countermeasure
Engineering companion; signed site-specific acceptance records must be
obtained separately.
]
#metadata(none)#label("v16-system-assurance")
#pagebreak(weak: true)
== G0 / ASCS systems assurance and release certification boundary
<g0-ascs-systems-assurance-and-release-certification-boundary>
== Executive decision statement
<executive-decision-statement>
#callout[
#strong[Release disposition: EDITORIAL CANDIDATE; INDEPENDENT ACCEPTANCE
PENDING; OPERATIONAL DEPLOYMENT NOT CERTIFIED.] Neither this report nor
historical drills establish that a school is protected, compliant, or
authorized to use a particular capability.
]
The specific hazard is a targeted firearm attack against a school,
particularly in the interval before outside responders can intervene.
The strategy combines upstream prevention, evidence-led reporting, fast
verified warning, code-compliant protection, hemorrhage control,
qualified externally governed professional response, recovery, and an
independent constitutional-rights gate. It does not rely on a single
technology, predicts no attacker behavior, and does not authorize
tactical violence.

The terms “defense-grade” and “systems assurance” in this publication
describe an engineering method: explicit requirements, hazards,
traceability, adversarial testing, documentation, independent
verification, change control and negative-result reporting. They do not
claim endorsement by DoD, CISA, law enforcement or any accreditor.

=== Decision outcomes
<decision-outcomes-1>
#figure(
  align(center)[#table(
    columns: (33.33%, 33.33%, 33.33%),
    align: (auto,auto,auto,),
    table.header([Status], [Meaning], [Action],),
    table.hline(),
    [#strong[APPROVE DOCUMENTATION]], [Editorial, sources,
    reproducibility and privacy checks pass], [Publish public package
    with limitations],
    [#strong[CONDITIONAL PILOT]], [Legal gate and pilot safety protocol
    approved; unresolved efficacy question], [Restricted, supervised and
    reversible evaluation only],
    [#strong[OPERATIONAL APPROVAL]], [Site-specific AHJ, legal,
    training, privacy, accessibility and performance reviews
    complete], [Sign by distinct accountable district and external
    authorities],
    [#strong[STOP / SUSPEND]], [Critical egress, authority, rights or
    safety test fails], [Suspend feature; preserve evidence; retest
    after remediation],
  )]
  , kind: table
  )

#pagebreak(weak: true)
== 01 | System boundary and integrated architecture
<system-boundary-and-integrated-architecture>
Unit of analysis: a district program and one representative school for
evaluation. Interfaces include caregivers, school personnel, emergency
communications, local fire and EMS, dispatch, authorized law
enforcement, trained specialists and independent reviewers. Home firearm
choices are outside school enforcement authority except as lawfully
determined in an individualized matter.

#figure(
  align(center)[#table(
    columns: (25%, 25%, 25%, 25%),
    align: (auto,auto,auto,auto,),
    table.header([Layer], [Principal inputs], [Function /
      output], [Primary dependency],),
    table.hline(),
    [G0 Governance], [Constitution, statutes, FERPA, agreements,
    community oversight], [Authorize or prohibit actions; protect
    complainants; audit disclosures], [Independent reviewer / board],
    [ASCS-00 Prevention], [Opt-in household information, resources,
    private outreach], [Reduce unauthorized access opportunities;
    connect voluntary support], [Lawful ownership protections],
    [ASCS-01 BTAM, detection and alerts], [Credible human reports,
    accessible alert inputs, optional sensors], [Qualified risk review,
    corroboration, protective notification], [Staffed review; PSAP
    coordination],
    [ASCS-02 Protective environment], [Compliant doors, protective
    rooms, accessible routes], [Delay exposure and preserve safe
    egress], [Fire/building AHJ],
    [ASCS-03 Specialist canine option], [Certified handler, scoped
    training and policies], [Potential narrow detection support; no
    general active-shooter claim], [Independent empirical evidence],
    [ASCS-04 Qualified professionals], [Legal authority, contract,
    supervision], [Emergency coordination and lawful professional
    intervention], [Formal policy; force reporting],
    [ASCS-05 Medical/recovery], [Kits, training, casualty information,
    privacy controls], [Immediate life support and family
    reunification], [EMS and school nurses],
    [ASCS-07 Verification], [Approved test plans, anonymized logs,
    adverse events], [Objective evidence, remediation,
    go/no-go], [Independent assessor],
  )]
  , kind: table
  )

=== Functional assurance logic
<functional-assurance-logic>
- An identified control must map to at least one defined hazard, one
  accountable owner, and one independently reviewable evidence artifact.
- A control can only claim a benefit supported by the kind of study
  performed: product bench test, site exercise, operational evaluation
  or evidence from real incidents are distinct.
- Failure of G0 legal authority, egress safety, medical minimums or
  basic communication cannot be averaged away by high performance
  elsewhere.
- Public release carries conceptual requirements and aggregate results;
  campus-specific access, sensors, operational placement, case files and
  response tactics require separate restricted governance.

#pagebreak(weak: true)
== 02 | Threat definition, uncertainty and risk method
<threat-definition-uncertainty-and-risk-method>
Mass-shooting hazard families considered: preventable firearm access;
warning-sign leakage not acted on; attempted unauthorized entry; failure
to recognize a credible threat; unsafe shelter and access controls;
delayed medical assistance; misidentified responders or innocents;
malicious reporting and rights violations. Other hazards such as fires
and chemical releases remain essential competing life-safety
constraints.

Risk is documented as severity, plausibility, exposure, controllability
and strength of evidence. Do not assign pseudo-precise annual event
probabilities from sparse local events. Extreme-severity/low-frequency
incidents and false alarms must be evaluated separately. The hazard
register includes negative consequences introduced by safeguards
themselves.

#figure(
  align(center)[#table(
    columns: (33.33%, 33.33%, 33.33%),
    align: (auto,auto,auto,),
    table.header([Evidence state], [Examples], [Permitted claim],),
    table.hline(),
    [Unassessed], [No reliable local evidence, or a vendor assertion
    only.], [Planning and controlled evaluation only.],
    [Documented], [Policy, inventory, ownership, or training records
    exist.], [Documented arrangements; protective function is not yet
    demonstrated.],
    [Inspected], [A qualified inspection checks condition and
    scope.], [Observed condition within the inspection boundary.],
    [Exercised within stated conditions], [An authorized controlled test
    records outcomes, misses, and adverse effects.], [Performance only
    under the declared test conditions.],
    [Independently verified within stated scope], [Independent reviewers
    corroborate repeatable tests or suitable operational
    records.], [Accepted evidence for the named scope, with limits and
    revalidation triggers.],
  )]
  , kind: table
  )

The states above describe control assurance, not the strength of a
causal study. Bench, simulated, field, and multisite studies remain
distinct study designs. Report the actual study design and uncertainty;
do not translate inspection or exercise success into attacks or deaths
prevented.

=== Representative public hazard register
<representative-public-hazard-register>
#figure(
  align(center)[#table(
    columns: (25%, 25%, 25%, 25%),
    align: (auto,auto,auto,auto,),
    table.header([ID], [Hazard / consequence], [Mapped
      controls], [Verification / limit],),
    table.hline(),
    [H01], [A child accesses a household firearm --- Injury before
    campus defenses], [ASCS00-01; ASCS00-02], [Secure-storage support;
    caregiver education; lawful voluntary referrals; Participation and
    knowledge measures only, not assumed reduction in violence],
    [H02], [Threat leakage ignored or reporting chilled --- Missed early
    prevention opportunity], [ASCS01-01; G0-01], [Anonymous and
    identified reporting with trusted human triage; Receipt and triage
    logs; reporter nonretaliation checks],
    [H03], [Malicious or fabricated allegation leads to coercion ---
    Rights violation, harm, trust collapse], [ASCS01-02;
    G0-02], [Evidence provenance, corroboration, independent appeal;
    Blinded false-report scenario and audit trail],
    [H04], [Emergency alert fails during degraded networks --- Delayed
    protective action], [ASCS01-03], [Independent manual channel and
    regular outage tests; Measured end-to-end alert latency
    distribution],
    [H05], [Classroom security interferes with emergency exit ---
    Fire/medical secondary casualty], [ASCS02-01; ASCS02-02], [Fire-code
    approved hardware, free egress, accessible alternatives; Certified
    inspection and user demonstrations],
    [H06], [Sensor false detection causes harmful police action ---
    Unnecessary force, panic, discriminatory impacts], [ASCS01-02;
    ASCS04-01], [Human verification; no algorithmic force authorization;
    Blind false-alarm trials and escalation audit],
    [H07], [Canine deployment causes search or injury concerns ---
    Student harm and civil-rights violations], [ASCS03-01;
    G0-01], [Handler certification, narrow scope, trauma-informed
    review; Independent tests and incident/complaint records],
    [H08], [On-site armed response is mistaken or misdirected ---
    Bystander casualties, responder confusion], [ASCS04-01], [Authority,
    credentials, coordination, oversight; Legal review, qualitative
    tabletop, incident reporting],
    [H09], [Medical kits or trained coverage absent --- Preventable
    hemorrhage], [ASCS05-01], [Routine inventory, staffing redundancy
    and training; Inventory audit and structured skills testing],
    [H10], [FERPA data repurposed into intelligence --- Privacy and
    trust erosion], [G0-02], [Purpose limitation, separate files, logged
    exceptions; Red-team unauthorized disclosure tests],
    [H11], [Single supplier/cyber failure impacts alarms --- Common-mode
    breakdown], [ASCS01-03; ASCS07-01], [Vendor threat model, offline
    and manual options; Degraded-mode tabletop and configuration
    review],
    [H12], [Exercise inflicts harm or reveals campus vulnerabilities ---
    Trauma, unauthorized disclosure], [ASCS07-01; G0-01], [No surprise
    simulations; safety officer; restricted annex; Prior exercise
    approvals and after-action findings],
  )]
  , kind: table
  )

#pagebreak(weak: true)
== 09 | Verification, validation and independent test protocol
<verification-validation-and-independent-test-protocol>
#strong[Verification] asks whether a specified control was implemented;
#strong[validation] asks whether it materially serves the actual
intended safety outcome without causing unacceptable secondary harm.
Neither a tabletop exercise nor a successful demo constitutes proof of
reduced fatalities in rare events.

#figure(
  align(center)[#table(
    columns: (33.33%, 33.33%, 33.33%),
    align: (auto,auto,auto,),
    table.header([Stage], [Activities], [Artifacts / independence],),
    table.hline(),
    [0: Definition], [Freeze controlled requirements, hazards, site
    boundary, participant protections], [Approved test charter, site
    access list, counsel and fire review],
    [1: Bench & desk], [Documentary audit, manufacturer tests,
    cybersecurity and privacy review], [Signed bill of controls and log
    of exceptions],
    [2: No-threat functional], [Simulated notifications, egress and safe
    medical supply tasks], [Reproducible time stamps, observer notes,
    accessibility evidence],
    [3: Degraded conditions], [Authorized low-risk
    power/network/simulated sensor failure], [Fallback and recovery
    demonstration; no actual outage inflicted],
    [4: External audit], [Independent reviewers reproduce select
    samples, adjudicate adverse effects], [Nonconformance report and
    corrective action owners],
    [5: Conditional operations], [Temporary approved pilot with
    de-identified reporting], [Periodic limits review and stop
    authority],
  )]
  , kind: table
  )

=== Metrics and measurement boundaries
<metrics-and-measurement-boundaries>
#figure(
  align(center)[#table(
    columns: (33.33%, 33.33%, 33.33%),
    align: (auto,auto,auto,),
    table.header([Metric], [Collection], [Interpretation and caveat],),
    table.hline(),
    [Alert delivery], [Timestamped simulated initiation and receipt;
    p50/p95/p99 distribution], [Measure end-to-end by scenario, not a
    universal arrival guarantee],
    [Detection quality], [TP, FP, TN, FN on a blinded curated evaluation
    corpus], [Report scenario-specific sensitivity, specificity and
    positive predictive value],
    [Rights adherence], [Proportion of cases with lawful basis and
    correct access logs], [Audit all exceptions; one critical rights
    failure may stop program],
    [Protection / egress], [Inspection + representative usability
    tests], [Must pass AHJ and accessibility sign-off],
    [Medical readiness], [Trained staffing, kit availability and
    replenishment], [Compliance ≠ patient survival rate],
    [Community trust], [Opt-in anonymously reported participation;
    accessible complaints], [Avoid mandatory surveys or linking
    identities],
    [Canine option], [Blind controlled tests, alert reasons,
    injury/complaint events], [Do not extrapolate to active-shooter
    interdiction],
    [System availability], [Test results across outages and manual
    mode], [No untested single point of failure accepted],
  )]
  , kind: table
  )

Illustrative statistical note: use Wilson binomial intervals or exact
intervals for detection proportions and record sample-size limitations.
Rare-event sensitivity requires carefully staged surrogate scenarios;
observational safety outcomes cannot be estimated by multiplying
performance numbers from incompatible studies.

#pagebreak(weak: true)
== 10 | Countermeasure tradespace and procurement controls
<countermeasure-tradespace-and-procurement-controls>
#figure(
  align(center)[#table(
    columns: (25%, 25%, 25%, 25%),
    align: (auto,auto,auto,auto,),
    table.header([Option], [Potential benefit], [Principal
      costs/risks], [Evidence release gate],),
    table.hline(),
    [Storage counseling + vouchers], [Addresses youth access before
    campus threat], [Privacy trust; low uptake; uneven
    affordability], [Verified education accuracy, anonymous uptake,
    vendor safeguards],
    [Behavioral threat teams], [Earlier review, intervention and
    supportive care], [Bias, false accusations, record
    misuse], [Documented case audits, fairness reviews, FERPA
    compliance],
    [Redundant alerts], [Quicker actionable notification], [False
    alarms, accessibility and IT outages], [Timed degraded-mode tests
    and human override],
    [Code-approved door hardware], [Exposure reduction while maintaining
    exit], [Fire compliance, expense, maintenance], [AHJ, ADA and safe
    egress acceptance],
    [ML/acoustic systems], [Potential additional automated cue], [False
    positives; surveillance; vendor opacity], [Independent local blind
    trials before pilot],
    [Canine specialist service], [Narrow optional screening], [Uncertain
    effectiveness, injuries/trauma/search issues], [Independent legal
    and efficacy trial],
    [Qualified on-site officers/security], [Potential faster authorized
    human response], [Force misuse, mistaken identification,
    liability], [Explicit authority and independent governance],
    [Bleeding-control readiness], [Medical preparation independent of
    attacker timing], [Training decay and kit gaps], [Legal baseline,
    inventory and drills],
  )]
  , kind: table
  )

Procurement must separate lifecycle expense (device, installation,
recurring training, servicing, power/network redundancy, cyberpatching,
litigation/insurance and evaluation) from hypothetical avoided
casualties. Require a reversible pilot and source code/data portability
where applicable. Proprietary technology must not evade independent
privacy or accuracy testing.

#pagebreak(weak: true)
== 11 | 90-day qualification and 12-month assurance program
<day-qualification-and-12-month-assurance-program>
#figure(
  align(center)[#table(
    columns: (33.33%, 33.33%, 33.33%),
    align: (auto,auto,auto,),
    table.header([Window], [Program action], [Completion / owner],),
    table.hline(),
    [Days 1--15], [Charter, roles, public disclosures, scope, emergency
    escalation paths], [Board lead + counsel establish gate G0],
    [Days 16--30], [Baseline evidence inventory, accessibility/fire
    review, threat-report flow; anonymized community program
    consultation], [Facilities, principal, health/community leads],
    [Days 31--45], [Voluntary storage campaign and no-registration
    voucher pilot; legal temporary-storage referral review], [Community
    partners and privacy officer],
    [Days 46--60], [No-threat alert/egress/medical controlled tests;
    canine concept review only if separately
    authorized], [Fire/EMS/emergency lead + independent evaluator],
    [Days 61--75], [Degraded-mode tests, false-report red-team tabletop,
    rights and data audit], [Independent assessor, FERPA officer,
    civil-rights liaison],
    [Days 76--90], [Issue signed nonconformance report, residual-risk
    decisions, revise MOU and remediation plan], [Board / external
    reviewers; suspend failed controls],
    [Quarterly, year 1], [Refresh training, maintenance, access logs and
    safeguarding complaints; re-evaluate supplier changes], [Control
    owners + independent reviewer],
    [Annual], [Review school-security agreements and required reporting,
    exercises, updated law and literature], [District counsel, board and
    community participants],
  )]
  , kind: table
  )

=== Approval signature matrix
<approval-signature-matrix>
#figure(
  align(center)[#table(
    columns: (33.33%, 33.33%, 33.33%),
    align: (auto,auto,auto,),
    table.header([Gate], [Approver], [Approval evidence],),
    table.hline(),
    [Legal and civil rights], [District counsel + external civil-rights
    reviewer], [Written scope and public complaint route],
    [Fire/egress/ADA], [Building/fire AHJ + disability access
    lead], [Approved hardware and documented accessible function],
    [Emergency / medical], [911/EMS liaison and qualified school medical
    lead], [Procedure and stocked readiness proof],
    [Technology/cyber], [CISO/privacy lead + independent
    assessor], [Security/privacy test, vendor terms, failure tests],
    [On-site professional force], [Agency counsel/supervision and school
    board as applicable], [Specific authorization and outside
    complaint/force oversight],
    [Public release], [Technical editor + privacy reviewer + repository
    maintainer], [Checklists and signed SHA-256 evidence],
  )]
  , kind: table
  )

#pagebreak(weak: true)
#metadata(none)#label("ascs-governance-and-public-trust")
#text-block[
VERSION 17.0 REVISION 1 / CROSS-CUTTING G0 / RIGHTS + PUBLIC TRUST

]
== G0 --- Constitutional governance and anti-weaponization safeguards
<g0-constitutional-governance-and-anti-weaponization-safeguards>
#strong[Release principle:] A protective capability is not operationally
ready unless it has documented lawful authority, necessity,
proportionality where applicable, privacy limits, non-retaliation, a
complaint path and independent review. This standard applies to family
prevention, threat intake, sensor alerts, security personnel, canine
screening, intervention and post-incident investigations.

=== Two pathways that must not be conflated
<two-pathways-that-must-not-be-conflated>
#figure(
  align(center)[#table(
    columns: (50%, 50%),
    align: (auto,auto,),
    table.header([Voluntary prevention and community
      services], [Law-enforcement and coercive action],),
    table.hline(),
    [Open to all households; no compelled disclosure of firearm
    ownership, political beliefs or personal inventories. Anonymous
    safe-storage vouchers; separated vendor and school
    records.], [Requires distinct legal authority and an individualized
    factual basis. Do not convert a safe-storage event, anonymous rumor
    or lawful speech into grounds for a search, detention or seizure.],
    [Firearm retailers, clubs, caregivers and health practitioners may
    teach secure storage without sharing participant identities.], [A
    police member of a FERPA-governed assessment team may not
    automatically repurpose student information for unrelated department
    intelligence.],
  )]
  , kind: table
  )

=== Evidence, fair process and escalation
<evidence-fair-process-and-escalation>
+ #strong[Receive and safeguard:] Record exact concern, source, time and
  corroboration; allow anonymous good-faith reporting without treating
  anonymity as proof. Escalate imminent danger immediately using lawful
  emergency procedures.
+ #strong[Assess observable conduct:] Distinguish threats, preparations,
  access, context, lawful expression and rumor. Explicitly prohibit sole
  reliance on viewpoint, protected identity, lawful ownership,
  disability status or peaceful advocacy.
+ #strong[Assign independent decision rights:] School team manages
  education/safety matters; only appropriate authorities take coercive
  law-enforcement actions. Counsel or a designated legal reviewer signs
  off on nonemergency law-enforcement requests.
+ #strong[Document the legal basis:] Preserve warrant, order, legally
  valid consent or specific exception when applicable; use the least
  intrusive lawful approach sufficient to address the risk. Rights
  reviews must not delay action against an immediate, credible threat to
  life.
+ #strong[Offer review and correction:] Provide appropriate notice,
  opportunity to respond and record correction or appeal in nonemergency
  matters, without compromising active safety needs or legally protected
  investigations.

=== Separate oversight from the response chain
<separate-oversight-from-the-response-chain>
- Independent civilian review body with student, family,
  disability-access, civil-rights and lawful-owner representation;
  transparent selection, recusal and conflict-of-interest rules; no
  access to operational secrets beyond lawful need.
- Protected complaint reporting to the school, supplying
  agency/contractor, and independent external channels as jurisdiction
  allows. Preserve source records and audit trails; investigate
  retaliation allegations independently.
- Publish only aggregate counts, dispositions, false positives,
  unlawful-action findings, training completions, remedies and vendor
  costs. Suppress small cells and withhold sensitive student/campus data
  as required.
- Require annual agreement review with public participation and clear
  limits on SRO discipline functions; maintain separate records of
  security involvement with student discipline, arrests and use of force
  as required by Washington law.

=== Abuse-of-authority red flags --- suspend and review
<abuse-of-authority-red-flags-suspend-and-review>
#figure(
  align(center)[#table(
    columns: (50%, 50%),
    align: (auto,auto,),
    table.header([Concern], [Immediate governance response],),
    table.hline(),
    [Political or ideological targeting; suppression of criticism or
    retaliation against a reporter], [Preserve evidence, prevent
    involved decision-maker from adjudicating their own case, refer for
    independent assessment, document interim protection against
    retaliation.],
    [Unlawful demand for firearm-owner lists or education
    records], [Refuse unauthorized secondary release, log request,
    obtain counsel review, notify privacy officer and remediate
    attempted access.],
    [Unapproved search, canine use, force, restraint or student
    discipline by security staff], [Protect safety first, preserve
    relevant evidence, initiate proper complaint/agency process, suspend
    affected procedure pending safety review.],
    [Unsubstantiated allegations or adversarial reports used without
    corroboration], [Check provenance, permit good-faith reporting,
    require individualized assessment and corrections when supported.],
  )]
  , kind: table
  )

#text-block[
#strong[Washington and federal basis:] U.S. constitutional safeguards;
WA Constitution Art. I §§ 3, 5, 7, 24; RCW 28A.320.124/.1241/.1242; RCW
10.120.020; FERPA threat-assessment guidance; WSCJTC
officer-certification complaint procedures. This is model governance
language, not a finding that a particular officer or agency has engaged
in misconduct.

]
#metadata(none)#label("ascs-00")
#text-block[
VERSION 17.0 REVISION 1 / ASCS-00 / UPSTREAM RISK REDUCTION

]
== 0. Youth firearm-access prevention and community partnerships
<0-youth-firearm-access-prevention>
#text-block[
Prevent a child or adolescent from gaining unauthorized access to a
firearm before a threat reaches a school. The operational goal is to
reduce unsupervised access through secure storage, caregiver education,
lawful intervention when warranted, and practical community
assistance---not to maintain a list of firearm-owning families.

]
#text-block[
#strong[Evidence boundary.] Secure storage is an established
injury-prevention practice and can reduce unauthorized access; its
effect on mass-shooting incidence specifically cannot be assumed or
quantified from storage-program distribution counts alone. Measure
implementation and verified access outcomes separately from changes in
rare violent incidents.
]
=== ASCS-00.1 / Household and vehicle access controls
<ascs-00.1-household-and-vehicle-access-controls>
#figure(
  align(center)[#table(
    columns: (33.33%, 33.33%, 33.33%),
    align: (auto,auto,auto,),
    table.header([Risk pathway], [Recommended safeguard], [Evidence to
      collect without personal registration],),
    table.hline(),
    [Unsupervised access inside a home], [Store firearms unloaded in a
    locked safe or lockbox; store ammunition separately and securely.
    Keep keys, combinations and credentials inaccessible to
    children.], [Anonymous pre/post knowledge and adoption surveys;
    aggregate voucher uptake],
    [Access in a relative\'s or friend\'s home], [Give caregivers a
    neutral conversation script to ask whether firearms are stored
    securely wherever children spend time. Do not request household
    inventories.], [Voluntary survey of familiarity and use of the
    conversation checklist],
    [Unattended firearms in vehicles], [Discourage leaving firearms in
    unattended vehicles. Where transport or temporary storage is
    unavoidable, use lawful locked storage and prevent access by
    minors.], [Educational reach and reported adoption, without asking
    for vehicle locations],
    [Elevated short-term household risk], [Offer voluntary off-site
    storage referral and individualized safety planning; emergency
    action belongs with qualified professionals and lawful
    authorities.], [Number of referral resources validated; aggregated
    service availability],
  )]
  , kind: table
  )

#strong[Implementation rule:] a cable or trigger lock is an available
option, but device suitability and theft resistance differ. Avoid
presenting one device as adequate for every situation. The recommended
standard is secured, unloaded firearms and separately secured
ammunition. The program must never imply that concealing a firearm is
equivalent to locking it. \[CDC; WA DOH\]

=== ASCS-00.2 / Voluntary community partnership architecture
<ascs-00.2-voluntary-community-partnership-architecture>
#figure(
  align(center)[#table(
    columns: (33.33%, 33.33%, 33.33%),
    align: (auto,auto,auto,),
    table.header([Partner], [Appropriate, bounded
      contribution], [Safeguard],),
    table.hline(),
    [Firearm retailers, ranges and owner organizations], [Practical
    storage demonstrations; discounts or vouchers; peer education
    tailored to common storage challenges], [No access to student data;
    no marketing lists or ownership disclosures],
    [County and municipal law enforcement], [Safety education, voluntary
    lock events, accurate legal referrals and response to specific
    credible danger], [Education is separate from investigations;
    information shared only on a lawful need-to-know basis],
    [Pediatricians, healthcare and public health], [Confidential,
    nonjudgmental storage counseling and crisis-risk
    referrals], [Clinical information remains under applicable privacy
    rules and professional judgment],
    [Schools, PTAs and family liaisons], [Universal caregiver messages,
    translation, accessibility, resource distribution and optional
    events], [No school-owned firearms register, household searches or
    mandatory ownership questionnaire],
    [Manufacturers, donors and foundations], [Subsidized devices,
    delivery support and arm\'s-length program evaluation], [Disclose
    conflicts; ban donor use of participant information],
    [Qualified voluntary-storage providers], [Case-by-case off-site
    storage for a household choosing to reduce access
    temporarily], [Call ahead; verify current capacity, eligibility,
    return process, costs and transfer law],
  )]
  , kind: table
  )

#strong[Existing infrastructure:] Washington Commerce\'s secure-storage
program supports community education and device distribution, and the
University of Washington maintains a voluntary storage locator. A listed
provider is not a guaranteed reservation or endorsement. Contact
providers in advance; never bring firearms unannounced to a school or
law-enforcement facility.

=== ASCS-00.3 / Due process and credible-threat intervention
<ascs-00.3-due-process-and-credible-threat-intervention>
Provide an accessible reporting channel for observed threats and
possible access to weapons. Trained, multidisciplinary reviewers
distinguish #strong[immediate protection decisions] from
#strong[unverified allegations]. Document objective behavior,
corroboration, urgency, decisions, lawful authority, notification,
appeal and case closure. Anonymous or AI-generated allegations alone
must not create a finding of wrongdoing. When danger is imminent, call
emergency services and follow approved protective procedures. Any
firearm-related seizure, transfer or order requires applicable legal
process and qualified decision-makers.

#strong[Family engagement:] communicate safe-storage guidance to all
families, not only those suspected of owning firearms. Respect protected
rights and avoid coercive requests for ownership status. Information
shared through independent healthcare or retailer programs must not be
repurposed for student profiling.

=== ASCS-00.4 / Partnership governance and boundaries
<ascs-00.4-partnership-governance-and-boundaries>
- Use a signed memorandum of understanding identifying program goals,
  separate responsibilities, funding, insurance, procurement rules and
  program duration.
- Require data minimization, retention limits, no participant marketing,
  conflict-of-interest declarations, accessibility and translated
  materials.
- Public communications must distinguish binding law, professional
  guidance and optional, voluntary practices; partners must not claim
  official federal endorsement.
- Review devices for basic fitness, compatibility and usability; provide
  alternate devices for different family needs rather than a single
  branded solution.
- Develop referrals for lawful, voluntary temporary storage, explicitly
  confirming capacity and any return/transfer requirements before
  describing the service as available.

=== ASCS-00.5 / Ninety-day pilot and assurance
<ascs-00.5-ninety-day-pilot-and-assurance>
#figure(
  align(center)[#table(
    columns: (33.33%, 33.33%, 33.33%),
    align: (auto,auto,auto,),
    table.header([Period], [District/community action], [Acceptance
      evidence],),
    table.hline(),
    [Days 1--30], [Appoint prevention lead; confirm legal/privacy
    review; invite broad stakeholder advisory group; select optional
    partners; establish anonymous baseline survey.], [Signed charter,
    legal review, publication-safe stakeholder list and pilot plan],
    [Days 31--60], [Launch universal family guidance, multilingual
    materials, optional lock or voucher access, and a vetted
    voluntary-storage referral directory.], [Materials tested for
    comprehension; partners trained; devices or vouchers available],
    [Days 61--90], [Measure delivery, training completion, uptake,
    knowledge and privacy incidents. Independently review program
    operations and publish aggregate lessons.], [De-identified
    dashboard, corrective-action log and approve/modify/stop decision],
  )]
  , kind: table
  )

#strong[Sample measures:] number of schools participating; resource
access by neighborhood; caregivers reached; device uptake (not device
installations presumed); response time to reported imminent concerns;
de-identified pre/post adoption rates; partner compliance; complaint and
privacy incident rates. Do not use school-shooting incidence as a 90-day
success metric or claim that distribution proves correct installation.

#text-block[
#strong[Washington legal distinction.] RCW 9.41.360 specifies potential
criminal liability for certain unsafe-storage outcomes, with exceptions,
and expressly states that it does not mandate how or where a firearm
must be stored. Washington Commerce identifies dealer secure-storage
device offers and voluntary storage mechanisms under separate
provisions. This advisory recommends prudent practices beyond minimum
statutory requirements; district counsel should confirm current law and
facts before advising on possession, transfers or court orders.
]
=== ASCS-00.6 / Sources and implementation references
<ascs-00.6-sources-and-implementation-references>
+ #link("https://app.leg.wa.gov/rcw/default.aspx?cite=9.41.360")[Washington Legislature: RCW 9.41.360, Unsafe storage of a firearm].
+ #link("https://www.commerce.wa.gov/community-safety/safe-storage/")[Washington Department of Commerce: Safe Storage Program].
+ #link("https://doh.wa.gov/community-and-environment/schools/safety-study-hall/secure-storage-firearms-and-ammunition")[Washington Department of Health: Secure storage of firearms and ammunition].
+ #link("https://www.cdc.gov/firearm-violence/prevention/index.html")[CDC: Preventing firearm injury and death].
+ #link("https://cfip.uw.edu/washington-state-safe-storage-map/")[University of Washington: Washington State Safe Storage Map].
+ #link("https://www.atg.wa.gov/firearms")[Washington Attorney General: Firearms safety and legal options].

#text-block[
PUBLIC POLICY RECOMMENDATION · Public resource only. No individual
school has been assessed or certified under ASCS-00. Courtesy of
NERVOSYS, LLC.
]
#pagebreak(weak: true)
#metadata(none)#label("ascs-00-extended")
#text-block[
VERSION 17.0 REVISION 1 / ASCS-00 / RIGHTS-PRESERVING PREVENTION

]
== ASCS-00A --- Prevent youth firearm access while respecting lawful ownership
<ascs-00a-prevent-youth-firearm-access-while-respecting-lawful-ownership>
#strong[Safety objective:] Prevent unsupervised access by minors and
other unauthorized people without compiling an ownership registry,
impeding lawful acquisition or possession, or requiring disclosure of
household firearm ownership to a school. This is a voluntary prevention
proposal; distinguish recommendations from laws.

=== Four practical access-control safeguards
<four-practical-access-control-safeguards>
+ #strong[Physical control:] Encourage a quality secured safe or lockbox
  that fits the household, secured unloaded storage when not in use, and
  separately secured ammunition. A concealment location alone is not a
  safeguard. Where a household needs emergency access, require an
  individually assessed and independently tested solution that still
  prevents youth access---do not promise that a specific product is
  childproof.
+ #strong[Credential discipline:] Keep combinations, backup keys,
  biometrics enrollment permissions and phone-based unlocking away from
  minors; audit access after a lost key, changed household access, or
  other material change.
+ #strong[Vehicle and secondary residences:] Discourage leaving firearms
  unattended in vehicles or unsecured in homes visited by children; use
  lawful secure containment when temporary vehicle storage is
  unavoidable.
+ #strong[Temporary separation during a crisis:] Offer an opt-in
  referral to qualified off-site storage providers or other lawful
  means-restriction options, with informed consent and verified
  transfer/return rules. Schools must not receive, transport or store
  firearms.

=== Voluntary implementation---no ownership registry
<voluntary-implementationno-ownership-registry>
Recruit firearm retailers, ranges, owner organizations, safe
manufacturers, pediatric providers, public-health offices, parent groups
and law enforcement to provide universal safety education, equipment
discounts and anonymous vouchers. Ensure that participation is offered
to everyone; no purchase or redemption data identifying household
ownership is transmitted to school administrators. Marketing use or sale
of program data is prohibited by charter.

#strong[Preserve rights and trust:] Support lawful firearm ownership and
supervision; document statutory limits separately; avoid broad searches,
compelled household inventories, profiling or punitive action based
solely on ownership. Respond to a specific credible danger through
individualized human threat assessment, lawful procedures and
appropriate review. Privacy restrictions do not prevent immediate
emergency reporting required by law.

=== Performance criteria
<performance-criteria>
- Availability and cost of independently evaluated storage options and
  accessible lock programs.
- Optional anonymous pre/post knowledge and secure-storage adoption
  surveys; report ranges and uncertainty, not invented ownership counts.
- No student-identifiable firearm-inventory database; zero unauthorized
  vendor disclosures.
- Documented lawful procedures for responding to credible access
  threats, including privacy and due process.

#text-block[
Basis: CDC firearm injury prevention and secure-storage guidance;
Washington RCW 9.41.360. The statute expressly states that it does not
mandate how or where firearms are stored. Household guidance here is
voluntary and is not a determination of individual legal duties.

]
#pagebreak(weak: true)
#metadata(none)#label("ascs-01-prearrival")
#text-block[
VERSION 17.0 REVISION 1 / ASCS-01 TO ASCS-04 / FIRST-MINUTES ASSURANCE

]
== ASCS-01 to 04 --- Detect, protect, and respond before police arrive
<ascs-01-to-04-detect-protect-and-respond-before-police-arrive>
#strong[Operating assumption:] An emergency can unfold before outside
police arrive. Organize protective capabilities as interconnected,
tested safeguards. Do not treat an alarm, locked door, canine team, or
armed staff presence as proof of safety. Document a human decision
authority and a fallback when systems fail.

=== ASCS-01 / Multi-path threat detection and prompt alerting
<ascs-01-multi-path-threat-detection-and-prompt-alerting>
- Primary signals: trusted human reporting, panic buttons, staffed
  cameras, access-control events and emergency calls. Compare optional
  acoustic gunshot detection, metal or weapons screening, and other
  analytic sensors using blinded tests and local conditions.
- Document detection rates, nuisance alarms, latency to human
  verification, alert delivery, inaccessible zones, equipment faults and
  vendor limitations. Do not claim cameras or AI can infer intent
  reliably from appearance or demographic characteristics.
- Provide accessible, redundant schoolwide alerts and a direct verified
  route to emergency dispatch; design for loss of mains power, IP
  network or a single service provider.
- Require review of false positives and false negatives, privacy impact,
  retention periods, and human override; never let software
  automatically trigger physical force.

=== ASCS-02 / Barriers and protected sheltering---not a dangerous lock-in
<ascs-02-barriers-and-protected-shelteringnot-a-dangerous-lock-in>
- Use supervised visitor entry, maintained perimeter doors, classroom
  locksets operable from inside, clear emergency signage, and rapid
  staff-initiated protective actions appropriate to the situation.
- #strong[No entrapment:] Emergency egress must remain code-compliant
  and accessible; no improvised door barricades, chains or automated
  mass locking that prevents safe evacuation or traps people during
  fire, smoke or medical emergencies.
- Choose code-approved hardware with accessibility and fire-marshal
  input, outside emergency override for responders, power-failure
  behavior defined in writing and authorized manual fallback.
- Validate through accessibility walkthroughs, evacuation drills,
  fire-code sign-off, medical-response drills and realistic but
  trauma-informed exercises. Keep campus-specific configurations
  restricted.

=== ASCS-03 / Canine detection as an optional, specialized layer
<ascs-03-canine-detection-as-an-optional-specialized-layer>
- Consider properly trained, insured and qualified detection dogs with
  professional handlers for bounded, lawful screening or area searches
  when local evidence supports value. Weapon scent detection is not
  equivalent to continuous detection of a shooter.
- Obtain written scope, animal welfare plan, training/re-certification
  records, false-alert review, student contact rules, disability/allergy
  accommodations, supervision and bite-injury risk controls.
- Never use uncontrolled dogs, student-directed attack-dog deployments,
  or coercive canine sweeps as a substitute for an individualized legal
  basis or sound prevention program.
- Compare with noncanine alternatives on cost, detection performance,
  staffing burdens, false positives and unintended effects. If local
  evidence is insufficient, remain in pilot/evaluation status.

=== ASCS-04 / Qualified human intervention and lawful force
<ascs-04-qualified-human-intervention-and-lawful-force>
- Separate ordinary staff protective duties from professional security
  and law-enforcement intervention. Staff should be empowered to alert,
  protect, evacuate or shelter and render lifesaving aid---not required
  to confront an attacker.
- If a district evaluates armed on-site responders, require a specific
  legal authorization, board review, law-enforcement coordination,
  screened personnel, relevant professional training, maintained
  competencies and an explicit accountable command structure.
- Require written de-escalation and force policies; medical support;
  identity and interoperability protocols; secure custody of issued
  weapons; independent incident review and student-rights safeguards. No
  school-operated autonomous weapon system or force decisions based
  solely on algorithmic output.
- Evaluate unintended consequences including mistaken identity,
  bystander risk, discriminatory enforcement, weapon diversion, and
  emergency-responder confusion. A policy or staffing level alone is not
  evidence of effectiveness.

=== Accompanying safeguards and acceptance gates
<accompanying-safeguards-and-acceptance-gates>
Every subsystem must pass #strong[legal/code approval → tabletop →
controlled functional testing → realistic multi-hazard drill →
independent verification] before designation as operational. Publish
only aggregate performance; keep live camera views, access bypass
routes, responder positioning and campus-sensitive vulnerability details
in restricted professional records.

#text-block[
Use the current annotated bibliography and public source register.
Independently verify material interpretations before institutional use.
Operational tactics and campus configurations are excluded from public
release.

]
== 3. Prevention: behavioral assessment, reporting and online harm
<3-prevention-behavioral-assessment-reporting-and-online-harm>
#text-block[
#strong[ASCS-00 upstream prevention:] Begin with reducing youth access
to unsecured firearms through safe-storage guidance, caregiver
engagement and voluntary community partnerships. The detailed program
appears in Section 0; do not infer household firearm ownership from
participation or non-participation.

]
=== Behavioral threat assessment and management (BTAM)
<behavioral-threat-assessment-and-management-btam>
Follow NTAC's operational model: identify specific concerning conduct,
gather lawful contextual information, assess the circumstances and
available protective factors, and manage risk through an
interdisciplinary team and supports. There is #strong[no useful
demographic or ideological profile] of a school attacker. Threat inquiry
must focus on conduct, capability, context, expressed intent and
credible corroboration---not race, religion, political affiliation,
disability, lawful protest or merely unpopular views. \[F02--F04\]
\[W04\]

#strong[Online behavior.] Evaluate voluntary reports, publicly available
evidence, school-system logs lawfully within district authority, and
materials properly supplied by students/families. Require purpose
limitation, appropriate consent/search standards, provenance, retention
controls, second-review for adverse conclusions and human verification.
Do not assume a student\'s following, group membership, slang, game
activity or political expression establishes a threat. Off-campus speech
can have First Amendment protection. \[L01\] \[L03\] \[F17\] \[W04\]

#strong[Student safeguarding.] For sexual extortion, violent-network
grooming, coercion to commit harm, AI-generated intimate-image
harassment and trafficking, prioritize immediate welfare, professional
counseling, safe parent/guardian contact where appropriate, specialist
referrals and lawful evidence preservation. Avoid recirculating sexual
imagery or making a student repeatedly recount traumatic events. For
covered-platform nonconsensual intimate-image removal, use the
applicable Take It Down Act process; schools should not make independent
claims about the perpetrator without review. \[F12--F14\] \[L04\]

=== Disclosure and evidence custody controls
<disclosure-and-evidence-custody-controls>
#strong[LAW:] when relying on FERPA\'s health-or-safety emergency
exception, officials must identify an articulable and significant
threat, limit release to recipients who need the information for
protection, and document both the threat supporting disclosure and
recipients in the student\'s records. The exception is #strong[not] a
general means of sharing student records for hypothetical exercises.
\[F25\] \[F26\] \[F22\]

#strong[PROPOSAL:] log who obtained or reviewed digital evidence, when,
for what specific purpose, and whether the material was original,
altered, inferred, or merely alleged. Separate child-victim support
files from disciplinary cases; require secondary review before
irreversible adverse action. Where legal retention rules allow, delete
or restrict irrelevant materials and record the appeal/correction
outcome.

=== Adversarial integrity checks for reports, images and online allegations
<adversarial-integrity-checks-for-reports-images-and-online-allegations>
Threat reporting is a safety input, not an automatic disciplinary
verdict. Train reviewers to distinguish an original observation from a
screenshot, repost, anonymous tip, AI-generated media or copied
allegation. Document chain of custody and an alternative explanation
before reaching adverse findings. #strong[Independent confirmation of a
serious hazard may justify protective action; legal and school
procedural rules govern subsequent searches, disclosures, discipline or
referral.] Apply the same protocol regardless of the political position
of the reporter or accused person. \[F05\] \[F06\] \[F26\] \[W04\]

Every case should have two separate statuses: #strong[protection
urgency] (immediate / elevated / routine) and #strong[allegation status]
(unverified / corroborated / disproven / unresolved). Permit
confidential, accessible reporting while investigating objective signs
of impersonation, collusion or malicious fabrication; do not label a
good-faith reporter dishonest solely because allegations are
unsubstantiated.

=== Reporting pathways resilient to abuse
<reporting-pathways-resilient-to-abuse>
Maintain accessible confidential and attributable channels; allow
reasonable anonymous reporting with clear triage and two-person review
of high-impact decisions. Jointly design swatting verification with PSAP
and police: #strong[protect promptly, verify in parallel], keep original
message/media, limit public amplification, and record why each action
was taken. Provide an independent avenue for someone falsely accused to
contest facts, request correction and challenge unnecessary disclosure.
\[F05\] \[F06\] \[F11\] \[W05\]

#pagebreak(weak: true)
== 4. Physical protection, entry screening and technology
<4-physical-protection-entry-screening-and-technology>
=== Architectural and operating controls
<architectural-and-operating-controls>
Apply CISA's #strong[layered, site-specific] model: school grounds and
arrival zones; supervised entrances; visitor screening and badge
integrity; secured yet readily evacuable interior doors; protected
communication; accessible circulation; and after-hours/sports/bus
exceptions. A locked door alone does not prove intrusion resilience.
Every proposed barrier must be reviewed with local fire/building
officials for egress, life safety and accessible accommodation. \[F01\]
\[W01\]

#strong[Entry screening.] Select measures based on credible facility
threats, throughput, accessibility and staffing. Screen visitors using
independent identity/authorization checks, custody restrictions, bag or
object checks only where legally permitted and documented, and
specialist handling of suspicious items. Metal or AI-assisted weapons
screening requires measured sensitivity, specificity, staffing burden,
queue consequences and rights review. Avoid unnecessary blanket
screening or discriminatory selection practices. \[F01\] \[F17\]

=== Functional design reviews, not gadget-first upgrades
<functional-design-reviews-not-gadget-first-upgrades>
For each campus entrance, assembly area, portable building, cafeteria,
bus loading point and extracurricular location, record the
#strong[actual protective action and communication path] during
realistic operating hours. Test whether screening creates queues that
increase exposure, whether automatically locked doors remain safe for
fire egress, and whether alternative entrance procedures quietly bypass
the intended control. Include students and staff who use mobility,
hearing, vision or language accommodations. \[F01\] \[F07\] \[W01\]

=== AI-assisted cameras and detection systems
<ai-assisted-cameras-and-detection-systems>
#strong[Purpose:] provide a human-reviewable observation cue for
potentially dangerous objects, intrusion into restricted areas or
observable emergencies---not automated suspicion scores or disciplinary
rulings. In procurement pilots, measure missed detections, false-alarm
rates in ordinary student conditions, latency to verified human
acknowledgment, demographic/lighting/weather effects, system uptime,
cyber and vendor controls, video retention and auditability. Never
trigger use of force solely from a model output. The NIST AI RMF is a
voluntary governance framework, not proof that a product works. \[F17\]
\[F16\]

#strong[Cyber-physical controls.] Adopt phishing-resistant MFA where
available, patch and vulnerability management, segmented critical
alerts/cameras/access control, tested offline backups and authenticated
multi-channel school-to-PSAP messages. Exercise a compromised alert
console and a simultaneous genuine event using only a test environment;
do not send mock incidents to public emergency channels. \[F15\] \[F16\]

=== Capability trial protocol: AI alerts, weapons screening, and analytic sensors
<capability-trial-protocol-ai-alerts-weapons-screening-and-analytic-sensors>
Before purchasing, run a #strong[school-specific, pre-registered
evaluation] under authorized controlled conditions; require vendor and
district evaluators to agree on what constitutes a positive event before
reviewing results. Capture #strong[verified detections, missed events,
false alerts, alerts requiring human review, end-to-end notification
latency, queue delay, outages, and accessibility impacts], alongside
privacy complaints and workload. Report confidence limitations and the
operating conditions actually tested; vendor demonstrations and
laboratory benchmarks are insufficient evidence of campus effectiveness.
\[F17\] \[F27\]

Provide #strong[human confirmation and two independent notification
channels] for safety-critical alerts. Define safe fallback if power,
networking, camera views, or the AI model fails; prohibit automatic
discipline, stop-and-search or force solely from an AI output.
Purchasing approval must include cybersecurity patching, data retention,
incident logs, export capability, independent audit rights, total
ownership costs and cancellation criteria. \[F16\] \[F17\] \[F27\]

=== Field trials: preregistered evidence and safe acceptance criteria
<field-trials-preregistered-evidence-and-safe-acceptance-criteria>
#strong[PROPOSAL, informed by CISA SSAT, NIST AI RMF and FEMA HSEEP.]
Before a test, freeze its purpose, operating limits, positive and
negative scenario definitions, baseline condition, population/zone
sample, accessibility accommodations, data-retention rules, evaluator
independence and #strong[safety abort conditions]. Use #emph[inert or
simulated] observations, not functional weapons, live emergency dispatch
messages, adversarial intrusion or unsafe equipment interference. Obtain
formal permission from district and responder partners. \[F24\] \[F27\]
\[F29--F30\]

For an #strong[automated alert or screening pilot], calculate (within
the approved sample) #strong[sensitivity = true alerts / (true alerts +
missed events)], #strong[false-positive rate = false alerts / (false
alerts + true negatives)], and end-to-end timing to #strong[human
acknowledgment and safe occupant notification]. Disclose all
denominators, confidence limitations, excluded cases, outages, labor
costs and corrective actions. If a denominator is zero or the sample was
designed only to demonstrate success, write #strong[NOT
ESTIMABLE]---never report 100% accuracy. Test fallback instructions with
the analytic component disabled. Misclassification cannot automatically
initiate a search, detention, disciplinary finding or force response.

For #strong[human personnel, equipment and working dogs], verify
credential/current authorization, training and medical readiness,
de-escalation and cooperation with arriving emergency responders. Record
child welfare, ADA, traumatic stress and mistaken-identification risks.
Do not conduct force-on-force or canine-apprehension training as school
drills. For #strong[counter-UxS], separately assess passive
observation/reporting and protected-occupant procedures; any active
aircraft/spectrum interdiction demands specific competent-agency
authority. \[W06--W11\] \[F18--F23\]

#strong[Acceptance record:] goal; applicable legal authority; safe
tested conditions; baseline; objective performance; sampled
locations/dayparts and accessibility needs; adverse effects; fallback;
ownership/cost; reviewer signature; action on failure;
#strong[expiry/retest trigger]. An advanced system should be rejected,
deferred or rolled back if evidence shows no meaningful incremental
protection, problematic false alerts, unacceptable rights impacts or
unmaintainable operation.

=== Counter-unmanned systems and security canines
<counter-unmanned-systems-and-security-canines>
Treat unexpected drones and ground robots first as #strong[observed
hazards, not established malicious actors]. Train staff to recognize
unsafe conditions, move vulnerable occupants to protection, preserve
safe observations and notify qualified responders. Procurement should
distinguish #strong[passive sensing] from #strong[active interdiction]
(jamming, takeover, kinetic defeat): the latter implicates federal
aviation/radio law and only specially authorized operators may act where
applicable. Qualified law enforcement must verify current federal
certifications, regulations and task-force arrangements; a district
itself has no general interdiction authority. \[F18--F20\]

Explosives-detection dogs can be evaluated as a specialized screening
capability with a certified handler and law-enforcement partner. Police
tactical K-9 functions are separate, with distinct force and injury
risk. Document bite prevention, handler suitability, accommodations for
service animals, veterinary welfare and independent performance reviews.
Do not conflate ordinary service animals with suspicious animals.
\[F21\] \[F23\]

#pagebreak(weak: true)
== 5. First minutes: protective action, responders and force limits
<5-first-minutes-protective-action-responders-and-force-limits>
=== Design requirement: no dependence on five-minute police arrival
<design-requirement-no-dependence-on-five-minute-police-arrival>
An outside police arrival time of five minutes is considered inadequate
#strong[as the sole planned means of immediate protection]. This is a
conservative district design assumption; actual dispatch, travel, access
and intervention times must be measured site by site. Specify separate
performance times for #strong[event recognition → school/PSAP
notification → occupant warning → appropriate protective action →
lifesaving care → responder arrival and control]. Measure high-occupancy
events, arrival/dismissal, remote buildings, buses, special-needs access
and power loss. \[F07\] \[F08\] \[W01\] \[W02\]

=== Prearrival timeline: what schools should actually measure
<prearrival-timeline-what-schools-should-actually-measure>
Use comparable time points during approved exercises and lawful incident
review: #strong[T0] initial credible cue; #strong[T1] authorized school
acknowledgment; #strong[T2] warning issued; #strong[T3] warning received
and understood; #strong[T4] appropriate protective action initiated;
#strong[T5] qualified aid available when safe; #strong[T6] PSAP
acknowledgment; #strong[T7] external responder arrival and command
integration. Record actual timestamps, uncertain starting cues, tested
locations, accessibility conditions, and elapsed intervals. Event
numbers do not prescribe the chronological order of every real incident.
\[F07\] \[W01\] \[W02\]

The working constraint is #strong[do not rely on police arrival within
five minutes]\; it is not a claim that exactly five minutes guarantees
harm or a legal performance standard. Validate response choices by
circumstance and avoid high-stress simulated attacks involving children.
Test concurrent hazards and communication failure in a
#strong[discussion or approved functional] setting.

=== First-minutes time and coverage protocol
<first-minutes-time-and-coverage-protocol>
#strong[PROPOSAL.] Time the full protective chain, not just the police
dispatch interval. The event log should distinguish #strong[T0]
(verified cue or initial credible report), #strong[T1] (authorized
school acknowledgment), #strong[T2] (warning issued), #strong[T3]
(warning received and understood by a sample of affected occupants),
#strong[T4] (appropriate protective action initiated), #strong[T5]
(qualified aid made available when safe), #strong[T6] (911/PSAP
acknowledgment), and #strong[T7] (external responder arrival and command
integration). Some events will have uncertain or different starting
cues; note that explicitly instead of back-solving a false precision.

Report observations #strong[by site, zone, daypart,
disability/accessibility condition, and failure scenario]. Provide
sample sizes, worst observed delays, distribution ranges, unknown or
missed recipients, and whether exercise actors followed safe,
non-tactical procedures. A five-minute planning assumption is a reason
to ensure immediate on-site capability; it is #strong[not] a legally
mandated response target or a scientifically validated universal
deadline.

#strong[Decision criteria:] establish safety-driven local targets with
fire/EMS, PSAPs and accessibility specialists #emph[before] tests; log
deviations and meaningful tradeoffs. Do not invent numeric detection
benchmarks where no normative or independently validated standard
exists. A vendor demo with selected actors is not representative
evidence of real campus performance. \[F07\] \[F29\] \[W01--W03\]

=== First-minutes functional sequence (role-based, not tactical)
<first-minutes-functional-sequence-role-based-not-tactical>
#figure(
  align(center)[#table(
    columns: (33.33%, 33.33%, 33.33%),
    align: (left,left,left,),
    table.header(table.cell(align: left)[Time
      phase], table.cell(align: left)[School and incident
      lead], table.cell(align: left)[Qualified responders / support],),
    table.hline(),
    table.cell(align: left)[Immediately after credible
    observation], table.cell(align: left)[Initiate locally appropriate
    warning and protective action; inform 911/PSAP of both facts and
    uncertainty; activate alternate channels if
    necessary], table.cell(align: left)[Dispatch verifies/coordinates;
    law enforcement, fire and EMS receive common situation updates],
    table.cell(align: left)[Before outside responders
    arrive], table.cell(align: left)[Account for occupants as feasible;
    protect against the relevant hazard; use trained
    bleeding-control/AED capability where conditions are safe; maintain
    controlled child release], table.cell(align: left)[Authorized
    on-campus personnel act within written law/policy; medical and
    communications teams support protection],
    table.cell(align: left)[When responders
    arrive], table.cell(align: left)[Establish clear leadership handoff;
    provide safe site information through agreed channels; avoid
    circulating unverifiable suspect
    descriptions], table.cell(align: left)[Incident command and
    specialized response under agency protocols; preserve
    medical/reunification continuity],
    table.cell(align: left)[Stabilization and
    recovery], table.cell(align: left)[Correct false reports; reunify
    families; document actions and assist victims; independent
    review], table.cell(align: left)[After-action improvement, legal
    review, medical support and service restoration],
  )]
  , kind: table
  )

=== Vetted protective personnel: less-lethal and lethal force
<vetted-protective-personnel-less-lethal-and-lethal-force>
Evaluate commissioned SROs, contracted authorized guards and other
specifically permitted security personnel #strong[as distinct legal
categories]. Any program needs written scope; stringent child-safety
suitability and background checks; recurring qualifications;
de-escalation; limited approved tools; safety storage; disability and
youth considerations; clear police identification/coordination;
immediate medical care; transparent incident logging; and independent
review. A weapons-possession exception is #strong[not] equivalent to
authority to use lethal force. \[F08\] \[W06--W11\]

A force policy must favor avoidance, de-escalation, protected withdrawal
and non-force remedies whenever feasible. Less-lethal tools can still
kill or cause grave injury. Peace officers are governed by RCW
10.120.020; noncommissioned personnel do #strong[not] automatically
inherit police powers and require a separately documented legal basis.
Deadly force is an exceptional response to qualifying imminent threats,
governed by applicable law; an AI classification or unverified tip alone
must never authorize it. No operational tactics or weapon selection are
prescribed here. \[W09--W11\]

=== Conditional advanced-capability approval
<conditional-advanced-capability-approval>
For #strong[armed security and less-lethal equipment], require a
documented legal-role matrix for commissioned officers versus other
permitted personnel, recurrent qualification, explicit limits on
civilian security authority, safe storage and access, rescue-medical
integration, incident logging, and independent review. Capture potential
harms (misidentification, unintended injury, discipline creep,
discrimination) as safety outcomes, not merely legal footnotes. Do not
assume a security presence is effective without campus-specific coverage
and coordination evidence. \[F08\] \[W06--W11\]

For #strong[drone/rover detection and professional canine programs],
start with location-specific hazards, qualified operator scope,
false-alarm impact, privacy and disability accommodations, and
documented coordination with legally empowered agencies. An observation
system must not be equated with lawful permission to jam, seize, deploy
force or conduct a search. \[F01\] \[F17\]

=== Traumatic-injury response
<traumatic-injury-response>
#strong[Immediate statutory check:] RCW 28A.210.440 requires each
Washington campus to provide accessible bleeding-control supplies with
mandated contents; at least two trained employees per school, with
increased coverage for schools over 1,000 students; annual and post-use
inventory/replacement. Integrate with first-aid and AED policies, EMS
staging and student accessibility; do not substitute a purchased kit for
trained and demonstrated readiness. \[W03\]

#pagebreak(weak: true)
== 6. Incident-specific protective decision guides
<6-incident-specific-protective-decision-guides>
#figure(
  align(center)[#table(
    columns: (33.33%, 33.33%, 33.33%),
    align: (left,left,left,),
    table.header(table.cell(align: left)[Threat /
      incident], table.cell(align: left)[First protective
      objective], table.cell(align: left)[Follow-through and
      safeguards],),
    table.hline(),
    table.cell(align: left)[Armed/edged assault; violent
    intruder], table.cell(align: left)[Rapid warning;
    location-appropriate separation, lockdown or evacuation; EMS
    request], table.cell(align: left)[Lawful responder-led resolution;
    trauma care and accountability; factual communication without
    unsupported identification],
    table.cell(align: left)[Explosives / suspicious objects / hazardous
    release], table.cell(align: left)[Avoid contact and secondary
    exposure; specialist consultation; shelter/evacuate appropriate to
    hazard], table.cell(align: left)[No untrained searches or device
    handling; coordinate fire/hazmat/bomb specialists; preserve
    evidence],
    table.cell(align: left)[False threat / swatting / impersonated
    alert], table.cell(align: left)[Protective action without waiting
    for perfect authentication; confirm independently through
    PSAP], table.cell(align: left)[Keep an auditable correction trail;
    prevent malicious use of school discipline; manage rumor
    propagation],
    table.cell(align: left)[Abduction, custody interference or missing
    child], table.cell(align: left)[Verify child location immediately;
    control student release; call law enforcement when
    indicated], table.cell(align: left)[Check orders/records lawfully,
    preserve privacy, avoid reliance on synthetic ransom media],
    table.cell(align: left)[Cyber compromise or communications
    outage], table.cell(align: left)[Switch to an independent alert path
    and manual protective procedures], table.cell(align: left)[Recover
    through tested backups; verify commands before announcements; avoid
    exposing student records],
    table.cell(align: left)[Coercion, trafficking, state-sponsored
    intimidation, extortion], table.cell(align: left)[Safeguard the
    affected student/family, avoid confrontation and
    retaliation], table.cell(align: left)[Appropriate specialists,
    evidence preservation, confidential referral; no inference from
    ethnicity or political belief],
    table.cell(align: left)[Drone, rover, canine or compound
    threat], table.cell(align: left)[Move occupants away from observed
    hazard; initiate coordinated incident
    assessment], table.cell(align: left)[Qualified specialized response;
    do not improvise active interdiction or canine force; re-evaluate
    when facts change],
    table.cell(align: left)[Earthquake, wildfire smoke, severe weather,
    utility failure], table.cell(align: left)[Execute hazard-specific
    shelter/evacuation and continuity
    procedures], table.cell(align: left)[Accessibility, transportation,
    family communication and prolonged service recovery],
  )]
  , kind: table
  )

These summaries are #emph[decision frameworks]. Final site-specific
instructions and authority assignments belong in approved building EOPs
and law-enforcement protocols. \[F01\] \[F07\] \[F10\] \[W01\]

#pagebreak(weak: true)
== 7. Constitutional and civil-liberties constraints that improve safety
<7-constitutional-and-civil-liberties-constraints-that-improve-safety>
#strong[G0 cross-reference:] Apply the integrated rights gate to legal
compliance, intake, detection, disciplinary, canine,
professional-response, and privacy decisions. See #emph[Constitutional
Governance and Public Trust]. Institution-specific law-enforcement
agreements require separate review and adoption; no signed MOU addendum
is supplied by this public reference.

The #strong[U.S. Constitution is the supreme law of the land]\;
Washington law cannot override it. State law and district policy may
provide additional lawful protections. The First Amendment protects
lawful speech and association, including important off-campus student
expression. The Fourth Amendment and relevant student-search doctrine
constrain invasive searches. The Fourteenth Amendment requires due
process and equal treatment. FERPA limits education-record disclosure.
\[L01--L03\] \[L02\] \[W15\]

#strong[No accusation is a finding.] In criminal cases, the legal
presumption of innocence places the burden on prosecution to prove guilt
beyond reasonable doubt. School protective/disciplinary decisions have
separate standards and legally required process. Proposed district
protections should nevertheless require corroboration, documented
decision grounds, notice and opportunity to respond, fair appeals,
proportionality, correction and a path to restore wrongly impaired
reputation. Washington expressly prohibits exclusion solely for a
threat-assessment referral. \[W04\] \[W12--W14\]

#strong[No viewpoint surveillance.] Neither political identity nor
lawful religious, civic or ideological association constitutes evidence
of dangerousness. Case reviews must separate genuinely threatening
conduct from protected speech; AI, digital searches and reporting logs
must be purpose-limited, independently reviewed, access-controlled and
deleted when no longer justified. \[F02\] \[F17\] \[L03\]

#strong[Safety staff accountability.] Written law-enforcement/security
agreements, discipline-role boundaries, complaints and reporting of
force/security incidents must follow Washington requirements. Officer
identification and response coordination are essential to prevent
misidentification during an emergency. \[W06--W08\]

#pagebreak(weak: true)
== 8. Implementation, assurance and governance
<8-implementation-assurance-and-governance>
=== Campus leadership: authority to improve beyond minimum compliance
<campus-leadership-ownership-beyond-minimum-compliance>
#strong[Required district leadership expectation (proposed policy):] the
superintendent and board should empower principals to identify
campus-specific exposure, challenge inherited assumptions, develop and
test creative protective solutions, and drive continuous improvement.
Administrators should not confuse successful completion of legal forms
with effective prevention, protection and response. Establish written
delegations, discretionary pilot budgets, direct escalation to district
leadership, legal/technical review support, and a protected route for
reporting failures without retaliation.

#strong[Performance contract:] assign each campus an accountable safety
lead; require a short risk-and-opportunity register identifying (a) the
uncovered hazard, (b) the proposed change, (c) the expected measurable
benefit, (d) legal and safety constraints, (e) pilot owner and approver,
(f) observed evidence and adverse effects, and (g) a decision to adopt,
revise or retire. Publish only non-sensitive outcomes. District
leadership owns resourcing and approvals; principals should not be held
responsible for changes they lack authority or funds to deliver.

#strong[Innovation safeguard:] prioritize simple, reversible and
accessible improvements before invasive or hazardous systems. Qualified
personnel and counsel must approve activities involving searches,
student data, force, restricted tools, external responders or live
exercises. Keep independent verification and corrective action central.
This authority framework is a district proposal, not a new requirement
imposed by CISA or Washington law. \[F01\] \[F02\] \[W01\]

=== Countermeasure decision ledger --- required before award
<countermeasure-decision-ledger--required-before-award>
#figure(
  align(center)[#table(
    columns: (25%, 25%, 25%, 25%),
    align: (left,left,left,left,),
    table.header(table.cell(align: left)[Capability], table.cell(align: left)[Legal/technical
      gate], table.cell(align: left)[Safety benefit to
      demonstrate], table.cell(align: left)[Principal failure or harm to
      measure],),
    table.hline(),
    table.cell(align: left)[Building access and visitor
    controls], table.cell(align: left)[Fire, ADA and lawful entry
    policies], table.cell(align: left)[Fewer unauthorized entries
    without lost egress], table.cell(align: left)[Lockouts, delay,
    unsupervised alternative entrances],
    table.cell(align: left)[Weapon/entry
    screening], table.cell(align: left)[Search rules and
    consent/policy], table.cell(align: left)[Reliable hazard detection
    and acceptable throughput], table.cell(align: left)[False
    accusations, queues, disparate burden],
    table.cell(align: left)[AI camera
    analytics], table.cell(align: left)[Privacy, information security,
    independent testing], table.cell(align: left)[Improved verified
    hazard-to-alert interval], table.cell(align: left)[Missed
    detections, false positives, retention abuse],
    table.cell(align: left)[School-security and armed
    staffing], table.cell(align: left)[State law, agency agreement,
    qualifications], table.cell(align: left)[Coverage and appropriate
    protective coordination], table.cell(align: left)[Misidentification,
    inadvertent injury, escalated discipline],
    table.cell(align: left)[Less-lethal
    equipment], table.cell(align: left)[Approved lawful policy and
    recurrent training], table.cell(align: left)[Safe, proportionate
    response options], table.cell(align: left)[Severe injuries and
    unjustified deployments],
    table.cell(align: left)[Explosives-detection
    canines], table.cell(align: left)[Handler accreditation and
    animal/ADA safeguards], table.cell(align: left)[Defined detection
    mission under realistic conditions], table.cell(align: left)[False
    alerts, bites, student distress],
    table.cell(align: left)[UAS detection and specialist
    referral], table.cell(align: left)[FAA/FCC/DOJ limits and
    counterpart agency authority], table.cell(align: left)[Verified
    situational awareness], table.cell(align: left)[False attribution;
    unlawful interdiction; privacy harm],
    table.cell(align: left)[Cyber/alert
    resilience], table.cell(align: left)[CISA security hygiene and PSAP
    coordination], table.cell(align: left)[Alert availability during
    actual service loss], table.cell(align: left)[Spoofing,
    single-vendor failure, missed backup alerts],
  )]
  , kind: table
  )

#strong[Procurement status:] \'pilot pending\' until written legal
authority, operator, funding, test plan, stop/rollback rule and harm
controls are documented; \'field validated\' only after witnessed tests.
No line above claims that the technology has already reduced school
violence. \[F01\] \[F08\] \[F17\] \[F27\] \[W06--W10\]

=== One 12-month delivery plan
<one-12-month-delivery-plan>
#figure(
  align(center)[#table(
    columns: (33.33%, 33.33%, 33.33%),
    align: (left,left,left,),
    table.header(table.cell(align: left)[Window], table.cell(align: left)[Primary
      owner], table.cell(align: left)[Deliverables and acceptance
      evidence],),
    table.hline(),
    table.cell(align: left)[Days
    0--30], table.cell(align: left)[Superintendent / safety director /
    principals], table.cell(align: left)[Assign campus leads; verify
    bleeding kits/staff counts, egress, alert coverage, PSAP contacts,
    substitute instructions, custodial release controls; list P0
    failures],
    table.cell(align: left)[Days 31--90], table.cell(align: left)[School
    leadership + police/fire/EMS + IT], table.cell(align: left)[Update
    hazard annexes; tabletop and functional tests; record timed
    warning/first-aid/communications results; resolve urgent risks with
    independently checked evidence],
    table.cell(align: left)[Months
    4--6], table.cell(align: left)[Procurement + legal +
    security], table.cell(align: left)[Only after gap analysis: pilot
    screening, AI detection, trained personnel or canine services with
    objective accuracy, legal and financial gates],
    table.cell(align: left)[Months 7--12], table.cell(align: left)[Board
    oversight / external evaluators], table.cell(align: left)[Refresh
    EOP; scenario exercises for cyber/physical coupling, swatting and
    abduction; audit false-positive harm; adopt correction schedule and
    procurement stop/go decisions],
  )]
  , kind: table
  )

=== First 90 days: milestone acceptance, not a paper exercise
<first-90-days-milestone-acceptance-not-a-paper-exercise>
#figure(
  align(center)[#table(
    columns: (33.33%, 33.33%, 33.33%),
    align: (left,left,left,),
    table.header(table.cell(align: left)[Checkpoint], table.cell(align: left)[Deliverable], table.cell(align: left)[Objective
      completion condition],),
    table.hline(),
    table.cell(align: left)[#strong[Day
    15]], table.cell(align: left)[Named school and district owners;
    legal compliance exception log], table.cell(align: left)[All P0
    controls have owners; absent records expressly labeled unassessed],
    table.cell(align: left)[#strong[Day
    30]], table.cell(align: left)[Physical campus inspection and
    bleeding-control / emergency-alert
    inventory], table.cell(align: left)[Each campus has signed
    inspection evidence and critical-gap list],
    table.cell(align: left)[#strong[Day
    60]], table.cell(align: left)[Approved tabletop and functional
    scenarios with PSAP and student
    services], table.cell(align: left)[Synthetic-case exercises produce
    timed observations, failure logs and alternate-channel results],
    table.cell(align: left)[#strong[Day
    90]], table.cell(align: left)[Independent reassessment and
    corrective action plan], table.cell(align: left)[Every critical
    failure is corrected or has documented interim protection,
    accountable owner and due date],
  )]
  , kind: table
  )

#strong[PROPOSAL, not statutory deadlines.] These are district
management milestones. State and federal legal deadlines remain whatever
the relevant provisions actually require. A tabletop exercise does not
establish real-world effectiveness; physical tests must be safe and
specifically authorized.

=== Measurement and independent review
<measurement-and-independent-review>
Record: #strong[alert latency, backup alert coverage,
occupant-protection initiation, responder coordination time,
trained-staff availability, kit validity, successful reunification
accountability, false/duplicated reports, AI-alert precision and
missed-event tests, privacy complaints, force incidents, and time to
close corrective actions]. Record #strong[not assessed] for absent
evidence; never equate an equipment purchase, approved policy or
simulated discussion with operational validation. \[F01\] \[F07\]
\[F17\] \[W08\]

=== Evidence tiers and independent sign-off
<evidence-tiers-and-independent-sign-off>
- #strong[Unassessed:] No reliable local evidence, or a vendor assertion
  only. Planning and controlled evaluation only.
- #strong[Documented:] Policy, inventory, ownership, or training records
  exist. Documented arrangements; protective function is not yet
  demonstrated.
- #strong[Inspected:] A qualified inspection checks condition and scope.
  Observed condition within the inspection boundary.
- #strong[Exercised within stated conditions:] An authorized controlled
  test records outcomes, misses, and adverse effects. Performance only
  under the declared test conditions.
- #strong[Independently verified within stated scope:] Independent
  reviewers corroborate repeatable tests or suitable operational
  records. Accepted evidence for the named scope, with limits and
  revalidation triggers.

Require independent evaluator signature, test date and scope,
deficiencies, any incident/civil-rights impact, and next revalidation
date. Missing data means #strong[UNASSESSED]. Escalate failure of
life-safety controls to district leadership promptly; never use a
composite score to mask a failed critical control.

=== Continuous-improvement cycle: exercises, corrective actions and publication
<continuous-improvement-cycle-exercises-corrective-actions-and-publication>
Adapt FEMA\'s #strong[Homeland Security Exercise and Evaluation Program
(HSEEP)] as a method, not as a claim of federal certification: select
objectives against actual campus vulnerabilities; use controlled
tabletop, functional and appropriately authorized full-scale exercises;
have evaluators record observable results; produce an
#strong[After-Action Report/Improvement Plan (AAR/IP)]\; then retest the
specific failure. Washington encourages multiple exercise types across a
four-year period, but that encouragement must not be mistaken for a
blanket statutory mandate to run every exercise in a given semester.
\[F29\] \[W01\]

Keep two linked reporting products: a #strong[restricted operational
evidence file] (exact layouts, people, access systems, hardware
configurations and test logs) and a #strong[board-level aggregate
exception report] (critical gaps, owner, interim controls, deadline,
accessibility impact, budget and closure evidence, without exploitable
implementation specifics). Assign one administrator to close each
improvement action and a different reviewer to verify closure.

For #strong[AI, automated screening and sensors], retain ground-truth
definitions, positive/negative test cases, missed alerts, nuisance
alarms, out-of-scope populations and conditions, false-action
consequences, model/version changes, privacy effects and manual fallback
performance. Do not use AI-generated labels as the sole basis of
discipline or force. For #strong[authorized protective personnel],
review legal authorization, agency agreements, qualification status,
exercise and reporting records, medical response, and the Washington
annual safety/security incident reporting provisions. \[F17\]
\[W06--W10\]

#strong[Threat intelligence and false reporting:] track operational
threat indicators and corroborated misconduct, not ideological
categories. Separate unverified tips, genuine emergencies, maliciously
fabricated reports and good-faith mistakes. A reporting system that
discourages genuine complaints or fails to correct wrongful attribution
is itself a safety and civil-rights risk. Keep incident files protected,
with limited disclosure and correction/appeal channels. \[F02\] \[F05\]
\[F06\] \[W04--W05\]

==== Board review: four decision gates
<board-review-four-decision-gates>
#figure(
  align(center)[#table(
    columns: (25%, 25%, 25%, 25%),
    align: (left,left,left,left,),
    table.header(table.cell(align: left)[Gate], table.cell(align: left)[When], table.cell(align: left)[Evidence
      to present], table.cell(align: left)[Board action],),
    table.hline(),
    table.cell(align: left)[#strong[G0 --- authority and
    scoping]], table.cell(align: left)[Start], table.cell(align: left)[Named
    district owner, campus list, written legal/privacy scope, partners,
    safety restrictions], table.cell(align: left)[Authorize assessment;
    not broad procurement],
    table.cell(align: left)[#strong[G1 --- critical
    controls]], table.cell(align: left)[Days
    1--30], table.cell(align: left)[Statute-by-statute compliance,
    bleeding-control counts, drill and notification records, initial
    critical findings], table.cell(align: left)[Fund/assign immediate
    corrections],
    table.cell(align: left)[#strong[G2 --- operational
    demonstration]], table.cell(align: left)[Days
    31--60], table.cell(align: left)[Tested alert/egress/accessibility
    coverage, PSAP participation, event logs, first AAR/IP, credible
    fallback], table.cell(align: left)[Require independent retests],
    table.cell(align: left)[#strong[G3 --- residual risk and
    investment]], table.cell(align: left)[Days
    61--90], table.cell(align: left)[Closed versus open critical gaps,
    sustained readiness, comparative cost/benefit and harms of optional
    controls], table.cell(align: left)[Approve, defer, condition or
    reject projects],
  )]
  , kind: table
  )

A #emph[conditional approval] must expire without a satisfactory retest
or whenever material software, staffing, facility or legal changes
invalidate earlier evidence. The chief safety official should escalate
imminent protective deficiencies immediately, rather than waiting for
the next board meeting.

=== Assurance governance and automatic reopening of findings
<assurance-governance-and-automatic-reopening-of-findings>
#strong[PROPOSAL.] Maintain three linked artifacts: (1) a #strong[public
board exception report] containing the number of assessed campuses,
unresolved mandatory requirements, categories of critical controls,
funding requests and correction timelines; (2) a #strong[restricted
campus evidence packet] containing permitted test results and sensitive
facilities/personnel details; and (3) a #strong[student-specific
protected case file] for individualized reports, FERPA disclosures,
reviews and corrections. Never copy student allegations, exact security
blind spots, protected routes or personnel deployment rosters into
public board packets.

Require independent #strong[reopening] whenever: a critical control
changes equipment/software/provider; a key qualified staff position or
coverage changes; a campus is reconfigured; a student-accessibility need
is unmet; an exercise finds an invalid assumption; a control has
materially false alerts; or a new binding requirement or credible
site-specific hazard invalidates the old test. Use an #strong[interim
protective measure] while reopening is investigated, and close only with
documented retest where applicable. \[F29--F30\] \[W01--W08\]

The district should report both #strong[readiness] (percentage of
#emph[applicable] controls independently demonstrated for the tested
scope) and #strong[critical exceptions] (absolute count and age,
including unassessed mandatory controls). Report these separately; the
first metric cannot cancel the second. Avoid districtwide percentages
without denominators and campus coverage. Any safety metric is
descriptive, not a probability that a school will resist an attack.

=== Lifecycle cost and reversibility record
<lifecycle-cost-and-reversibility-record>
Every major optional capability should have a completed business case:
#strong[one-time capital cost; annual licensing and connectivity;
personnel and recurring qualification; facilities/fire/ADA changes;
privacy/data-management cost; maintenance; evaluation; insurance and
potential liability; vendor exit costs; expected useful life; and
opportunity cost]. If reliable prices or benefits are unavailable, write
#strong[TBD] rather than inventing estimates. Require a
sunset/re-approval trigger and a non-proprietary way to retain incident
evidence when changing vendors.

The choice is not only \'buy versus do nothing\': compare a technology
purchase with procedural corrections, staffed entry supervision,
improved communications, training, trauma supplies and tested
continuity. Prefer an intervention with measurable safety benefit and
acceptable unintended harms under real school conditions.

=== Decision thresholds for advanced procurement
<decision-thresholds-for-advanced-procurement>
Every proposal should present: (1) problem and hazard model; (2) lawful
purpose and authority; (3) independent operational baseline; (4)
measured improvement over less intrusive alternatives; (5) adverse
consequences to students; (6) sustainment staffing, integration and
outage modes; (7) performance test and stop/rollback criteria.
#strong[Reject unverifiable claims of zero false alarms, instantaneous
intervention, universal weapon recognition or infallible offender
prediction.] \[F01\] \[F17\]

=== National innovation sharing and federal advisory governance
<national-school-safety-innovation-forum-governance>
#strong[Proposal, not current mandate:] Establish a voluntary, moderated
nationwide school-safety administrators\' forum. Use a standard record
of hypotheses, legal review, independent field evidence, negative
results, costs and unintended harms. Request nonbinding technical
reviews and recommendations from CISA, USSS NTAC, DOJ BJA/NIJ,
Department of Education and FEMA, and cooperate with states and Tribal
education authorities. Federal oversight must be authorized by
participating agencies, not presumed. Publish only de-identified,
non-sensitive learning products, with restricted practitioner access for
legally shareable operational details. Require independent replication
before calling a practice effective.

== 9. Further-research agenda
<9-further-research-agenda>
#block[
#set enum(numbering: "1.", start: 1)
+ #strong[Before-arrival life safety:] Which access, communications and
  medical measures show the largest practical benefit at the district's
  actual buildings, transport routes and events?
+ #strong[Armed personnel and SRO tradeoffs:] What independent research
  separates prevention or response benefits from effects on arrests,
  discipline, disparate impacts, mistaken-identity risk and educational
  climate? Do not presume net benefit.
+ #strong[Screening throughput:] What are measured
  true-positive/false-positive performance, staffing requirements and
  crowding effects of each proposed entry system?
+ #strong[AI camera validity:] How do alerts behave on school-specific
  camera angles, lighting, backpacks, sports equipment, disabilities and
  crowds? Can results be independently replicated?
+ #strong[Swatting and synthetic-media authentication:] Which protocols
  best allow prompt protection without unjustified escalation or
  unsupported accusations?
+ #strong[Online coercion:] How can schools help exploited children
  while limiting repeated exposure, discovery, unnecessary data sharing
  and retaliatory bullying?
+ #strong[Counter-UAS legal implementation:] Which specific federal
  statutory/training pathways, if any, apply to local partners today? Do
  not infer authority from a vendor catalog.
+ #strong[Security canines:] What independent studies address detection
  effectiveness, handler requirements, liability, welfare and student
  accessibility?
+ #strong[Equity and civil liberties:] What audit measures reveal
  wrongly targeted individuals, political viewpoint bias, improper
  searches and unjustified exclusion?
+ #strong[All-hazards continuity:] What minimum capability works when
  power, telecom, transport and primary responders fail together?
]

#strong[Research order:] Start with federal primary guidance and binding
state law, then independent effectiveness studies, then local
vulnerability and validation data. Agency warning bulletins describe
hazards; they are not proof of prevalence at a given school or proof
that a given vendor product is effective.

#pagebreak(weak: true)
== 10. Glossary and evidence hierarchy
<10-glossary-and-evidence-hierarchy>
#strong[BTAM:] Behavioral Threat Assessment and Management.
#strong[PSAP:] Public Safety Answering Point (911 dispatch).
#strong[SRO:] School Resource Officer. #strong[UAS/UGV/UxS:] unmanned
aircraft / ground / broad unmanned systems. #strong[C-UAS:]
counter-unmanned aircraft systems. #strong[EOP:] Emergency Operations
Plan. #strong[Less-lethal:] intended to reduce injury risk but not
harmless. #strong[Validated:] independent measured performance under
approved conditions; an untested planned feature is #strong[unassessed].

#strong[Legal reading hierarchy:] (1) U.S. Constitution and applicable
binding federal law/cases; (2) Washington
Constitution/statutes/regulations not conflicting with federal law; (3)
binding district/agency policies and contracts; (4) advisory federal and
state guidance; (5) research, planning scenarios and product claims.
#emph[Guidance is not a license to search, monitor, detain, discipline
or use force.]

#pagebreak(weak: true)
== 11. Campus field verification and independent assurance
<11-campus-field-verification-and-independent-assurance>
#strong[Controlled testing protocol • proposed district procedure]

#strong[Purpose.] Make the integrated advisory actionable without
publishing tactical security weaknesses or treating unperformed checks
as certification. This protocol is a #emph[district proposal], not a new
legal requirement. All template rows begin #strong[UNASSESSED].

=== 1. Approve the evaluation before any exercise
<1-approve-the-evaluation-before-any-exercise>
The district safety owner, school administrator, IT lead (if relevant),
PSAP/agency partners (if involved), privacy officer, accessibility lead
and evaluator agree on site, safe scope, objectives, fictional inputs,
abort/stop conditions, participants, access protections and record
retention. Never use real emergency calls, weapons, live counter-drone
equipment, coercive scenarios involving real children, or potentially
injurious force demonstrations as school exercises. Coordination and
legal approval are mandatory where specialist services are contemplated.
\[F07\] \[F29--F30\] \[W01\]

=== 2. Establish the legal baseline separately from tests
<2-establish-the-legal-baseline-separately-from-tests>
Use the legal compliance register (Section 14). Verify every relevant
RCW obligation with current records or inspection: safe-school plan and
monthly drills; incident-command certification; employee/substitute
briefings; emergency response system; bleeding-control contents,
staffing and inspections; security-provider agreements, complaints and
reporting; behavior-based threat assessment; and FERPA disclosure logs.
#strong[An empty compliance entry is not a violation finding and not a
passing result.] \[W01--W08\] \[F25\]

=== 3. Select representative protective conditions
<3-select-representative-protective-conditions>
Use the representative test conditions (Section 15). Include an ordinary
classroom, remote/portable area, crowded/noisy assembly, transportation
activity, accessible route, and formally controlled communications
outage. Test the #emph[entire path]: recognition, authorized
acknowledgment, occupant warning, safe protection, coordination and
fallback. Do not publish detailed diagrams, staffing patterns or blind
spots with the public board report. \[F01\] \[F07\]

=== 4. Record observations that another evaluator can reproduce
<4-record-observations-that-another-evaluator-can-reproduce>
For each check document:
`site/zone, scope/date, objective, preapproved criteria, authorization, assessor and witness, evidence level, test sample denominator, observed misses/false actions, timing with measurement limitations, accessibility alternative, harm/complaints, failure/abort reason, interim measure, owner, retest date`.
Timing is measured from a defined starting cue. Missing observations are
#emph[UNKNOWN]. Where a sample contains no actual positive or negative
examples, never calculate 100% sensitivity or specificity from it.
\[F24\] \[F27\] \[F30\]

#figure(
  align(center)[#table(
    columns: (33.33%, 33.33%, 33.33%),
    align: (auto,auto,auto,),
    table.header([Result], [Permitted interpretation], [Required next
      action],),
    table.hline(),
    [UNASSESSED], [Unknown; no credible evidence yet], [Assign owner and
    safe test],
    [DOCUMENTED ONLY], [Policy, equipment list or credential
    exists], [Arrange appropriate demonstration],
    [DEMONSTRATED / LIMITED], [Observed under named
    conditions], [Specify exclusions, fallback and retest],
    [VERIFIED FOR SCOPE], [Independent repeatable evidence for stated
    conditions], [Set expiry and change triggers],
    [CRITICAL DEFICIENCY], [Required control absent or material
    protective failure shown], [Implement immediate interim mitigation
    and escalate; do not average away],
  )]
  , kind: table
  )

=== 5. Assess optional capabilities only after essential gaps
<5-assess-optional-capabilities-only-after-essential-gaps>
Optional armed coverage, less-lethal equipment, working canines, AI
camera analytics, enhanced weapons screening and counter-UxS products
require individualized authority, comparative baseline, known operating
costs, measured incremental benefit, adverse-effects review and
independent validation. No supplier demonstration establishes universal
reliability. Any active counter-drone interdiction requires qualified
public-safety authority; district personnel have no blanket
authorization. Keep force policy under legal and agency oversight.
\[F17--F21\] \[W06--W11\]

=== 6. Close with an after-action and board exception report
<6-close-with-an-after-action-and-board-exception-report>
Create restricted evidence files and a sanitized board report: assessed
campuses and zones; mandatory compliance status; critical issues with
interim safeguards; accountable owners; dates; expenses; and independent
retest outcomes. Neither a favorable average score nor a later
procurement can close a verified critical failure. Reopen controls after
staff, facility, vendor, software, policy or materially changed risk
conditions. Use FEMA HSEEP/EEGs to align observations with exercise
objectives and a documented AAR/IP. \[F29--F30\]

#strong[Records:] the legal compliance register (Section 14), the
representative test conditions (Section 15), the assurance checklist
(Section 13), the assurance checklist (Section 13), and the threat and
control mapping (Section 12).

#strong[Operational status:] No live school, dispatch, IT or security
verification conducted. The templates are ready for district
authorization, not a declaration of readiness.

== 12. Integrated threat vector register and countermeasure crosswalk
<12-integrated-threat-vector-register-and-countermeasure-crosswalk>
Identifiers in this section belong to the legacy\_hazard namespace.
Engine scenario:T01 through scenario:T18 refer to different records.
Never join registers using an unqualified overlapping identifier.

#strong[Assessment rule:] These 56 planning pathways are neither
incident-frequency estimates nor a list of confirmed local attacks.
Every candidate control must be evaluated for a particular campus. All
vector statuses remain #strong[UNASSESSED].

Each entry includes the existing threat taxonomy, recommended initial
protective response, proposed control IDs, responsible parties, and
evidence necessary for demonstrating coverage. Control IDs are expanded
in Section 13.

=== V01 --- Firearm assault
<v01--firearm-assault>
#strong[V15 upstream addition:] Prioritize prevention of unauthorized
youth access through secure storage and the ASCS-00 community program;
document voluntary outreach and pathways for credible-threat
intervention separately from site protective controls.

#strong[Family:] Intentional violence | #strong[Evidence:] Documented
class | #strong[Status:] UNASSESSED.

#strong[Protective approach:] BTAM; access/alerts; trained response.
#strong[Immediate action:] Protect/alert/911/aid.

#strong[Candidate controls:] M01 M02 M03 M04 M10 M15. #strong[Owners:]
Facilities / principal; District safety / PSAP; Nurse / principal; BTAM
team; Law enforcement / district; Board / auditor. #strong[Minimum
evidence:] Campus applicability, actual coverage, authorized safe
demonstration, recorded failures, independent sign-off and retest date.

#strong[Inherited source labels:] S01 S03 (cross-check against the
official bibliography before legal adoption).

=== V02 --- Edged/blunt assault
<v02--edgedblunt-assault>
#strong[Family:] Intentional violence | #strong[Evidence:] Documented
class | #strong[Status:] UNASSESSED.

#strong[Protective approach:] Observations; access; trained staff.
#strong[Immediate action:] Distance/protect/911/aid.

#strong[Candidate controls:] M01 M02 M03 M04 M15. #strong[Owners:]
Facilities / principal; District safety / PSAP; Nurse / principal; BTAM
team; Board / auditor. #strong[Minimum evidence:] Campus applicability,
actual coverage, authorized safe demonstration, recorded failures,
independent sign-off and retest date.

#strong[Inherited source labels:] S01 S03 (cross-check against the
official bibliography before legal adoption).

=== V03 --- Explosive threat/IED
<v03--explosive-threatied>
#strong[Family:] Intentional violence | #strong[Evidence:] Documented
class | #strong[Status:] UNASSESSED.

#strong[Protective approach:] CISA bomb-threat training; specialists.
#strong[Immediate action:] Do not handle; protective decision by
experts.

#strong[Candidate controls:] M01 M02 M03 M04 M12 M15. #strong[Owners:]
Facilities / principal; District safety / PSAP; Nurse / principal; BTAM
team; Specialist handler / legal; Board / auditor. #strong[Minimum
evidence:] Campus applicability, actual coverage, authorized safe
demonstration, recorded failures, independent sign-off and retest date.

#strong[Inherited source labels:] S08 (cross-check against the official
bibliography before legal adoption).

=== V04 --- Arson/fire as attack
<v04--arsonfire-as-attack>
#strong[Family:] Intentional violence | #strong[Evidence:] Documented
class | #strong[Status:] UNASSESSED.

#strong[Protective approach:] Detection; fire prevention; building
plans. #strong[Immediate action:] Fire protocols/evacuation/911.

#strong[Candidate controls:] M01 M02 M04 M15. #strong[Owners:]
Facilities / principal; District safety / PSAP; BTAM team; Board /
auditor. #strong[Minimum evidence:] Campus applicability, actual
coverage, authorized safe demonstration, recorded failures, independent
sign-off and retest date.

#strong[Inherited source labels:] S07 S15 (cross-check against the
official bibliography before legal adoption).

=== V05 --- Vehicular injury/ramming
<v05--vehicular-injuryramming>
#strong[Family:] Intentional violence | #strong[Evidence:] Foreseeable
class | #strong[Status:] UNASSESSED.

#strong[Protective approach:] Professionally reviewed traffic controls.
#strong[Immediate action:] Clear people; emergency call.

#strong[Candidate controls:] M01 M02 M04 M15. #strong[Owners:]
Facilities / principal; District safety / PSAP; BTAM team; Board /
auditor. #strong[Minimum evidence:] Campus applicability, actual
coverage, authorized safe demonstration, recorded failures, independent
sign-off and retest date.

#strong[Inherited source labels:] S01 (cross-check against the official
bibliography before legal adoption).

=== V06 --- Hostage/restraint
<v06--hostagerestraint>
#strong[Family:] Intentional violence | #strong[Evidence:] Documented
class | #strong[Status:] UNASSESSED.

#strong[Protective approach:] BTAM; communication; law enforcement
liaison. #strong[Immediate action:] Protect bystanders; police response.

#strong[Candidate controls:] M01 M02 M04 M15. #strong[Owners:]
Facilities / principal; District safety / PSAP; BTAM team; Board /
auditor. #strong[Minimum evidence:] Campus applicability, actual
coverage, authorized safe demonstration, recorded failures, independent
sign-off and retest date.

#strong[Inherited source labels:] S03 (cross-check against the official
bibliography before legal adoption).

=== V07 --- Targeted hate/ideological violence
<v07--targeted-hateideological-violence>
#strong[Family:] Intentional violence | #strong[Evidence:] Documented
class | #strong[Status:] UNASSESSED.

#strong[Protective approach:] Behavior-based assessment; student
support. #strong[Immediate action:] Protect target; report acts/threats.

#strong[Candidate controls:] M01 M02 M04 M15. #strong[Owners:]
Facilities / principal; District safety / PSAP; BTAM team; Board /
auditor. #strong[Minimum evidence:] Campus applicability, actual
coverage, authorized safe demonstration, recorded failures, independent
sign-off and retest date.

#strong[Inherited source labels:] S03 S14 (cross-check against the
official bibliography before legal adoption).

=== V08 --- Domestic/personal grievance spillover
<v08--domesticpersonal-grievance-spillover>
#strong[Family:] Intentional violence | #strong[Evidence:] Foreseeable
class | #strong[Status:] UNASSESSED.

#strong[Protective approach:] Trusted reporting; access rules; Include
intimate partner or parental custody dispute spillover; verify lawful
orders and safe release before taking adverse action.\.
#strong[Immediate action:] Protect students; police coordination.

#strong[Candidate controls:] M01 M02 M04 M15. #strong[Owners:]
Facilities / principal; District safety / PSAP; BTAM team; Board /
auditor. #strong[Minimum evidence:] Campus applicability, actual
coverage, authorized safe demonstration, recorded failures, independent
sign-off and retest date.

#strong[Inherited source labels:] S03 S46 S48 (cross-check against the
official bibliography before legal adoption).

=== V09 --- Insider access abuse
<v09--insider-access-abuse>
#strong[Family:] Intentional violence | #strong[Evidence:] Foreseeable
class | #strong[Status:] UNASSESSED.

#strong[Protective approach:] Least privilege; dual controls; Prevent
insider misuse of pickup records, student identity data and sensitive
contact information.\. #strong[Immediate action:] Revoke access safely;
investigate.

#strong[Candidate controls:] M01 M02 M04 M15. #strong[Owners:]
Facilities / principal; District safety / PSAP; BTAM team; Board /
auditor. #strong[Minimum evidence:] Campus applicability, actual
coverage, authorized safe demonstration, recorded failures, independent
sign-off and retest date.

#strong[Inherited source labels:] S01 S09 S50 (cross-check against the
official bibliography before legal adoption).

=== V10 --- Remote accomplice/linked sites
<v10--remote-accomplicelinked-sites>
#strong[Family:] Intentional violence | #strong[Evidence:] Planning
class | #strong[Status:] UNASSESSED.

#strong[Protective approach:] Independent verification; multiagency
liaison. #strong[Immediate action:] Report linkage, protect and
document.

#strong[Candidate controls:] M01 M02 M04 M15. #strong[Owners:]
Facilities / principal; District safety / PSAP; BTAM team; Board /
auditor. #strong[Minimum evidence:] Campus applicability, actual
coverage, authorized safe demonstration, recorded failures, independent
sign-off and retest date.

#strong[Inherited source labels:] S03 S06 (cross-check against the
official bibliography before legal adoption).

=== V11 --- Sexual violence/exploitation
<v11--sexual-violenceexploitation>
#strong[Family:] Intentional violence | #strong[Evidence:] Documented
class | #strong[Status:] UNASSESSED.

#strong[Protective approach:] Victim support; trusted intake; Include
child trafficking victim protection and specialist referral, not only
sexual-violence event response.\. #strong[Immediate action:] Safeguard
victim and report per law.

#strong[Candidate controls:] M01 M02 M04 M15. #strong[Owners:]
Facilities / principal; District safety / PSAP; BTAM team; Board /
auditor. #strong[Minimum evidence:] Campus applicability, actual
coverage, authorized safe demonstration, recorded failures, independent
sign-off and retest date.

#strong[Inherited source labels:] S05 S45 S49 (cross-check against the
official bibliography before legal adoption).

=== V12 --- Crowd surge/event violence
<v12--crowd-surgeevent-violence>
#strong[Family:] Intentional violence | #strong[Evidence:] Foreseeable
class | #strong[Status:] UNASSESSED.

#strong[Protective approach:] Event design; safety stewards.
#strong[Immediate action:] Disperse safely; EMS/911.

#strong[Candidate controls:] M01 M02 M04 M15. #strong[Owners:]
Facilities / principal; District safety / PSAP; BTAM team; Board /
auditor. #strong[Minimum evidence:] Campus applicability, actual
coverage, authorized safe demonstration, recorded failures, independent
sign-off and retest date.

#strong[Inherited source labels:] S07 (cross-check against the official
bibliography before legal adoption).

=== V13 --- Self-harm or suicide crisis
<v13--self-harm-or-suicide-crisis>
#strong[Family:] Intentional violence | #strong[Evidence:] Documented
class; 2026 FBI warning | #strong[Status:] UNASSESSED.

#strong[Protective approach:] Supportive screening and referral;
online-coercion victim protection without treating victims as suspects.
#strong[Immediate action:] Urgent crisis response and trusted
safeguarding referrals.

#strong[Candidate controls:] M01 M02 M04 M15. #strong[Owners:]
Facilities / principal; District safety / PSAP; BTAM team; Board /
auditor. #strong[Minimum evidence:] Campus applicability, actual
coverage, authorized safe demonstration, recorded failures, independent
sign-off and retest date.

#strong[Inherited source labels:] S03 S29 (cross-check against the
official bibliography before legal adoption).

=== V14 --- Deliberate hazardous-substance release
<v14--deliberate-hazardous-substance-release>
#strong[Family:] Intentional violence | #strong[Evidence:] Planning
class | #strong[Status:] UNASSESSED.

#strong[Protective approach:] Facilities access; public health/hazmat
liaison. #strong[Immediate action:] Protect and refer to trained
specialists.

#strong[Candidate controls:] M01 M02 M04 M15. #strong[Owners:]
Facilities / principal; District safety / PSAP; BTAM team; Board /
auditor. #strong[Minimum evidence:] Campus applicability, actual
coverage, authorized safe demonstration, recorded failures, independent
sign-off and retest date.

#strong[Inherited source labels:] S07 S08 (cross-check against the
official bibliography before legal adoption).

=== U01 --- Unsafe/hostile drone
<u01--unsafehostile-drone>
#strong[Family:] Unmanned & animal | #strong[Evidence:] Planning
scenario; federal UAS risk guidance | #strong[Status:] UNASSESSED.

#strong[Protective approach:] UAS awareness training, event response
plan, specialist escalation, preserve lawfully collected observations.
#strong[Immediate action:] Protect occupants; notify authorities; no
unauthorized interference.

#strong[Candidate controls:] M01 M02 M13 M15. #strong[Owners:]
Facilities / principal; District safety / PSAP; District / specialized
agency; Board / auditor. #strong[Minimum evidence:] Campus
applicability, actual coverage, authorized safe demonstration, recorded
failures, independent sign-off and retest date.

#strong[Inherited source labels:] S10 S32 (cross-check against the
official bibliography before legal adoption).

=== U02 --- Unmanned ground rover
<u02--unmanned-ground-rover>
#strong[Family:] Unmanned & animal | #strong[Evidence:] Planning class |
#strong[Status:] UNASSESSED.

#strong[Protective approach:] Site access; suspicious object policy.
#strong[Immediate action:] Keep away; specialist response.

#strong[Candidate controls:] M01 M02 M13 M15. #strong[Owners:]
Facilities / principal; District safety / PSAP; District / specialized
agency; Board / auditor. #strong[Minimum evidence:] Campus
applicability, actual coverage, authorized safe demonstration, recorded
failures, independent sign-off and retest date.

#strong[Inherited source labels:] S01 (cross-check against the official
bibliography before legal adoption).

=== U03 --- Aggressive canine
<u03--aggressive-canine>
#strong[Family:] Unmanned & animal | #strong[Evidence:] Foreseeable
class | #strong[Status:] UNASSESSED.

#strong[Protective approach:] Animal safety protocol. #strong[Immediate
action:] Separate; animal control; EMS.

#strong[Candidate controls:] M01 M02 M12 M13 M15. #strong[Owners:]
Facilities / principal; District safety / PSAP; Specialist handler /
legal; District / specialized agency; Board / auditor. #strong[Minimum
evidence:] Campus applicability, actual coverage, authorized safe
demonstration, recorded failures, independent sign-off and retest date.

#strong[Inherited source labels:] S13 (cross-check against the official
bibliography before legal adoption).

=== U04 --- Other dangerous animals
<u04--other-dangerous-animals>
#strong[Family:] Unmanned & animal | #strong[Evidence:] Documented class
| #strong[Status:] UNASSESSED.

#strong[Protective approach:] Site wildlife response. #strong[Immediate
action:] Separate/notify specialists.

#strong[Candidate controls:] M01 M02 M12 M13 M15. #strong[Owners:]
Facilities / principal; District safety / PSAP; Specialist handler /
legal; District / specialized agency; Board / auditor. #strong[Minimum
evidence:] Campus applicability, actual coverage, authorized safe
demonstration, recorded failures, independent sign-off and retest date.

#strong[Inherited source labels:] S07 (cross-check against the official
bibliography before legal adoption).

=== U05 --- Remote-enabled mixed attack
<u05--remote-enabled-mixed-attack>
#strong[Family:] Unmanned & animal | #strong[Evidence:] Planning
scenario | #strong[Status:] UNASSESSED.

#strong[Protective approach:] Cross-hazard response with redundancy and
authorized specialists; no speculative threat profiling.
#strong[Immediate action:] Hazard-specific protection and coordinated
dispatch.

#strong[Candidate controls:] M01 M02 M13 M15. #strong[Owners:]
Facilities / principal; District safety / PSAP; District / specialized
agency; Board / auditor. #strong[Minimum evidence:] Campus
applicability, actual coverage, authorized safe demonstration, recorded
failures, independent sign-off and retest date.

#strong[Inherited source labels:] S01 S32 (cross-check against the
official bibliography before legal adoption).

=== D01 --- Threatening social post
<d01--threatening-social-post>
#strong[Family:] Information & cyber | #strong[Evidence:] Documented
class | #strong[Status:] UNASSESSED.

#strong[Protective approach:] Provenance; BTAM; confidential intake.
#strong[Immediate action:] Validate & protect proportionately.

#strong[Candidate controls:] M02 M05 M07 M15. #strong[Owners:] District
safety / PSAP; PSAP / principal; IT / district safety; Board / auditor.
#strong[Minimum evidence:] Campus applicability, actual coverage,
authorized safe demonstration, recorded failures, independent sign-off
and retest date.

#strong[Inherited source labels:] S05 S06 (cross-check against the
official bibliography before legal adoption).

=== D02 --- Swatting/false bomb report
<d02--swattingfalse-bomb-report>
#strong[Family:] Information & cyber | #strong[Evidence:] Documented
federal advisory 2026 | #strong[Status:] UNASSESSED.

#strong[Protective approach:] Joint school--dispatch swatting plan;
staff training and authenticated callback via known contacts.
#strong[Immediate action:] Protect first while dispatch evaluates
parallel evidence; minimize amplification.

#strong[Candidate controls:] M02 M05 M07 M15. #strong[Owners:] District
safety / PSAP; PSAP / principal; IT / district safety; Board / auditor.
#strong[Minimum evidence:] Campus applicability, actual coverage,
authorized safe demonstration, recorded failures, independent sign-off
and retest date.

#strong[Inherited source labels:] S28 S36 (cross-check against the
official bibliography before legal adoption).

=== D03 --- Coordinated false allegation
<d03--coordinated-false-allegation>
#strong[Family:] Information & cyber | #strong[Evidence:] Documented
class and federal guidance | #strong[Status:] UNASSESSED.

#strong[Protective approach:] Independent evidence chain and reviewer;
flag clusters, impersonation or coordinated identical tips; Extend
independent review to coordinated political/financial claims,
foreign-actor impersonation, and child-release falsehoods; do not assign
culpability from report volume.\. #strong[Immediate action:] Protection
based on danger; no public allegation or disciplinary assumption.

#strong[Candidate controls:] M02 M05 M07 M15. #strong[Owners:] District
safety / PSAP; PSAP / principal; IT / district safety; Board / auditor.
#strong[Minimum evidence:] Campus applicability, actual coverage,
authorized safe demonstration, recorded failures, independent sign-off
and retest date.

#strong[Inherited source labels:] S05 S06 S28 S42 S47 S50 (cross-check
against the official bibliography before legal adoption).

=== D04 --- Deepfake/forged evidence
<d04--deepfakeforged-evidence>
#strong[Family:] Information & cyber | #strong[Evidence:] Documented
class; FTC 2026 guidance | #strong[Status:] UNASSESSED.

#strong[Protective approach:] Provenance checks; independently verify
audio/video; preserve metadata without replicating sexual imagery; FTC
removal route; Use two-channel verification for synthetic missing-child
imagery or purported foreign official communications.\.
#strong[Immediate action:] Do not publicly identify or punish based only
on media; secure victim assistance.

#strong[Candidate controls:] M02 M05 M07 M15. #strong[Owners:] District
safety / PSAP; PSAP / principal; IT / district safety; Board / auditor.
#strong[Minimum evidence:] Campus applicability, actual coverage,
authorized safe demonstration, recorded failures, independent sign-off
and retest date.

#strong[Inherited source labels:] S30 S31 S34 S39 S41 S47 S50
(cross-check against the official bibliography before legal adoption).

=== D05 --- Cyberbullying/sextortion
<d05--cyberbullyingsextortion>
#strong[Family:] Information & cyber | #strong[Evidence:] Documented
class; FTC 2026 guidance | #strong[Status:] UNASSESSED.

#strong[Protective approach:] Trauma-informed support; victim reporting,
rapid platform takedown requests, safe evidence handling and counselor
referral. #strong[Immediate action:] Protect affected child; avoid
sharing imagery; contact NCMEC/appropriate agencies.

#strong[Candidate controls:] M02 M05 M07 M15. #strong[Owners:] District
safety / PSAP; PSAP / principal; IT / district safety; Board / auditor.
#strong[Minimum evidence:] Campus applicability, actual coverage,
authorized safe demonstration, recorded failures, independent sign-off
and retest date.

#strong[Inherited source labels:] S29 S30 S31 S38 S39 (cross-check
against the official bibliography before legal adoption).

=== D06 --- Doxing/privacy abuse
<d06--doxingprivacy-abuse>
#strong[Family:] Information & cyber | #strong[Evidence:] Documented
class | #strong[Status:] UNASSESSED.

#strong[Protective approach:] Reduce student exposure; private reporting
and protected record handling; provide content removal referrals; Add
family and custody contact restrictions, student itinerary and
reunification data minimization.\. #strong[Immediate action:] Protect
student, document only necessary details and minimize recirculation.

#strong[Candidate controls:] M02 M05 M07 M15. #strong[Owners:] District
safety / PSAP; PSAP / principal; IT / district safety; Board / auditor.
#strong[Minimum evidence:] Campus applicability, actual coverage,
authorized safe demonstration, recorded failures, independent sign-off
and retest date.

#strong[Inherited source labels:] S29 S30 S31 S37 S42 S50 (cross-check
against the official bibliography before legal adoption).

=== D07 --- Compromised alerts/PA
<d07--compromised-alertspa>
#strong[Family:] Information & cyber | #strong[Evidence:] Scenario
supported by CISA cyber risk guidance | #strong[Status:] UNASSESSED.

#strong[Protective approach:] Separate authenticated command channels;
backup alert pathway; test cyber and power failure. #strong[Immediate
action:] Provide independent emergency guidance and dispatch update.

#strong[Candidate controls:] M02 M05 M07 M15. #strong[Owners:] District
safety / PSAP; PSAP / principal; IT / district safety; Board / auditor.
#strong[Minimum evidence:] Campus applicability, actual coverage,
authorized safe demonstration, recorded failures, independent sign-off
and retest date.

#strong[Inherited source labels:] S33 S35 S40 (cross-check against the
official bibliography before legal adoption).

=== D08 --- Ransomware/data theft
<d08--ransomwaredata-theft>
#strong[Family:] Information & cyber | #strong[Evidence:] Documented
class | #strong[Status:] UNASSESSED.

#strong[Protective approach:] MFA; patch known exploited
vulnerabilities; offline backups and measured restoration.
#strong[Immediate action:] Invoke cyber EOP and preserve manual
attendance/communications.

#strong[Candidate controls:] M02 M05 M07 M15. #strong[Owners:] District
safety / PSAP; PSAP / principal; IT / district safety; Board / auditor.
#strong[Minimum evidence:] Campus applicability, actual coverage,
authorized safe demonstration, recorded failures, independent sign-off
and retest date.

#strong[Inherited source labels:] S33 S35 S40 (cross-check against the
official bibliography before legal adoption).

=== D09 --- Camera or access-control compromise
<d09--camera-or-access-control-compromise>
#strong[Family:] Information & cyber | #strong[Evidence:] Scenario
supported by CISA cyber risk guidance | #strong[Status:] UNASSESSED.

#strong[Protective approach:] Monitor administrative access; vendor
controls; separate life-safety and general IT trust. #strong[Immediate
action:] Use human verification and protective fallback.

#strong[Candidate controls:] M02 M05 M07 M09 M15. #strong[Owners:]
District safety / PSAP; PSAP / principal; IT / district safety; IT /
counsel / evaluator; Board / auditor. #strong[Minimum evidence:] Campus
applicability, actual coverage, authorized safe demonstration, recorded
failures, independent sign-off and retest date.

#strong[Inherited source labels:] S33 S35 S40 (cross-check against the
official bibliography before legal adoption).

=== D10 --- Political/religious targeting
<d10--politicalreligious-targeting>
#strong[Family:] Information & cyber | #strong[Evidence:] Foreseeable
class | #strong[Status:] UNASSESSED.

#strong[Protective approach:] Nonideological threat standards; rights
review; Protect ideologically targeted persons; apply viewpoint-neutral
conduct criteria and evidence-based escalation.\. #strong[Immediate
action:] Protect targets, investigate conduct.

#strong[Candidate controls:] M02 M05 M07 M15. #strong[Owners:] District
safety / PSAP; PSAP / principal; IT / district safety; Board / auditor.
#strong[Minimum evidence:] Campus applicability, actual coverage,
authorized safe demonstration, recorded failures, independent sign-off
and retest date.

#strong[Inherited source labels:] S03 S14 S42 S53 (cross-check against
the official bibliography before legal adoption).

=== D11 --- Disinformation/impersonation
<d11--disinformationimpersonation>
#strong[Family:] Information & cyber | #strong[Evidence:] Documented
class | #strong[Status:] UNASSESSED.

#strong[Protective approach:] Verify sender and message origin with
trusted contacts; guard against synthetic impersonation; Authenticate
government impersonation, foreign official requests and faux legal
notices before disclosure.\. #strong[Immediate action:] Cross-check
before adverse attribution; dispatch on material threat.

#strong[Candidate controls:] M02 M05 M07 M14 M15. #strong[Owners:]
District safety / PSAP; PSAP / principal; IT / district safety; Privacy
officer / counsel; Board / auditor. #strong[Minimum evidence:] Campus
applicability, actual coverage, authorized safe demonstration, recorded
failures, independent sign-off and retest date.

#strong[Inherited source labels:] S28 S34 S42 S47 (cross-check against
the official bibliography before legal adoption).

=== D12 --- Remote grooming/coercion
<d12--remote-groomingcoercion>
#strong[Family:] Information & cyber | #strong[Evidence:] Documented
federal warning | #strong[Status:] UNASSESSED.

#strong[Protective approach:] Recognize FBI-reported online coercion
networks; trusted reporting, victim safeguarding and specialist
referrals; avoid storing abusive imagery. #strong[Immediate action:]
Assess imminent harm, protect victim, involve qualified safeguarding/911
if needed.

#strong[Candidate controls:] M02 M04 M05 M07 M14 M15. #strong[Owners:]
District safety / PSAP; BTAM team; PSAP / principal; IT / district
safety; Privacy officer / counsel; Board / auditor. #strong[Minimum
evidence:] Campus applicability, actual coverage, authorized safe
demonstration, recorded failures, independent sign-off and retest date.

#strong[Inherited source labels:] S29 S34 S38 S39 (cross-check against
the official bibliography before legal adoption).

=== E01 --- Building fire / smoke
<e01--building-fire--smoke>
#strong[Family:] Environmental | #strong[Evidence:] Documented class |
#strong[Status:] UNASSESSED.

#strong[Protective approach:] Alarms, inspections, egress.
#strong[Immediate action:] Evacuate/shelter per fire hazard.

#strong[Candidate controls:] M02 M03 M15. #strong[Owners:] District
safety / PSAP; Nurse / principal; Board / auditor. #strong[Minimum
evidence:] Campus applicability, actual coverage, authorized safe
demonstration, recorded failures, independent sign-off and retest date.

#strong[Inherited source labels:] S07 S15 (cross-check against the
official bibliography before legal adoption).

=== E02 --- Earthquake/structural collapse
<e02--earthquakestructural-collapse>
#strong[Family:] Environmental | #strong[Evidence:] Documented class |
#strong[Status:] UNASSESSED.

#strong[Protective approach:] Drills; facilities assessment.
#strong[Immediate action:] Earthquake protective action then assess.

#strong[Candidate controls:] M02 M03 M15. #strong[Owners:] District
safety / PSAP; Nurse / principal; Board / auditor. #strong[Minimum
evidence:] Campus applicability, actual coverage, authorized safe
demonstration, recorded failures, independent sign-off and retest date.

#strong[Inherited source labels:] S07 S15 (cross-check against the
official bibliography before legal adoption).

=== E03 --- Wildfire/smoke/air quality
<e03--wildfiresmokeair-quality>
#strong[Family:] Environmental | #strong[Evidence:] Documented class |
#strong[Status:] UNASSESSED.

#strong[Protective approach:] HVAC plans; air-quality thresholds.
#strong[Immediate action:] Shelter/evacuate per official guidance.

#strong[Candidate controls:] M02 M03 M15. #strong[Owners:] District
safety / PSAP; Nurse / principal; Board / auditor. #strong[Minimum
evidence:] Campus applicability, actual coverage, authorized safe
demonstration, recorded failures, independent sign-off and retest date.

#strong[Inherited source labels:] S07 (cross-check against the official
bibliography before legal adoption).

=== E04 --- Flood/landslide/severe rain
<e04--floodlandslidesevere-rain>
#strong[Family:] Environmental | #strong[Evidence:] Documented class |
#strong[Status:] UNASSESSED.

#strong[Protective approach:] Site warnings; routes. #strong[Immediate
action:] Relocate and reunify safely.

#strong[Candidate controls:] M02 M03 M15. #strong[Owners:] District
safety / PSAP; Nurse / principal; Board / auditor. #strong[Minimum
evidence:] Campus applicability, actual coverage, authorized safe
demonstration, recorded failures, independent sign-off and retest date.

#strong[Inherited source labels:] S07 (cross-check against the official
bibliography before legal adoption).

=== E05 --- High wind/lightning/extreme temp
<e05--high-windlightningextreme-temp>
#strong[Family:] Environmental | #strong[Evidence:] Documented class |
#strong[Status:] UNASSESSED.

#strong[Protective approach:] Weather monitoring; shelter.
#strong[Immediate action:] Stop outdoor exposure; shelter.

#strong[Candidate controls:] M02 M03 M15. #strong[Owners:] District
safety / PSAP; Nurse / principal; Board / auditor. #strong[Minimum
evidence:] Campus applicability, actual coverage, authorized safe
demonstration, recorded failures, independent sign-off and retest date.

#strong[Inherited source labels:] S07 (cross-check against the official
bibliography before legal adoption).

=== E06 --- Gas leak / chemical plume / lab spill
<e06--gas-leak--chemical-plume--lab-spill>
#strong[Family:] Environmental | #strong[Evidence:] Documented class |
#strong[Status:] UNASSESSED.

#strong[Protective approach:] Inspection; fire/hazmat plan.
#strong[Immediate action:] Protect, evacuate/shelter as indicated.

#strong[Candidate controls:] M02 M03 M15. #strong[Owners:] District
safety / PSAP; Nurse / principal; Board / auditor. #strong[Minimum
evidence:] Campus applicability, actual coverage, authorized safe
demonstration, recorded failures, independent sign-off and retest date.

#strong[Inherited source labels:] S07 (cross-check against the official
bibliography before legal adoption).

=== E07 --- Water/food contamination
<e07--waterfood-contamination>
#strong[Family:] Environmental | #strong[Evidence:] Documented class |
#strong[Status:] UNASSESSED.

#strong[Protective approach:] Public-health protocols. #strong[Immediate
action:] Isolate source; notify health office.

#strong[Candidate controls:] M02 M03 M15. #strong[Owners:] District
safety / PSAP; Nurse / principal; Board / auditor. #strong[Minimum
evidence:] Campus applicability, actual coverage, authorized safe
demonstration, recorded failures, independent sign-off and retest date.

#strong[Inherited source labels:] S07 (cross-check against the official
bibliography before legal adoption).

=== E08 --- Infectious disease outbreak
<e08--infectious-disease-outbreak>
#strong[Family:] Environmental | #strong[Evidence:] Documented class |
#strong[Status:] UNASSESSED.

#strong[Protective approach:] Public-health liaison; sanitation.
#strong[Immediate action:] Implement health guidance.

#strong[Candidate controls:] M02 M03 M15. #strong[Owners:] District
safety / PSAP; Nurse / principal; Board / auditor. #strong[Minimum
evidence:] Campus applicability, actual coverage, authorized safe
demonstration, recorded failures, independent sign-off and retest date.

#strong[Inherited source labels:] S07 (cross-check against the official
bibliography before legal adoption).

=== E09 --- Mass medical crisis/overdose
<e09--mass-medical-crisisoverdose>
#strong[Family:] Environmental | #strong[Evidence:] Documented class |
#strong[Status:] UNASSESSED.

#strong[Protective approach:] Mandatory RCW 28A.210.440: accessible
campus bleeding-control kit; qualifying contents; 2+ trained employees
(more if enrollment \>1,000); annual/after-use inventory and
replacement; AED/EMS integration.\. #strong[Immediate action:] Activate
911/EMS; ensure trained lifesaving aid and accessible kit; replenish and
document after use.\.

#strong[Candidate controls:] M02 M03 M15. #strong[Owners:] District
safety / PSAP; Nurse / principal; Board / auditor. #strong[Minimum
evidence:] Campus applicability, actual coverage, authorized safe
demonstration, recorded failures, independent sign-off and retest date.

#strong[Inherited source labels:] S07 S27 (cross-check against the
official bibliography before legal adoption).

=== I01 --- Power failure
<i01--power-failure>
#strong[Family:] Infrastructure | #strong[Evidence:] Documented class |
#strong[Status:] UNASSESSED.

#strong[Protective approach:] Backup alerts, egress and operations.
#strong[Immediate action:] Manual continuity and safety checks.

#strong[Candidate controls:] M02 M07 M15. #strong[Owners:] District
safety / PSAP; IT / district safety; Board / auditor. #strong[Minimum
evidence:] Campus applicability, actual coverage, authorized safe
demonstration, recorded failures, independent sign-off and retest date.

#strong[Inherited source labels:] S07 (cross-check against the official
bibliography before legal adoption).

=== I02 --- Telecom/radio outage
<i02--telecomradio-outage>
#strong[Family:] Infrastructure | #strong[Evidence:] Documented class |
#strong[Status:] UNASSESSED.

#strong[Protective approach:] Independent channels. #strong[Immediate
action:] Switch to tested alternative.

#strong[Candidate controls:] M02 M07 M15. #strong[Owners:] District
safety / PSAP; IT / district safety; Board / auditor. #strong[Minimum
evidence:] Campus applicability, actual coverage, authorized safe
demonstration, recorded failures, independent sign-off and retest date.

#strong[Inherited source labels:] S07 S09 S35 S40 (cross-check against
the official bibliography before legal adoption).

=== I03 --- HVAC/fire/water failure
<i03--hvacfirewater-failure>
#strong[Family:] Infrastructure | #strong[Evidence:] Documented class |
#strong[Status:] UNASSESSED.

#strong[Protective approach:] Maintenance, alternate occupancy.
#strong[Immediate action:] Site hazard assessment and relocation.

#strong[Candidate controls:] M02 M07 M15. #strong[Owners:] District
safety / PSAP; IT / district safety; Board / auditor. #strong[Minimum
evidence:] Campus applicability, actual coverage, authorized safe
demonstration, recorded failures, independent sign-off and retest date.

#strong[Inherited source labels:] S07 (cross-check against the official
bibliography before legal adoption).

=== I04 --- Transportation accident
<i04--transportation-accident>
#strong[Family:] Infrastructure | #strong[Evidence:] Documented class |
#strong[Status:] UNASSESSED.

#strong[Protective approach:] Rosters/driver comms/EMS plans.
#strong[Immediate action:] Account for passengers and reunify.

#strong[Candidate controls:] M02 M07 M15. #strong[Owners:] District
safety / PSAP; IT / district safety; Board / auditor. #strong[Minimum
evidence:] Campus applicability, actual coverage, authorized safe
demonstration, recorded failures, independent sign-off and retest date.

#strong[Inherited source labels:] S07 (cross-check against the official
bibliography before legal adoption).

=== I05 --- Supply-chain or vendor failure
<i05--supply-chain-or-vendor-failure>
#strong[Family:] Infrastructure | #strong[Evidence:] Foreseeable class |
#strong[Status:] UNASSESSED.

#strong[Protective approach:] Maintenance reserve; alternate suppliers.
#strong[Immediate action:] Continuity plan; risk triage.

#strong[Candidate controls:] M02 M07 M15. #strong[Owners:] District
safety / PSAP; IT / district safety; Board / auditor. #strong[Minimum
evidence:] Campus applicability, actual coverage, authorized safe
demonstration, recorded failures, independent sign-off and retest date.

#strong[Inherited source labels:] S07 (cross-check against the official
bibliography before legal adoption).

=== C01 --- Simultaneous hazards
<c01--simultaneous-hazards>
#strong[Family:] Compound | #strong[Evidence:] Planning class |
#strong[Status:] UNASSESSED.

#strong[Protective approach:] Multi-hazard exercises and decision
review. #strong[Immediate action:] Choose location-specific protective
actions.

#strong[Candidate controls:] M02 M05 M07 M15. #strong[Owners:] District
safety / PSAP; PSAP / principal; IT / district safety; Board / auditor.
#strong[Minimum evidence:] Campus applicability, actual coverage,
authorized safe demonstration, recorded failures, independent sign-off
and retest date.

#strong[Inherited source labels:] S07 (cross-check against the official
bibliography before legal adoption).

=== C02 --- False alert masking real incident
<c02--false-alert-masking-real-incident>
#strong[Family:] Compound | #strong[Evidence:] Documented class; federal
guidance | #strong[Status:] UNASSESSED.

#strong[Protective approach:] Separate real-time occupant protection
from dispatch-led credibility checks and escalation. #strong[Immediate
action:] Maintain active protection for corroborated danger even if one
report is false.

#strong[Candidate controls:] M02 M05 M07 M15. #strong[Owners:] District
safety / PSAP; PSAP / principal; IT / district safety; Board / auditor.
#strong[Minimum evidence:] Campus applicability, actual coverage,
authorized safe demonstration, recorded failures, independent sign-off
and retest date.

#strong[Inherited source labels:] S28 S36 (cross-check against the
official bibliography before legal adoption).

=== C03 --- Unclassified emerging mechanism
<c03--unclassified-emerging-mechanism>
#strong[Family:] Compound | #strong[Evidence:] Unknown/future |
#strong[Status:] UNASSESSED.

#strong[Protective approach:] Capability-based intake and specialists.
#strong[Immediate action:] Protect, document, escalate, reassess.

#strong[Candidate controls:] M02 M05 M07 M15. #strong[Owners:] District
safety / PSAP; PSAP / principal; IT / district safety; Board / auditor.
#strong[Minimum evidence:] Campus applicability, actual coverage,
authorized safe demonstration, recorded failures, independent sign-off
and retest date.

#strong[Inherited source labels:] S01 S07 (cross-check against the
official bibliography before legal adoption).

=== T01 --- Transnational repression of student or family
<t01--transnational-repression-of-student-or-family>
#strong[Family:] Targeted coercion & abduction | #strong[Evidence:]
Documented FBI threat class; campus-specific nexus unverified |
#strong[Status:] UNASSESSED.

#strong[Protective approach:] Confidential victim report; FBI referral
based on verified conduct; no nationality profiling. #strong[Immediate
action:] Protect person, assess specific threat, consult FBI/law
enforcement.

#strong[Candidate controls:] M04 M06 M14 M15. #strong[Owners:] BTAM
team; Attendance / principal; Privacy officer / counsel; Board /
auditor. #strong[Minimum evidence:] Campus applicability, actual
coverage, authorized safe demonstration, recorded failures, independent
sign-off and retest date.

#strong[Inherited source labels:] S42 S43 S53 (cross-check against the
official bibliography before legal adoption).

=== T02 --- Foreign-origin coercion or misuse of school data
<t02--foreign-origin-coercion-or-misuse-of-school-data>
#strong[Family:] Targeted coercion & abduction | #strong[Evidence:]
Documented tactic, K-12-specific scenario | #strong[Status:] UNASSESSED.

#strong[Protective approach:] Verify foreign official requests, MFA,
least-privilege records and monitored exports. #strong[Immediate
action:] Reject unauthenticated request; secure student data and counsel
review.

#strong[Candidate controls:] M04 M06 M14 M15. #strong[Owners:] BTAM
team; Attendance / principal; Privacy officer / counsel; Board /
auditor. #strong[Minimum evidence:] Campus applicability, actual
coverage, authorized safe demonstration, recorded failures, independent
sign-off and retest date.

#strong[Inherited source labels:] S42 S43 S50 (cross-check against the
official bibliography before legal adoption).

=== T03 --- Organized-crime recruitment, debt/extortion or forced courier activity
<t03--organized-crime-recruitment-debtextortion-or-forced-courier-activity>
#strong[Family:] Targeted coercion & abduction | #strong[Evidence:]
Documented recruitment/coercion class; campus nexus unverified |
#strong[Status:] UNASSESSED.

#strong[Protective approach:] Child safeguarding; education, counselor,
specialist and reporting support; prohibit investigative profiling.
#strong[Immediate action:] Safeguard potentially exploited child; notify
authorities per law.

#strong[Candidate controls:] M04 M06 M14 M15. #strong[Owners:] BTAM
team; Attendance / principal; Privacy officer / counsel; Board /
auditor. #strong[Minimum evidence:] Campus applicability, actual
coverage, authorized safe demonstration, recorded failures, independent
sign-off and retest date.

#strong[Inherited source labels:] S44 S45 S51 (cross-check against the
official bibliography before legal adoption).

=== T04 --- Minor labor/sex trafficking exploitation
<t04--minor-laborsex-trafficking-exploitation>
#strong[Family:] Targeted coercion & abduction | #strong[Evidence:]
Established federal school guidance | #strong[Status:] UNASSESSED.

#strong[Protective approach:] Training and disclosure pathway per
Education guidance; mandatory-reporting review. #strong[Immediate
action:] Protect victim and make appropriate professional report.

#strong[Candidate controls:] M04 M06 M14 M15. #strong[Owners:] BTAM
team; Attendance / principal; Privacy officer / counsel; Board /
auditor. #strong[Minimum evidence:] Campus applicability, actual
coverage, authorized safe demonstration, recorded failures, independent
sign-off and retest date.

#strong[Inherited source labels:] S45 S49 S52 (cross-check against the
official bibliography before legal adoption).

=== T05 --- Physical child abduction or luring at school/transit
<t05--physical-child-abduction-or-luring-at-schooltransit>
#strong[Family:] Targeted coercion & abduction | #strong[Evidence:]
Documented general threat; context-specific | #strong[Status:]
UNASSESSED.

#strong[Protective approach:] Attendance accountability, release
controls, supervised pickup, verified transport changes.
#strong[Immediate action:] 911 for credible missing/abducted child;
coordinate reunion and evidence.

#strong[Candidate controls:] M04 M06 M14 M15. #strong[Owners:] BTAM
team; Attendance / principal; Privacy officer / counsel; Board /
auditor. #strong[Minimum evidence:] Campus applicability, actual
coverage, authorized safe demonstration, recorded failures, independent
sign-off and retest date.

#strong[Inherited source labels:] S46 (cross-check against the official
bibliography before legal adoption).

=== T06 --- Custodial interference or unauthorized release
<t06--custodial-interference-or-unauthorized-release>
#strong[Family:] Targeted coercion & abduction | #strong[Evidence:]
Documented WA statutory category | #strong[Status:] UNASSESSED.

#strong[Protective approach:] Current orders and pickup authorizations,
backup decision authority, confidential exceptions. #strong[Immediate
action:] Prevent unauthorized handoff; seek counsel/law enforcement
where warranted.

#strong[Candidate controls:] M04 M06 M14 M15. #strong[Owners:] BTAM
team; Attendance / principal; Privacy officer / counsel; Board /
auditor. #strong[Minimum evidence:] Campus applicability, actual
coverage, authorized safe demonstration, recorded failures, independent
sign-off and retest date.

#strong[Inherited source labels:] S46 S48 (cross-check against the
official bibliography before legal adoption).

=== T07 --- Virtual kidnapping and synthetic ransom claims
<t07--virtual-kidnapping-and-synthetic-ransom-claims>
#strong[Family:] Targeted coercion & abduction | #strong[Evidence:]
Specific FBI PSA 2025-12-05 | #strong[Status:] UNASSESSED.

#strong[Protective approach:] Independent child-safety verification via
trusted channel; preserve original material. #strong[Immediate action:]
Assess actual danger promptly; contact dispatch/FBI; no public
allegation.

#strong[Candidate controls:] M04 M06 M14 M15. #strong[Owners:] BTAM
team; Attendance / principal; Privacy officer / counsel; Board /
auditor. #strong[Minimum evidence:] Campus applicability, actual
coverage, authorized safe demonstration, recorded failures, independent
sign-off and retest date.

#strong[Inherited source labels:] S47 (cross-check against the official
bibliography before legal adoption).

=== T08 --- Nonviolent political/reputational or economic coercion
<t08--nonviolent-politicalreputational-or-economic-coercion>
#strong[Family:] Targeted coercion & abduction | #strong[Evidence:]
Documented broad tactics; local case hypothetical | #strong[Status:]
UNASSESSED.

#strong[Protective approach:] Viewpoint-neutral threat intake,
origin/authentication checks, civil-rights and victim support.
#strong[Immediate action:] Prevent ongoing harassment/data release;
distinguish protected dissent.

#strong[Candidate controls:] M04 M06 M14 M15. #strong[Owners:] BTAM
team; Attendance / principal; Privacy officer / counsel; Board /
auditor. #strong[Minimum evidence:] Campus applicability, actual
coverage, authorized safe demonstration, recorded failures, independent
sign-off and retest date.

#strong[Inherited source labels:] S42 S50 S51 (cross-check against the
official bibliography before legal adoption).

#pagebreak(weak: true)
== 13. Protective capability assurance catalogue
<13-protective-capability-assurance-catalogue>
#strong[Use:] A control is not validated merely because it appears on a
purchase order, has a vendor demonstration, or was discussed in a
tabletop. Independent reviewers record site, relevant population,
preapproved test scope, results, accessibility and change-triggered
retest. #strong[No aggregate score can override failure of accessible
egress, a mandated medical control, or a critical alert channel.]

=== M01 --- Access and egress
<m01--access-and-egress>
#strong[Priority:] P0 | #strong[Owner:] Facilities / principal |
#strong[Current state:] UNASSESSED.

#strong[Representative conditions:] Representative in-scope campus
conditions.

#strong[Evidence for acceptance:] Physical doors, safe egress, drill
coverage.

#strong[Invalidating failure:] Observed failure, access exceptions,
accessibility complaint. #strong[Life-safety gate:] Review for critical
life-safety function.

=== M02 --- Emergency notification and PSAP
<m02--emergency-notification-and-psap>
#strong[Priority:] P0 | #strong[Owner:] District safety / PSAP |
#strong[Current state:] UNASSESSED.

#strong[Representative conditions:] Representative in-scope campus
conditions.

#strong[Evidence for acceptance:] Dual route alerts, dispatch contact,
logs.

#strong[Invalidating failure:] Spoofed command; disconnected classroom.
#strong[Life-safety gate:] Review for critical life-safety function.

=== M03 --- Bleeding-control kits
<m03--bleeding-control-kits>
#strong[Priority:] P0 | #strong[Owner:] Nurse / principal |
#strong[Current state:] UNASSESSED.

#strong[Representative conditions:] Representative in-scope campus
conditions.

#strong[Evidence for acceptance:] Kit content, expiration, trained
staff, inventories.

#strong[Invalidating failure:] Missing supplies or trained personnel.
#strong[Life-safety gate:] Review for critical life-safety function.

=== M04 --- BTAM and student safeguarding
<m04--btam-and-student-safeguarding>
#strong[Priority:] P0 | #strong[Owner:] BTAM team | #strong[Current
state:] UNASSESSED.

#strong[Representative conditions:] Representative in-scope campus
conditions.

#strong[Evidence for acceptance:] Qualified team, review and child
services.

#strong[Invalidating failure:] False attribution, victim
re-traumatization. #strong[Life-safety gate:] Review for critical
life-safety function.

=== M05 --- False-report and swatting protocol
<m05--false-report-and-swatting-protocol>
#strong[Priority:] P0 | #strong[Owner:] PSAP / principal |
#strong[Current state:] UNASSESSED.

#strong[Representative conditions:] Representative in-scope campus
conditions.

#strong[Evidence for acceptance:] Parallel protect-and-verify practice.

#strong[Invalidating failure:] Discipline by accusation; unnecessary
disclosure. #strong[Life-safety gate:] Review for critical life-safety
function.

=== M06 --- Visitor and student release
<m06--visitor-and-student-release>
#strong[Priority:] P0 | #strong[Owner:] Attendance / principal |
#strong[Current state:] UNASSESSED.

#strong[Representative conditions:] Representative in-scope campus
conditions.

#strong[Evidence for acceptance:] Custody restrictions, visitor ID,
verification logs.

#strong[Invalidating failure:] Wrongful denial; unsafe release.
#strong[Life-safety gate:] Review for critical life-safety function.

=== M07 --- School cyber / alerts resilience
<m07--school-cyber--alerts-resilience>
#strong[Priority:] P1 | #strong[Owner:] IT / district safety |
#strong[Current state:] UNASSESSED.

#strong[Representative conditions:] Representative in-scope campus
conditions.

#strong[Evidence for acceptance:] MFA, backups, communications
segregation.

#strong[Invalidating failure:] False instructions; data exposure.
#strong[Life-safety gate:] Review for critical life-safety function.

=== M08 --- Entry screening
<m08--entry-screening>
#strong[Priority:] P1 | #strong[Owner:] Facilities / counsel |
#strong[Current state:] UNASSESSED.

#strong[Representative conditions:] Representative in-scope campus
conditions.

#strong[Evidence for acceptance:] Legal basis; throughput/false-alert
test.

#strong[Invalidating failure:] Disparate treatment, blocked egress.
#strong[Life-safety gate:] Review for critical life-safety function.

=== M09 --- AI camera detections
<m09--ai-camera-detections>
#strong[Priority:] P2 | #strong[Owner:] IT / counsel / evaluator |
#strong[Current state:] UNASSESSED.

#strong[Representative conditions:] Representative in-scope campus
conditions.

#strong[Evidence for acceptance:] Independent annotated tests, baseline,
logs.

#strong[Invalidating failure:] False positives and missed events.
#strong[Life-safety gate:] Review for critical life-safety function.

=== M10 --- SRO/authorized armed coverage
<m10--sroauthorized-armed-coverage>
#strong[Priority:] P2 | #strong[Owner:] Law enforcement / district |
#strong[Current state:] UNASSESSED.

#strong[Representative conditions:] Representative in-scope campus
conditions.

#strong[Evidence for acceptance:] Authority, recurrent qualifications,
dispatch ID.

#strong[Invalidating failure:] Misidentification; injury; disciplinary
harm. #strong[Life-safety gate:] Review for critical life-safety
function.

=== M11 --- Less-lethal and force governance
<m11--less-lethal-and-force-governance>
#strong[Priority:] P2 | #strong[Owner:] Agency / counsel |
#strong[Current state:] UNASSESSED.

#strong[Representative conditions:] Representative in-scope campus
conditions.

#strong[Evidence for acceptance:] Authorized equipment/training, review.

#strong[Invalidating failure:] Injury, unauthorized uses.
#strong[Life-safety gate:] Review for critical life-safety function.

=== M12 --- Detection canine services
<m12--detection-canine-services>
#strong[Priority:] P2 | #strong[Owner:] Specialist handler / legal |
#strong[Current state:] UNASSESSED.

#strong[Representative conditions:] Representative in-scope campus
conditions.

#strong[Evidence for acceptance:] Trained handler, defined search
purpose, accommodations.

#strong[Invalidating failure:] False alert; bite; disability impact.
#strong[Life-safety gate:] Review for critical life-safety function.

=== M13 --- Counter-UxS observation/referral
<m13--counter-uxs-observationreferral>
#strong[Priority:] P2 | #strong[Owner:] District / specialized agency |
#strong[Current state:] UNASSESSED.

#strong[Representative conditions:] Representative in-scope campus
conditions.

#strong[Evidence for acceptance:] Passive observations, authority check.

#strong[Invalidating failure:] Unlawful interdiction; false attribution.
#strong[Life-safety gate:] Review for critical life-safety function.

=== M14 --- FERPA information sharing
<m14--ferpa-information-sharing>
#strong[Priority:] P0 | #strong[Owner:] Privacy officer / counsel |
#strong[Current state:] UNASSESSED.

#strong[Representative conditions:] Representative in-scope campus
conditions.

#strong[Evidence for acceptance:] Need and legal basis; emergency
recipient log.

#strong[Invalidating failure:] Overdisclosure; exercise misuse.
#strong[Life-safety gate:] Review for critical life-safety function.

=== M15 --- Quarterly independent review
<m15--quarterly-independent-review>
#strong[Priority:] P1 | #strong[Owner:] Board / auditor |
#strong[Current state:] UNASSESSED.

#strong[Representative conditions:] Representative in-scope campus
conditions.

#strong[Evidence for acceptance:] Evidence tier and remediation log.

#strong[Invalidating failure:] Unassessed listed as passed.
#strong[Life-safety gate:] Review for critical life-safety function.

#pagebreak(weak: true)
== 14. Washington compliance and legal approval checklist
<14-washington-compliance-and-legal-approval-checklist>
#strong[Legal hierarchy:] Federal constitutional protections control
over inconsistent state practice. Washington requirements may provide
additional protections. This is a planning crosswalk, not legal advice.
Counsel must confirm applicability, updated text and evidence before
declaring legal compliance. #strong[Empty records do not establish
either passing compliance or a proven violation.]

=== C01 --- Safe school plan incl accessibility and reunification
<c01--safe-school-plan-incl-accessibility-and-reunification>
#strong[Authority:] W01 | #strong[Responsible:] District safety /
principal | #strong[Priority:] P0.

#strong[Minimum verification evidence:] Approved current campus plan,
accessible alternatives, reunification contacts. #strong[Status:]
UNASSESSED; district counsel and independent reviewer to determine
applicability and closure.

=== C02 --- Monthly drills while students in session
<c02--monthly-drills-while-students-in-session>
#strong[Authority:] W01 | #strong[Responsible:] Principal |
#strong[Priority:] P0.

#strong[Minimum verification evidence:] Drill dates, times, type,
accessible participation, exceptions. #strong[Status:] UNASSESSED;
district counsel and independent reviewer to determine applicability and
closure.

=== C03 --- Principal incident-command certification
<c03--principal-incident-command-certification>
#strong[Authority:] W01 | #strong[Responsible:] District safety |
#strong[Priority:] P0.

#strong[Minimum verification evidence:] Principal current ICS
certificate and appointed substitute plan. #strong[Status:] UNASSESSED;
district counsel and independent reviewer to determine applicability and
closure.

=== C04 --- Temporary/substitute staff notification
<c04--temporarysubstitute-staff-notification>
#strong[Authority:] W01 | #strong[Responsible:] Principal / HR |
#strong[Priority:] P0.

#strong[Minimum verification evidence:] Documented briefing method and
sample receipt. #strong[Status:] UNASSESSED; district counsel and
independent reviewer to determine applicability and closure.

=== C05 --- Emergency response system and partner coordination
<c05--emergency-response-system-and-partner-coordination>
#strong[Authority:] W02 | #strong[Responsible:] District / 911 PSAP |
#strong[Priority:] P0.

#strong[Minimum verification evidence:] Selected qualifying capability
plus collaborative planning and safe exercise evidence. #strong[Status:]
UNASSESSED; district counsel and independent reviewer to determine
applicability and closure.

=== C06 --- Bleeding-control equipment per campus
<c06--bleeding-control-equipment-per-campus>
#strong[Authority:] W03 | #strong[Responsible:] School nurse /
facilities | #strong[Priority:] P0.

#strong[Minimum verification evidence:] Physical kit placement, required
contents, accessibility. #strong[Status:] UNASSESSED; district counsel
and independent reviewer to determine applicability and closure.

=== C07 --- Bleeding-control training coverage
<c07--bleeding-control-training-coverage>
#strong[Authority:] W03 | #strong[Responsible:] School nurse / HR |
#strong[Priority:] P0.

#strong[Minimum verification evidence:] Enrollment, trained employee
count, course completion records. #strong[Status:] UNASSESSED; district
counsel and independent reviewer to determine applicability and closure.

=== C08 --- Bleeding-control inspections and replacements
<c08--bleeding-control-inspections-and-replacements>
#strong[Authority:] W03 | #strong[Responsible:] School nurse |
#strong[Priority:] P0.

#strong[Minimum verification evidence:] Annual and after-use
inventory/replenishment logs. #strong[Status:] UNASSESSED; district
counsel and independent reviewer to determine applicability and closure.

=== C09 --- Behavior-based multidisciplinary threat assessment
<c09--behavior-based-multidisciplinary-threat-assessment>
#strong[Authority:] W04 | #strong[Responsible:] BTAM director |
#strong[Priority:] P0.

#strong[Minimum verification evidence:] Team composition,
case-processing safeguards, referral outcome review. #strong[Status:]
UNASSESSED; district counsel and independent reviewer to determine
applicability and closure.

=== C10 --- Notice and malicious-report provisions
<c10--notice-and-malicious-report-provisions>
#strong[Authority:] W05 | #strong[Responsible:] Counsel / principal |
#strong[Priority:] P0.

#strong[Minimum verification evidence:] Adopted policy and balanced
reporting/attribution safeguards. #strong[Status:] UNASSESSED; district
counsel and independent reviewer to determine applicability and closure.

=== C11 --- Security staff duties and complaint procedure
<c11--security-staff-duties-and-complaint-procedure>
#strong[Authority:] W06 | #strong[Responsible:] Principal / counsel |
#strong[Priority:] Conditional.

#strong[Minimum verification evidence:] Current role and complaint
policy; family communication. #strong[Status:] UNASSESSED; district
counsel and independent reviewer to determine applicability and closure.

=== C12 --- Annual safety and security provider agreement
<c12--annual-safety-and-security-provider-agreement>
#strong[Authority:] W07 | #strong[Responsible:] District counsel |
#strong[Priority:] Conditional.

#strong[Minimum verification evidence:] Current annually adopted
agreement, community process and training terms. #strong[Status:]
UNASSESSED; district counsel and independent reviewer to determine
applicability and closure.

=== C13 --- Security staffing / force / complaints reporting
<c13--security-staffing--force--complaints-reporting>
#strong[Authority:] W08 | #strong[Responsible:] District compliance |
#strong[Priority:] Conditional.

#strong[Minimum verification evidence:] Annual data submission
confirmation and scope check. #strong[Status:] UNASSESSED; district
counsel and independent reviewer to determine applicability and closure.

=== C14 --- FERPA emergency disclosure documentation
<c14--ferpa-emergency-disclosure-documentation>
#strong[Authority:] F25 L02 | #strong[Responsible:] Privacy officer |
#strong[Priority:] Conditional.

#strong[Minimum verification evidence:] Student-record entry of
articulable/significant threat and each recipient. #strong[Status:]
UNASSESSED; district counsel and independent reviewer to determine
applicability and closure.

=== C15 --- HSEEP-style exercise evidence and corrections
<c15--hseep-style-exercise-evidence-and-corrections>
#strong[Authority:] F29 F30 | #strong[Responsible:] District safety /
evaluator | #strong[Priority:] Proposed.

#strong[Minimum verification evidence:] Exercise objectives, evaluator
sheets, AAR/IP, retest tickets. #strong[Status:] UNASSESSED; district
counsel and independent reviewer to determine applicability and closure.

#pagebreak(weak: true)
== 15. Representative field sampling, exercises and remediation
<15-representative-field-sampling-exercises-and-remediation>
District teams must preapprove all tests and use fictional inputs. Never
trigger actual emergency dispatches, obstruct egress, deploy weapons or
employ live coercive or harmful scenarios. Detailed campus geometry,
patrol schedules and sensor placement belong in restricted local
records. The following samples are a minimum proposed coverage set, not
a certification of readiness.

=== S01 --- Typical classroom
<s01--typical-classroom>
#strong[Conditions:] Standard staffed hours. #strong[Observable
outcome:] Alert received/understood; safe action. #strong[Safe scope:]
At least one ordinary school-day sample.

=== S02 --- Portable or remote teaching space
<s02--portable-or-remote-teaching-space>
#strong[Conditions:] School day. #strong[Observable outcome:] Fallback
and accessible warning. #strong[Safe scope:] Include spaces separate
from main building.

=== S03 --- Sports or outdoor gathering
<s03--sports-or-outdoor-gathering>
#strong[Conditions:] After-school activity. #strong[Observable outcome:]
Accessible alert, staff/PSAP communication. #strong[Safe scope:] Include
changing ambient noise.

=== S04 --- Transportation / loading
<s04--transportation--loading>
#strong[Conditions:] Arrival/departure. #strong[Observable outcome:]
Accountability and warning receipt. #strong[Safe scope:] Coordinate with
transportation; no simulated danger.

=== S05 --- Accessible route / accommodation
<s05--accessible-route--accommodation>
#strong[Conditions:] Ordinary use. #strong[Observable outcome:] Equal
warning and protective alternatives. #strong[Safe scope:] Participant
accommodation and privacy approved.

=== S06 --- Approved degraded-IT exercise
<s06--approved-degraded-it-exercise>
#strong[Conditions:] Controlled test only. #strong[Observable outcome:]
Authenticated fallback without production interruption. #strong[Safe
scope:] IT and dispatch signoff; no real 911 message.

=== S07 --- Independent false-report verification
<s07--independent-false-report-verification>
#strong[Conditions:] Fictional tabletop. #strong[Observable outcome:]
Parallel protection + evidence checks + correction. #strong[Safe scope:]
Use fictional identities, no student records.

=== S08 --- Medical kit and trained-staff coverage
<s08--medical-kit-and-trained-staff-coverage>
#strong[Conditions:] Unannounced administrative inventory, not
emergency. #strong[Observable outcome:] Physical contents and staffing
records. #strong[Safe scope:] No realistic injury simulation around
children.

=== Independent evidence and improvement-plan record
<independent-evidence-and-improvement-plan-record>
Every sampled observation should capture a unique ID, site and date;
written authorization; objective and expected protective effect; actual
conditions; sample denominator; delivered versus missed warnings, false
actions, measured interval and uncertainties; accessibility coverage;
assessor and independent witness; evidence reference; any legal/physical
harm; corrective action owner; due date; and retest result.
#strong[Missing data are UNKNOWN.]

After a failure, record a temporary protection, pause unsafe optional
capabilities when appropriate, report material gaps to the board without
revealing exploitable details, and retest after corrective work. Closure
requires independent evidence of the corrected function under relevant
conditions. \[F29--F30\]

#pagebreak(weak: true)
== 16. Annotated research bibliography and further reading
<16-annotated-research-bibliography-and-further-reading>
#strong[Source-currency note:] The 50-item inherited source ledger
retains Version 11.3 entries and adds FEMA Exercise Evaluation Guides
\[F30\] and U.S. Department of Education emergency-planning guidance
\[F31\]. The central Washington safe-school, emergency-system,
bleeding-control, security-staff and malicious-report statutes, CISA
school-security scope, federal EOP planning, FERPA FAQ and FEMA exercise
doctrine were reviewed against official government pages. The remaining
inherited documents and links have #strong[not] all received fresh
line-by-line review. Confirm the live law and regulations before
adoption. Agency guidance and research are not binding legal authority
unless another rule incorporates them.

#strong[How to use it.] Each entry identifies a primary government
source, publication date or current status, authority class and specific
research application. Read the full text before citing a mandate; a
federal guidance document is not necessarily binding. The links below
lead to agency or legislature publications. The source set is a targeted
research starting point rather than a claim of exhaustive legal review.
Newly added technical and privacy sources F24--F28 have been checked
against the named agency pages; other links remain subject to periodic
link and currency review.

=== National learning networks and federal recommendations
<national-peer-learning-source-brief>
#strong[N01 ·
#link("https://bja.ojp.gov/funding/webinar/fy23-stop-tta-recording")[FY 2023 STOP School Violence Training and Technical Assistance Program]]
\ #emph[DOJ Bureau of Justice Assistance · 2023 · Federal program
presentation.] \ Describes peer-to-peer learning sites, communities of
practice, training tools, and dissemination of program results. This is
a precedent, not confirmation of a newly established nationwide forum.

#strong[N02 ·
#link("https://bja.ojp.gov/program/stop-school-violence-program/overview")[STOP School Violence Program Overview]]
\ #emph[DOJ Bureau of Justice Assistance · Federal program guidance.] \
Describes evidence-based program expectations and distinctions between
allowable program activities and prohibited uses of certain funding
sources. Grants or federal participation are not guaranteed.

#strong[N03 ·
#link("https://www.cisa.gov/sites/default/files/2022-11/k12-school-security-guide-3rd-edition-022022-508.pdf")[K--12 School Security Guide, Third Edition]]
\ #emph[CISA · 2022 · Federal operational guidance.] \ Supports
site-specific vulnerability assessment and layered protective planning;
useful as a common taxonomy for independent peer review.

=== Federal school-security doctrine
<federal-school-security-doctrine>
#strong[F01 ·
#link("https://www.cisa.gov/sites/default/files/publications/k12-school-security-guide-3rd-edition-022022-508.pdf")[K-12 School Security Guide, Third Edition]]
\ #emph[CISA · 2022 · Federal guidance.] \ Primary framework for layered
physical-security design, site-specific assessments, physical-security
elements, and decision sequencing; not a mandate to buy particular
equipment.

#strong[F02 ·
#link("https://www.secretservice.gov/sites/default/files/reports/2020-06/USSS_NTAC_Enhancing_School_Safety_Guide_7.11.18.pdf")[Enhancing School Safety Using a Threat Assessment Model: An Operational Guide]]
\ #emph[U.S. Secret Service NTAC · 2018 · Federal operational guidance.]
\ Foundational behavioral threat assessment and management (BTAM)
methodology; explicitly rejects a demographic or personality attacker
profile.

#strong[F03 ·
#link("https://www.secretservice.gov/sites/default/files/2020-04/Protecting_Americas_Schools.pdf")[Protecting America\'s Schools: A U.S. Secret Service Analysis of Targeted School Violence]]
\ #emph[U.S. Secret Service NTAC · 2019 · Federal research study.] \
Retrospective case analysis informing concern identification,
intervention pathways, and reporting design; descriptive patterns are
not deterministic predictors.

#strong[F04 ·
#link("https://www.secretservice.gov/sites/default/files/reports/2021-03/USSS%20Averting%20Targeted%20School%20Violence.2021.03.pdf")[Averting Targeted School Violence]]
\ #emph[U.S. Secret Service NTAC · 2021 · Federal research study.] \
Case-based analysis of disrupted plots. Supports multidisciplinary
intervention and the importance of early reporting and follow-up.

#strong[F05 ·
#link("https://www.cisa.gov/sites/default/files/2023-05/CISA-USSS%20K-12%20Bystander%20Reporting%20Toolkit_508.pdf")[Improving School Safety Through Bystander Reporting: K-12 Toolkit]]
\ #emph[CISA / U.S. Secret Service · 2023 · Joint federal guidance.] \
Design and improvement of reporting channels, communications, trust,
triage, and pathways to intervention; complement with separate
anti-retaliation controls.

#strong[F06 ·
#link("https://www.cisa.gov/sites/default/files/2024-10/ATRGToolkit508_V2.pdf")[Anonymized Threat Response Guidance Toolkit]]
\ #emph[CISA · 2024 · Federal guidance.] \ Balanced verification and
school response to anonymous threats, hoaxes, and swatting; especially
relevant to preventing adverse effects from deceptive reports.

#strong[F07 ·
#link("https://www.ed.gov/media/document/rems-guide-developing-high-quality-emergency-operations-plans-k-12-schools-2013-113150.pdf")[Guide for Developing High-Quality School Emergency Operations Plans]]
\ #emph[ED / DHS / DOJ / FBI / FEMA / HHS · 2013 · Interagency planning
guidance.] \ End-to-end school EOP methodology: collaboration, scenario
planning, functional annexes, training, exercises, and recovery.

#strong[F08 ·
#link("https://www.cisa.gov/sites/default/files/2024-07/CISA%20K-12%20School%20Security%20Guide%20Companion%20Product%20for%20School-Based%20Law%20Enforcement%20and%20School%20Resource%20Officers_508c.pdf")[School Security Guide Companion for School-Based Law Enforcement and School Resource Officers]]
\ #emph[CISA · 2024 · Federal guidance.] \ Defines high-level roles for
law enforcement/SROs in physical-security assessment and school
partnerships; does not replace state law and local agreements.

#strong[F09 ·
#link("https://www.ed.gov/teaching-and-administration/safe-learning-environments/school-safety-and-security/emergency-planning")[Emergency Planning: Federal School EOP Resources]]
\ #emph[U.S. Department of Education · Reviewed 2026-03-05 · Federal
resource portal.] \ Central federal portal to school planning, district
teams, cyber annexes, recovery, and age-appropriate drills.

#strong[F29 ·
#link("https://preptoolkit.fema.gov/web/hseep-resources/policy-and-guidance")[Homeland Security Exercise and Evaluation Program (HSEEP) Policy and Guidance]]
\ #emph[FEMA · 2020 doctrine; official current resource portal · Federal
exercise guidance.] \ Exercise program planning, objective-based
evaluation and after-action/improvement planning. Use to develop local
acceptance tests; does not establish that a school has been certified or
that an exercise outcome generalizes beyond conditions tested.

#strong[F24 ·
#link("https://www.cisa.gov/sites/default/files/2022-11/ssat-technical-appendix-022022-508.pdf")[K-12 School Security Assessment Tool: Technical Appendix]]
\ #emph[CISA · 2022 · Federal technical guidance.] \ Explains
school-specific scenario selection, detection/delay/response measures
and dependency assessment. Use for integrated capability tests rather
than assuming individual product efficacy.

#strong[F28 ·
#link("https://www.secretservice.gov/sites/default/files/reports/2025-08/What-Is-A-Behavioral-Threat-Assessment-In-School.pdf")[What Is a Behavioral Threat Assessment in School?]]
\ #emph[U.S. Secret Service NTAC · 2025 · Official fact sheet.] \
Clarifies that school BTAM focuses on concerning behaviors,
multidisciplinary evaluation and support; it is not a criminal
investigation, disciplinary process, or demographic attacker profile.

=== Federal risk and emerging threats
<federal-risk-and-emerging-threats>
#strong[F11 ·
#link("https://fsapartners.ed.gov/fsa-print/publication/1007556")[Guidance to Educational Institutions on Swatting Threats, GEN-26-04]]
\ #emph[U.S. Departments of Education and Justice · 2026-09-25 ·
Nonbinding federal guidance.] \ Newest cross-agency swatting guidance
used for district-dispatch precoordination, urgent protection,
verification, and cautious communication.

#strong[F12 ·
#link("https://www.fbi.gov/contact-us/field-offices/philadelphia/news/fbi-philadelphia-warns-of-violent-online-networks-targeting-children-and-vulnerable-populations")[Violent Online Networks Targeting Children and Vulnerable Populations]]
\ #emph[FBI Philadelphia · 2026-09-23 · Federal public warning.] \
Documents child grooming, coerced harmful behavior, and online
exploitation. Agency warning does not establish a campus-specific
incident.

#strong[F13 ·
#link("https://www.fbi.gov/investigate/cyber/alerts/2025/criminals-using-altered-proof-of-life-media-to-extort-victims-in-virtual-kidnapping-for-ransom-scams")[Criminals Using Altered Proof-of-Life Media in Virtual Kidnapping Scams]]
\ #emph[FBI · 2025-12-05 · Federal public warning.] \ Supports immediate
independent child-welfare checks and verification of ransom claims that
may contain altered images or video.

#strong[F14 ·
#link("https://www.ftc.gov/news-events/news/press-releases/2026/05/ftc-begins-enforcing-take-it-down-act")[FTC Begins Enforcing the TAKE IT DOWN Act]]
\ #emph[FTC · 2026-05-19 · Federal law implementation notice.] \
Explains removal-request process for covered platforms and 48-hour
response obligation for valid requests involving nonconsensual intimate
images.

#strong[F15 ·
#link("https://www.cisa.gov/sites/default/files/2023-01/K-12report_FINAL_V2_508c_0.pdf")[Protecting Our Future: Safeguarding K-12 Organizations from Cybersecurity Threats]]
\ #emph[CISA · 2023-01 · Federal cybersecurity guidance.] \ Practical
cyber priorities such as MFA, known vulnerability remediation, backups,
and incident planning for school operations.

#strong[F16 ·
#link("https://www.cisa.gov/sites/default/files/2023-08/K-12_Acquisition_Guidance.pdf")[Cybersecurity Guidance for K-12 Technology Acquisitions]]
\ #emph[CISA · 2023-08 · Federal procurement guidance.] \
Secure-by-design procurement requirements: logs, MFA, patching, no
default passwords, least privileges, vulnerability disclosure.

#strong[F17 ·
#link("https://www.nist.gov/publications/artificial-intelligence-risk-management-framework-ai-rmf-10")[Artificial Intelligence Risk Management Framework 1.0]]
\ #emph[NIST · 2023-01-26 · Voluntary risk-management framework.] \
Govern/Map/Measure/Manage framework for testing AI-alert accuracy, false
positives, privacy, fairness, oversight, and lifecycle governance.

#strong[F18 ·
#link("https://www.faa.gov/sites/faa.gov/files/uas/resources/c_uas/Interagency_Legal_Advisory_on_UAS_Detection_and_Mitigation_Technologies.pdf")[Interagency Legal Advisory on UAS Detection and Mitigation Technologies]]
\ #emph[FAA / DOJ / DHS / FCC · 2020-08-17 · Interagency legal advisory;
check new law.] \ Historical baseline regarding legal hazards of C-UAS
detection and interdiction. Must be read in light of post-2025
conditional law-enforcement authority.

#strong[F19 ·
#link("https://www.justice.gov/ola/media/1436171/dl?inline=")[SAFER SKIES Act and Qualified SLTT Counter-UAS Certification (testimony)]]
\ #emph[FBI / U.S. DOJ · 2026-04 · Federal implementation testimony.] \
Explains limited federally conditioned training, certification, and
task-force pathways for law-enforcement counter-UAS actions; not general
school authority.

#strong[F20 ·
#link("https://www.faa.gov/uas/resources/c_uas")[Counter UAS Resource and Legal Advisory Portal]]
\ #emph[FAA · Living website · Federal regulatory resource.] \ Current
FAA entry point to interagency counter-UAS guidance and
aircraft/spectrum regulatory boundaries.

#strong[F21 ·
#link("https://www.atf.gov/explosives/enforcement-tools-services/detection-canines")[Detection Canines: National Canine Program]]
\ #emph[ATF · Living website · Federal specialized capability guidance.]
\ Defines accredited explosives/accelerant-detection canine capability
and access pathways for qualifying law-enforcement agencies; separate
from tactical bite/apprehension use.

#strong[F22 ·
#link("https://studentprivacy.ed.gov/faq/when-it-permissible-utilize-ferpas-health-or-safety-emergency-exception-disclosures")[FERPA Health or Safety Emergency Exception: FAQ]]
\ #emph[U.S. Department of Education · Living website · Federal privacy
interpretation.] \ Limits education-record disclosure to genuine
actual/impending/imminent emergencies; not a blanket justification for
exercises or surveillance.

#strong[F23 ·
#link("https://www.justice.gov/servicemembers/service-animals-and-assistance-animals-0")[Service Animals and Assistance Animals]]
\ #emph[U.S. Department of Justice · Updated 2024-11-04 · Federal
civil-rights guidance.] \ Supports accommodation planning around canine
security programs and distinguishes working security dogs from protected
service animals.

#strong[F25 ·
#link("https://studentprivacy.ed.gov/faq/does-school-have-record-disclosures-made-under-ferpas-health-or-safety-emergency-exception")[Recording FERPA emergency disclosures]]
\ #emph[U.S. Department of Education, Student Privacy Policy Office ·
Current official FAQ · Interpretive compliance guidance.] \ Explains the
requirement to record the articulable and significant threat supporting
emergency disclosure and the recipients. Check actual law and counsel\'s
interpretation for local implementation.

#strong[F26 ·
#link("https://studentprivacy.ed.gov/faq/may-school-make-disclosures-under-ferpas-health-or-safety-emergency-provision-emergency")[FERPA and emergency preparedness exercises]]
\ #emph[U.S. Department of Education, Student Privacy Policy Office ·
Current official FAQ · Interpretive compliance guidance.] \ Clarifies
that the health-and-safety exception does not permit disclosure simply
for exercise planning. Use synthetic exercise cases.

#strong[F27 ·
#link("https://airc.nist.gov/airmf-resources/airmf/5-sec-core/")[AI RMF Core: Measure]]
\ #emph[NIST · AI RMF 1.0 framework · Voluntary technical guidance.] \
Addresses validation, safety, resilience, accountability and contextual
interpretation of AI systems. Use for camera/analytic tool test plans
and ongoing monitoring, not claims of guaranteed detection.

=== Constitutional and federal law
<constitutional-and-federal-law>
#strong[L01 ·
#link("https://www.archives.gov/founding-docs/constitution/what-does-it-say")[U.S. Constitution, Article VI Supremacy Clause; First, Fourth and Fourteenth Amendments]]
\ #emph[National Archives · Founding text · Binding federal
constitutional law.] \ Federal constitutional protections prevail over
conflicting state policy; provides baseline for speech, searches, force,
due process, and equal protection.

#strong[L02 ·
#link("https://uscode.house.gov/view.xhtml?edition=prelim&num=0&req=granuleid%3AUSC-prelim-title20-section1232g")[Family Educational Rights and Privacy Act, 20 U.S.C. § 1232g]]
\ #emph[U.S. Code (House) · Current code · Binding federal statute.] \
Education-record access and disclosure rules; pair with the Department
of Education emergency exception FAQ for operations.

#strong[L03 ·
#link("https://www.supremecourt.gov/docket/docketfiles/html/public/20-255.html")[Mahanoy Area School District v. B. L., No. 20-255]]
\ #emph[U.S. Supreme Court · 2021-06-23 · Binding judicial precedent.] \
Off-campus student speech retains First Amendment protection;
fact-specific risk and disruption analysis required before action.

#strong[L04 ·
#link("https://www.ftc.gov/business-guidance/resources/complying-take-it-down-act")[Take It Down Act Implementation Guidance]]
\ #emph[FTC · 2026-05 · Federal statute guidance.] \ Describes covered
platform duties and procedures for removal of nonconsensual intimate
imagery including synthetic material.

#strong[F30 · Federal school-security doctrine · FEMA (living site).]
#emph[Exercise Evaluation Guides (EEGs) --- HSEEP Resources.]
#strong[GUIDANCE.] Official:
#link("https://preptoolkit.fema.gov/web/hseep-resources/eegs"). Use to
structure objective-linked observations, documented capability targets,
evaluation and corrective actions; does not certify a campus.

#strong[F31 · Federal school-security doctrine · U.S. Department of
Education (reviewed March 5, 2026).] #emph[Emergency Planning.]
#strong[GUIDANCE.] Official:
#link("https://www.ed.gov/teaching-and-administration/safe-learning-environments/school-safety-and-security/emergency-planning").
Use to distinguish all-hazards EOP planning, exercises and recovery from
CISA\'s narrower crime/violence physical-security guide.

=== Washington implementation guidance
<washington-implementation-guidance>
#strong[F10 ·
#link("https://ospi.k12.wa.us/index.php/student-success/health-safety/school-safety-center/comprehensive-safety-planning")[Comprehensive Safety Planning]]
\ #emph[Washington OSPI · Living website · State implementation
guidance.] \ Maps prevention, protection, mitigation, response, and
recovery to Washington comprehensive safety plans and functional
annexes.

=== Washington statutes and regulations
<washington-statutes-and-regulations>
#strong[W01 ·
#link("https://app.leg.wa.gov/rcw/default.aspx?cite=28A.320.125")[RCW 28A.320.125 --- Safe School Plans and Drills]]
\ #emph[Washington Legislature · Current · Binding Washington law.] \
Requires district plans, protective functional responses, accessibility,
reunification and coordination; use as a compliance crosswalk.

#strong[W02 ·
#link("https://app.leg.wa.gov/rcw/default.aspx?cite=28A.320.126")[RCW 28A.320.126 --- Emergency Response System (Alyssa's Law)]]
\ #emph[Washington Legislature · Current (2025 revision) · Binding
Washington law.] \ Requires schools to collaborate with public safety
answering points and law enforcement on qualifying response-system
capabilities.

#strong[W03 ·
#link("https://app.leg.wa.gov/RCW/default.aspx?cite=28A.210.440")[RCW 28A.210.440 --- Bleeding Control Equipment and Training]]
\ #emph[Washington Legislature · Effective 2026--27 school year ·
Binding Washington law.] \ Sets accessible campus equipment, specific
contents, two trained employees minimum, higher staffing for schools
above 1,000, and inventory after use/annually.

#strong[W04 ·
#link("https://app.leg.wa.gov/rcw/default.aspx?cite=28A.320.123")[RCW 28A.320.123 --- School-Based Threat Assessment Program]]
\ #emph[Washington Legislature · Current · Binding Washington law.] \
Requires behavior- and circumstance-based multidisciplinary assessment
and prohibits suspension or expulsion merely for referral or assessment.

#strong[W05 ·
#link("https://app.leg.wa.gov/rcw/default.aspx?cite=28A.320.128")[RCW 28A.320.128 --- Threat Notification and Knowingly False Reports]]
\ #emph[Washington Legislature · Current · Binding Washington law.] \
Prescribes threat-notification policies and criminalizes certain
intentionally and maliciously or bad-faith knowingly false threat
notifications.

#strong[W06 ·
#link("https://app.leg.wa.gov/rcw/default.aspx?cite=28A.320.124")[RCW 28A.320.124 --- School Safety and Security Staff]]
\ #emph[Washington Legislature · Current · Binding Washington law.] \
Requires clarity about security duties and student conduct; excludes
SROs from formal student discipline responsibilities.

#strong[W07 ·
#link("https://app.leg.wa.gov/rcw/default.aspx?cite=28A.320.1242")[RCW 28A.320.1242 --- Agency and Contractor Agreements]]
\ #emph[Washington Legislature · Current · Binding Washington law.] \
Annual reviewed agreements, training documentation,
placement/performance procedures, and parent/student/community
involvement.

#strong[W08 ·
#link("https://app.leg.wa.gov/rcw/default.aspx?cite=28A.320.1241")[RCW 28A.320.1241 --- Security Staffing and Force Incident Reporting]]
\ #emph[Washington Legislature · Current · Binding Washington law.] \
Annual data on school-security staffing, use-of-force incidents,
arrest/discipline, and complaints; important accountability baseline.

#strong[W09 ·
#link("https://app.leg.wa.gov/rcw/default.aspx?cite=9.41.280")[RCW 9.41.280 --- Dangerous Weapons at Schools]]
\ #emph[Washington Legislature · Current · Binding Washington law.] \
School weapon-possession prohibition and enumerated exceptions.
Exception alone does not authorize a specific force deployment.

#strong[W10 ·
#link("https://app.leg.wa.gov/rcw/default.aspx?cite=10.120.020")[RCW 10.120.020 --- Permissible Peace Officer Use of Force]]
\ #emph[Washington Legislature · Current · Binding Washington law.] \
Officers' force limits, de-escalation, deadly-force restrictions and
special safeguards. Distinct from noncommissioned personnel authority.

#strong[W11 ·
#link("https://app.leg.wa.gov/rcw/default.aspx?cite=9A.16.050")[RCW 9A.16.050 --- Justifiable Homicide by Other Persons]]
\ #emph[Washington Legislature · Current · Binding Washington law.] \
Self-defense and defense-of-others statutory circumstances; requires
counsel/agency review before any district policy references.

#strong[W12 ·
#link("https://app.leg.wa.gov/rcw/default.aspx?cite=28A.600.015")[RCW 28A.600.015 --- Student Discipline and Due Process]]
\ #emph[Washington Legislature · Current · Binding Washington law.] \
Enabling law for substantive and procedural protections in school
suspension/expulsion and emergency removal.

#strong[W13 ·
#link("https://app.leg.wa.gov/wac/default.aspx?cite=392-400-510")[WAC 392-400-510 --- Emergency Removal Limits]]
\ #emph[Washington Legislature · 2025 revision · Binding Washington
rule.] \ Requires sufficient cause of immediate/continuing danger or
extreme disruption; limits duration and requires superintendent
reporting.

#strong[W14 ·
#link("https://app.leg.wa.gov/wac/default.aspx?cite=392-400-515")[WAC 392-400-515 --- Emergency Removal Notice]]
\ #emph[Washington Legislature · 2025 revision · Binding Washington
rule.] \ Parent/student notification, written reasons, timing and
process for emergency removals.

#strong[W15 ·
#link("https://leg.wa.gov/state-laws-and-rules/washington-state-constitution/")[Washington Constitution, Article I, Section 2]]
\ #emph[Washington Legislature · Current · Binding state constitutional
law.] \ Expressly recognizes the U.S. Constitution as supreme law of the
land; state provisions can furnish further protections.

#divider()

=== Document controls and provenance
<document-controls-and-provenance>
#strong[Version:] 17.0 Revision 1, October 26, 2026.
#strong[Supersedes:] all prior stand-alone advisory and annex editions;
does not assert that districts have adopted or exercised any control.
#strong[Consolidated register:] All 56 threat vectors, control mappings
and field-verification criteria are included in this document.
#strong[Scope:] public K--12 Washington; private, tribal and charter
variations and new laws require independent jurisdiction-specific
review. #strong[Update trigger:] material federal or Washington
statutory changes, published agency guidance, independent validation
findings, major incidents with verified generalizable lessons, or new
threats that do not fit existing controls. #strong[Legal review:]
mandatory before adoption of screening/search, privacy disclosures,
authorized armed personnel, less-lethal use, canine force, or UAS
interdiction.

=== Research and source-maintenance protocol
<research-and-source-maintenance-protocol>
For each material change to this advisory, the reviewing team should
retain a #emph[one-page evidence record] recording the following:

- #strong[Primary publication and date.] Link to the agency or
  legislature itself, note the date of the document and any subsequent
  amendment; archive a permitted copy or durable reference.
- #strong[Kind of authority.] Identify constitutional rule, current
  statute/regulation, binding decision, nonbinding guideline, research
  study, public warning or planning hypothesis. Do not let an agency
  publication silently become a claimed legal requirement.
- #strong[Affected population and place.] Distinguish national
  incidents, Washington-wide law, a verified local episode and a
  hypothetical exercise. Do not extrapolate from one attack to
  prevalence across schools.
- #strong[Decision implications.] State the exact hazard, the existing
  register entry, candidate countermeasure and accountable
  decision-maker; identify any existing controls that may already
  mitigate it.
- #strong[Effectiveness and failure modes.] Note study design,
  comparison group, measured effect, confidence limits, adverse
  consequences, implementation cost and vendor dependence; classify
  unsupported products as unvalidated.
- #strong[Rights and legal approval.] Record anticipated effects on
  speech, privacy, disability accommodations, searches, due process,
  emergency disclosure and force authority; obtain written
  counsel/agency concurrence as appropriate.
- #strong[Change acceptance.] Require an independently reviewed test
  plan, measurable acceptance criterion, fallback method, redress path
  and explicit date for reevaluation before calling a change effective.

#strong[Independent evidence gap:] Government practice guides explain
how to design programs, but they do not by themselves establish a
quantified reduction in casualty rates from armed staff, canine teams,
AI cameras or weapons scanners. Seek comparative studies and reliable
local measurement before approving these as \'proven\' school-safety
improvements.

#strong[Suggested review cadence:] check binding Washington sources each
quarter and before a district vote; review CISA, NTAC, FBI, FAA, FTC, ED
and NIST sources after a material announcement; reconfirm local
capability through annual exercises and after significant incidents or
infrastructure changes. Monitor for relevant updates without treating
every bulletin as grounds for additional surveillance or procurement.

#text-block[
Courtesy of NERVOSYS, LLC · Contact: Dr. Adam Erickson · Independent
research; not an official government publication.
]
#pagebreak(weak: true)
#metadata(none)#label("17-accelerated-technology-and-cybersecurity-assurance")
#pagebreak(weak: true)
== 17. Technology acceleration, attacker-defender adaptation and cybersecurity assurance
<17-accelerated-technology-and-cybersecurity-assurance-r1-2>
#text-block[
Mandatory crosscutting safety discipline · G0 + ASCS-00 through ASCS-04

]
#strong[Policy direction.] Do not freeze school defense around static
technologies. Establish a rolling integration program that scans for
capabilities, uses controlled proof-of-concept trials, tests against
realistic failure modes, and incorporates validated improvements. Treat
rapid attacker-defender co-evolution as an operational planning
assumption, not as evidence that a specific novel product is effective.
Procurement speed does not substitute for independent evidence or legal
authority.

#card[
#strong[Cyber-physical nonnegotiables:] No connected technology may
control the legality of force; no remote command may bypass life-safety
egress requirements; no ordinary cloud outage may prevent emergency
communications; no device may collect or share unnecessary student or
firearm-owner information; and no school may claim operational
validation without independent safety, cybersecurity, privacy, and
accessibility reviews.
]
=== 17.1 Continuous technology integration cycle
<continuous-technology-integration-cycle>
#figure(
  align(center)[#table(
    columns: (33.33%, 33.33%, 33.33%),
    align: (auto,auto,auto,),
    table.header([Stage], [Decision and owner], [Evidence before next
      stage],),
    table.hline(),
    [1 / Sense], [Safety lead identifies a defined gap and candidate
    solution], [Specific hazard, alternatives, preliminary
    benefits/harms, legal boundary],
    [2 / Isolate], [IT/OT owner tests in a segmented lab without student
    data], [Architecture, threat model, vendor update and disclosure
    terms],
    [3 / Challenge], [Independent testers perform authorized tabletop,
    resilience and usability tests], [False positives, accessibility,
    outage behavior, cyber test artifacts, rollback],
    [4 / Pilot], [District conducts bounded opt-in/site-authorized
    trials], [Human oversight, consent where applicable, independent
    fire/privacy sign-off],
    [5 / Monitor], [Security operations records real field failure and
    drift], [Metrics, incidents, patches, civil-rights complaints,
    false-alarm review],
    [6 / Adapt / Retire], [Governance board approves improvement or
    decommission], [Documented corrective action, reevaluation date,
    safe uninstall or rollback],
  )]
  , kind: table
  )

=== 17.2 Treat cybersecurity as a life-safety hazard
<treat-cybersecurity-as-a-life-safety-hazard>
Threat model deliberate cyber intrusion, accidental misconfiguration,
insider abuse, supply-chain compromise, communication loss, malicious or
deceptive sensor inputs, ransomware, and vendor abandonment. Systems in
scope include camera networks, analytics, acoustic detection,
door/access control, emergency paging and mass notification, radio/cloud
relay, dispatch links, visitor systems, robotics, and digital records.
Protect confidentiality, integrity and availability, but place life
safety and lawful human control above convenience.

=== 17.3 Required cybersecurity controls and acceptance tests
<required-cybersecurity-controls-and-acceptance-tests>
#figure(
  align(center)[#table(
    columns: (33.33%, 33.33%, 33.33%),
    align: (auto,auto,auto,),
    table.header([Control], [Required behavior], [Acceptance method],),
    table.hline(),
    [CY-01 / Inventory], [Identify every networked critical asset and
    support dependency], [Physical-to-logical inventory reconciliation],
    [CY-02 / Vendor assurance], [Secure defaults, lifecycle support,
    vulnerability reporting and updates], [Contract and product dossier
    review],
    [CY-03 / Isolation], [Separate safety systems from student networks;
    least-privilege admin], [Authorized segmentation and MFA checks],
    [CY-04 / Safe fallback], [Free egress and manual alerting survive
    outages and cyber incidents], [Coordinated non-disruptive simulated
    outage],
    [CY-05 / Alert integrity], [Authenticate critical signals; verify
    before coercive intervention], [False-positive / delayed-message
    tabletop],
    [CY-06 / Maintenance], [Known-risk patching, change records,
    rollback capability], [Staged patch and restoration demonstration],
    [CY-07 / Privacy], [Minimize records, restrict access, prevent
    surveillance creep], [Data-flow and rights audit],
    [CY-08 / Recovery], [Maintain cyber incident plan, tested backups
    and recovery pathways], [Incident exercise and restoration review],
    [CY-09 / Adversarial QA], [Independent, authorized challenge-testing
    in safe test boundaries], [Test approval, evidence, retest
    documentation],
    [CY-10 / Lifecycle], [Retire unsafe technology, preserve human
    authority and override], [Annual approval and retirement drill],
  )]
  , kind: table
  )

=== 17.4 Operational integration by subsystem
<operational-integration-by-subsystem>
- #strong[Detection (ASCS-01):] sensor confidence and provenance, model
  drift, tamper detection and independent human verification; no
  automatic use-of-force authorization.
- #strong[Doors and barriers (ASCS-02):] local/mechanical exit remains
  code-compliant; failed network and compromised controller have safe,
  reviewed behaviors. Never install a software-only lock-in.
- #strong[Canines (ASCS-03):] digital support tools are optional and do
  not replace certified handlers, humane operation or constitutional
  constraints. No unverified digital trigger justifies a search.
- #strong[Professional responders (ASCS-04):] secure communications and
  positive incident verification; authorized human decisions remain
  reviewable and bound to law.
- #strong[Medical response:] paper/offline casualty procedures,
  redundant radios and physically available supplies if software systems
  fail.
- #strong[Prevention / G0:] secure-storage participation data is not a
  firearm-owner registry; privacy separation and independent redress are
  mandatory.

=== 17.5 Governance, adversarial testing and public accountability
<governance-adversarial-testing-and-public-accountability>
Develop a NIST CSF 2.0 profile under #emph[Govern, Identify, Protect,
Detect, Respond, Recover]. Require board-approved risk acceptance for
critical exceptions, a separate cyber incident commander, and
transparent aggregate outcomes. Authorized red-team exercises must use
written scope, supervised laboratory or off-hours conditions, and
fail-safe halt procedures. Do not publish device passwords, precise
school-network topologies or exploitation details in the public
repository.

=== 17.6 Deployment gates and evidence limits
<deployment-gates-and-evidence-limits>
#strong[Hard stop:] deploy no critical connected security system without
an owner, documented maintenance lifetime, safe offline behavior, a
credible cyber response plan, and independent validation of
fire/accessibility and rights protections. A successful pilot or
pen-test does not prove that school shootings have been prevented.
Maintain a continuous evidence register and reassess after material
incidents, vulnerabilities, or product updates.

#text-block[
Reference basis: NIST CSF 2.0 (2024); NIST SP 800-82 Rev. 3 (2023); NIST
SP 800-218 (2022); CISA K-12 cybersecurity guidance. NIST SP 800-82 Rev.
4 is a public draft as of October 2026 and is not treated here as a
final standard.

]
#pagebreak(weak: true)
#metadata(none)#label("threat-driven-modernization-revc")
#pagebreak(weak: true)
== 18. Threat-driven protective technology: acquisition, evidence and adaptation
<threat-driven-protective-technology-acquisition-evidence-and-adaptation>
#text-block[
#strong[Version 17.0 Revision 1 AI assurance carried forward · 26
October 2026.] This supersedes any interpretation of Section 17 that
technology should be adopted merely because it is new. Its adoption,
scope and pace are functions of established and credibly emerging
threats, site exposure, measured control gaps, and defensible evidence.

]
#text-block[
#strong[System-level decision rule.] #emph[Threat signal → corroboration
→ exposure and baseline → protective gap → least intrusive alternatives
→ controlled test → independent life-safety, legal and cybersecurity
gates → limited deployment → reassessment or retirement.] Early
experimentation is desirable; uncontrolled deployment is not.
]
=== 18.1 Threat intelligence and confidence levels
<threat-intelligence-and-confidence-levels>
Maintain a dated, owner-signed threat register. Label each signal
#strong[established] (documented pattern with credible evidence),
#strong[emerging] (new capability or tactic supported by credible
evidence but uncertain prevalence), or #strong[hypothesis]
(low-confidence scenario for horizon scanning only). Record the source,
applicable population, time horizon, exposure relevance, contradictory
evidence, uncertainty and privacy constraints. Avoid presenting national
incidents as campus-specific probability. Do not use ideological
identity, lawful firearm ownership or protected speech as a risk proxy.

=== 18.2 Technology must answer a specific protective question
<technology-must-answer-a-specific-protective-question>
Before considering any product, identify what may fail in a
mass-shooting prevention or protection pathway, what existing safeguards
do, what observable improvement is needed, and what non-technological
alternative may be more effective. Prefer practical improvements in
access prevention, trusted reporting, verified alerts, code-compliant
barriers, accessible evacuation and bleeding control when these close
the gap. New detection devices, automated analytics, canine teams and
advanced responders remain optional unless separately supported by
evidence and legal authorization.

#figure(
  align(center)[#table(
    columns: (25%, 25%, 25%, 25%),
    align: (auto,auto,auto,auto,),
    table.header([Threat / maturity], [Protective gap], [Potential
      response, including non-tech], [Required evidence or hold point],),
    table.hline(),
    [#strong[TD-01] \ Established], [Youth access to unsecured
    firearms], [Access prevention and voluntary storage
    support], [Caregiver education, discounted safe storage, lawful
    temporary storage referrals \ #emph[Test:] Independent privacy
    audit; anonymous pre/post storage practices; no firearm-owner
    registry],
    [#strong[TD-02] \ Established], [Credible threats missed or
    mischaracterized], [Human triage, consistent referrals, fair-process
    corrections], [Accessible reporting pathways, multidisciplinary
    threat assessment, human review \ #emph[Test:] Timeliness,
    false-report handling, documentation, appeals and non-retaliation],
    [#strong[TD-03] \ Established], [Delayed warnings or unsafe
    protective action], [Notification, accessible egress and immediate
    protective action], [Redundant alerts, code-approved doors,
    accessibility plans, manual fallback \ #emph[Test:] Timed authorized
    drills, fire/AHJ and disability-access approval, degraded-mode
    testing],
    [#strong[TD-04] \ Established / evolving], [Compromised connected
    safety technology], [Integrity and availability of alert/access
    systems], [Segmentation, authenticated alerts, updates, backups and
    manual operation \ #emph[Test:] Authorized secure-environment tests;
    verified egress and response continuity during outage],
    [#strong[TD-05] \ Emerging technique], [Fabricated or manipulated
    threat information], [Verification before intrusive actions; ability
    to correct false records], [Human source review, provenance checks,
    independent case audit \ #emph[Test:] Blinded false-report
    exercises, correction and appeal, measurable error rates],
    [#strong[TD-06] \ Emerging capability], [Unmanned or remote-enabled
    disruption], [Recognize and communicate hazards without unauthorized
    interference], [Observer reporting, protective procedures, referral
    to authorized agencies \ #emph[Test:] Jurisdiction/legal check,
    low-risk tabletop; no unapproved counter-UAS actions],
    [#strong[TD-07] \ Technology-induced hazard], [Unvalidated automated
    weapons detection], [Reliable verification without discriminatory or
    hazardous escalation], [Human-in-loop trials; preserve alternative
    alerting and emergency decisions \ #emph[Test:] Pre-registered
    independent precision/recall, subgroup assessment where lawful, no
    autonomous force],
    [#strong[TD-08] \ Crosscutting governance risk], [Institutional
    misuse or chilling participation], [Independent oversight, lawful
    limits and trustworthy voluntary participation], [Purpose-limited
    data, complaint channels, separation from enforcement intelligence \
    #emph[Test:] External review, redress timelines, access-log
    inspection, non-retaliation verification],
  )]
  , kind: table
  )

=== 18.3 A two-speed innovation program
<a-two-speed-innovation-program>
#card-grid(
[
#strong[Fast track: discovery and sandbox] \ Monthly evidence intake,
tabletop studies, bench prototypes, accessibility and privacy reviews.
Keep experimental systems disconnected from live alarms, access control
and personal student records.
],
[
#strong[Controlled track: life-safety deployment] \ Site-specific trials
only after independent safety, cyber, legal and human-factors reviews.
Require reliable manual fallback, rollback, assigned maintenance owner
and reviewable consent/data practices.
],
)
Conduct quarterly threat/control-gap reviews and immediate review after
a credible significant incident, substantiated new attack technique,
exploited product vulnerability or material system change. A change in
the threat environment can accelerate #emph[assessment]\; it cannot
waive lawful authority, safe egress or independent validation.

=== 18.4 Decision record, measurement and withdrawal
<decision-record-measurement-and-withdrawal>
Each investment requires a #strong[Threat-to-Technology Decision
Record]: source and confidence; population and campus exposure; severity
and consequence; baseline controls and unmet requirement; alternatives;
proposed capability and failure modes; efficacy evidence; false alarms
and missed detections; equity/privacy and 2A impacts; OT/cyber
dependencies; lifecycle cost; acceptance criteria; named owner; and
sunset/reassessment date.

Metrics should include reporting-to-human-review time, protective alert
reach and latency in approved exercises, accessible egress outcomes,
false positive/negative behavior, offline functionality, staff training
coverage, time-to-remediate vulnerabilities, complaint redress, and
long-run program participation. Use pre-registered tests and report
uncertainty; never invent a shooting-prevention effectiveness
percentage. Compare against the current baseline rather than simply
counting installed equipment.

#text-block[
#strong[Automatic no-go / suspend.] Blocked or nonaccessible egress;
autonomous force or unauthorized armed response; uncorroborated personal
targeting; coercive firearm-owner disclosure; unexplained disparate
treatment; student data transmitted outside legal purpose; compromised
alert/control integrity; no safe offline mode; unusable complaint
process; or claims of efficacy without adequate evidence. An independent
reviewer may stop the pilot.
]
=== 18.5 Governance, sources and limitations
<governance-sources-and-limitations>
Threat assessment and adoption boards must include school leadership,
independent evaluation, fire and accessibility authorities, the CISO,
privacy/civil-rights counsel, family/community representation, and
appropriately authorized emergency responders. Separate the vendor from
test design and acceptance; publish only non-sensitive aggregate
results. Preserve a confidential site-specific annex outside the public
repository.

#text-block[
#strong[Reference anchors:] CISA K-12 School Security Guide (3rd ed.,
2022), CISA SSAT, U.S. Secret Service NTAC (2021), NIST CSF 2.0, NIST SP
800-82 Rev. 3 (final, 2023), and CISA K-12 cybersecurity guidance. NIST
SP 800-82 Rev. 4 (2026) is a public draft and is not presented as a
final standard. All described controls are proposed and #strong[not]
site-certified.

]
#metadata(none)#label("ai-promise-v16-0-revd")
#pagebreak(weak: true)
== 19. The promise and limitations of AI for mass-shooting prevention and protection
<the-promise-and-limitations-of-ai-for-mass-shooting-prevention-and-protection>
#text-block[
#strong[Decision premise.] AI is potentially a useful #emph[defensive
force multiplier] for information handling, assurance, training and
independent testing. Its role is determined by a documented threat and
unmet protective gap; novelty or vendor claims alone do not justify
deployment. Published evidence does not establish that AI can reliably
predict who will commit a school shooting or independently prevent mass
violence. Human accountability, lawful authority and manual life-safety
paths remain mandatory.
]
=== 19.1 Where AI may help across the system
<where-ai-may-help-across-the-system>
The following opportunities are #strong[proposals to evaluate, not
proven school-shooting countermeasures]. A plausible general-purpose AI
use does not constitute evidence of effectiveness in an occupied K--12
campus. Every concept must be compared with trained personnel, ordinary
software, building improvements and non-technological alternatives.

#figure(
  align(center)[#table(
    columns: (25%, 25%, 25%, 25%),
    align: (auto,auto,auto,auto,),
    table.header([Concern], [Potential AI contribution], [Human/safety
      boundary], [Evidence status],),
    table.hline(),
    [AI-01 \ Child firearm-access prevention], [Opt-in educational
    assistants can explain secure storage, translate caregiver
    checklists, compare product attributes and answer family questions
    with verified sources.], [Do not identify gun owners, infer
    household firearms, collect serial numbers, or report participants
    to law enforcement.], [Near-term assistant; protection outcomes
    unproven],
    [AI-02 \ Behavioral reporting and assessment], [Assist authorized
    multidisciplinary teams by deduplicating incoming reports, flagging
    missing context, summarizing cited evidence, and routing urgent
    human review.], [Never generate an offender profile, automated risk
    score, disciplinary ruling, watchlist, or law-enforcement referral
    from protected traits, political expression or uncorroborated
    claims.], [Constrained pilot with human decisions],
    [AI-03 \ Video, acoustic and multi-sensor detection], [AI may fuse
    signals to help a trained operator review possible gunfire or other
    acute hazards and rapidly check supporting evidence.], [Cannot serve
    as sole basis for lockdown, coercive intervention, identity matching
    or use of force; record false alarms and environmental
    drift.], [Experimental school-specific performance],
    [AI-04 \ Classrooms, barriers and egress], [Help audit maintenance
    records, accessibility, hardware certification, door faults, drill
    findings and code deviations. Support simulation of safe evacuation
    options.], [AI must never lock students in, independently command
    access-control hardware, block accessible exits, or override
    fire-safety systems.], [Near-term maintenance support; no autonomous
    control],
    [AI-05 \ Canines and specialist detection], [Assist handlers with
    scheduling, welfare monitoring, exercise documentation and aggregate
    quality assurance of canine teams.], [No unsupported claim that AI
    or canines can predict a shooter. Do not automate animal deployment
    or treat alerts as guilt.], [Administrative support; detection
    benefit unverified],
    [AI-06 \ Pre-arrival protective and professional response], [Help an
    authorized human dispatcher assemble verified alerts, accessible
    occupancy information, and interoperable incident updates.], [Never
    autonomously select targets, authorize force, dispatch coercive
    action on a model-only finding, or provide automated engagement
    commands.], [Bounded information support; no autonomous force],
    [AI-07 \ Medical readiness and casualty reduction], [Improve
    training refreshers, inspect bleed-control kit availability,
    translate instructions, support supply forecasts and approved triage
    exercises.], [Never replace clinical judgment or provide
    patient-specific autonomous triage in actual emergencies without
    validated authorization.], [Near-term logistics/training; triage
    research only],
    [AI-08 \ Cybersecurity and adversarial resilience], [Analyze
    permitted telemetry for anomalous device behavior, prioritize
    patches, inventory internet-connected school safety equipment, and
    support supervised incident response.], [Treat AI models as attack
    surfaces: prompt injection, poisoned data, vendor compromise, model
    drift, and exfiltration. Preserve independent manual life-safety
    fallback.], [Promising SOC support; qualification required],
    [AI-09 \ Civil rights, accountability and evidence
    integrity], [Support privacy-preserving audits of complaint-handling
    times, procedural consistency, retention compliance and disparate
    impacts in aggregate.], [No identity-based or ideology-based
    scoring, secret surveillance, compelled disclosure or unreviewable
    automated findings.], [Administrative analytics with strict
    guardrails],
    [AI-10 \ Shared learning and emerging threat analysis], [Summarize
    de-identified after-action findings, map evidence gaps and surface
    new public research for peer review and controlled updates.], [No
    distribution of exploitable site security information or student
    PII; AI-generated conclusions require source checking.], [Near-term
    summarization; impact to be evaluated],
  )]
  , kind: table
  )

=== 19.2 A safety case for every AI capability
<a-safety-case-for-every-ai-capability>
#card-grid(
[
#strong[Human-led, lower-consequence assistance]
Opt-in educational Q&A; translation; supply and maintenance analysis;
public-source synthesis; anonymized after-action summaries. A trained
person checks output before any consequential use.

],
[
#strong[Restricted, higher-consequence applications]
Student-related threat triage; live sensor fusion; incident alert
routing; law-enforcement interfaces; building access; patient
information. These demand stronger evidence, documented authority,
independent review, and a tested non-AI fallback.

],
)
#text-block[
#strong[Nondelegable decisions.] An AI model cannot determine that an
individual is dangerous, impose discipline, initiate a nonconsensual
search, disclose protected student records, command confinement, or
authorize use of force. AI must never autonomously operate weapons or
select targets. Emergency human action remains governed by applicable
law, professional standards and demonstrable facts; an AI alert alone is
not sufficient.
]
=== 19.3 Threat-driven qualification and measurement
<threat-driven-qualification-and-measurement>
#strong[Step A --- State the hazard:] Identify the specific,
evidence-supported threat and plausible defensive failure. Name the
intended use, impacted population and what an adequate non-AI baseline
achieves. #strong[Step B --- Establish evidence:] Separate vendor
demonstrations, general-purpose benchmarks, independent analogous
deployments and verified local field tests. Do not equate classification
accuracy with violence prevented. #strong[Step C --- Sandbox:] Prefer
synthetic or genuinely de-identified data and physically isolated
simulations, with no live student decisions. #strong[Step D ---
Controlled pilot:] Allow tightly constrained, overseen pilots only after
privacy, student-rights, accessibility, cybersecurity, medical, fire and
legal reviews. #strong[Step E --- Monitor and revoke:] Revalidate after
material model, firmware, threat or environment changes; suspend
immediately on a critical safety or rights failure.

#figure(
  align(center)[#table(
    columns: (33.33%, 33.33%, 33.33%),
    align: (auto,auto,auto,),
    table.header([Qualification measure], [Required
      evidence], [Disqualifying concern],),
    table.hline(),
    [Validity and error], [Pre-registered false positives/negatives,
    calibration, subgroup analysis, dataset shift, uncertainty and
    human-review latency.], [Unbounded false accusations, excessive
    missed alerts, opaque vendor claims.],
    [Life safety], [Manual override, power/network loss, accessible
    egress and first-responder workflows tested by qualified
    authorities.], [Exit obstruction; autonomous confinement; inability
    to operate without AI.],
    [Cybersecurity], [Supplier provenance, least privilege, adversarial
    testing, update/rollback plan, logging and compromise-response
    exercise.], [Model compromise with unsafe physical consequence or
    uncontrolled data access.],
    [Lawful and equitable use], [Purpose limitation, FERPA/other
    applicable law review, appeal/correction, protected-trait impact
    checks and independent oversight.], [Secret profiling,
    viewpoint-based targeting, unlawful disclosure, denial of redress.],
    [Benefit and proportionality], [Incremental improvement versus
    non-AI baseline, lifecycle cost, operator workload and harm
    analysis.], [No clear safety benefit, unmanageable surveillance or
    maintenance burden.],
  )]
  , kind: table
  )

=== 19.4 Adversarial co-evolution and model-specific cybersecurity
<adversarial-co-evolution-and-model-specific-cybersecurity>
As defenders adopt automation, attackers may exploit sensors, generate
misleading information, contaminate datasets, manipulate language-model
inputs, spoof alert pathways or seek unauthorized access to safety
infrastructure. The security program must model #emph[both] ordinary
system compromise and adversarial-machine-learning mechanisms such as
data poisoning, evasion, prompt injection and sensitive-data extraction.
AI-assisted cyber monitoring is itself subject to these threats. Public
documentation should describe assurance methods without publishing
specific campus blind spots, access-control configurations or exploit
sequences.

=== 19.5 Civil liberties and the trust required for voluntary cooperation
<civil-liberties-and-the-trust-required-for-voluntary-cooperation>
AI must not transform voluntary firearm-safe-storage outreach into
collection of ownership or household data. Threat-management support
must focus on corroborated conduct, never demographic or political
profiling. Participation data from retailers, shooting organizations and
families must remain segregated from law-enforcement intelligence except
where independently supported lawful disclosure is necessary. FERPA and
other applicable privacy law constrain student-record access and
redisclosure. A documented human appeal, correction mechanism and
genuinely independent complaint channel are prerequisites for
high-impact use.

=== 19.6 90-day research and evaluation agenda
<day-research-and-evaluation-agenda>
#card[
=== Days 0--30 · Baseline and governance
<days-030-baseline-and-governance>
Choose no more than three low-consequence candidate applications (e.g.,
opt-in secure-storage educational content, maintenance analytics, and
de-identified research summaries). Create data-flow diagrams, identify
the legal basis and accessible alternative, recruit independent
reviewers and pre-register evaluation endpoints. Do not ingest
identifiable student or ownership records.

]
#card[
=== Days 31--60 · Red-team and comparative exercises
<days-3160-red-team-and-comparative-exercises>
Compare AI-supported performance to trained human/ordinary software
baselines using synthetic or approved data. Test hallucinations,
subgroup error, false alarms, adversarial prompts, outages and operator
overreliance. Log all critical failures, fix or abandon failed
applications, and document the need for human verification.

]
#card[
=== Days 61--90 · Publication decision
<days-6190-publication-decision>
Independent evaluator issues continue / modify / discontinue decisions
for each low-risk pilot. Release aggregate findings, limitations and
costs without sensitive site information. Any proposal touching live
alerts, door controls, individual assessments or use of force must enter
a separate higher-assurance process; 90 days alone cannot certify that
use.

]
=== 19.7 Source register and evidence limits
<source-register-and-evidence-limits>
+ #link("https://www.nist.gov/itl/ai-risk-management-framework")[NIST AI Risk Management Framework 1.0]
  --- Valid/reliable, safe, secure/resilient, privacy, fairness,
  explainability and accountability.
+ #link("https://www.nist.gov/publications/artificial-intelligence-risk-management-framework-generative-artificial-intelligence")[NIST Generative AI Profile (AI 600-1)]
  --- GenAI-specific evaluation and controls.
+ #link("https://www.nist.gov/publications/adversarial-machine-learning-taxonomy-and-terminology-attacks-and-mitigations-0")[NIST Adversarial Machine Learning 2025]
  --- Evasion, poisoning, privacy attacks and model abuse.
+ #link("https://www.secretservice.gov/sites/default/files/reports/2020-06/USSS_NTAC_Enhancing_School_Safety_Guide_7.11.18.pdf")[USSS NTAC, Enhancing School Safety]
  --- No reliable student attacker profile; emphasize behaviors and
  human threat assessment.
+ #link("https://www.cisa.gov/resources-tools/resources/k-12-school-security-guide-3rd-edition")[CISA K-12 School Security Guide]
  --- Campus-specific, layered assessment; technology is only one
  element.
+ #link("https://studentprivacy.ed.gov/faq/does-ferpa-permit-sharing-education-records-outside-law-enforcement-officials-mental-health")[Department of Education FERPA FAQ on threat teams]
  --- Purpose limitations and restrictions on redisclosure of education
  records.
+ #link("https://www.nist.gov/cyberframework")[NIST Cybersecurity Framework]
  --- Govern, identify, protect, detect, respond and recover.

#text-block[
#strong[Public-research limitation:] These are prospective applications
and evaluation requirements, not tested performance claims or legal
advice. AI capabilities and legal requirements change; formal district
deployment requires up-to-date source review, authorization and
independent on-site validation. Release: Version 17.0 Revision 1 Version
17.0 Revision 1 (scenario-specific engineering update), 26 October 2026.

]
#pagebreak(weak: true)
#metadata(none)#label("specific-threat-countermeasure-v17")
#pagebreak(weak: true)
== 20. Specific threat scenarios, safeguards and qualification
<20-threat-specific-assurance>
#strong[Version 17.0 Revision 1 engineering objective.] Translate
general prevention and response recommendations into observable threat
conditions, proportionate protective actions, accountable owners,
measurable test results and explicitly prohibited failure modes. This is
a public non-tactical specification: deployment-ready plans require
confidential local appendices and independent authority review.

#callout[
#strong[Evidence hierarchy.] Legal/code obligation ≠ demonstrated
shooting-outcome effect. Established prevention mechanisms, professional
guidance, tested components and speculative technologies must be labeled
separately. Success in a tabletop or pilot is not proof of casualty
reduction.
]
=== 20.1 Defensive process
<defensive-process>
#strong[Observe & corroborate → classify urgency → choose the least
harmful effective safeguard → verify human authority → test the control
→ record results → improve or withdraw.] Do not equate lawful firearm
ownership, an identity category, protected expression or an AI score
with an individualized threat.

=== 20.2 Scenario-based protective requirements
<scenario-based-protective-requirements>
#card[
==== T01 · Household firearm accessible to a minor
<t01-household-firearm-accessible-to-a-minor>
#strong[Observable condition:] Caregiver identifies an unlocked firearm
or accessible key/code. #strong[Defensive control:] Voluntary locked and
unloaded storage guidance; protect combinations; discounted safe or lock
referral. #strong[Owner:] Community firearm-safety lead. #strong[Test:]
Anonymous opt-in adoption survey, lock voucher accounting, and caregiver
comprehension exercise. #strong[Stop:] Ownership reporting required or
security intervention based solely on ownership.

]
#card[
==== T02 · Firearm in relatives', friends', or shared-care locations
<t02-firearm-in-relatives-friends-or-shared-care-locations>
#strong[Observable condition:] Caregiver concern about access during
visits or custody transitions. #strong[Defensive control:] Universal
caregiver discussion guide; voluntary peer-to-peer secure-storage
conversation; translated materials. #strong[Owner:] Family engagement
coordinator. #strong[Test:] Usability test with volunteer caregivers
across household types. #strong[Stop:] Program conditions school access
on parental ownership disclosure.

]
#card[
==== T03 · Unsecured firearm left in a vehicle
<t03-unsecured-firearm-left-in-a-vehicle>
#strong[Observable condition:] Voluntary report that firearm was
previously left accessible in a vehicle. #strong[Defensive control:]
Avoid unattended vehicle storage; voluntary locked storage education;
lawful temporary storage referrals. #strong[Owner:] Community retailer
and caregiver network. #strong[Test:] Anonymized scenario questionnaire
and program distribution audit. #strong[Stop:] Law-enforcement vehicle
search derived from education enrollment data.

]
#card[
==== T04 · Credible communicated threat or planning leakage
<t04-credible-communicated-threat-or-planning-leakage>
#strong[Observable condition:] Specific observed statements or behavior
with corroborating context. #strong[Defensive control:]
Multidisciplinary, behavior-based assessment; documented corroboration;
supportive interventions; emergency referral only where justified.
#strong[Owner:] School threat assessment chair. #strong[Test:] Tabletop
case review with synthetic facts and independent review of
proportionality. #strong[Stop:] Unsupported coercion or unsupported
record transfer.

]
#card[
==== T05 · Malicious, mistaken, or uncorroborated accusation
<t05-malicious-mistaken-or-uncorroborated-accusation>
#strong[Observable condition:] Anonymous allegation lacking
independently corroborated conduct. #strong[Defensive control:] Separate
intake from finding; preserve exculpatory information; corrective
review, time limits and appeals. #strong[Owner:] Civil rights officer /
independent reviewer. #strong[Test:] Synthetic false-report exercise
with review by legal and student representatives. #strong[Stop:] Student
punishment, political profiling or irreversible label without support.

]
#card[
==== T06 · Suspected weapon or violence near school arrival/access area
<t06-suspected-weapon-or-violence-near-school-arrivalaccess-area>
#strong[Observable condition:] Direct human report of potential weapon
or danger, not algorithmic inference alone. #strong[Defensive control:]
Trained human confirmation where safe; dispatch escalation;
campus-specific protective action; accessible notification.
#strong[Owner:] School incident commander / 911 dispatch. #strong[Test:]
No-live-weapon notification tabletop; measure decision and alert chain.
#strong[Stop:] Protective action depends entirely on a network sensor or
unvalidated classifier.

]
#card[
==== T07 · False or missed acoustic/visual firearm alarm
<t07-false-or-missed-acousticvisual-firearm-alarm>
#strong[Observable condition:] Sensor activates without verified
incident, or misses simulated signal. #strong[Defensive control:]
Independent sensor benchmark; source provenance; human verification;
alternate reporting channel. #strong[Owner:] Technology assurance lead.
#strong[Test:] Controlled authorized synthetic tests, blinded
false-positive and false-negative assessments. #strong[Stop:] Vendor
cannot disclose validation data; false alerts trigger irreversible
action.

]
#card[
==== T08 · Threat reported while groups are in hallways or common areas
<t08-threat-reported-while-groups-are-in-hallways-or-common-areas>
#strong[Observable condition:] Verified immediate threat with mixed
locations and conflicting movement instructions. #strong[Defensive
control:] Preplanned options-based training; intelligible multi-channel
guidance; trained staff judgement. #strong[Owner:] Emergency
preparedness lead. #strong[Test:] Accessible, non-violent exercise with
multiple mobility profiles and observers. #strong[Stop:] Single
inflexible command unnecessarily exposes or traps occupants.

]
#card[
==== T09 · Classroom door hardware fails or impedes egress
<t09-classroom-door-hardware-fails-or-impedes-egress>
#strong[Observable condition:] Routine inspection finds fault,
incompatible accessory, or emergency release failure. #strong[Defensive
control:] Code-reviewed listed hardware; scheduled inspection; manual
opening and release; accessibility testing. #strong[Owner:] Facilities /
fire code authority. #strong[Test:] Qualified walk-through under
power-off and simulated panic conditions. #strong[Stop:] Any tested exit
obstruction or inability to release from inside.

]
#card[
==== T10 · Person with disability cannot perceive or follow protective instruction
<t10-person-with-disability-cannot-perceive-or-follow-protective-instruction>
#strong[Observable condition:] Audible-only alert or obstructed
accessible exit. #strong[Defensive control:] Multimodal accessible
alerts, individualized support planning, accessible refuge/egress
review. #strong[Owner:] ADA/504 coordinator. #strong[Test:] Inclusive
drill with disabled participants and voluntary accommodations.
#strong[Stop:] Protective protocol excludes or isolates disabled
occupants.

]
#card[
==== T11 · Power or communications outage during incident
<t11-power-or-communications-outage-during-incident>
#strong[Observable condition:] Loss of power, WAN, cellular, or security
control unit. #strong[Defensive control:] Tested backup power; manual
public address / radio alternatives; fail-safe access and written
procedures. #strong[Owner:] Facilities / IT / incident command.
#strong[Test:] Authorized loss-of-power functional test with observer
and fire authority. #strong[Stop:] Any power loss locks an occupied exit
or disables all emergency notification.

]
#card[
==== T12 · Spoofed alert, ransomware, or compromised access-control system
<t12-spoofed-alert-ransomware-or-compromised-access-control-system>
#strong[Observable condition:] Unexpected vendor login, unsigned
command, inconsistent emergency message. #strong[Defensive control:]
MFA; least privilege; segmentation; signed updates; manual override;
offline incident playbook. #strong[Owner:] CISO / physical security
owner. #strong[Test:] Authorized tabletop and isolated cyber-physical
failure injection (no live student impact). #strong[Stop:] Remote
operator can close all egress or issue unverified lethal-threat
instructions.

]
#card[
==== T13 · Life-threatening bleeding before EMS arrival
<t13-life-threatening-bleeding-before-ems-arrival>
#strong[Observable condition:] Observed injury requiring immediate
emergency medical response. #strong[Defensive control:] Bleeding-control
kits, trained personnel, accessible cache locations, EMS handoff
coordination. #strong[Owner:] School nurse / EMS liaison. #strong[Test:]
Skills-based medical training and equipment inspection; coordinate with
qualified clinicians. #strong[Stop:] Kits inaccessible or training not
sustained.

]
#card[
==== T14 · Delayed police arrival during an active threat
<t14-delayed-police-arrival-during-an-active-threat>
#strong[Observable condition:] Dispatch acknowledges incident but units
are not yet on scene. #strong[Defensive control:] Protective actions,
verified alarms, trained communications lead, EMS staging; only legally
authorized professional security with oversight. #strong[Owner:]
District emergency lead / law enforcement agency. #strong[Test:]
Multi-agency tabletop; timed non-weapon exercise; authority and ID
checks. #strong[Stop:] Unqualified staff armed or force authority
delegated to software.

]
#card[
==== T15 · Canine false indication, injury, or unreliable deployment
<t15-canine-false-indication-injury-or-unreliable-deployment>
#strong[Observable condition:] Canine proposed for explosives/firearms
screening or a positive indication occurs. #strong[Defensive control:]
Qualified canine/handler credentialing; validated application-specific
reliability; welfare and student safety review. #strong[Owner:] Canine
program supervisor / independent evaluator. #strong[Test:] Double-blind
controlled screening trials; documented incident review. #strong[Stop:]
Insufficient canine validation or foreseeable student bite/exposure
risk.

]
#card[
==== T16 · Misidentified person or unauthorized on-site use of force
<t16-misidentified-person-or-unauthorized-on-site-use-of-force>
#strong[Observable condition:] Confusing observations; responder has
incomplete incident picture. #strong[Defensive control:] Qualified
law-enforcement coordination; identification and restraint standards;
independent force review; medical response. #strong[Owner:] Authorized
law enforcement / independent oversight. #strong[Test:] Legal policy
review, credentials audit and scenario-based decision exercise without
weapons. #strong[Stop:] Unlawful force policy; missing chain of command
or independent review.

]
#card[
==== T17 · AI-generated accusation, synthetic media, or automated threat score
<t17-ai-generated-accusation-synthetic-media-or-automated-threat-score>
#strong[Observable condition:] Suspicious synthetic audio/video or
automated recommendation presents urgent allegation. #strong[Defensive
control:] Source verification, human case review, multiple independent
observations and challenge process. #strong[Owner:] AI assurance officer
\/ threat team. #strong[Test:] Adversarial synthetic exercise, subgroup
error analysis and documentation review. #strong[Stop:] Model
recommendation is treated as proof or enables automatic police action.

]
#card[
==== T18 · After-event reunification confusion or sensitive-data leakage
<t18-after-event-reunification-confusion-or-sensitive-data-leakage>
#strong[Observable condition:] Families receive contradictory or
over-detailed status messages. #strong[Defensive control:] Single
authorized family information lead, secure verification, accessible
multilingual updates. #strong[Owner:] Reunification coordinator /
privacy officer. #strong[Test:] Family-facing tabletop, multilingual
review, redacted communication audit. #strong[Stop:] Live roster exposed
or misinformation uncontrolled.

]
=== 20.3 Five cross-cutting qualification gates
<five-cross-cutting-qualification-gates>
+ #strong[Necessity:] identify a documented threat, exposed population
  and unmet protective gap; consider low-tech alternatives.
+ #strong[Protection:] demonstrate plausible benefit and measure alert
  delay, errors, accessibility and secondary hazards.
+ #strong[Rights:] document lawful authority, FERPA restrictions,
  nondiscrimination, due process, community input and complaint
  mechanisms.
+ #strong[Cyber-resilience:] validate vendor access, updates,
  segmentation, identity controls, offline fallback and incident
  response.
+ #strong[Independent acceptance:] a board-designated evaluator
  documents objective evidence and approves, restricts, suspends or
  rejects the capability.

=== 20.4 Release and decision authority
<release-and-decision-authority>
Publish only de-identified scenarios and aggregated validation outcomes.
Withhold detailed campus maps, physical bypass or penetration methods,
school-specific timing diagrams, sensitive credentials, identities of
threat reporters and student case materials. A district safety director
cannot override a fire authority\'s egress determination; procurement
staff cannot waive privacy/constitutional gates; AI and sensors cannot
authorize physical force.

=== 20.5 Practical first 90 days
<practical-first-90-days>
#strong[Days 1--30:] audit baseline readiness and rights, collect
incident categories, map owners and missing documentation. #strong[Days
31--60:] run non-violent synthetic tabletop/functional tests for
accessible alerts, outage release and false reports. #strong[Days
61--90:] independently examine results; adopt low-regret measures,
remediate failures and initiate separately authorized research pilots
for unvalidated technologies. No 90-day plan constitutes field
certification of life-safety equipment or armed response.

=== 20.6 Supporting materials
<supporting-materials>
See the separate #emph[Threat Scenario and Countermeasure Engineering
Specification, Version 17.0 Revision 1]\; its machine-readable JSON/CSV
registers are the controlling source for identifiers, test steps,
responsible owners and deployment-stop rules. Legal and factual
references are recorded in the source register.

#metadata(none)#label("logical-advisory-reasoning")
#pagebreak(weak: true)
== 21. Verifiable advisory reasoning
<verifiable-advisory-reasoning>
The companion engine evaluates declarative Boolean rules over approved
anonymous assertions. It keeps logical results separate from source
currency and institutional authority. Missing facts remain unknown;
matching assertions are not authenticated evidence.

Each assessment identifies the engine and knowledge versions, the
knowledge SHA-256, accepted Boolean assertions, predicate outcomes, and
a rule-by-rule reasoning certificate. A separate Python checker replays
the result against the original request and a trusted knowledge bundle.
This detects altered verdicts or substituted assertions; it does not
prove that an assertion is true or certify a school.

Agents must preserve the structured result and disclose missing facts
and source-review limitations. Generated prose cannot change rule
verdicts. Unreviewed, conflicting, withdrawn, or expired sources require
human review. The default assessment date is the frozen knowledge
reference date; an explicit date is required when current source status
matters.

The supported constraint language is specified in the public reasoning
contract. It provides six advisory outcomes: not applicable, unknown
scope, needs evidence, assertions match, gap for review, and deployment
hold. There are no autonomous enforcement or equipment-control actions.
