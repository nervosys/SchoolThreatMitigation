// DEFENSE-TECH FUNCTIONAL ACCENT VERSION 14.5
// Restrained blue / teal / amber defense-technology briefing style; independent publication without agency insignia or endorsement.
// Independent school-safety report; no agency seals, logos, or claims of endorsement.
#import "design_system.typ": NAVY, NAVY2, GOLD, TEAL, AMBER, INK, MUTED, LINE, PALE, BODY_FONT, BODY_SIZE, PAGE_H1, PAGE_H2, PAGE_H3
#set document(title: "School Safety & Layered Threat Mitigation — Systems-Based Security Reference Version 14.5", author: "Courtesy of NERVOSYS, LLC — Contact: Dr. Adam Erickson", keywords: ("school safety", "Washington K-12", "CISA", "U.S. Secret Service", "threat mitigation"))
#set page(paper: "us-letter", margin: (top: 0.75in, bottom: 0.75in, left: 0.75in, right: 0.75in),
  header: context [#text(font: "Inter", size: 7.5pt, weight: "semibold", fill: MUTED)[COURTESY OF NERVOSYS, LLC  /  WASHINGTON K–12] #h(1fr) #text(font: "Inter", size: 7.5pt, fill: MUTED)[CONTACT: DR. ADAM ERICKSON]],
  footer: context [#text(font: "Inter", size: 7.5pt, fill: MUTED)[COURTESY OF NERVOSYS, LLC — DR. ADAM ERICKSON] #h(1fr) #text(font: "Inter", size: 7.5pt, weight: "bold", fill: GOLD)[#link("https://nervosys.ai")[https://nervosys.ai]] #h(1fr) #text(font: "Inter", size: 7.5pt, weight: "bold", fill: NAVY)[#counter(page).display()]]
)
#set text(font: BODY_FONT, size: BODY_SIZE, fill: INK)
#set par(justify: false, leading: 0.64em, spacing: 0.62em)
#set heading(numbering: none)
#show heading.where(level: 1): it => block(above: 17pt, below: 8pt, breakable: false)[
  #text(font: "Inter", size: PAGE_H1, weight: "bold", fill: NAVY)[#it.body]
  #v(3pt)
  #line(length: 100%, stroke: (paint: GOLD, thickness: 1.15pt))
]
#show heading.where(level: 2): it => block(above: 14pt, below: 7pt, breakable: false)[
  #text(font: "Inter", size: PAGE_H2, weight: "bold", fill: NAVY)[#it.body]
  #v(3pt)
  #line(length: 100%, stroke: (paint: GOLD, thickness: 1.15pt))
]
#show heading.where(level: 3): it => block(above: 12pt, below: 5pt, breakable: false)[
  #text(font: "Inter", size: PAGE_H3, weight: "bold", fill: TEAL)[#it.body]
]
#show heading.where(level: 4): it => block(above: 8pt, below: 3pt, breakable: false)[
  #text(font: "Inter", size: 10pt, weight: "semibold", fill: rgb("#263C49"))[#it.body]
]
#let horizontalrule = [#line(length: 100%, stroke: (paint: GOLD, thickness: 0.6pt))]
#let endnote(num, contents) = [#stack(dir: ltr, spacing: 3pt, super[#num], contents)]

// COVER: The ONLY raster image in the publication is this decorative background.
// Every title, metadata field, rule, footer, and page after the cover is Typst-native content.
#set page(paper: "us-letter", margin: 0pt, header: none, footer: none)
#place(top + left, image("assets/cover_background.png", width: 8.5in, height: 11in, fit: "cover"))
#place(top + left, dx: 0.75in, dy: 0.75in)[
  #text(font: "Inter", size: 7.7pt, weight: "bold", tracking: 0.7pt, fill: rgb("#C4D9E1"))[INDEPENDENT SCHOOL SAFETY ANALYSIS / WASHINGTON K–12]
  #h(1fr)
  #text(font: "Inter", size: 7.7pt, weight: "bold", fill: rgb("#C4D9E1"))[VERSION 14.5]
]
#place(top + left, dx: 0.75in, dy: 1.32in, line(length: 7in, stroke: 0.7pt + rgb("#68828D")))
#place(top + left, dx: 0.75in, dy: 1.88in)[
  #text(font: "Inter", size: 9pt, weight: "bold", tracking: 1.4pt, fill: rgb("#39C2DC"))[SYSTEMS-BASED SECURITY REFERENCE]
]
#place(top + left, dx: 0.75in, dy: 2.38in)[
  #text(font: "Inter", size: 34pt, weight: "bold", fill: white)[SCHOOL SAFETY]
  #v(2pt)
  #text(font: "Inter", size: 33pt, weight: "bold", fill: white)[& LAYERED THREAT]
  #v(2pt)
  #text(font: "Inter", size: 33pt, weight: "bold", fill: white)[MITIGATION]
]
#place(top + left, dx: 0.75in, dy: 4.50in)[
  #rect(width: 0.80in, height: 3pt, fill: rgb("#19A6C5"))
  #h(6pt)
  #rect(width: 0.35in, height: 3pt, fill: rgb("#0E847C"))
  #h(6pt)
  #rect(width: 0.16in, height: 3pt, fill: rgb("#D49552"))
]
#place(top + left, dx: 0.75in, dy: 4.86in)[
  #block(width: 5.8in)[
    #text(font: "Inter", size: 9pt, weight: "bold", fill: rgb("#D9E9EE"))[GOVERNING-BOARD DECISIONS / OPERATIONAL PROTECTION / FIELD ASSURANCE]
    #v(13pt)
    #text(font: "Inter", size: 10.8pt, fill: rgb("#C6D6DE"))[A defense-in-depth policy and operational guide for Washington K–12 schools, integrating prevention, protective action, technology assurance, legal compliance and official-source research.]
  ]
]
#place(bottom + left, dx: 0.75in, dy: -1.55in)[
  #text(font: "Inter", size: 8pt, weight: "bold", fill: rgb("#E4D0B1"))[PUBLIC REFERENCE  /  READINESS STATUS: NOT VALIDATED]
  #v(8pt)
  #line(length: 7in, stroke: 0.6pt + rgb("#526B70"))
  #v(10pt)
  #text(font: "Inter", size: 9pt, fill: white)[Courtesy of NERVOSYS, LLC  /  Contact: Dr. Adam Erickson]
  #v(5pt)
  #text(font: "Inter", size: 9pt, weight: "bold", fill: rgb("#5FC9E0"))[#link("https://nervosys.ai")[https://nervosys.ai]]
  #v(8pt)
  #text(font: "Inter", size: 7pt, fill: rgb("#AEC0C9"))[Independent research; not issued or endorsed by CISA or any government agency.]
]
#pagebreak()

// EXECUTIVE SUMMARY: Typst-native editable type, panels, lines and two-column grid. NO image().
#set page(paper: "us-letter", margin: (top: 0.75in, bottom: 0.75in, left: 0.75in, right: 0.75in), header: none, footer: none)
#text(font: "Inter", size: 7.5pt, weight: "bold", fill: NAVY)[BOARD-LEVEL BRIEF / WASHINGTON K–12] #h(1fr) #text(font: "Inter", size: 7.5pt, weight: "bold", fill: NAVY)[VERSION 14.5]
#v(8pt)
#line(length: 100%, stroke: 0.6pt + rgb("#AFC3CD"))
#v(12pt)
#text(font: "Inter", size: 25pt, weight: "bold", fill: NAVY)[Executive summary]
#v(8pt)
#line(length: 100%, stroke: 2.4pt + rgb("#128EAF"))
#v(14pt)
#text(font: "Inter", size: 10pt, weight: "semibold", fill: NAVY)[School safety requires layered prevention, reliable warnings, immediate occupant protection, and lifesaving care before outside responders arrive. The objective is to reduce harm—not merely acquire security technology.]
#v(15pt)
#block(fill: NAVY, stroke: (left: 3pt + rgb("#D39657")), inset: 12pt)[
  #text(font: "Inter", size: 7.5pt, weight: "bold", fill: rgb("#91DBE5"))[GOVERNING PLANNING STANDARD]
  #v(5pt)
  #text(font: "Inter", size: 9pt, weight: "semibold", fill: white)[Do not rely on police arrival within five minutes. Ensure every occupied setting receives actionable instructions and can initiate safe protective and medical measures while qualified responders are en route.]
]
#v(16pt)
#grid(columns: (1fr, 1fr), column-gutter: 14pt, row-gutter: 16pt,
  block(stroke: (top: 2pt + rgb("#128EAF")), inset: (top: 7pt, right: 3pt, bottom: 1pt, left: 0pt))[
    #text(font: "Inter", size: 10.3pt, weight: "bold", fill: NAVY)[01 / Close mandatory life-safety gaps]
    #v(5pt)
    #text(font: "Inter", size: 8.1pt)[Verify Washington school safety plans, drills, accessible procedures, responder coordination and statutory bleeding-control equipment, training and inspections. Assign interim protections to critical deficiencies.]
  ],
  block(stroke: (top: 2pt + rgb("#0B7D76")), inset: (top: 7pt, right: 3pt, bottom: 1pt, left: 0pt))[
    #text(font: "Inter", size: 10.3pt, weight: "bold", fill: NAVY)[02 / Prevent and authenticate threats]
    #v(5pt)
    #text(font: "Inter", size: 8.1pt)[Use behavior-based multidisciplinary assessment and trusted reporting for violence, cyberbullying, coercion, abduction and targeting. Independently verify allegations and synthetic evidence without dismissing genuine danger.]
  ],
  block(stroke: (top: 2pt + rgb("#128EAF")), inset: (top: 7pt, right: 3pt, bottom: 1pt, left: 0pt))[
    #text(font: "Inter", size: 10.3pt, weight: "bold", fill: NAVY)[03 / Prove first-minutes performance]
    #v(5pt)
    #text(font: "Inter", size: 8.1pt)[Test accessible alerts, shelter or evacuation decisions, egress, backup communication, EMS coordination and trauma care in classrooms, portable buildings, transportation and outdoor activities. Time actual protective action.]
  ],
  block(stroke: (top: 2pt + rgb("#0B7D76")), inset: (top: 7pt, right: 3pt, bottom: 1pt, left: 0pt))[
    #text(font: "Inter", size: 10.3pt, weight: "bold", fill: NAVY)[04 / Authorize advanced controls selectively]
    #v(5pt)
    #text(font: "Inter", size: 8.1pt)[Consider screening, AI cameras, counter-UxS detection, canines and protective personnel for documented gaps. Require lawful authority, qualified operators, independent trials, error analysis, oversight and effective fallbacks.]
  ],
)
#v(16pt)
#text(font: "Inter", size: 10.8pt, weight: "bold", fill: NAVY)[Decision requested from district leadership]
#v(6pt)
#block(fill: rgb("#EDF3F5"), stroke: (left: 3pt + rgb("#D39657")), inset: 10pt)[
  #text(font: "Inter", size: 8.3pt)[*Authorize principals to lead beyond minimum compliance:* approve a 90-day campus assurance and improvement program with named owners, resources and a fast approval route for safe pilots. Require leaders to identify failures, develop creative alternatives, share useful results and independently close critical gaps.]
]
#v(14pt)
#text(font: "Inter", size: 7.5pt, fill: MUTED)[*Evidence standard:* documented → inspected → exercised → independently verified. *Rights:* protect constitutional speech and due process, privacy, disability access and lawful limits on force. Neither an accusation nor an AI alert establishes wrongdoing. *Readiness:* unassessed.]
#v(1fr)
#line(length: 100%, stroke: .6pt + rgb("#AFC3CD"))
#v(7pt)
#text(font: "Inter", size: 7pt, weight: "semibold", fill: MUTED)[COURTESY OF NERVOSYS, LLC  /  DR. ADAM ERICKSON] #h(1fr) #link("https://nervosys.ai")[#text(font: "Inter", size: 7pt, fill: GOLD)[https://nervosys.ai]]
#pagebreak()

// INTERIOR (vector text, tables, typographic rules, and live links)
#set page(paper: "us-letter", margin: (top: 0.75in, bottom: 0.75in, left: 0.75in, right: 0.75in),
  header: context [#text(font: "Inter", size: 7pt, weight: "semibold", fill: MUTED)[SCHOOL SAFETY  /  WASHINGTON K–12] #h(1fr) #text(font: "Inter", size: 7pt, fill: MUTED)[INDEPENDENT POLICY ADVISORY]],
  footer: context [#text(font: "Inter", size: 7pt, fill: MUTED)[COURTESY OF NERVOSYS, LLC — DR. ADAM ERICKSON] #h(1fr) #text(font: "Inter", size: 7pt, weight: "bold", fill: GOLD)[#link("https://nervosys.ai")[https://nervosys.ai]] #h(1fr) #counter(page).display()]
)
#text(font: "Inter", size: 7.7pt, fill: MUTED)[Independent research — not issued or endorsed by CISA or another government agency. Website: #link("https://nervosys.ai")[https://nervosys.ai]]
#v(16pt)
#outline(depth: 2, title: [Contents])
#pagebreak()

#pagebreak()
= Implementation at a glance
<field-guide-at-a-glance>
#text(size: 10pt, fill: rgb("#5a5a5a"))[A decision sequence for school boards, administrators, and safety teams. Start with occupant protection and independent evidence, not equipment selection.]
#v(11pt)
#grid(columns: (1fr, 1fr, 1fr), gutter: 10pt,
  block(fill: rgb("#eef4f7"), inset: 11pt, stroke: (top: 2pt + rgb("#60717B")))[
    #text(size: 8pt, weight: "bold", fill: rgb("#555555"))[P0 / FIRST 30 DAYS]
    #v(6pt)
    #text(size: 10pt, weight: "bold", fill: NAVY)[Protect life immediately]
    #v(6pt)
    #text(size: 8pt)[Verify alerts, egress, shelter, dispatch coordination and bleeding-control readiness. Assign all critical deficiencies.]
  ],
  block(fill: rgb("#eef4f7"), inset: 11pt, stroke: (top: 2pt + rgb("#9b6023")))[
    #text(size: 8pt, weight: "bold", fill: rgb("#555555"))[P1 / BY DAY 90]
    #v(6pt)
    #text(size: 10pt, weight: "bold", fill: NAVY)[Demonstrate functionality]
    #v(6pt)
    #text(size: 8pt)[Test classrooms, transport, outdoor activities and outages; retain independently witnessed, timed evidence.]
  ],
  block(fill: rgb("#eef4f7"), inset: 11pt, stroke: (top: 2pt + rgb("#126e65")))[
    #text(size: 8pt, weight: "bold", fill: rgb("#555555"))[P2 / CONDITIONAL]
    #v(6pt)
    #text(size: 10pt, weight: "bold", fill: NAVY)[Approve specialized systems]
    #v(6pt)
    #text(size: 8pt)[Consider AI, screening, protective personnel, canines, and counter-UxS only after legal and field validation.]
  ],
)
#v(16pt)
== Evidence ladder: procurement is not proof of readiness
#table(columns: (1fr,1fr,1fr,1fr), inset: 8pt,
  [Documented], [Inspected], [Exercised], [Independently verified])
#v(15pt)
#block(fill: NAVY, inset: 12pt, radius: 2pt)[
  #text(size: 9.3pt, weight: "bold", fill: white)[NO OFFSETTING CRITICAL FAILURE]
  #v(4pt)
  #text(size: 9pt, fill: white)[A failed accessible warning, blocked egress, unaddressed serious safeguarding gap, or another critical deficiency cannot be offset by a favorable aggregate score. Campus status remains NOT VALIDATED until corrected and retested.]
]
#v(15pt)
== Source and decision labels
#table(columns: (1fr, 3fr), inset: 7pt,
  [*LAW*], [Constitutional, statutory or regulatory requirement; confirm current applicability.],
  [*GUIDANCE*], [Agency best practice; not itself a grant of search, surveillance or force authority.],
  [*EVIDENCE*], [Research or independent observation; disclose limitations.],
  [*PROPOSAL*], [District decision requiring approval and performance testing.],
)
#v(9pt)
#text(size: 8pt, fill: MUTED)[Independent research, not issued by CISA. Sensitive site-level security details remain in restricted district records.]


#pagebreak()
#text(size: 7.3pt, weight: "bold", fill: rgb("#5e7684"))[DISTRICT LEADERSHIP / PROPOSED POLICY / CONTINUOUS IMPROVEMENT]
#v(6pt)
#text(size: 19.5pt, weight: "bold", fill: NAVY)[Administrator ownership and innovation mandate]
#v(7pt)
#line(length: 100%, stroke: (paint: rgb("#60717B"), thickness: 1.7pt))
#v(9pt)
*Compliance is the floor. Effective protection is the objective.* Principals and school administrators are expected to challenge assumptions, identify campus-specific hazards, and develop better ways of protecting students and staff—not merely demonstrate that prescribed paperwork has been completed.
#v(10pt)
#block(fill: rgb("#1b2e3a"), inset: 12pt)[
  #text(size: 7.5pt, weight: "bold", fill: rgb("#d9d9d9"))[GOVERNING-BOARD DIRECTIVE]
  #v(4pt)
  #text(size: 8.2pt, fill: white)[Delegate responsibility, decision rights, protected time and resources to each campus safety lead. Require leaders to identify measurable gaps, invite ideas from staff and responders, pilot lawful solutions, and report successes and failures. Do not penalize truthful reporting of weaknesses.]
]
#v(10pt)
#grid(columns: (1fr,1fr), gutter: 11pt,
  block(fill: rgb("#eef4f7"), inset: 10pt)[
    #text(size: 9.3pt, weight: "bold", fill: NAVY)[01 / Own the outcome]
    #v(4pt)
    #text(size: 8pt)[Appoint a campus owner for warning coverage, protective actions, egress, medical readiness and responder coordination. Provide a district sponsor, resources, and a method to escalate urgent barriers.]
  ],
  block(fill: rgb("#eef4f7"), inset: 10pt)[
    #text(size: 9.3pt, weight: "bold", fill: NAVY)[02 / Challenge the baseline]
    #v(4pt)
    #text(size: 8pt)[Compare written policy against observed performance. Invite teachers, students, families, custodians, disability specialists and emergency responders to identify overlooked failure modes.]
  ],
  block(fill: rgb("#eef4f7"), inset: 10pt)[
    #text(size: 9.3pt, weight: "bold", fill: NAVY)[03 / Pilot responsibly]
    #v(4pt)
    #text(size: 8pt)[Start with reversible changes: clearer instructions, backup communications, accessible signage, safe staff handoffs, substitute orientation, and trauma-care access. Obtain approval before live tests.]
  ],
  block(fill: rgb("#eef4f7"), inset: 10pt)[
    #text(size: 9.3pt, weight: "bold", fill: NAVY)[04 / Prove and share]
    #v(4pt)
    #text(size: 8pt)[Define the problem and expected result, measure baseline and adverse effects, observe tests independently, then scale, revise or stop. Share useful results without revealing sensitive configurations.]
  ],
)
#v(10pt)
#text(size: 10.2pt, weight: "bold", fill: NAVY)[Administrator-led improvement cycle]
#v(6pt)
#table(columns: (1fr,1fr,1fr,1fr,1fr), inset: 5pt,
  [Find gap], [Design option], [Authorize pilot], [Measure], [Scale or stop])
#v(10pt)
#block(fill: rgb("#f3f8fb"), stroke: (left: 3pt + GOLD), inset: 10pt)[
  *Limits and accountability.* Innovation never waives law, accessible egress, student privacy, due process or lawful oversight. Administrators may not unilaterally authorize weapons, force, drone interdiction, invasive surveillance or unsafe drills. The district must fund and expedite lawful review rather than impose responsibility without authority.
]
#v(7pt)
#text(size: 7.6pt, fill: MUTED)[Board oversight: quarterly campus improvement reviews, documented high-risk exceptions, protected escalation, measured outcomes and review of discontinued pilots. This is a *proposed district leadership policy*, informed by #link("https://www.cisa.gov/sites/default/files/publications/k12-school-security-guide-3rd-edition-022022-508.pdf")[CISA], #link("https://www.secretservice.gov/sites/default/files/reports/2020-06/USSS_NTAC_Enhancing_School_Safety_Guide_7.11.18.pdf")[USSS NTAC], and #link("https://app.leg.wa.gov/rcw/default.aspx?cite=28A.320.125")[RCW 28A.320.125]. It is not an additional legal mandate.]
// Version 14.5: proposed nationwide learning forum with invited federal technical advice.
#pagebreak()
#text(size: 7.3pt, weight: "bold", fill: rgb("#5e7684"))[NATIONAL COLLABORATION / VOLUNTARY PROGRAM / PROPOSED POLICY]
#v(6pt)
#text(size: 19pt, weight: "bold", fill: NAVY)[National School Safety Innovation Forum]
#v(4pt)
#text(size: 9pt, weight: "semibold")[Courtesy of NERVOSYS, LLC  ·  Contact: Dr. Adam Erickson]
#v(6pt)
#line(length: 100%, stroke: (paint: rgb("#60717B"), thickness: 1.7pt))
#v(10pt)
*Local innovation should produce national learning.* Create a moderated nationwide community of practice for school administrators to share independently documented safety improvements, failed pilots, implementation costs, and lessons learned. Build on DOJ's STOP School Violence peer-learning infrastructure rather than duplicate it.
#v(10pt)
#block(fill: rgb("#1b2e3a"), inset: 12pt)[
  #text(size: 7.2pt, weight: "bold", fill: rgb("#d9d9d9"))[GOVERNANCE RECOMMENDATION]
  #v(4pt)
  #text(size: 8.1pt, fill: white)[*School-led, federally advised, independently evaluated.* Invite federal agencies to recommend technical standards and review methods. Districts retain campus decision authority; any federal oversight, sponsorship, or participation requires those agencies' agreement and confers no implied certification.]
]
#v(10pt)
#grid(columns: (1fr,1fr), gutter: 10pt,
  block(fill: rgb("#eef4f7"), inset: 10pt)[
    #text(size: 9.1pt, weight: "bold", fill: NAVY)[01 / National administrator network]
    #v(4pt)
    #text(size: 7.9pt)[Verify participating school leaders; include public, Tribal, territorial, charter, private, rural and urban schools, plus educators, accessibility specialists, responders and researchers. Host regional peer groups, quarterly workshops and an annual findings review.]
  ],
  block(fill: rgb("#eef4f7"), inset: 10pt)[
    #text(size: 9.1pt, weight: "bold", fill: NAVY)[02 / Federal recommendations and review]
    #v(4pt)
    #text(size: 7.9pt)[Invite CISA for physical/cyber protection; USSS NTAC for behavioral threat assessment; DOJ BJA/NIJ for evaluation; Education for privacy and civil rights; FEMA for exercise design; and state partners such as Washington OSPI. Federal advice is nonbinding.]
  ],
  block(fill: rgb("#eef4f7"), inset: 10pt)[
    #text(size: 9.1pt, weight: "bold", fill: NAVY)[03 / Evidence-based case library]
    #v(4pt)
    #text(size: 7.9pt)[Require the problem, local context, approach, approvals, baseline, cost, field-test methods, measurable outcomes, adverse effects and replication limits. Mark practices *proposed*, *locally tested*, *independently replicated* or *not recommended*. Share negative results.]
  ],
  block(fill: rgb("#eef4f7"), inset: 10pt)[
    #text(size: 9.1pt, weight: "bold", fill: NAVY)[04 / Access, privacy and integrity]
    #v(4pt)
    #text(size: 7.9pt)[Publish sanitized public summaries and restrict other legitimate professional material. Exclude identifiable students, live investigations, maps, sensor gaps and personnel deployments. Moderate participation; disclose vendor conflicts; support correction and review.]
  ],
)
#v(10pt)
#text(size: 9pt, weight: "bold", fill: NAVY)[Sharing process]
#v(6pt)
#table(columns: (1fr, 1fr, 1.25fr, 1fr, 1.25fr), inset: 5pt,
  [Submit], [Screen], [Federal / peer review], [Evaluate], [Publish / replicate])
#v(9pt)
*Launch proposal:* Within 90 days convene a charter team and invite written agency recommendations. Pilot the moderated evidence library within six months; issue annual public lessons-learned reports. Measure independently verified risk reduction, practical adoption, costs and adverse consequences, not forum activity alone.
#v(7pt)
#text(size: 7.3pt, fill: MUTED)[*Evidence:* #link("https://bja.ojp.gov/funding/webinar/fy23-stop-tta-recording")[DOJ BJA STOP TTA 2023]; #link("https://bja.ojp.gov/program/stop-school-violence-program/overview")[BJA STOP Program]; #link("https://www.cisa.gov/sites/default/files/2022-11/k12-school-security-guide-3rd-edition-022022-508.pdf")[CISA K–12 Guide]; #link("https://www.secretservice.gov/sites/default/files/reports/2020-06/USSS_NTAC_Enhancing_School_Safety_Guide_7.11.18.pdf")[USSS NTAC]. This is a proposed initiative, not an existing government-endorsed national forum.]

#pagebreak()

= Readiness release decision sheet
<readiness-release-decision-sheet>
#text(size: 9.2pt, fill: rgb("#4c4c4c"))[Use at district review gates and after a material campus change. *Readiness is scoped*, not a general certification. Record campus, specific buildings, conditions, witness and test date in restricted files.]
#v(11pt)
#grid(columns: (1fr, 1fr), gutter: 10pt,
  block(fill: rgb("#eef4f7"), stroke: (left: 2.5pt + rgb("#60717B")), inset: 10pt)[
    #text(size: 7pt, weight: "bold", fill: rgb("#6d6d6d"))[01 / LEGAL BASELINE]
    #v(4pt)
    #text(size: 10pt, weight: "bold", fill: NAVY)[Prove mandatory duties]
    #v(4pt)
    #text(size: 8pt)[Verify drills, accessible procedures, bleeding-control coverage, emergency-response agreements, training, privacy duties and records.]
  ],
  block(fill: rgb("#eef4f7"), stroke: (left: 2.5pt + rgb("#888888")), inset: 10pt)[
    #text(size: 7pt, weight: "bold", fill: rgb("#6d6d6d"))[02 / REACH]
    #v(4pt)
    #text(size: 10pt, weight: "bold", fill: NAVY)[Reach occupied settings]
    #v(4pt)
    #text(size: 8pt)[Demonstrate accessible warnings in classrooms, transport, outdoor programs, and degraded operations; measure fallback.]
  ],
  block(fill: rgb("#eef4f7"), stroke: (left: 2.5pt + rgb("#60717B")), inset: 10pt)[
    #text(size: 7pt, weight: "bold", fill: rgb("#6d6d6d"))[03 / PROTECTION]
    #v(4pt)
    #text(size: 10pt, weight: "bold", fill: NAVY)[Demonstrate action]
    #v(4pt)
    #text(size: 8pt)[Observe safe protective decisions, egress, shelter and accountability before outside responders arrive; time consistently.]
  ],
  block(fill: rgb("#eef4f7"), stroke: (left: 2.5pt + rgb("#888888")), inset: 10pt)[
    #text(size: 7pt, weight: "bold", fill: rgb("#6d6d6d"))[04 / MEDICAL]
    #v(4pt)
    #text(size: 10pt, weight: "bold", fill: NAVY)[Prove lifesaving readiness]
    #v(4pt)
    #text(size: 8pt)[Inspect required supplies and trained staffing; observe a safe simulated traumatic-injury response and EMS handoff.]
  ],
  block(fill: rgb("#eef4f7"), stroke: (left: 2.5pt + rgb("#60717B")), inset: 10pt)[
    #text(size: 7pt, weight: "bold", fill: rgb("#6d6d6d"))[05 / INTEROPERABILITY]
    #v(4pt)
    #text(size: 10pt, weight: "bold", fill: NAVY)[Confirm responder handoff]
    #v(4pt)
    #text(size: 8pt)[Verify dispatch coordination, backup communications, shared information and transfer of incident command.]
  ],
  block(fill: rgb("#eef4f7"), stroke: (left: 2.5pt + rgb("#888888")), inset: 10pt)[
    #text(size: 7pt, weight: "bold", fill: rgb("#6d6d6d"))[06 / ASSURANCE]
    #v(4pt)
    #text(size: 10pt, weight: "bold", fill: NAVY)[Independently review gaps]
    #v(4pt)
    #text(size: 8pt)[Document misses, false alerts, accessibility, maintenance and corrective actions; retest before closure.]
  ],
)
#v(14pt)
#block(fill: rgb("#1b2e3a"), inset: 13pt)[
  #text(size: 10pt, weight: "bold", fill: white)[Decision outcomes]
  #v(5pt)
  #text(size: 8.3pt, fill: white)[*NOT ASSESSED:* testing absent or unauthorized.  *CONDITIONAL:* specified functions shown but material limits remain.  *VERIFIED IN SCOPE:* specified capability and test conditions independently accepted.  *CRITICAL FAILURE:* maintain NOT VALIDATED status; implement interim measures and retest.]
]
#v(12pt)
#text(size: 7.5pt, fill: MUTED)[A board-facing exception report must omit exploitable site detail. Do not average away a blocked egress route, failed accessible warning or required statutory duty. This decision sheet is a proposed governance aid, not a new law or federal certification.]

#pagebreak()
== How to read this document
<how-to-read-this-document>
- #strong[Executive decisions and core countermeasures:] Sections 1–10;
  recommended actions and evidence obligations.
- #strong[Campus field protocol:] Section 11; authorization, safe
  sampling, evidence levels and independent review.
- #strong[Operational reference registers:] Sections 12–15; all 56
  vector entries, 15 candidate capabilities, Washington compliance
  requirements and field sampling.
- #strong[Annotated research bibliography:] Section 16; official
  federal, state, constitutional and regulatory sources with links and
  limitations.

#strong[Authority key:] #strong[LAW] \= binding law; #strong[GUIDANCE]
\= nonbinding agency advice; #strong[RESEARCH] \= empirical/descriptive
evidence; #strong[WARNING] \= agency warning, not local verification;
#strong[PROPOSAL] \= district option requiring review and testing.

#horizontalrule

== 1. Executive decisions and immediate priorities
<1-executive-decisions-and-immediate-priorities>
=== Decision requested
<decision-requested>
Empower every campus principal to own protective outcomes and propose safe, measurable improvements beyond mandated minimums. Grant time, resources, decision rights and a fast district review path. Approve a 90-day districtwide baseline program with one accountable
owner, campus-level inspections, independently witnessed #emph[in-scope]
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
  columns: 3,
  align: (col, row) => (left,left,left,).at(col),
  inset: 6pt,
  [Priority], [Required decision or capability], [Minimum completion
  evidence],
  [#strong[P0 · immediate];],
  [Emergency warning and backup channels; clear
  evacuation/lockdown/shelter choices; working egress/access controls],
  [Timed, accessible tests including buses, fields and after-hours
  activities; deficiencies owned and dated],
  [#strong[P0 · immediate];],
  [Washington bleeding-control compliance; first-aid/AED/EMS interface],
  [Verified kits, employee training coverage and annual/post-use
  inventories under RCW 28A.210.440],
  [#strong[P0 · immediate];],
  [PSAP, fire/EMS and police coordination; incident leadership and
  reunification],
  [Current contacts, joint review, responder access arrangements and
  documented functional exercises],
  [#strong[P0 · immediate];],
  [Behavioral reporting, triage and student safeguarding],
  [Multidisciplinary case-management team, follow-up procedures, privacy
  and malicious-report controls],
  [#strong[P1 · near term];],
  [Entry screening, targeted cameras, cybersecurity and identity
  protection],
  [Site-specific gap analysis and measured reliability, false positives,
  accessibility and privacy],
  [#strong[P2 · conditional];],
  [Authorized protective personnel, detection canines, counter-UxS
  specialists],
  [Independent legal authorization, evidence-based benefit,
  qualification and exercise validation],
)]
)

#strong[Compliance note.] Washington’s #emph[safe school plan] and
emergency-response-system statutes are binding, and bleeding-control
readiness became a specific statutory requirement beginning in the
2026–27 school year. Reconcile district policy and evidence with RCW
28A.320.125, .126 and 28A.210.440. \[W01–W03\]

=== Compliance details administrators must not miss
<compliance-details-administrators-must-not-miss>
- #strong[Drills and documentation — LAW.] RCW 28A.320.125 calls for at
  least one safety-related drill per month #strong[while school is in
  session with students], covering shelter-in-place, lockdown and
  evacuation functional responses; it also requires drill date, time and
  type to be recorded, relevant earthquake and mapped-hazard exercises,
  and age-appropriate, trauma-informed lockdown drills.
- #strong[Principal incident command — LAW.] The safe school plan must
  require the building principal to be certified on the incident command
  system. Check substitutes, staff with accessibility needs, and
  students at off-site events. \[W01\]
- #strong[Response system — LAW.] RCW 28A.320.126 requires district
  collaboration with local law enforcement, public safety answering
  points and safety/security staff to develop a qualifying emergency
  response system. The statute specifies #strong[at least one] listed
  response-system capability; it does not require each school to buy
  every listed product. The statutory progress-report deadline was
  October 1, 2025: audit submissions and existing implementation, not a
  fictional new 2026 deadline. \[W02\]
- #strong[Bleeding control — LAW.] Verify each campus\'s physical
  equipment, required contents, trained-staff coverage and inspection
  records individually. A district purchase order is not evidence of
  campus compliance. \[W03\]

#strong[Decision rule:] a safety control with an uninspected site,
expired training, unknown backup performance or missing records remains
#strong[UNASSESSED] or #strong[NONCOMPLIANT], not \'operational\'
merely because a policy or equipment inventory exists.

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
28A.210.440 applies for the 2026–27 year and specifies equipment
contents, staff coverage and annual/after-use inspections. \[W01–W03\]

#strong[Security staffing and records.] Where the district deploys
safety/security personnel, RCW 28A.320.124 requires a duties/complaints
policy; RCW 28A.320.1242 requires annual adoption of applicable provider
agreements with training and community involvement; RCW 28A.320.1241
requires specific yearly collection/submission of staffing,
force-related incidents and complaints. Verify each provision rather
than inferring authority or readiness from a contract alone. \[W06–W08\]

#strong[Privacy and student allegations.] School-based threat assessment
must concern individual behavior and context rather than demographic
profiling. When FERPA\'s health/safety emergency exception is used to
disclose protected educational records, log the articulable and
significant threat and disclosure recipients. Urgent precautionary
protection is distinct from an adjudicated disciplinary finding.
\[W04–W05\] \[F25\]

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
volume of technology purchased. \[F01\] \[F07\] \[W01–W03\]

=== Acceptance logic: what must be true before a campus is called ready
<acceptance-logic-what-must-be-true-before-a-campus-is-called-ready>
#strong[PROPOSAL — board-adopted assurance standard, not a statutory
certification.] For each campus and time period \(school hours,
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
  columns: 3,
  align: (col, row) => (left,left,left,).at(col),
  inset: 6pt,
  [Assurance decision], [Sufficient basis], [What it does #strong[not]
  establish],
  [#strong[Not assessed];],
  [Evidence absent, expired, or outside test scope],
  [Does not mean an imminent threat exists],
  [#strong[Installed, not proven];],
  [Inventory or physical inspection only],
  [Does not establish alerts reach occupants or staff can respond],
  [#strong[Demonstrated with limitations];],
  [Controlled, witnessed exercise within stated settings],
  [Does not generalize to power loss, weekends or every disability
  accommodation],
  [#strong[Verified for defined scope];],
  [Repeatable field exercise or suitable incident evidence, with
  independent review and active maintenance],
  [Does not predict every real-world attack or certify an entire
  district],
  [#strong[Critical failure];],
  [Mandatory life-safety provision absent or a necessary barrier
  demonstrably fails],
  [Cannot be averaged away; interim protection and follow-up required],
)]
)

#strong[Sampling rule:] test the #emph[hardest representative
conditions], not only the easiest demonstration—e.g., a classroom far
from main administration, a noisy assembly, an accessible alternative
route, a school bus, and a case with degraded IT or power. Expand the
sample where buildings, populations or equipment configurations differ
materially. Never test an actual emergency by dispatching false alerts
or obstructing life-safety functions. FEMA\'s HSEEP exercise framework
supports objective-based evaluation followed by an After-Action
Report/Improvement Plan \(AAR/IP). \[F29\]

=== The school safety operating concept
<the-school-safety-operating-concept>
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

== 2. Threat model and decision logic
<2-threat-model-and-decision-logic>
CISA’s 2022 K–12 School Security Guide addresses #strong[crime and
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
  columns: 3,
  align: (col, row) => (left,left,left,).at(col),
  inset: 6pt,
  [Threat family], [Representative examples], [Defensive planning
  response],
  [Targeted violence],
  [Firearms, edged weapons, explosives, arson, vehicle incursion,
  unauthorized entry, attacks during transit or events],
  [Access controls, location-appropriate protection, rapid notification,
  qualified response, hemorrhage control],
  [Information, cyber and deception],
  [Swatting, forged allegations, credential compromise, extortion,
  cyberbullying, AI-generated harassment, ransomware],
  [Source authentication, PSAP coordination, child protection, backups,
  evidence provenance and fair investigation],
  [Targeted coercion and abduction],
  [Custody disputes, luring, virtual kidnapping, trafficking,
  foreign-state intimidation, organized criminal recruitment],
  [Verified release and custody protocols, welfare checks, safe
  disclosures, specialist referrals, victim services],
  [Environmental and medical],
  [Wildfire/smoke, earthquake, severe weather, hazmat exposure,
  epidemic, medical mass casualty],
  [Hazard-specific shelter/evacuation, air systems, supplies, EMS
  interface, continuity],
  [Unmanned systems and animals],
  [Unexpected UAS/UGV presence, hazardous drone activity, aggressive
  dogs, specialized working canines],
  [Safe observation, indoor protection, specialist coordination, lawful
  mitigation and ADA-conscious handling],
  [Infrastructure and transport],
  [Power/IT failure, water failure, communications outage, bus
  disruption, supply-chain outage],
  [Redundant channels, alternative locations, manual modes, continuity
  and alternate transport],
  [Compound and unknown],
  [False alert masking a genuine event, cyber-physical disruption,
  previously unclassified method],
  [Multiple independent observations, flexible incident command,
  escalation pathways, register update],
)]
)

=== Assurance-case method for all 56 threat vectors
<assurance-case-method-for-all-56-threat-vectors>
For #strong[each vector] in the companion data register, document: \(1)
the observed hazard or credible warning; \(2) the control IDs meant to
prevent, detect, protect or recover; \(3) required evidence; \(4) the
named school/district owner; \(5) whether all students and locations can
benefit; \(6) failure interactions with other hazards; and \(7) a retest
date. The companion #strong[threat-to-control crosswalk] provides a
first-pass mapping. Systems-Based Security Reference Version 14.5 adds a field-test plan
that separates measured campus coverage from mere equipment presence. It
is a #emph[proposed assessment map], not proof of local applicability
or control effectiveness.

A school may face a severe harm mechanism with little incidence
evidence. In that case, evaluate whether existing measures already
mitigate it before introducing a dedicated sensor or tactic. Conversely,
recurrent low-tech failures—unreachable emergency messaging, unsecured
releases, misconfigured access doors—deserve remediation even if no
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
  columns: 3,
  align: (col, row) => (left,left,left,).at(col),
  inset: 6pt,
  [State], [Meaning], [District action],
  [#strong[Known statutory gap];],
  [Requirement is confirmed and required evidence is missing or fails
  inspection],
  [Correct immediately; document interim protection and legal review],
  [#strong[Measured protective deficiency];],
  [A controlled test or documented incident demonstrates an operational
  failure],
  [Assign accountable owner, due date and retest],
  [#strong[Plausible exposure, untested];],
  [Hazard could apply locally, but effectiveness or frequency is
  unknown],
  [Assess site, use proportional interim measures, do not procure on
  assumptions],
  [#strong[Emerging / not established locally];],
  [Government warning or hypothetical mechanism without local supporting
  evidence],
  [Track updates and test existing defenses before adding technology],
)]
)

Record #strong[source strength], #strong[local applicability],
#strong[coverage gaps], and #strong[effect on other hazards];; for
example, screening queues cannot impair fire egress or emergency
reunification. \[F01\] \[F24\]

=== Prioritization without invented probability or compensating scores
<prioritization-without-invented-probability-or-compensating-scores>
#strong[PROPOSAL.] Use a non-compensatory decision order: #strong[\(1)
imminent protective deficiency; \(2) binding legal duty; \(3)
demonstrable exposure and absence of backup; \(4) effect on occupants
with disabilities, transportation and off-hours activities; \(5)
evidence of a locally relevant threat; \(6) cost, opportunity cost and
testability.] An unknown likelihood must remain #strong[UNKNOWN] rather
than being filled with arbitrary numeric threat probabilities or
sensational national incidents. CISA\'s school-security method is
site-specific; federal targeted-violence cases and warnings do not
provide a reliable probability of an event on a named campus.
\[F01–F04\]

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
#strong[Track A — immediate protection.] When articulable circumstances
indicate a credible immediate danger, an authorized leader may take a
proportionate protective action while verification continues.
Communicate uncertainty to dispatch and occupants; monitor reversibility
and collateral risk. #strong[Track B — findings and adverse actions.]
Attribution, discipline, exclusion, public identification and criminal
referral each demand their own lawful evidence, review and notice
processes. An anonymous tip, AI alert, partisan accusation or screenshot
is #strong[not] proof of guilt. \[F05\] \[F06\] \[F11\] \[W04\]
\[W12–W14\]

Use evidence labels #strong[direct observation; independently
corroborated; unverified; contradicted; adjudicated fabrication].
Preserve originals and access logs. Do not infer a knowingly false or
malicious report merely because evidence was insufficient. Investigate
credible indicators of manipulation, coordinated retaliation and
impersonation without discouraging good-faith disclosures. \[W05\]

== 3. Prevention: behavioral assessment, reporting and online harm
<3-prevention-behavioral-assessment-reporting-and-online-harm>
=== Behavioral threat assessment and management \(BTAM)
<behavioral-threat-assessment-and-management-btam>
Follow NTAC’s operational model: identify specific concerning conduct,
gather lawful contextual information, assess the circumstances and
available protective factors, and manage risk through an
interdisciplinary team and supports. There is #strong[no useful
demographic or ideological profile] of a school attacker. Threat inquiry
must focus on conduct, capability, context, expressed intent and
credible corroboration—not race, religion, political affiliation,
disability, lawful protest or merely unpopular views. \[F02–F04\]
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
claims about the perpetrator without review. \[F12–F14\] \[L04\]

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
urgency] \(immediate / elevated / routine) and #strong[allegation
status] \(unverified / corroborated / disproven / unresolved). Permit
confidential, accessible reporting while investigating objective signs
of impersonation, collusion or malicious fabrication; do not label a
good-faith reporter dishonest solely because allegations are
unsubstantiated.

=== Reporting pathways resilient to abuse
<reporting-pathways-resilient-to-abuse>
Maintain accessible confidential and attributable channels; allow
reasonable anonymous reporting with clear triage and two-person review
of high-impact decisions. Jointly design swatting verification with PSAP
and police: #strong[protect promptly, verify in parallel], keep
original message/media, limit public amplification, and record why each
action was taken. Provide an independent avenue for someone falsely
accused to contest facts, request correction and challenge unnecessary
disclosure. \[F05\] \[F06\] \[F11\] \[W05\]

== 4. Physical protection, entry screening and technology
<4-physical-protection-entry-screening-and-technology>
=== Architectural and operating controls
<architectural-and-operating-controls>
Apply CISA’s #strong[layered, site-specific] model: school grounds and
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
observable emergencies—not automated suspicion scores or disciplinary
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
\[F29–F30\]

For an #strong[automated alert or screening pilot], calculate \(within
the approved sample) #strong[sensitivity \= true alerts / \(true alerts
+ missed events)], #strong[false-positive rate \= false alerts /
\(false alerts + true negatives)], and end-to-end timing to
#strong[human acknowledgment and safe occupant notification]. Disclose
all denominators, confidence limitations, excluded cases, outages, labor
costs and corrective actions. If a denominator is zero or the sample was
designed only to demonstrate success, write #strong[NOT ESTIMABLE];—never
report 100% accuracy. Test fallback instructions with the analytic
component disabled. Misclassification cannot automatically initiate a
search, detention, disciplinary finding or force response.

For #strong[human personnel, equipment and working dogs], verify
credential/current authorization, training and medical readiness,
de-escalation and cooperation with arriving emergency responders. Record
child welfare, ADA, traumatic stress and mistaken-identification risks.
Do not conduct force-on-force or canine-apprehension training as school
drills. For #strong[counter-UxS], separately assess passive
observation/reporting and protected-occupant procedures; any active
aircraft/spectrum interdiction demands specific competent-agency
authority. \[W06–W11\] \[F18–F23\]

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
\(jamming, takeover, kinetic defeat): the latter implicates federal
aviation/radio law and only specially authorized operators may act where
applicable. Qualified law enforcement must verify current federal
certifications, regulations and task-force arrangements; a district
itself has no general interdiction authority. \[F18–F20\]

Explosives-detection dogs can be evaluated as a specialized screening
capability with a certified handler and law-enforcement partner. Police
tactical K-9 functions are separate, with distinct force and injury
risk. Document bite prevention, handler suitability, accommodations for
service animals, veterinary welfare and independent performance reviews.
Do not conflate ordinary service animals with suspicious animals.
\[F21\] \[F23\]

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
lifesaving care → responder arrival and control]. Measure
high-occupancy events, arrival/dismissal, remote buildings, buses,
special-needs access and power loss. \[F07\] \[F08\] \[W01\] \[W02\]

=== Prearrival timeline: what schools should actually measure
<prearrival-timeline-what-schools-should-actually-measure>
Use comparable time points during approved exercises and real incidents
\(subject to privacy and preservation requirements): #strong[T0 hazard
first detected; T1 alert initiated; T2 school/dispatch acknowledgment;
T3 first verified occupant protective action; T4 medical response
initiated when indicated; T5 outside responders arrive; T6 authorized
incident command transfer.] Report elapsed intervals and the share of
tested locations reached, including cafeteria, gym, sports fields,
buses, portable classrooms and accessible notification devices. \[F07\]
\[W01\] \[W02\]

The working constraint is #strong[do not rely on police arrival within
five minutes];; it is not a claim that exactly five minutes guarantees
harm or a legal performance standard. Validate response choices by
circumstance and avoid high-stress simulated attacks involving children.
Test concurrent hazards and communication failure in a
#strong[discussion or approved functional] setting.

=== First-minutes time and coverage protocol
<first-minutes-time-and-coverage-protocol>
#strong[PROPOSAL.] Time the full protective chain, not just the police
dispatch interval. The event log should distinguish #strong[T0]
\(verified cue or initial credible report), #strong[T1] \(authorized
school acknowledgment), #strong[T2] \(warning issued), #strong[T3]
\(warning received and understood by a sample of affected occupants),
#strong[T4] \(appropriate protective action initiated), #strong[T5]
\(qualified aid made available when safe), #strong[T6] \(911/PSAP
acknowledgment), and #strong[T7] \(external responder arrival and
command integration). Some events will have uncertain or different
starting cues; note that explicitly instead of back-solving a false
precision.

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
evidence of real campus performance. \[F07\] \[F29\] \[W01–W03\]

=== First-minutes functional sequence \(role-based, not tactical)
<first-minutes-functional-sequence-role-based-not-tactical>
#figure(
align(center)[#table(
  columns: 3,
  align: (col, row) => (left,left,left,).at(col),
  inset: 6pt,
  [Time phase], [School and incident lead], [Qualified responders /
  support],
  [Immediately after credible observation],
  [Initiate locally appropriate warning and protective action; inform
  911/PSAP of both facts and uncertainty; activate alternate channels if
  necessary],
  [Dispatch verifies/coordinates; law enforcement, fire and EMS receive
  common situation updates],
  [Before outside responders arrive],
  [Account for occupants as feasible; protect against the relevant
  hazard; use trained bleeding-control/AED capability where conditions
  are safe; maintain controlled child release],
  [Authorized on-campus personnel act within written law/policy; medical
  and communications teams support protection],
  [When responders arrive],
  [Establish clear leadership handoff; provide safe site information
  through agreed channels; avoid circulating unverifiable suspect
  descriptions],
  [Incident command and specialized response under agency protocols;
  preserve medical/reunification continuity],
  [Stabilization and recovery],
  [Correct false reports; reunify families; document actions and assist
  victims; independent review],
  [After-action improvement, legal review, medical support and service
  restoration],
)]
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
authority to use lethal force. \[F08\] \[W06–W11\]

A force policy must favor avoidance, de-escalation, protected withdrawal
and non-force remedies whenever feasible. Less-lethal tools can still
kill or cause grave injury. Peace officers are governed by RCW
10.120.020; noncommissioned personnel do #strong[not] automatically
inherit police powers and require a separately documented legal basis.
Deadly force is an exceptional response to qualifying imminent threats,
governed by applicable law; an AI classification or unverified tip alone
must never authorize it. No operational tactics or weapon selection are
prescribed here. \[W09–W11\]

=== Conditional advanced-capability approval
<conditional-advanced-capability-approval>
For #strong[armed security and less-lethal equipment], require a
documented legal-role matrix for commissioned officers versus other
permitted personnel, recurrent qualification, explicit limits on
civilian security authority, safe storage and access, rescue-medical
integration, incident logging, and independent review. Capture potential
harms \(misidentification, unintended injury, discipline creep,
discrimination) as safety outcomes, not merely legal footnotes. Do not
assume a security presence is effective without campus-specific coverage
and coordination evidence. \[F08\] \[W06–W11\]

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

== 6. Incident-specific protective decision guides
<6-incident-specific-protective-decision-guides>
#figure(
align(center)[#table(
  columns: 3,
  align: (col, row) => (left,left,left,).at(col),
  inset: 6pt,
  [Threat / incident], [First protective objective], [Follow-through and
  safeguards],
  [Armed/edged assault; violent intruder],
  [Rapid warning; location-appropriate separation, lockdown or
  evacuation; EMS request],
  [Lawful responder-led resolution; trauma care and accountability;
  factual communication without unsupported identification],
  [Explosives / suspicious objects / hazardous release],
  [Avoid contact and secondary exposure; specialist consultation;
  shelter/evacuate appropriate to hazard],
  [No untrained searches or device handling; coordinate fire/hazmat/bomb
  specialists; preserve evidence],
  [False threat / swatting / impersonated alert],
  [Protective action without waiting for perfect authentication; confirm
  independently through PSAP],
  [Keep an auditable correction trail; prevent malicious use of school
  discipline; manage rumor propagation],
  [Abduction, custody interference or missing child],
  [Verify child location immediately; control student release; call law
  enforcement when indicated],
  [Check orders/records lawfully, preserve privacy, avoid reliance on
  synthetic ransom media],
  [Cyber compromise or communications outage],
  [Switch to an independent alert path and manual protective
  procedures],
  [Recover through tested backups; verify commands before announcements;
  avoid exposing student records],
  [Coercion, trafficking, state-sponsored intimidation, extortion],
  [Safeguard the affected student/family, avoid confrontation and
  retaliation],
  [Appropriate specialists, evidence preservation, confidential
  referral; no inference from ethnicity or political belief],
  [Drone, rover, canine or compound threat],
  [Move occupants away from observed hazard; initiate coordinated
  incident assessment],
  [Qualified specialized response; do not improvise active interdiction
  or canine force; re-evaluate when facts change],
  [Earthquake, wildfire smoke, severe weather, utility failure],
  [Execute hazard-specific shelter/evacuation and continuity
  procedures],
  [Accessibility, transportation, family communication and prolonged
  service recovery],
)]
)

These summaries are #emph[decision frameworks]. Final site-specific
instructions and authority assignments belong in approved building EOPs
and law-enforcement protocols. \[F01\] \[F07\] \[F10\] \[W01\]

== 7. Constitutional and civil-liberties constraints that improve safety
<7-constitutional-and-civil-liberties-constraints-that-improve-safety>
The #strong[U.S. Constitution is the supreme law of the land];;
Washington law cannot override it. State law and district policy may
provide additional lawful protections. The First Amendment protects
lawful speech and association, including important off-campus student
expression. The Fourth Amendment and relevant student-search doctrine
constrain invasive searches. The Fourteenth Amendment requires due
process and equal treatment. FERPA limits education-record disclosure.
\[L01–L03\] \[L02\] \[W15\]

#strong[No accusation is a finding.] In criminal cases, the legal
presumption of innocence places the burden on prosecution to prove guilt
beyond reasonable doubt. School protective/disciplinary decisions have
separate standards and legally required process. Proposed district
protections should nevertheless require corroboration, documented
decision grounds, notice and opportunity to respond, fair appeals,
proportionality, correction and a path to restore wrongly impaired
reputation. Washington expressly prohibits exclusion solely for a
threat-assessment referral. \[W04\] \[W12–W14\]

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
misidentification during an emergency. \[W06–W08\]

== 8. Implementation, assurance and governance
<8-implementation-assurance-and-governance>
=== Campus leadership: authority to improve beyond minimum compliance

*Proposed district leadership policy.* The superintendent and board should empower principals to identify campus-specific exposure, challenge inherited assumptions, develop and test creative protective solutions, and drive continuous improvement. A completed legal checklist alone does not prove effective prevention, protection or response. Provide written delegations, discretionary pilot budgets, prompt legal and technical review, and a protected route for reporting weaknesses without retaliation.

*Performance contract.* Each campus owner maintains an improvement log specifying the hazard, proposed intervention, expected protective outcome, cost and legal gates, pilot approvers, observed evidence and unintended harms, and a decision to adopt, change or retire. District leadership remains accountable for funding and approvals; principals should not be assigned responsibilities for measures they cannot lawfully or practically deliver.

*Limits.* Favor safe, accessible and reversible ideas before invasive or hazardous capabilities. Specialist approval is required for searches, student data, force, restricted counter-UxS technologies, responder interactions and live exercises. The proposal is consistent with the individualized planning principles of CISA and USSS and Washington's local hazard assessment responsibilities, but it is not a new government requirement. [F01] [F02] [W01]

=== Countermeasure decision ledger — required before award
<countermeasure-decision-ledger--required-before-award>
#figure(
align(center)[#table(
  columns: 4,
  align: (col, row) => (left,left,left,left,).at(col),
  inset: 6pt,
  [Capability], [Legal/technical gate], [Safety benefit to demonstrate],
  [Principal failure or harm to measure],
  [Building access and visitor controls],
  [Fire, ADA and lawful entry policies],
  [Fewer unauthorized entries without lost egress],
  [Lockouts, delay, unsupervised alternative entrances],
  [Weapon/entry screening],
  [Search rules and consent/policy],
  [Reliable hazard detection and acceptable throughput],
  [False accusations, queues, disparate burden],
  [AI camera analytics],
  [Privacy, information security, independent testing],
  [Improved verified hazard-to-alert interval],
  [Missed detections, false positives, retention abuse],
  [School-security and armed staffing],
  [State law, agency agreement, qualifications],
  [Coverage and appropriate protective coordination],
  [Misidentification, inadvertent injury, escalated discipline],
  [Less-lethal equipment],
  [Approved lawful policy and recurrent training],
  [Safe, proportionate response options],
  [Severe injuries and unjustified deployments],
  [Explosives-detection canines],
  [Handler accreditation and animal/ADA safeguards],
  [Defined detection mission under realistic conditions],
  [False alerts, bites, student distress],
  [UAS detection and specialist referral],
  [FAA/FCC/DOJ limits and counterpart agency authority],
  [Verified situational awareness],
  [False attribution; unlawful interdiction; privacy harm],
  [Cyber/alert resilience],
  [CISA security hygiene and PSAP coordination],
  [Alert availability during actual service loss],
  [Spoofing, single-vendor failure, missed backup alerts],
)]
)

#strong[Procurement status:] \'pilot pending\' until written legal
authority, operator, funding, test plan, stop/rollback rule and harm
controls are documented; \'field validated\' only after witnessed tests.
No line above claims that the technology has already reduced school
violence. \[F01\] \[F08\] \[F17\] \[F27\] \[W06–W10\]

=== One 12-month delivery plan
<one-12-month-delivery-plan>
#figure(
align(center)[#table(
  columns: 3,
  align: (col, row) => (left,left,left,).at(col),
  inset: 6pt,
  [Window], [Primary owner], [Deliverables and acceptance evidence],
  [Days 0–30],
  [Superintendent / safety director / principals],
  [Assign campus leads; verify bleeding kits/staff counts, egress, alert
  coverage, PSAP contacts, substitute instructions, custodial release
  controls; list P0 failures],
  [Days 31–90],
  [School leadership + police/fire/EMS + IT],
  [Update hazard annexes; tabletop and functional tests; record timed
  warning/first-aid/communications results; resolve urgent risks with
  independently checked evidence],
  [Months 4–6],
  [Procurement + legal + security],
  [Only after gap analysis: pilot screening, AI detection, trained
  personnel or canine services with objective accuracy, legal and
  financial gates],
  [Months 7–12],
  [Board oversight / external evaluators],
  [Refresh EOP; scenario exercises for cyber/physical coupling, swatting
  and abduction; audit false-positive harm; adopt correction schedule
  and procurement stop/go decisions],
)]
)

=== First 90 days: milestone acceptance, not a paper exercise
<first-90-days-milestone-acceptance-not-a-paper-exercise>
#figure(
align(center)[#table(
  columns: 3,
  align: (col, row) => (left,left,left,).at(col),
  inset: 6pt,
  [Checkpoint], [Deliverable], [Objective completion condition],
  [#strong[Day 15];],
  [Named school and district owners; legal compliance exception log],
  [All P0 controls have owners; absent records expressly labeled
  unassessed],
  [#strong[Day 30];],
  [Physical campus inspection and bleeding-control / emergency-alert
  inventory],
  [Each campus has signed inspection evidence and critical-gap list],
  [#strong[Day 60];],
  [Approved tabletop and functional scenarios with PSAP and student
  services],
  [Synthetic-case exercises produce timed observations, failure logs and
  alternate-channel results],
  [#strong[Day 90];],
  [Independent reassessment and corrective action plan],
  [Every critical failure is corrected or has documented interim
  protection, accountable owner and due date],
)]
)

#strong[PROPOSAL, not statutory deadlines.] These are district
management milestones. State and federal legal deadlines remain whatever
the relevant provisions actually require. E2 tabletop success is never
counted as E3 real-world functionality; physical tests must be safe and
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
- #strong[E0 — unverified:] no inspected evidence, or only vendor claim,
  policy, funding award, or concept. Cannot close a safety finding.
- #strong[E1 — inspected:] documentation and equipment observed on site,
  with condition and ownership checked.
- #strong[E2 — exercised:] an authorized tabletop/functional test
  demonstrates procedure under stated conditions; not proof of
  live-event effectiveness.
- #strong[E3 — operationally corroborated for specified conditions:]
  repeatable, independently witnessed field exercise or appropriately
  reviewed incident records; report sample and scope limits and any
  adverse effects.

Require independent evaluator signature, test date and scope,
deficiencies, any incident/civil-rights impact, and next revalidation
date. Missing data means #strong[UNASSESSED]. Escalate failure of
life-safety controls to district leadership promptly; never use a
composite score to mask a failed critical control.

=== Continuous-improvement cycle: exercises, corrective actions and publication
<continuous-improvement-cycle-exercises-corrective-actions-and-publication>
Adapt FEMA\'s #strong[Homeland Security Exercise and Evaluation Program
\(HSEEP)] as a method, not as a claim of federal certification: select
objectives against actual campus vulnerabilities; use controlled
tabletop, functional and appropriately authorized full-scale exercises;
have evaluators record observable results; produce an
#strong[After-Action Report/Improvement Plan \(AAR/IP)];; then retest
the specific failure. Washington encourages multiple exercise types
across a four-year period, but that encouragement must not be mistaken
for a blanket statutory mandate to run every exercise in a given
semester. \[F29\] \[W01\]

Keep two linked reporting products: a #strong[restricted operational
evidence file] \(exact layouts, people, access systems, hardware
configurations and test logs) and a #strong[board-level aggregate
exception report] \(critical gaps, owner, interim controls, deadline,
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
\[W06–W10\]

#strong[Threat intelligence and false reporting:] track operational
threat indicators and corroborated misconduct, not ideological
categories. Separate unverified tips, genuine emergencies, maliciously
fabricated reports and good-faith mistakes. A reporting system that
discourages genuine complaints or fails to correct wrongful attribution
is itself a safety and civil-rights risk. Keep incident files protected,
with limited disclosure and correction/appeal channels. \[F02\] \[F05\]
\[F06\] \[W04–W05\]

==== Board review: four decision gates
<board-review-four-decision-gates>
#figure(
align(center)[#table(
  columns: 4,
  align: (col, row) => (left,left,left,left,).at(col),
  inset: 6pt,
  [Gate], [When], [Evidence to present], [Board action],
  [#strong[G0 — authority and scoping];],
  [Start],
  [Named district owner, campus list, written legal/privacy scope,
  partners, safety restrictions],
  [Authorize assessment; not broad procurement],
  [#strong[G1 — critical controls];],
  [Days 1–30],
  [Statute-by-statute compliance, bleeding-control counts, drill and
  notification records, initial critical findings],
  [Fund/assign immediate corrections],
  [#strong[G2 — operational demonstration];],
  [Days 31–60],
  [Tested alert/egress/accessibility coverage, PSAP participation, event
  logs, first AAR/IP, credible fallback],
  [Require independent retests],
  [#strong[G3 — residual risk and investment];],
  [Days 61–90],
  [Closed versus open critical gaps, sustained readiness, comparative
  cost/benefit and harms of optional controls],
  [Approve, defer, condition or reject projects],
)]
)

A #emph[conditional approval] must expire without a satisfactory retest
or whenever material software, staffing, facility or legal changes
invalidate earlier evidence. The chief safety official should escalate
imminent protective deficiencies immediately, rather than waiting for
the next board meeting.

=== Assurance governance and automatic reopening of findings
<assurance-governance-and-automatic-reopening-of-findings>
#strong[PROPOSAL.] Maintain three linked artifacts: \(1) a
#strong[public board exception report] containing the number of assessed
campuses, unresolved mandatory requirements, categories of critical
controls, funding requests and correction timelines; \(2) a
#strong[restricted campus evidence packet] containing permitted test
results and sensitive facilities/personnel details; and \(3) a
#strong[student-specific protected case file] for individualized
reports, FERPA disclosures, reviews and corrections. Never copy student
allegations, exact security blind spots, protected routes or personnel
deployment rosters into public board packets.

Require independent #strong[reopening] whenever: a critical control
changes equipment/software/provider; a key qualified staff position or
coverage changes; a campus is reconfigured; a student-accessibility need
is unmet; an exercise finds an invalid assumption; a control has
materially false alerts; or a new binding requirement or credible
site-specific hazard invalidates the old test. Use an #strong[interim
protective measure] while reopening is investigated, and close only with
documented retest where applicable. \[F29–F30\] \[W01–W08\]

The district should report both #strong[readiness] \(percentage of
#emph[applicable] controls independently demonstrated for the tested
scope) and #strong[critical exceptions] \(absolute count and age,
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
opportunity cost]. If reliable prices or benefits are unavailable,
write #strong[TBD] rather than inventing estimates. Require a
sunset/re-approval trigger and a non-proprietary way to retain incident
evidence when changing vendors.

The choice is not only \'buy versus do nothing\': compare a technology
purchase with procedural corrections, staffed entry supervision,
improved communications, training, trauma supplies and tested
continuity. Prefer an intervention with measurable safety benefit and
acceptable unintended harms under real school conditions.

=== Decision thresholds for advanced procurement
<decision-thresholds-for-advanced-procurement>
Every proposal should present: \(1) problem and hazard model; \(2)
lawful purpose and authority; \(3) independent operational baseline;
\(4) measured improvement over less intrusive alternatives; \(5) adverse
consequences to students; \(6) sustainment staffing, integration and
outage modes; \(7) performance test and stop/rollback criteria.
#strong[Reject unverifiable claims of zero false alarms, instantaneous
intervention, universal weapon recognition or infallible offender
prediction.] \[F01\] \[F17\]

=== Nationwide innovation exchange and federal technical recommendations
Create a moderated national administrator community of practice, informed by BJA STOP School Violence TTA peer learning. Use a structured evidence dossier for proposals, unsuccessful pilots, independently replicated results, costs, legal constraints and adverse effects. Request nonbinding technical review from CISA, USSS NTAC, DOJ BJA/NIJ, ED and FEMA; coordinate with Washington OSPI and other state/Tribal agencies. Federal oversight or sponsorship requires agency agreement. Publish sanitized results only; keep students, live incidents and exploitable campus security data out of public archives.

== 9. Further-research agenda
<9-further-research-agenda>
+ #strong[Before-arrival life safety:] Which access, communications and
  medical measures show the largest practical benefit at the district’s
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

#strong[Research order:] Start with federal primary guidance and binding
state law, then independent effectiveness studies, then local
vulnerability and validation data. Agency warning bulletins describe
hazards; they are not proof of prevalence at a given school or proof
that a given vendor product is effective.

== 10. Glossary and evidence hierarchy
<10-glossary-and-evidence-hierarchy>
#strong[BTAM:] Behavioral Threat Assessment and Management.
#strong[PSAP:] Public Safety Answering Point \(911 dispatch).
#strong[SRO:] School Resource Officer. #strong[UAS/UGV/UxS:] unmanned
aircraft / ground / broad unmanned systems. #strong[C-UAS:]
counter-unmanned aircraft systems. #strong[EOP:] Emergency Operations
Plan. #strong[Less-lethal:] intended to reduce injury risk but not
harmless. #strong[Validated:] independent measured performance under
approved conditions; an untested planned feature is #strong[unassessed].

#strong[Legal reading hierarchy:] \(1) U.S. Constitution and applicable
binding federal law/cases; \(2) Washington
Constitution/statutes/regulations not conflicting with federal law; \(3)
binding district/agency policies and contracts; \(4) advisory federal
and state guidance; \(5) research, planning scenarios and product
claims. #emph[Guidance is not a license to search, monitor, detain,
discipline or use force.]

== 11. Campus field verification and independent assurance
<11-campus-field-verification-and-independent-assurance>
#strong[Controlled testing protocol • proposed district procedure]

#strong[Purpose.] Make the integrated advisory actionable without
publishing tactical security weaknesses or treating unperformed checks
as certification. This protocol is a #emph[district proposal], not a
new legal requirement. All template rows begin #strong[UNASSESSED].

=== 1. Approve the evaluation before any exercise
<1-approve-the-evaluation-before-any-exercise>
The district safety owner, school administrator, IT lead \(if relevant),
PSAP/agency partners \(if involved), privacy officer, accessibility lead
and evaluator agree on site, safe scope, objectives, fictional inputs,
abort/stop conditions, participants, access protections and record
retention. Never use real emergency calls, weapons, live counter-drone
equipment, coercive scenarios involving real children, or potentially
injurious force demonstrations as school exercises. Coordination and
legal approval are mandatory where specialist services are contemplated.
\[F07\] \[F29–F30\] \[W01\]

=== 2. Establish the legal baseline separately from tests
<2-establish-the-legal-baseline-separately-from-tests>
Use the legal compliance register \(Section 14). Verify every relevant
RCW obligation with current records or inspection: safe-school plan and
monthly drills; incident-command certification; employee/substitute
briefings; emergency response system; bleeding-control contents,
staffing and inspections; security-provider agreements, complaints and
reporting; behavior-based threat assessment; and FERPA disclosure logs.
#strong[An empty compliance entry is not a violation finding and not a
passing result.] \[W01–W08\] \[F25\]

=== 3. Select representative protective conditions
<3-select-representative-protective-conditions>
Use the representative test conditions \(Section 15). Include an
ordinary classroom, remote/portable area, crowded/noisy assembly,
transportation activity, accessible route, and formally controlled
communications outage. Test the #emph[entire path];: recognition,
authorized acknowledgment, occupant warning, safe protection,
coordination and fallback. Do not publish detailed diagrams, staffing
patterns or blind spots with the public board report. \[F01\] \[F07\]

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
  columns: 3,
  align: (col, row) => (auto,auto,auto,).at(col),
  inset: 6pt,
  [Result], [Permitted interpretation], [Required next action],
  [UNASSESSED],
  [Unknown; no credible evidence yet],
  [Assign owner and safe test],
  [DOCUMENTED ONLY],
  [Policy, equipment list or credential exists],
  [Arrange appropriate demonstration],
  [DEMONSTRATED / LIMITED],
  [Observed under named conditions],
  [Specify exclusions, fallback and retest],
  [VERIFIED FOR SCOPE],
  [Independent repeatable evidence for stated conditions],
  [Set expiry and change triggers],
  [CRITICAL DEFICIENCY],
  [Required control absent or material protective failure shown],
  [Implement immediate interim mitigation and escalate; do not average
  away],
)]
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
\[F17–F21\] \[W06–W11\]

=== 6. Close with an after-action and board exception report
<6-close-with-an-after-action-and-board-exception-report>
Create restricted evidence files and a sanitized board report: assessed
campuses and zones; mandatory compliance status; critical issues with
interim safeguards; accountable owners; dates; expenses; and independent
retest outcomes. Neither a favorable average score nor a later
procurement can close a verified critical failure. Reopen controls after
staff, facility, vendor, software, policy or materially changed risk
conditions. Use FEMA HSEEP/EEGs to align observations with exercise
objectives and a documented AAR/IP. \[F29–F30\]

#strong[Records:] the legal compliance register \(Section 14), the
representative test conditions \(Section 15), the assurance checklist
\(Section 13), the assurance checklist \(Section 13), and the threat and
control mapping \(Section 12).

#strong[Operational status:] No live school, dispatch, IT or security
verification conducted. The templates are ready for district
authorization, not a declaration of readiness.

== 12. Integrated threat vector register and countermeasure crosswalk
<12-integrated-threat-vector-register-and-countermeasure-crosswalk>
#strong[Assessment rule:] These 56 planning pathways are neither
incident-frequency estimates nor a list of confirmed local attacks.
Every candidate control must be evaluated for a particular campus. All
vector statuses remain #strong[UNASSESSED].

Each entry includes the existing threat taxonomy, recommended initial
protective response, proposed control IDs, responsible parties, and
evidence necessary for demonstrating coverage. Control IDs are expanded
in Section 13.

=== V01 — Firearm assault
<v01--firearm-assault>
#strong[Family:] Intentional violence | #strong[Evidence:] Documented
class | #strong[Status:] UNASSESSED.

#strong[Protective approach:] BTAM; access/alerts; trained response.
#strong[Immediate action:] Protect/alert/911/aid.

#strong[Candidate controls:] M01 M02 M03 M04 M10 M15. #strong[Owners:]
Facilities / principal; District safety / PSAP; Nurse / principal; BTAM
team; Law enforcement / district; Board / auditor. #strong[Minimum
evidence:] Campus applicability, actual coverage, authorized safe
demonstration, recorded failures, independent sign-off and retest date.

#strong[Inherited source labels:] S01 S03 \(cross-check against the
official bibliography before legal adoption).

=== V02 — Edged/blunt assault
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

#strong[Inherited source labels:] S01 S03 \(cross-check against the
official bibliography before legal adoption).

=== V03 — Explosive threat/IED
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

#strong[Inherited source labels:] S08 \(cross-check against the official
bibliography before legal adoption).

=== V04 — Arson/fire as attack
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

#strong[Inherited source labels:] S07 S15 \(cross-check against the
official bibliography before legal adoption).

=== V05 — Vehicular injury/ramming
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

#strong[Inherited source labels:] S01 \(cross-check against the official
bibliography before legal adoption).

=== V06 — Hostage/restraint
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

#strong[Inherited source labels:] S03 \(cross-check against the official
bibliography before legal adoption).

=== V07 — Targeted hate/ideological violence
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

#strong[Inherited source labels:] S03 S14 \(cross-check against the
official bibliography before legal adoption).

=== V08 — Domestic/personal grievance spillover
<v08--domesticpersonal-grievance-spillover>
#strong[Family:] Intentional violence | #strong[Evidence:] Foreseeable
class | #strong[Status:] UNASSESSED.

#strong[Protective approach:] Trusted reporting; access rules; Include
intimate partner or parental custody dispute spillover; verify lawful
orders and safe release before taking adverse action.. #strong[Immediate
action:] Protect students; police coordination.

#strong[Candidate controls:] M01 M02 M04 M15. #strong[Owners:]
Facilities / principal; District safety / PSAP; BTAM team; Board /
auditor. #strong[Minimum evidence:] Campus applicability, actual
coverage, authorized safe demonstration, recorded failures, independent
sign-off and retest date.

#strong[Inherited source labels:] S03 S46 S48 \(cross-check against the
official bibliography before legal adoption).

=== V09 — Insider access abuse
<v09--insider-access-abuse>
#strong[Family:] Intentional violence | #strong[Evidence:] Foreseeable
class | #strong[Status:] UNASSESSED.

#strong[Protective approach:] Least privilege; dual controls; Prevent
insider misuse of pickup records, student identity data and sensitive
contact information.. #strong[Immediate action:] Revoke access safely;
investigate.

#strong[Candidate controls:] M01 M02 M04 M15. #strong[Owners:]
Facilities / principal; District safety / PSAP; BTAM team; Board /
auditor. #strong[Minimum evidence:] Campus applicability, actual
coverage, authorized safe demonstration, recorded failures, independent
sign-off and retest date.

#strong[Inherited source labels:] S01 S09 S50 \(cross-check against the
official bibliography before legal adoption).

=== V10 — Remote accomplice/linked sites
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

#strong[Inherited source labels:] S03 S06 \(cross-check against the
official bibliography before legal adoption).

=== V11 — Sexual violence/exploitation
<v11--sexual-violenceexploitation>
#strong[Family:] Intentional violence | #strong[Evidence:] Documented
class | #strong[Status:] UNASSESSED.

#strong[Protective approach:] Victim support; trusted intake; Include
child trafficking victim protection and specialist referral, not only
sexual-violence event response.. #strong[Immediate action:] Safeguard
victim and report per law.

#strong[Candidate controls:] M01 M02 M04 M15. #strong[Owners:]
Facilities / principal; District safety / PSAP; BTAM team; Board /
auditor. #strong[Minimum evidence:] Campus applicability, actual
coverage, authorized safe demonstration, recorded failures, independent
sign-off and retest date.

#strong[Inherited source labels:] S05 S45 S49 \(cross-check against the
official bibliography before legal adoption).

=== V12 — Crowd surge/event violence
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

#strong[Inherited source labels:] S07 \(cross-check against the official
bibliography before legal adoption).

=== V13 — Self-harm or suicide crisis
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

#strong[Inherited source labels:] S03 S29 \(cross-check against the
official bibliography before legal adoption).

=== V14 — Deliberate hazardous-substance release
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

#strong[Inherited source labels:] S07 S08 \(cross-check against the
official bibliography before legal adoption).

=== U01 — Unsafe/hostile drone
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

#strong[Inherited source labels:] S10 S32 \(cross-check against the
official bibliography before legal adoption).

=== U02 — Unmanned ground rover
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

#strong[Inherited source labels:] S01 \(cross-check against the official
bibliography before legal adoption).

=== U03 — Aggressive canine
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

#strong[Inherited source labels:] S13 \(cross-check against the official
bibliography before legal adoption).

=== U04 — Other dangerous animals
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

#strong[Inherited source labels:] S07 \(cross-check against the official
bibliography before legal adoption).

=== U05 — Remote-enabled mixed attack
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

#strong[Inherited source labels:] S01 S32 \(cross-check against the
official bibliography before legal adoption).

=== D01 — Threatening social post
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

#strong[Inherited source labels:] S05 S06 \(cross-check against the
official bibliography before legal adoption).

=== D02 — Swatting/false bomb report
<d02--swattingfalse-bomb-report>
#strong[Family:] Information & cyber | #strong[Evidence:] Documented
federal advisory 2026 | #strong[Status:] UNASSESSED.

#strong[Protective approach:] Joint school–dispatch swatting plan; staff
training and authenticated callback via known contacts.
#strong[Immediate action:] Protect first while dispatch evaluates
parallel evidence; minimize amplification.

#strong[Candidate controls:] M02 M05 M07 M15. #strong[Owners:] District
safety / PSAP; PSAP / principal; IT / district safety; Board / auditor.
#strong[Minimum evidence:] Campus applicability, actual coverage,
authorized safe demonstration, recorded failures, independent sign-off
and retest date.

#strong[Inherited source labels:] S28 S36 \(cross-check against the
official bibliography before legal adoption).

=== D03 — Coordinated false allegation
<d03--coordinated-false-allegation>
#strong[Family:] Information & cyber | #strong[Evidence:] Documented
class and federal guidance | #strong[Status:] UNASSESSED.

#strong[Protective approach:] Independent evidence chain and reviewer;
flag clusters, impersonation or coordinated identical tips; Extend
independent review to coordinated political/financial claims,
foreign-actor impersonation, and child-release falsehoods; do not assign
culpability from report volume.. #strong[Immediate action:] Protection
based on danger; no public allegation or disciplinary assumption.

#strong[Candidate controls:] M02 M05 M07 M15. #strong[Owners:] District
safety / PSAP; PSAP / principal; IT / district safety; Board / auditor.
#strong[Minimum evidence:] Campus applicability, actual coverage,
authorized safe demonstration, recorded failures, independent sign-off
and retest date.

#strong[Inherited source labels:] S05 S06 S28 S42 S47 S50 \(cross-check
against the official bibliography before legal adoption).

=== D04 — Deepfake/forged evidence
<d04--deepfakeforged-evidence>
#strong[Family:] Information & cyber | #strong[Evidence:] Documented
class; FTC 2026 guidance | #strong[Status:] UNASSESSED.

#strong[Protective approach:] Provenance checks; independently verify
audio/video; preserve metadata without replicating sexual imagery; FTC
removal route; Use two-channel verification for synthetic missing-child
imagery or purported foreign official communications.. #strong[Immediate
action:] Do not publicly identify or punish based only on media; secure
victim assistance.

#strong[Candidate controls:] M02 M05 M07 M15. #strong[Owners:] District
safety / PSAP; PSAP / principal; IT / district safety; Board / auditor.
#strong[Minimum evidence:] Campus applicability, actual coverage,
authorized safe demonstration, recorded failures, independent sign-off
and retest date.

#strong[Inherited source labels:] S30 S31 S34 S39 S41 S47 S50
\(cross-check against the official bibliography before legal adoption).

=== D05 — Cyberbullying/sextortion
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

#strong[Inherited source labels:] S29 S30 S31 S38 S39 \(cross-check
against the official bibliography before legal adoption).

=== D06 — Doxing/privacy abuse
<d06--doxingprivacy-abuse>
#strong[Family:] Information & cyber | #strong[Evidence:] Documented
class | #strong[Status:] UNASSESSED.

#strong[Protective approach:] Reduce student exposure; private reporting
and protected record handling; provide content removal referrals; Add
family and custody contact restrictions, student itinerary and
reunification data minimization.. #strong[Immediate action:] Protect
student, document only necessary details and minimize recirculation.

#strong[Candidate controls:] M02 M05 M07 M15. #strong[Owners:] District
safety / PSAP; PSAP / principal; IT / district safety; Board / auditor.
#strong[Minimum evidence:] Campus applicability, actual coverage,
authorized safe demonstration, recorded failures, independent sign-off
and retest date.

#strong[Inherited source labels:] S29 S30 S31 S37 S42 S50 \(cross-check
against the official bibliography before legal adoption).

=== D07 — Compromised alerts/PA
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

#strong[Inherited source labels:] S33 S35 S40 \(cross-check against the
official bibliography before legal adoption).

=== D08 — Ransomware/data theft
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

#strong[Inherited source labels:] S33 S35 S40 \(cross-check against the
official bibliography before legal adoption).

=== D09 — Camera or access-control compromise
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

#strong[Inherited source labels:] S33 S35 S40 \(cross-check against the
official bibliography before legal adoption).

=== D10 — Political/religious targeting
<d10--politicalreligious-targeting>
#strong[Family:] Information & cyber | #strong[Evidence:] Foreseeable
class | #strong[Status:] UNASSESSED.

#strong[Protective approach:] Nonideological threat standards; rights
review; Protect ideologically targeted persons; apply viewpoint-neutral
conduct criteria and evidence-based escalation.. #strong[Immediate
action:] Protect targets, investigate conduct.

#strong[Candidate controls:] M02 M05 M07 M15. #strong[Owners:] District
safety / PSAP; PSAP / principal; IT / district safety; Board / auditor.
#strong[Minimum evidence:] Campus applicability, actual coverage,
authorized safe demonstration, recorded failures, independent sign-off
and retest date.

#strong[Inherited source labels:] S03 S14 S42 S53 \(cross-check against
the official bibliography before legal adoption).

=== D11 — Disinformation/impersonation
<d11--disinformationimpersonation>
#strong[Family:] Information & cyber | #strong[Evidence:] Documented
class | #strong[Status:] UNASSESSED.

#strong[Protective approach:] Verify sender and message origin with
trusted contacts; guard against synthetic impersonation; Authenticate
government impersonation, foreign official requests and faux legal
notices before disclosure.. #strong[Immediate action:] Cross-check
before adverse attribution; dispatch on material threat.

#strong[Candidate controls:] M02 M05 M07 M14 M15. #strong[Owners:]
District safety / PSAP; PSAP / principal; IT / district safety; Privacy
officer / counsel; Board / auditor. #strong[Minimum evidence:] Campus
applicability, actual coverage, authorized safe demonstration, recorded
failures, independent sign-off and retest date.

#strong[Inherited source labels:] S28 S34 S42 S47 \(cross-check against
the official bibliography before legal adoption).

=== D12 — Remote grooming/coercion
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

#strong[Inherited source labels:] S29 S34 S38 S39 \(cross-check against
the official bibliography before legal adoption).

=== E01 — Building fire / smoke
<e01--building-fire--smoke>
#strong[Family:] Environmental | #strong[Evidence:] Documented class |
#strong[Status:] UNASSESSED.

#strong[Protective approach:] Alarms, inspections, egress.
#strong[Immediate action:] Evacuate/shelter per fire hazard.

#strong[Candidate controls:] M02 M03 M15. #strong[Owners:] District
safety / PSAP; Nurse / principal; Board / auditor. #strong[Minimum
evidence:] Campus applicability, actual coverage, authorized safe
demonstration, recorded failures, independent sign-off and retest date.

#strong[Inherited source labels:] S07 S15 \(cross-check against the
official bibliography before legal adoption).

=== E02 — Earthquake/structural collapse
<e02--earthquakestructural-collapse>
#strong[Family:] Environmental | #strong[Evidence:] Documented class |
#strong[Status:] UNASSESSED.

#strong[Protective approach:] Drills; facilities assessment.
#strong[Immediate action:] Earthquake protective action then assess.

#strong[Candidate controls:] M02 M03 M15. #strong[Owners:] District
safety / PSAP; Nurse / principal; Board / auditor. #strong[Minimum
evidence:] Campus applicability, actual coverage, authorized safe
demonstration, recorded failures, independent sign-off and retest date.

#strong[Inherited source labels:] S07 S15 \(cross-check against the
official bibliography before legal adoption).

=== E03 — Wildfire/smoke/air quality
<e03--wildfiresmokeair-quality>
#strong[Family:] Environmental | #strong[Evidence:] Documented class |
#strong[Status:] UNASSESSED.

#strong[Protective approach:] HVAC plans; air-quality thresholds.
#strong[Immediate action:] Shelter/evacuate per official guidance.

#strong[Candidate controls:] M02 M03 M15. #strong[Owners:] District
safety / PSAP; Nurse / principal; Board / auditor. #strong[Minimum
evidence:] Campus applicability, actual coverage, authorized safe
demonstration, recorded failures, independent sign-off and retest date.

#strong[Inherited source labels:] S07 \(cross-check against the official
bibliography before legal adoption).

=== E04 — Flood/landslide/severe rain
<e04--floodlandslidesevere-rain>
#strong[Family:] Environmental | #strong[Evidence:] Documented class |
#strong[Status:] UNASSESSED.

#strong[Protective approach:] Site warnings; routes. #strong[Immediate
action:] Relocate and reunify safely.

#strong[Candidate controls:] M02 M03 M15. #strong[Owners:] District
safety / PSAP; Nurse / principal; Board / auditor. #strong[Minimum
evidence:] Campus applicability, actual coverage, authorized safe
demonstration, recorded failures, independent sign-off and retest date.

#strong[Inherited source labels:] S07 \(cross-check against the official
bibliography before legal adoption).

=== E05 — High wind/lightning/extreme temp
<e05--high-windlightningextreme-temp>
#strong[Family:] Environmental | #strong[Evidence:] Documented class |
#strong[Status:] UNASSESSED.

#strong[Protective approach:] Weather monitoring; shelter.
#strong[Immediate action:] Stop outdoor exposure; shelter.

#strong[Candidate controls:] M02 M03 M15. #strong[Owners:] District
safety / PSAP; Nurse / principal; Board / auditor. #strong[Minimum
evidence:] Campus applicability, actual coverage, authorized safe
demonstration, recorded failures, independent sign-off and retest date.

#strong[Inherited source labels:] S07 \(cross-check against the official
bibliography before legal adoption).

=== E06 — Gas leak / chemical plume / lab spill
<e06--gas-leak--chemical-plume--lab-spill>
#strong[Family:] Environmental | #strong[Evidence:] Documented class |
#strong[Status:] UNASSESSED.

#strong[Protective approach:] Inspection; fire/hazmat plan.
#strong[Immediate action:] Protect, evacuate/shelter as indicated.

#strong[Candidate controls:] M02 M03 M15. #strong[Owners:] District
safety / PSAP; Nurse / principal; Board / auditor. #strong[Minimum
evidence:] Campus applicability, actual coverage, authorized safe
demonstration, recorded failures, independent sign-off and retest date.

#strong[Inherited source labels:] S07 \(cross-check against the official
bibliography before legal adoption).

=== E07 — Water/food contamination
<e07--waterfood-contamination>
#strong[Family:] Environmental | #strong[Evidence:] Documented class |
#strong[Status:] UNASSESSED.

#strong[Protective approach:] Public-health protocols. #strong[Immediate
action:] Isolate source; notify health office.

#strong[Candidate controls:] M02 M03 M15. #strong[Owners:] District
safety / PSAP; Nurse / principal; Board / auditor. #strong[Minimum
evidence:] Campus applicability, actual coverage, authorized safe
demonstration, recorded failures, independent sign-off and retest date.

#strong[Inherited source labels:] S07 \(cross-check against the official
bibliography before legal adoption).

=== E08 — Infectious disease outbreak
<e08--infectious-disease-outbreak>
#strong[Family:] Environmental | #strong[Evidence:] Documented class |
#strong[Status:] UNASSESSED.

#strong[Protective approach:] Public-health liaison; sanitation.
#strong[Immediate action:] Implement health guidance.

#strong[Candidate controls:] M02 M03 M15. #strong[Owners:] District
safety / PSAP; Nurse / principal; Board / auditor. #strong[Minimum
evidence:] Campus applicability, actual coverage, authorized safe
demonstration, recorded failures, independent sign-off and retest date.

#strong[Inherited source labels:] S07 \(cross-check against the official
bibliography before legal adoption).

=== E09 — Mass medical crisis/overdose
<e09--mass-medical-crisisoverdose>
#strong[Family:] Environmental | #strong[Evidence:] Documented class |
#strong[Status:] UNASSESSED.

#strong[Protective approach:] Mandatory RCW 28A.210.440: accessible
campus bleeding-control kit; qualifying contents; 2+ trained employees
\(more if enrollment \>1,000); annual/after-use inventory and
replacement; AED/EMS integration.. #strong[Immediate action:] Activate
911/EMS; ensure trained lifesaving aid and accessible kit; replenish and
document after use..

#strong[Candidate controls:] M02 M03 M15. #strong[Owners:] District
safety / PSAP; Nurse / principal; Board / auditor. #strong[Minimum
evidence:] Campus applicability, actual coverage, authorized safe
demonstration, recorded failures, independent sign-off and retest date.

#strong[Inherited source labels:] S07 S27 \(cross-check against the
official bibliography before legal adoption).

=== I01 — Power failure
<i01--power-failure>
#strong[Family:] Infrastructure | #strong[Evidence:] Documented class |
#strong[Status:] UNASSESSED.

#strong[Protective approach:] Backup alerts, egress and operations.
#strong[Immediate action:] Manual continuity and safety checks.

#strong[Candidate controls:] M02 M07 M15. #strong[Owners:] District
safety / PSAP; IT / district safety; Board / auditor. #strong[Minimum
evidence:] Campus applicability, actual coverage, authorized safe
demonstration, recorded failures, independent sign-off and retest date.

#strong[Inherited source labels:] S07 \(cross-check against the official
bibliography before legal adoption).

=== I02 — Telecom/radio outage
<i02--telecomradio-outage>
#strong[Family:] Infrastructure | #strong[Evidence:] Documented class |
#strong[Status:] UNASSESSED.

#strong[Protective approach:] Independent channels. #strong[Immediate
action:] Switch to tested alternative.

#strong[Candidate controls:] M02 M07 M15. #strong[Owners:] District
safety / PSAP; IT / district safety; Board / auditor. #strong[Minimum
evidence:] Campus applicability, actual coverage, authorized safe
demonstration, recorded failures, independent sign-off and retest date.

#strong[Inherited source labels:] S07 S09 S35 S40 \(cross-check against
the official bibliography before legal adoption).

=== I03 — HVAC/fire/water failure
<i03--hvacfirewater-failure>
#strong[Family:] Infrastructure | #strong[Evidence:] Documented class |
#strong[Status:] UNASSESSED.

#strong[Protective approach:] Maintenance, alternate occupancy.
#strong[Immediate action:] Site hazard assessment and relocation.

#strong[Candidate controls:] M02 M07 M15. #strong[Owners:] District
safety / PSAP; IT / district safety; Board / auditor. #strong[Minimum
evidence:] Campus applicability, actual coverage, authorized safe
demonstration, recorded failures, independent sign-off and retest date.

#strong[Inherited source labels:] S07 \(cross-check against the official
bibliography before legal adoption).

=== I04 — Transportation accident
<i04--transportation-accident>
#strong[Family:] Infrastructure | #strong[Evidence:] Documented class |
#strong[Status:] UNASSESSED.

#strong[Protective approach:] Rosters/driver comms/EMS plans.
#strong[Immediate action:] Account for passengers and reunify.

#strong[Candidate controls:] M02 M07 M15. #strong[Owners:] District
safety / PSAP; IT / district safety; Board / auditor. #strong[Minimum
evidence:] Campus applicability, actual coverage, authorized safe
demonstration, recorded failures, independent sign-off and retest date.

#strong[Inherited source labels:] S07 \(cross-check against the official
bibliography before legal adoption).

=== I05 — Supply-chain or vendor failure
<i05--supply-chain-or-vendor-failure>
#strong[Family:] Infrastructure | #strong[Evidence:] Foreseeable class |
#strong[Status:] UNASSESSED.

#strong[Protective approach:] Maintenance reserve; alternate suppliers.
#strong[Immediate action:] Continuity plan; risk triage.

#strong[Candidate controls:] M02 M07 M15. #strong[Owners:] District
safety / PSAP; IT / district safety; Board / auditor. #strong[Minimum
evidence:] Campus applicability, actual coverage, authorized safe
demonstration, recorded failures, independent sign-off and retest date.

#strong[Inherited source labels:] S07 \(cross-check against the official
bibliography before legal adoption).

=== C01 — Simultaneous hazards
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

#strong[Inherited source labels:] S07 \(cross-check against the official
bibliography before legal adoption).

=== C02 — False alert masking real incident
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

#strong[Inherited source labels:] S28 S36 \(cross-check against the
official bibliography before legal adoption).

=== C03 — Unclassified emerging mechanism
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

#strong[Inherited source labels:] S01 S07 \(cross-check against the
official bibliography before legal adoption).

=== T01 — Transnational repression of student or family
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

#strong[Inherited source labels:] S42 S43 S53 \(cross-check against the
official bibliography before legal adoption).

=== T02 — Foreign-origin coercion or misuse of school data
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

#strong[Inherited source labels:] S42 S43 S50 \(cross-check against the
official bibliography before legal adoption).

=== T03 — Organized-crime recruitment, debt/extortion or forced courier activity
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

#strong[Inherited source labels:] S44 S45 S51 \(cross-check against the
official bibliography before legal adoption).

=== T04 — Minor labor/sex trafficking exploitation
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

#strong[Inherited source labels:] S45 S49 S52 \(cross-check against the
official bibliography before legal adoption).

=== T05 — Physical child abduction or luring at school/transit
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

#strong[Inherited source labels:] S46 \(cross-check against the official
bibliography before legal adoption).

=== T06 — Custodial interference or unauthorized release
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

#strong[Inherited source labels:] S46 S48 \(cross-check against the
official bibliography before legal adoption).

=== T07 — Virtual kidnapping and synthetic ransom claims
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

#strong[Inherited source labels:] S47 \(cross-check against the official
bibliography before legal adoption).

=== T08 — Nonviolent political/reputational or economic coercion
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

#strong[Inherited source labels:] S42 S50 S51 \(cross-check against the
official bibliography before legal adoption).

== 13. Protective capability assurance catalogue
<13-protective-capability-assurance-catalogue>
#strong[Use:] A control is not validated merely because it appears on a
purchase order, has a vendor demonstration, or was discussed in a
tabletop. Independent reviewers record site, relevant population,
preapproved test scope, results, accessibility and change-triggered
retest. #strong[No aggregate score can override failure of accessible
egress, a mandated medical control, or a critical alert channel.]

=== M01 — Access and egress
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

=== M02 — Emergency notification and PSAP
<m02--emergency-notification-and-psap>
#strong[Priority:] P0 | #strong[Owner:] District safety / PSAP |
#strong[Current state:] UNASSESSED.

#strong[Representative conditions:] Representative in-scope campus
conditions.

#strong[Evidence for acceptance:] Dual route alerts, dispatch contact,
logs.

#strong[Invalidating failure:] Spoofed command; disconnected classroom.
#strong[Life-safety gate:] Review for critical life-safety function.

=== M03 — Bleeding-control kits
<m03--bleeding-control-kits>
#strong[Priority:] P0 | #strong[Owner:] Nurse / principal |
#strong[Current state:] UNASSESSED.

#strong[Representative conditions:] Representative in-scope campus
conditions.

#strong[Evidence for acceptance:] Kit content, expiration, trained
staff, inventories.

#strong[Invalidating failure:] Missing supplies or trained personnel.
#strong[Life-safety gate:] Review for critical life-safety function.

=== M04 — BTAM and student safeguarding
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

=== M05 — False-report and swatting protocol
<m05--false-report-and-swatting-protocol>
#strong[Priority:] P0 | #strong[Owner:] PSAP / principal |
#strong[Current state:] UNASSESSED.

#strong[Representative conditions:] Representative in-scope campus
conditions.

#strong[Evidence for acceptance:] Parallel protect-and-verify practice.

#strong[Invalidating failure:] Discipline by accusation; unnecessary
disclosure. #strong[Life-safety gate:] Review for critical life-safety
function.

=== M06 — Visitor and student release
<m06--visitor-and-student-release>
#strong[Priority:] P0 | #strong[Owner:] Attendance / principal |
#strong[Current state:] UNASSESSED.

#strong[Representative conditions:] Representative in-scope campus
conditions.

#strong[Evidence for acceptance:] Custody restrictions, visitor ID,
verification logs.

#strong[Invalidating failure:] Wrongful denial; unsafe release.
#strong[Life-safety gate:] Review for critical life-safety function.

=== M07 — School cyber / alerts resilience
<m07--school-cyber--alerts-resilience>
#strong[Priority:] P1 | #strong[Owner:] IT / district safety |
#strong[Current state:] UNASSESSED.

#strong[Representative conditions:] Representative in-scope campus
conditions.

#strong[Evidence for acceptance:] MFA, backups, communications
segregation.

#strong[Invalidating failure:] False instructions; data exposure.
#strong[Life-safety gate:] Review for critical life-safety function.

=== M08 — Entry screening
<m08--entry-screening>
#strong[Priority:] P1 | #strong[Owner:] Facilities / counsel |
#strong[Current state:] UNASSESSED.

#strong[Representative conditions:] Representative in-scope campus
conditions.

#strong[Evidence for acceptance:] Legal basis; throughput/false-alert
test.

#strong[Invalidating failure:] Disparate treatment, blocked egress.
#strong[Life-safety gate:] Review for critical life-safety function.

=== M09 — AI camera detections
<m09--ai-camera-detections>
#strong[Priority:] P2 | #strong[Owner:] IT / counsel / evaluator |
#strong[Current state:] UNASSESSED.

#strong[Representative conditions:] Representative in-scope campus
conditions.

#strong[Evidence for acceptance:] Independent annotated tests, baseline,
logs.

#strong[Invalidating failure:] False positives and missed events.
#strong[Life-safety gate:] Review for critical life-safety function.

=== M10 — SRO/authorized armed coverage
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

=== M11 — Less-lethal and force governance
<m11--less-lethal-and-force-governance>
#strong[Priority:] P2 | #strong[Owner:] Agency / counsel |
#strong[Current state:] UNASSESSED.

#strong[Representative conditions:] Representative in-scope campus
conditions.

#strong[Evidence for acceptance:] Authorized equipment/training, review.

#strong[Invalidating failure:] Injury, unauthorized uses.
#strong[Life-safety gate:] Review for critical life-safety function.

=== M12 — Detection canine services
<m12--detection-canine-services>
#strong[Priority:] P2 | #strong[Owner:] Specialist handler / legal |
#strong[Current state:] UNASSESSED.

#strong[Representative conditions:] Representative in-scope campus
conditions.

#strong[Evidence for acceptance:] Trained handler, defined search
purpose, accommodations.

#strong[Invalidating failure:] False alert; bite; disability impact.
#strong[Life-safety gate:] Review for critical life-safety function.

=== M13 — Counter-UxS observation/referral
<m13--counter-uxs-observationreferral>
#strong[Priority:] P2 | #strong[Owner:] District / specialized agency |
#strong[Current state:] UNASSESSED.

#strong[Representative conditions:] Representative in-scope campus
conditions.

#strong[Evidence for acceptance:] Passive observations, authority check.

#strong[Invalidating failure:] Unlawful interdiction; false attribution.
#strong[Life-safety gate:] Review for critical life-safety function.

=== M14 — FERPA information sharing
<m14--ferpa-information-sharing>
#strong[Priority:] P0 | #strong[Owner:] Privacy officer / counsel |
#strong[Current state:] UNASSESSED.

#strong[Representative conditions:] Representative in-scope campus
conditions.

#strong[Evidence for acceptance:] Need and legal basis; emergency
recipient log.

#strong[Invalidating failure:] Overdisclosure; exercise misuse.
#strong[Life-safety gate:] Review for critical life-safety function.

=== M15 — Quarterly independent review
<m15--quarterly-independent-review>
#strong[Priority:] P1 | #strong[Owner:] Board / auditor |
#strong[Current state:] UNASSESSED.

#strong[Representative conditions:] Representative in-scope campus
conditions.

#strong[Evidence for acceptance:] Evidence tier and remediation log.

#strong[Invalidating failure:] Unassessed listed as passed.
#strong[Life-safety gate:] Review for critical life-safety function.

== 14. Washington compliance and legal approval checklist
<14-washington-compliance-and-legal-approval-checklist>
#strong[Legal hierarchy:] Federal constitutional protections control
over inconsistent state practice. Washington requirements may provide
additional protections. This is a planning crosswalk, not legal advice.
Counsel must confirm applicability, updated text and evidence before
declaring legal compliance. #strong[Empty records do not establish
either passing compliance or a proven violation.]

=== C01 — Safe school plan incl accessibility and reunification
<c01--safe-school-plan-incl-accessibility-and-reunification>
#strong[Authority:] W01 | #strong[Responsible:] District safety /
principal | #strong[Priority:] P0.

#strong[Minimum verification evidence:] Approved current campus plan,
accessible alternatives, reunification contacts. #strong[Status:]
UNASSESSED; district counsel and independent reviewer to determine
applicability and closure.

=== C02 — Monthly drills while students in session
<c02--monthly-drills-while-students-in-session>
#strong[Authority:] W01 | #strong[Responsible:] Principal |
#strong[Priority:] P0.

#strong[Minimum verification evidence:] Drill dates, times, type,
accessible participation, exceptions. #strong[Status:] UNASSESSED;
district counsel and independent reviewer to determine applicability and
closure.

=== C03 — Principal incident-command certification
<c03--principal-incident-command-certification>
#strong[Authority:] W01 | #strong[Responsible:] District safety |
#strong[Priority:] P0.

#strong[Minimum verification evidence:] Principal current ICS
certificate and appointed substitute plan. #strong[Status:] UNASSESSED;
district counsel and independent reviewer to determine applicability and
closure.

=== C04 — Temporary/substitute staff notification
<c04--temporarysubstitute-staff-notification>
#strong[Authority:] W01 | #strong[Responsible:] Principal / HR |
#strong[Priority:] P0.

#strong[Minimum verification evidence:] Documented briefing method and
sample receipt. #strong[Status:] UNASSESSED; district counsel and
independent reviewer to determine applicability and closure.

=== C05 — Emergency response system and partner coordination
<c05--emergency-response-system-and-partner-coordination>
#strong[Authority:] W02 | #strong[Responsible:] District / 911 PSAP |
#strong[Priority:] P0.

#strong[Minimum verification evidence:] Selected qualifying capability
plus collaborative planning and safe exercise evidence. #strong[Status:]
UNASSESSED; district counsel and independent reviewer to determine
applicability and closure.

=== C06 — Bleeding-control equipment per campus
<c06--bleeding-control-equipment-per-campus>
#strong[Authority:] W03 | #strong[Responsible:] School nurse /
facilities | #strong[Priority:] P0.

#strong[Minimum verification evidence:] Physical kit placement, required
contents, accessibility. #strong[Status:] UNASSESSED; district counsel
and independent reviewer to determine applicability and closure.

=== C07 — Bleeding-control training coverage
<c07--bleeding-control-training-coverage>
#strong[Authority:] W03 | #strong[Responsible:] School nurse / HR |
#strong[Priority:] P0.

#strong[Minimum verification evidence:] Enrollment, trained employee
count, course completion records. #strong[Status:] UNASSESSED; district
counsel and independent reviewer to determine applicability and closure.

=== C08 — Bleeding-control inspections and replacements
<c08--bleeding-control-inspections-and-replacements>
#strong[Authority:] W03 | #strong[Responsible:] School nurse |
#strong[Priority:] P0.

#strong[Minimum verification evidence:] Annual and after-use
inventory/replenishment logs. #strong[Status:] UNASSESSED; district
counsel and independent reviewer to determine applicability and closure.

=== C09 — Behavior-based multidisciplinary threat assessment
<c09--behavior-based-multidisciplinary-threat-assessment>
#strong[Authority:] W04 | #strong[Responsible:] BTAM director |
#strong[Priority:] P0.

#strong[Minimum verification evidence:] Team composition,
case-processing safeguards, referral outcome review. #strong[Status:]
UNASSESSED; district counsel and independent reviewer to determine
applicability and closure.

=== C10 — Notice and malicious-report provisions
<c10--notice-and-malicious-report-provisions>
#strong[Authority:] W05 | #strong[Responsible:] Counsel / principal |
#strong[Priority:] P0.

#strong[Minimum verification evidence:] Adopted policy and balanced
reporting/attribution safeguards. #strong[Status:] UNASSESSED; district
counsel and independent reviewer to determine applicability and closure.

=== C11 — Security staff duties and complaint procedure
<c11--security-staff-duties-and-complaint-procedure>
#strong[Authority:] W06 | #strong[Responsible:] Principal / counsel |
#strong[Priority:] Conditional.

#strong[Minimum verification evidence:] Current role and complaint
policy; family communication. #strong[Status:] UNASSESSED; district
counsel and independent reviewer to determine applicability and closure.

=== C12 — Annual safety and security provider agreement
<c12--annual-safety-and-security-provider-agreement>
#strong[Authority:] W07 | #strong[Responsible:] District counsel |
#strong[Priority:] Conditional.

#strong[Minimum verification evidence:] Current annually adopted
agreement, community process and training terms. #strong[Status:]
UNASSESSED; district counsel and independent reviewer to determine
applicability and closure.

=== C13 — Security staffing / force / complaints reporting
<c13--security-staffing--force--complaints-reporting>
#strong[Authority:] W08 | #strong[Responsible:] District compliance |
#strong[Priority:] Conditional.

#strong[Minimum verification evidence:] Annual data submission
confirmation and scope check. #strong[Status:] UNASSESSED; district
counsel and independent reviewer to determine applicability and closure.

=== C14 — FERPA emergency disclosure documentation
<c14--ferpa-emergency-disclosure-documentation>
#strong[Authority:] F25 L02 | #strong[Responsible:] Privacy officer |
#strong[Priority:] Conditional.

#strong[Minimum verification evidence:] Student-record entry of
articulable/significant threat and each recipient. #strong[Status:]
UNASSESSED; district counsel and independent reviewer to determine
applicability and closure.

=== C15 — HSEEP-style exercise evidence and corrections
<c15--hseep-style-exercise-evidence-and-corrections>
#strong[Authority:] F29 F30 | #strong[Responsible:] District safety /
evaluator | #strong[Priority:] Proposed.

#strong[Minimum verification evidence:] Exercise objectives, evaluator
sheets, AAR/IP, retest tickets. #strong[Status:] UNASSESSED; district
counsel and independent reviewer to determine applicability and closure.

== 15. Representative field sampling, exercises and remediation
<15-representative-field-sampling-exercises-and-remediation>
District teams must preapprove all tests and use fictional inputs. Never
trigger actual emergency dispatches, obstruct egress, deploy weapons or
employ live coercive or harmful scenarios. Detailed campus geometry,
patrol schedules and sensor placement belong in restricted local
records. The following samples are a minimum proposed coverage set, not
a certification of readiness.

=== S01 — Typical classroom
<s01--typical-classroom>
#strong[Conditions:] Standard staffed hours. #strong[Observable
outcome:] Alert received/understood; safe action. #strong[Safe scope:]
At least one ordinary school-day sample.

=== S02 — Portable or remote teaching space
<s02--portable-or-remote-teaching-space>
#strong[Conditions:] School day. #strong[Observable outcome:] Fallback
and accessible warning. #strong[Safe scope:] Include spaces separate
from main building.

=== S03 — Sports or outdoor gathering
<s03--sports-or-outdoor-gathering>
#strong[Conditions:] After-school activity. #strong[Observable outcome:]
Accessible alert, staff/PSAP communication. #strong[Safe scope:] Include
changing ambient noise.

=== S04 — Transportation / loading
<s04--transportation--loading>
#strong[Conditions:] Arrival/departure. #strong[Observable outcome:]
Accountability and warning receipt. #strong[Safe scope:] Coordinate with
transportation; no simulated danger.

=== S05 — Accessible route / accommodation
<s05--accessible-route--accommodation>
#strong[Conditions:] Ordinary use. #strong[Observable outcome:] Equal
warning and protective alternatives. #strong[Safe scope:] Participant
accommodation and privacy approved.

=== S06 — Approved degraded-IT exercise
<s06--approved-degraded-it-exercise>
#strong[Conditions:] Controlled test only. #strong[Observable outcome:]
Authenticated fallback without production interruption. #strong[Safe
scope:] IT and dispatch signoff; no real 911 message.

=== S07 — Independent false-report verification
<s07--independent-false-report-verification>
#strong[Conditions:] Fictional tabletop. #strong[Observable outcome:]
Parallel protection + evidence checks + correction. #strong[Safe scope:]
Use fictional identities, no student records.

=== S08 — Medical kit and trained-staff coverage
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
conditions. \[F29–F30\]

=== Additional official sources — nationwide forum proposal
- *N01.* #link("https://bja.ojp.gov/funding/webinar/fy23-stop-tta-recording")[BJA FY2023 STOP Training and Technical Assistance Program] — federal program presentation describing learning sites, communities of practice, and shared resources; precedent, not endorsement.
- *N02.* #link("https://bja.ojp.gov/program/stop-school-violence-program/overview")[BJA STOP School Violence Program overview] — evidence standards and funding limitations; eligibility does not establish any specific award.
- *N03.* #link("https://www.cisa.gov/sites/default/files/2022-11/k12-school-security-guide-3rd-edition-022022-508.pdf")[CISA K-12 School Security Guide, Third Edition] — standard terminology for physical-security systems and locally relevant risk assessment.

== 16. Annotated research bibliography and further reading
<16-annotated-research-bibliography-and-further-reading>
#strong[Source-currency note:] The 50-item source ledger retains Version
11.3 entries and adds FEMA Exercise Evaluation Guides \[F30\] and U.S.
Department of Education emergency-planning guidance \[F31\]. The central
Washington safe-school, emergency-system, bleeding-control,
security-staff and malicious-report statutes, CISA school-security
scope, federal EOP planning, FERPA FAQ and FEMA exercise doctrine were
reviewed against official government pages. The remaining inherited
documents and links have #strong[not] all received fresh line-by-line
review. Confirm the live law and regulations before adoption. Agency
guidance and research are not binding legal authority unless another
rule incorporates them.

#strong[How to use it.] Each entry identifies a primary government
source, publication date or current status, authority class and specific
research application. Read the full text before citing a mandate; a
federal guidance document is not necessarily binding. The links below
lead to agency or legislature publications. The source set is a targeted
research starting point rather than a claim of exhaustive legal review.
Newly added technical and privacy sources F24–F28 have been checked
against the named agency pages; other links remain subject to periodic
link and currency review.

=== Federal school-security doctrine
<federal-school-security-doctrine>
#strong[F01 ·
#link("https://www.cisa.gov/sites/default/files/publications/k12-school-security-guide-3rd-edition-022022-508.pdf")[K-12 School Security Guide, Third Edition];]
\
#emph[CISA · 2022 · Federal guidance.] \
Primary framework for layered physical-security design, site-specific
assessments, physical-security elements, and decision sequencing; not a
mandate to buy particular equipment.

#strong[F02 ·
#link("https://www.secretservice.gov/sites/default/files/reports/2020-06/USSS_NTAC_Enhancing_School_Safety_Guide_7.11.18.pdf")[Enhancing School Safety Using a Threat Assessment Model: An Operational Guide];]
\
#emph[U.S. Secret Service NTAC · 2018 · Federal operational guidance.] \
Foundational behavioral threat assessment and management \(BTAM)
methodology; explicitly rejects a demographic or personality attacker
profile.

#strong[F03 ·
#link("https://www.secretservice.gov/sites/default/files/2020-04/Protecting_Americas_Schools.pdf")[Protecting America\'s Schools: A U.S. Secret Service Analysis of Targeted School Violence];]
\
#emph[U.S. Secret Service NTAC · 2019 · Federal research study.] \
Retrospective case analysis informing concern identification,
intervention pathways, and reporting design; descriptive patterns are
not deterministic predictors.

#strong[F04 ·
#link("https://www.secretservice.gov/sites/default/files/reports/2021-03/USSS%20Averting%20Targeted%20School%20Violence.2021.03.pdf")[Averting Targeted School Violence];]
\
#emph[U.S. Secret Service NTAC · 2021 · Federal research study.] \
Case-based analysis of disrupted plots. Supports multidisciplinary
intervention and the importance of early reporting and follow-up.

#strong[F05 ·
#link("https://www.cisa.gov/sites/default/files/2023-05/CISA-USSS%20K-12%20Bystander%20Reporting%20Toolkit_508.pdf")[Improving School Safety Through Bystander Reporting: K-12 Toolkit];]
\
#emph[CISA / U.S. Secret Service · 2023 · Joint federal guidance.] \
Design and improvement of reporting channels, communications, trust,
triage, and pathways to intervention; complement with separate
anti-retaliation controls.

#strong[F06 ·
#link("https://www.cisa.gov/sites/default/files/2024-10/ATRGToolkit508_V2.pdf")[Anonymized Threat Response Guidance Toolkit];]
\
#emph[CISA · 2024 · Federal guidance.] \
Balanced verification and school response to anonymous threats, hoaxes,
and swatting; especially relevant to preventing adverse effects from
deceptive reports.

#strong[F07 ·
#link("https://www.ed.gov/media/document/rems-guide-developing-high-quality-emergency-operations-plans-k-12-schools-2013-113150.pdf")[Guide for Developing High-Quality School Emergency Operations Plans];]
\
#emph[ED / DHS / DOJ / FBI / FEMA / HHS · 2013 · Interagency planning
guidance.] \
End-to-end school EOP methodology: collaboration, scenario planning,
functional annexes, training, exercises, and recovery.

#strong[F08 ·
#link("https://www.cisa.gov/sites/default/files/2024-07/CISA%20K-12%20School%20Security%20Guide%20Companion%20Product%20for%20School-Based%20Law%20Enforcement%20and%20School%20Resource%20Officers_508c.pdf")[School Security Guide Companion for School-Based Law Enforcement and School Resource Officers];]
\
#emph[CISA · 2024 · Federal guidance.] \
Defines high-level roles for law enforcement/SROs in physical-security
assessment and school partnerships; does not replace state law and local
agreements.

#strong[F09 ·
#link("https://www.ed.gov/teaching-and-administration/safe-learning-environments/school-safety-and-security/emergency-planning")[Emergency Planning: Federal School EOP Resources];]
\
#emph[U.S. Department of Education · Reviewed 2026-03-05 · Federal
resource portal.] \
Central federal portal to school planning, district teams, cyber
annexes, recovery, and age-appropriate drills.

#strong[F29 ·
#link("https://preptoolkit.fema.gov/web/hseep-resources/policy-and-guidance")[Homeland Security Exercise and Evaluation Program \(HSEEP) Policy and Guidance];]
\
#emph[FEMA · 2020 doctrine; official current resource portal · Federal
exercise guidance.] \
Exercise program planning, objective-based evaluation and
after-action/improvement planning. Use to develop local acceptance
tests; does not establish that a school has been certified or that an
exercise outcome generalizes beyond conditions tested.

#strong[F24 ·
#link("https://www.cisa.gov/sites/default/files/2022-11/ssat-technical-appendix-022022-508.pdf")[K-12 School Security Assessment Tool: Technical Appendix];]
\
#emph[CISA · 2022 · Federal technical guidance.] \
Explains school-specific scenario selection, detection/delay/response
measures and dependency assessment. Use for integrated capability tests
rather than assuming individual product efficacy.

#strong[F28 ·
#link("https://www.secretservice.gov/sites/default/files/reports/2025-08/What-Is-A-Behavioral-Threat-Assessment-In-School.pdf")[What Is a Behavioral Threat Assessment in School?];]
\
#emph[U.S. Secret Service NTAC · 2025 · Official fact sheet.] \
Clarifies that school BTAM focuses on concerning behaviors,
multidisciplinary evaluation and support; it is not a criminal
investigation, disciplinary process, or demographic attacker profile.

=== Federal risk and emerging threats
<federal-risk-and-emerging-threats>
#strong[F11 ·
#link("https://fsapartners.ed.gov/fsa-print/publication/1007556")[Guidance to Educational Institutions on Swatting Threats, GEN-26-04];]
\
#emph[U.S. Departments of Education and Justice · 2026-09-25 ·
Nonbinding federal guidance.] \
Newest cross-agency swatting guidance used for district-dispatch
precoordination, urgent protection, verification, and cautious
communication.

#strong[F12 ·
#link("https://www.fbi.gov/contact-us/field-offices/philadelphia/news/fbi-philadelphia-warns-of-violent-online-networks-targeting-children-and-vulnerable-populations")[Violent Online Networks Targeting Children and Vulnerable Populations];]
\
#emph[FBI Philadelphia · 2026-09-23 · Federal public warning.] \
Documents child grooming, coerced harmful behavior, and online
exploitation. Agency warning does not establish a campus-specific
incident.

#strong[F13 ·
#link("https://www.fbi.gov/investigate/cyber/alerts/2025/criminals-using-altered-proof-of-life-media-to-extort-victims-in-virtual-kidnapping-for-ransom-scams")[Criminals Using Altered Proof-of-Life Media in Virtual Kidnapping Scams];]
\
#emph[FBI · 2025-12-05 · Federal public warning.] \
Supports immediate independent child-welfare checks and verification of
ransom claims that may contain altered images or video.

#strong[F14 ·
#link("https://www.ftc.gov/news-events/news/press-releases/2026/05/ftc-begins-enforcing-take-it-down-act")[FTC Begins Enforcing the TAKE IT DOWN Act];]
\
#emph[FTC · 2026-05-19 · Federal law implementation notice.] \
Explains removal-request process for covered platforms and 48-hour
response obligation for valid requests involving nonconsensual intimate
images.

#strong[F15 ·
#link("https://www.cisa.gov/sites/default/files/2023-01/K-12report_FINAL_V2_508c_0.pdf")[Protecting Our Future: Safeguarding K-12 Organizations from Cybersecurity Threats];]
\
#emph[CISA · 2023-01 · Federal cybersecurity guidance.] \
Practical cyber priorities such as MFA, known vulnerability remediation,
backups, and incident planning for school operations.

#strong[F16 ·
#link("https://www.cisa.gov/sites/default/files/2023-08/K-12_Acquisition_Guidance.pdf")[Cybersecurity Guidance for K-12 Technology Acquisitions];]
\
#emph[CISA · 2023-08 · Federal procurement guidance.] \
Secure-by-design procurement requirements: logs, MFA, patching, no
default passwords, least privileges, vulnerability disclosure.

#strong[F17 ·
#link("https://www.nist.gov/publications/artificial-intelligence-risk-management-framework-ai-rmf-10")[Artificial Intelligence Risk Management Framework 1.0];]
\
#emph[NIST · 2023-01-26 · Voluntary risk-management framework.] \
Govern/Map/Measure/Manage framework for testing AI-alert accuracy, false
positives, privacy, fairness, oversight, and lifecycle governance.

#strong[F18 ·
#link("https://www.faa.gov/sites/faa.gov/files/uas/resources/c_uas/Interagency_Legal_Advisory_on_UAS_Detection_and_Mitigation_Technologies.pdf")[Interagency Legal Advisory on UAS Detection and Mitigation Technologies];]
\
#emph[FAA / DOJ / DHS / FCC · 2020-08-17 · Interagency legal advisory;
check new law.] \
Historical baseline regarding legal hazards of C-UAS detection and
interdiction. Must be read in light of post-2025 conditional
law-enforcement authority.

#strong[F19 ·
#link("https://www.justice.gov/ola/media/1436171/dl?inline=")[SAFER SKIES Act and Qualified SLTT Counter-UAS Certification \(testimony)];]
\
#emph[FBI / U.S. DOJ · 2026-04 · Federal implementation testimony.] \
Explains limited federally conditioned training, certification, and
task-force pathways for law-enforcement counter-UAS actions; not general
school authority.

#strong[F20 ·
#link("https://www.faa.gov/uas/resources/c_uas")[Counter UAS Resource and Legal Advisory Portal];]
\
#emph[FAA · Living website · Federal regulatory resource.] \
Current FAA entry point to interagency counter-UAS guidance and
aircraft/spectrum regulatory boundaries.

#strong[F21 ·
#link("https://www.atf.gov/explosives/enforcement-tools-services/detection-canines")[Detection Canines: National Canine Program];]
\
#emph[ATF · Living website · Federal specialized capability guidance.] \
Defines accredited explosives/accelerant-detection canine capability and
access pathways for qualifying law-enforcement agencies; separate from
tactical bite/apprehension use.

#strong[F22 ·
#link("https://studentprivacy.ed.gov/faq/when-it-permissible-utilize-ferpas-health-or-safety-emergency-exception-disclosures")[FERPA Health or Safety Emergency Exception: FAQ];]
\
#emph[U.S. Department of Education · Living website · Federal privacy
interpretation.] \
Limits education-record disclosure to genuine actual/impending/imminent
emergencies; not a blanket justification for exercises or surveillance.

#strong[F23 ·
#link("https://www.justice.gov/servicemembers/service-animals-and-assistance-animals-0")[Service Animals and Assistance Animals];]
\
#emph[U.S. Department of Justice · Updated 2024-11-04 · Federal
civil-rights guidance.] \
Supports accommodation planning around canine security programs and
distinguishes working security dogs from protected service animals.

#strong[F25 ·
#link("https://studentprivacy.ed.gov/faq/does-school-have-record-disclosures-made-under-ferpas-health-or-safety-emergency-exception")[Recording FERPA emergency disclosures];]
\
#emph[U.S. Department of Education, Student Privacy Policy Office ·
Current official FAQ · Interpretive compliance guidance.] \
Explains the requirement to record the articulable and significant
threat supporting emergency disclosure and the recipients. Check actual
law and counsel\'s interpretation for local implementation.

#strong[F26 ·
#link("https://studentprivacy.ed.gov/faq/may-school-make-disclosures-under-ferpas-health-or-safety-emergency-provision-emergency")[FERPA and emergency preparedness exercises];]
\
#emph[U.S. Department of Education, Student Privacy Policy Office ·
Current official FAQ · Interpretive compliance guidance.] \
Clarifies that the health-and-safety exception does not permit
disclosure simply for exercise planning. Use synthetic exercise cases.

#strong[F27 ·
#link("https://airc.nist.gov/airmf-resources/airmf/5-sec-core/")[AI RMF Core: Measure];]
\
#emph[NIST · AI RMF 1.0 framework · Voluntary technical guidance.] \
Addresses validation, safety, resilience, accountability and contextual
interpretation of AI systems. Use for camera/analytic tool test plans
and ongoing monitoring, not claims of guaranteed detection.

=== Constitutional and federal law
<constitutional-and-federal-law>
#strong[L01 ·
#link("https://www.archives.gov/founding-docs/constitution/what-does-it-say")[U.S. Constitution, Article VI Supremacy Clause; First, Fourth and Fourteenth Amendments];]
\
#emph[National Archives · Founding text · Binding federal constitutional
law.] \
Federal constitutional protections prevail over conflicting state
policy; provides baseline for speech, searches, force, due process, and
equal protection.

#strong[L02 ·
#link("https://uscode.house.gov/view.xhtml?edition=prelim&num=0&req=granuleid%3AUSC-prelim-title20-section1232g")[Family Educational Rights and Privacy Act, 20 U.S.C. § 1232g];]
\
#emph[U.S. Code \(House) · Current code · Binding federal statute.] \
Education-record access and disclosure rules; pair with the Department
of Education emergency exception FAQ for operations.

#strong[L03 ·
#link("https://www.supremecourt.gov/docket/docketfiles/html/public/20-255.html")[Mahanoy Area School District v. B. L., No. 20-255];]
\
#emph[U.S. Supreme Court · 2021-06-23 · Binding judicial precedent.] \
Off-campus student speech retains First Amendment protection;
fact-specific risk and disruption analysis required before action.

#strong[L04 ·
#link("https://www.ftc.gov/business-guidance/resources/complying-take-it-down-act")[Take It Down Act Implementation Guidance];]
\
#emph[FTC · 2026-05 · Federal statute guidance.] \
Describes covered platform duties and procedures for removal of
nonconsensual intimate imagery including synthetic material.

#strong[F30 · Federal school-security doctrine · FEMA \(living site).]
#emph[Exercise Evaluation Guides \(EEGs) — HSEEP Resources.]
#strong[GUIDANCE.] Official:
#link("https://preptoolkit.fema.gov/web/hseep-resources/eegs");. Use to
structure objective-linked observations, documented capability targets,
evaluation and corrective actions; does not certify a campus.

#strong[F31 · Federal school-security doctrine · U.S. Department of
Education \(reviewed March 5, 2026).] #emph[Emergency Planning.]
#strong[GUIDANCE.] Official:
#link("https://www.ed.gov/teaching-and-administration/safe-learning-environments/school-safety-and-security/emergency-planning");.
Use to distinguish all-hazards EOP planning, exercises and recovery from
CISA\'s narrower crime/violence physical-security guide.

=== Washington implementation guidance
<washington-implementation-guidance>
#strong[F10 ·
#link("https://ospi.k12.wa.us/index.php/student-success/health-safety/school-safety-center/comprehensive-safety-planning")[Comprehensive Safety Planning];]
\
#emph[Washington OSPI · Living website · State implementation guidance.]
\
Maps prevention, protection, mitigation, response, and recovery to
Washington comprehensive safety plans and functional annexes.

=== Washington statutes and regulations
<washington-statutes-and-regulations>
#strong[W01 ·
#link("https://app.leg.wa.gov/rcw/default.aspx?cite=28A.320.125")[RCW 28A.320.125 — Safe School Plans and Drills];]
\
#emph[Washington Legislature · Current · Binding Washington law.] \
Requires district plans, protective functional responses, accessibility,
reunification and coordination; use as a compliance crosswalk.

#strong[W02 ·
#link("https://app.leg.wa.gov/rcw/default.aspx?cite=28A.320.126")[RCW 28A.320.126 — Emergency Response System \(Alyssa’s Law)];]
\
#emph[Washington Legislature · Current \(2025 revision) · Binding
Washington law.] \
Requires schools to collaborate with public safety answering points and
law enforcement on qualifying response-system capabilities.

#strong[W03 ·
#link("https://app.leg.wa.gov/RCW/default.aspx?cite=28A.210.440")[RCW 28A.210.440 — Bleeding Control Equipment and Training];]
\
#emph[Washington Legislature · Effective 2026–27 school year · Binding
Washington law.] \
Sets accessible campus equipment, specific contents, two trained
employees minimum, higher staffing for schools above 1,000, and
inventory after use/annually.

#strong[W04 ·
#link("https://app.leg.wa.gov/rcw/default.aspx?cite=28A.320.123")[RCW 28A.320.123 — School-Based Threat Assessment Program];]
\
#emph[Washington Legislature · Current · Binding Washington law.] \
Requires behavior- and circumstance-based multidisciplinary assessment
and prohibits suspension or expulsion merely for referral or assessment.

#strong[W05 ·
#link("https://app.leg.wa.gov/rcw/default.aspx?cite=28A.320.128")[RCW 28A.320.128 — Threat Notification and Knowingly False Reports];]
\
#emph[Washington Legislature · Current · Binding Washington law.] \
Prescribes threat-notification policies and criminalizes certain
intentionally and maliciously or bad-faith knowingly false threat
notifications.

#strong[W06 ·
#link("https://app.leg.wa.gov/rcw/default.aspx?cite=28A.320.124")[RCW 28A.320.124 — School Safety and Security Staff];]
\
#emph[Washington Legislature · Current · Binding Washington law.] \
Requires clarity about security duties and student conduct; excludes
SROs from formal student discipline responsibilities.

#strong[W07 ·
#link("https://app.leg.wa.gov/rcw/default.aspx?cite=28A.320.1242")[RCW 28A.320.1242 — Agency and Contractor Agreements];]
\
#emph[Washington Legislature · Current · Binding Washington law.] \
Annual reviewed agreements, training documentation,
placement/performance procedures, and parent/student/community
involvement.

#strong[W08 ·
#link("https://app.leg.wa.gov/rcw/default.aspx?cite=28A.320.1241")[RCW 28A.320.1241 — Security Staffing and Force Incident Reporting];]
\
#emph[Washington Legislature · Current · Binding Washington law.] \
Annual data on school-security staffing, use-of-force incidents,
arrest/discipline, and complaints; important accountability baseline.

#strong[W09 ·
#link("https://app.leg.wa.gov/rcw/default.aspx?cite=9.41.280")[RCW 9.41.280 — Dangerous Weapons at Schools];]
\
#emph[Washington Legislature · Current · Binding Washington law.] \
School weapon-possession prohibition and enumerated exceptions.
Exception alone does not authorize a specific force deployment.

#strong[W10 ·
#link("https://app.leg.wa.gov/rcw/default.aspx?cite=10.120.020")[RCW 10.120.020 — Permissible Peace Officer Use of Force];]
\
#emph[Washington Legislature · Current · Binding Washington law.] \
Officers’ force limits, de-escalation, deadly-force restrictions and
special safeguards. Distinct from noncommissioned personnel authority.

#strong[W11 ·
#link("https://app.leg.wa.gov/rcw/default.aspx?cite=9A.16.050")[RCW 9A.16.050 — Justifiable Homicide by Other Persons];]
\
#emph[Washington Legislature · Current · Binding Washington law.] \
Self-defense and defense-of-others statutory circumstances; requires
counsel/agency review before any district policy references.

#strong[W12 ·
#link("https://app.leg.wa.gov/rcw/default.aspx?cite=28A.600.015")[RCW 28A.600.015 — Student Discipline and Due Process];]
\
#emph[Washington Legislature · Current · Binding Washington law.] \
Enabling law for substantive and procedural protections in school
suspension/expulsion and emergency removal.

#strong[W13 ·
#link("https://app.leg.wa.gov/wac/default.aspx?cite=392-400-510")[WAC 392-400-510 — Emergency Removal Limits];]
\
#emph[Washington Legislature · 2025 revision · Binding Washington rule.]
\
Requires sufficient cause of immediate/continuing danger or extreme
disruption; limits duration and requires superintendent reporting.

#strong[W14 ·
#link("https://app.leg.wa.gov/wac/default.aspx?cite=392-400-515")[WAC 392-400-515 — Emergency Removal Notice];]
\
#emph[Washington Legislature · 2025 revision · Binding Washington rule.]
\
Parent/student notification, written reasons, timing and process for
emergency removals.

#strong[W15 ·
#link("https://leg.wa.gov/state-laws-and-rules/washington-state-constitution/")[Washington Constitution, Article I, Section 2];]
\
#emph[Washington Legislature · Current · Binding state constitutional
law.] \
Expressly recognizes the U.S. Constitution as supreme law of the land;
state provisions can furnish further protections.

#horizontalrule

=== Document controls and provenance
<document-controls-and-provenance>
#strong[Version:] 14.3, October 23, 2026. #strong[Supersedes:] all prior
stand-alone advisory and annex editions; does not assert that districts
have adopted or exercised any control. #strong[Consolidated register:]
All 56 threat vectors, control mappings and field-verification criteria
are included in this document. #strong[Scope:] public K–12 Washington;
private, tribal and charter variations and new laws require independent
jurisdiction-specific review. #strong[Update trigger:] material federal
or Washington statutory changes, published agency guidance, independent
validation findings, major incidents with verified generalizable
lessons, or new threats that do not fit existing controls. #strong[Legal
review:] mandatory before adoption of screening/search, privacy
disclosures, authorized armed personnel, less-lethal use, canine force,
or UAS interdiction.

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
