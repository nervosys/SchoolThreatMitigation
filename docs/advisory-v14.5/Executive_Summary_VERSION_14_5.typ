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


// EXECUTIVE SUMMARY: all objects in this page are native Typst elements
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
#text(font: "Inter", size: 7pt, weight: "semibold", fill: MUTED)[COURTESY OF NERVOSYS, LLC  /  DR. ADAM ERICKSON] #h(1fr) #link("https://nervosys.ai")[#text(font: "Inter", size: 7pt, fill: GOLD)[https://nervosys.ai]] #h(1fr) #text(font: "Inter", size: 7pt, fill: NAVY)[01]


