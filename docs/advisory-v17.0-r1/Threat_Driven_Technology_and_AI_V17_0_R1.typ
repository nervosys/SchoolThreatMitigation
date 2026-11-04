// Editable print source for Version 17.0 Revision 1.
// Shared styles, covers, cards and tables are in publication.typ.
#import "publication.typ": *
#show: publication.with(title: "Threat Driven Technology and AI | Version 17.0 Revision 1", guide: false, compact: true)

#metadata(none)#label("publication-content")
#hero[
#text-block[
Technology program · Version 17.0 Revision 1

]
= Emerging Threats and Adaptive Protective Technology
<emerging-threats-and-adaptive-protective-technology>
Evidence first; rapid experimentation without unsafe deployment

#cover-note[
#cover-note[
Publication 17.0 Revision 1. Editorial corrections and verifiable
advisory reasoning; independent acceptance and site validation remain
pending.

]
]
]
== Threat-driven triggers for investment
<threat-driven-triggers-for-investment>
Technology adoption starts only when a threat class is substantiated, an
existing protective gap is documented and alternative human/process
safeguards are compared. An emerging tactic may justify isolated
research, not live autonomy. Revisit the threat register after relevant
incidents, credible vendor findings, research or validated field
failures.

#figure(
  align(center)[#table(
    columns: (33.33%, 33.33%, 33.33%),
    align: (auto,auto,auto,),
    table.header([Candidate], [Legitimate research
      question], [Deployment boundary],),
    table.hline(),
    [AI-assisted triage], [Can humans organize de-identified synthetic
    reports faster without more false escalation?], [No prediction of an
    individual shooter or automatic police dispatch],
    [Gunshot/acoustic detectors], [Are false alarm and miss rates
    acceptable in site-appropriate, independently measured
    conditions?], [No autonomous lockdown, suspect designation or
    force],
    [Multimodal accessible alerts], [Do students and staff receive
    consistent understandable protection messages under
    disruptions?], [Accessible manual fallback and dispatch coordination
    required],
    [Networked door and access systems], [Do controls preserve
    code-compliant egress through outage or compromise?], [Independent
    AHJ signoff before any live connection],
    [Canine programs], [For which specific screening task, if any, is
    performance validated and cost justified?], [No general claim of
    shooting prevention; handler/welfare/rights compliance],
    [Cyber defensive analytics], [Can threats to critical systems be
    detected without student surveillance?], [Constrain telemetry,
    vendor access and automatic changes],
  )]
  , kind: table
  )

== Procurement decision record
<procurement-decision-record>
Record threat class, population exposure, baseline performance,
prospective causal pathway, independent evidence, detailed failure
effects, cybersecurity requirements, residual safety/rights risk, vendor
lock-in and cost. A low-tech fix that performs as well with less harm
should be preferred for that use case.

== Two-speed adoption
<two-speed-adoption>
#card-grid(
[
#card[
=== Sandbox exploration
<sandbox-exploration>
Synthetic data, physical isolation, opt-in non-identifying studies,
rapid terminate/retrain decisions; no direct influence on live alerts or
access control.

]
],
[
#card[
=== Life-safety qualification
<life-safety-qualification>
Independent evidence, cyber-physical validation, accessibility and fire
review, human command authority, disaster recovery and renewal audits.

]
],
)
== Cybersecurity is a safety gate
<cybersecurity-is-a-safety-gate>
Apply NIST CSF Govern, Identify, Protect, Detect, Respond and Recover.
Require secure updates, strong identity controls, supplier
accountability, reliable offline fallback and exercises for spoofed
alerts, network loss and ransomware. Any remotely exploitable pathway to
unsafe confinement blocks production approval.

== AI specific limitations
<ai-specific-limitations>
Dataset selection bias, synthetic deepfakes, hallucinations, domain
shift and attacker adaptation must be explicitly tested. A model used
for incident summaries cannot be assumed capable of predicting an attack
or assigning probable guilt. Human reviewers own every consequential
decision, and must be able to challenge model assertions.
