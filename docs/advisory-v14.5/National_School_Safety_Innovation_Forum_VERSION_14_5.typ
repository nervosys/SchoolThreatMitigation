// National School Safety Innovation Forum — Version 14.5
// Independent proposal. Courtesy of NERVOSYS, LLC | Contact: Dr. Adam Erickson.
#import "design_system.typ": NAVY, NAVY2, GOLD, TEAL, AMBER, INK, MUTED, BODY_FONT, BODY_SIZE, PAGE_H2
#set document(title: "National School Safety Innovation Forum", author: "NERVOSYS, LLC — Contact: Dr. Adam Erickson")
#set page(paper: "us-letter", margin: (top: 0.75in, bottom: 0.75in, left: 0.75in, right: 0.75in),
 header: context [#text(font: "Inter",size:8pt,weight:"bold")[NATIONAL SCHOOL SAFETY INNOVATION FORUM] #h(1fr) #text(font:"Inter",size:8pt)[NERVOSYS, LLC]],
 footer: context [#text(font:"Inter",size:8pt)[Contact: Dr. Adam Erickson] #h(1fr) #text(fill:rgb("#086C91"),weight:"bold")[#link("https://nervosys.ai")[https://nervosys.ai]] #h(1fr) #counter(page).display()])
#set text(font:BODY_FONT,size:BODY_SIZE,fill:INK)
#set par(justify:false,leading:0.64em,spacing:0.62em)
#show heading.where(level:2): it => block(above:10pt,below:5pt)[#text(font:BODY_FONT,size:PAGE_H2,weight:"bold",fill:TEAL)[#it.body]]
#text(size:7.1pt,weight:"bold",fill:NAVY)[NATIONAL COLLABORATION / WASHINGTON K–12] #h(1fr) #text(size:7.1pt,weight:"bold",fill:NAVY)[VERSION 14.5]
#v(4pt)
#text(size:6.8pt,weight:"semibold",fill:MUTED)[PROPOSED PROGRAM / VOLUNTARY FEDERAL ADVICE]
#v(10pt)
#text(font:BODY_FONT,size:21pt,weight:"bold",fill:NAVY)[National School Safety Innovation Forum]
#line(length:100%,stroke: (paint: GOLD, thickness: 1.7pt))
#v(8pt)
*Local innovation should produce national learning.* Establish a moderated, nationwide community of practice in which school administrators publish documented safety improvements, unsuccessful approaches, measured tradeoffs, and lessons learned. Build on existing DOJ STOP School Violence technical-assistance and peer-learning work rather than duplicating it.
#block(fill:INK,inset:12pt)[
 #text(fill:white,size:8pt,weight:"bold")[GOVERNANCE RECOMMENDATION]
 #v(4pt)
 #text(fill:white,size:10.5pt)[*School-led, federally advised, independently evaluated.* Invite federal agencies to review technical methods and issue nonbinding recommendations. School districts retain legal authority for campus decisions; agency participation and sponsorship require formal agreement and do not imply federal certification.]
]
== 01 / Network and access
Provide verified membership for public, Tribal, territorial, charter and private school leaders; include rural and urban districts, educators, families, accessibility specialists, responders and researchers. Offer moderated discussion, regional peer groups, quarterly workshops and an annual evidence review.
== 02 / Federal technical review
Request CISA advice on physical and cyber protection; USSS NTAC on behavioral threat assessment; DOJ BJA/NIJ on evaluations and replication; Education on student privacy and civil rights; and FEMA on exercises. Involve state education and safety agencies, including Washington OSPI.
== 03 / Evidence-based case library
Use a standard entry: problem, setting, countermeasure, lawful approvals, baseline, cost, implementation limits, test methods, outcomes, adverse effects and reproducibility. Label *proposed*, *locally tested*, *independently replicated* or *not recommended*. Publish useful failures as well as successes.
== 04 / Security, rights and trust
Separate public summaries from tightly restricted professional materials. Exclude identifiable student records, live incidents, floor plans, sensor gaps, armed-staff deployments and exploitable vulnerabilities. Require moderation, independent conflict-of-interest declarations, privacy review, correction and appeal procedures.
== Recommended sharing workflow
*Submit → Screen → Federal / peer review → Evaluate → Publish / replicate*
*Launch proposal:* Convene a 90-day charter group; invite written agency recommendations; pilot a secure case library and administrator peer-review program within six months; publish an annual public findings report and a restricted practitioner supplement. Measure independently verified improvements, adoption, cost, safety incidents and unintended effects—not message volume or product sales.
== Research basis
DOJ BJA STOP TTA (2023): communities of practice and dissemination. DOJ STOP School Violence Program. CISA K–12 School Security Guide (2022). USSS NTAC (2018). This forum is proposed, not an existing federally approved program.
#v(15pt)
#line(length:100%,stroke: 0.65pt + rgb("#D7E1E5"))
#v(6pt)
#text(size:7pt,weight:"semibold",fill:MUTED)[COURTESY OF NERVOSYS, LLC / DR. ADAM ERICKSON] #h(1fr) #link("https://nervosys.ai")[#text(size:7pt,fill:GOLD)[https://nervosys.ai]] #h(1fr) #text(size:7pt,fill:NAVY)[01]
