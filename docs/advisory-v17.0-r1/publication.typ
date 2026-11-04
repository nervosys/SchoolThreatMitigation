// Shared print layout. Compile the six document sources with Typst 0.15.1.
// Inter 4.1 is bundled under assets/fonts/OFL.txt; no network packages are used.
#let navy = rgb("#102c41")
#let teal = rgb("#168b98")
#let ink = rgb("#273542")
#let muted = rgb("#637482")
#let pale = rgb("#f2f6f7")
#let border = rgb("#cbd8df")

#let publication(title: "School safety", guide: false, compact: false, body) = {
  set document(title: title, author: ("NERVOSYS, LLC",), date: none)
  set text(font: "Inter", size: if compact {8.4pt} else {9pt}, lang: "en", fill: ink)
  set page("us-letter", margin: (top: 0.79in, bottom: 0.74in, x: 0.75in),
    header: [#set text(size: 6.8pt, fill: muted)
      #grid(columns: (1fr, auto), [SCHOOL SAFETY / WASHINGTON K-12], [VERSION 17.0 REVISION 1])],
    footer: context [#set text(size: 6.8pt, fill: muted)
      #grid(columns: (1fr, auto), [PUBLIC RESEARCH / READINESS NOT VALIDATED], [#counter(page).display("1")])])
  set par(justify: false, leading: 0.42em, spacing: 0.65em)
  set heading(numbering: none)
  show heading.where(level: 1): set text(size: 24pt, weight: "bold", fill: navy)
  show heading.where(level: 2): set text(size: if compact {13pt} else if guide {16pt} else {15pt}, weight: "bold", fill: navy)
  show heading.where(level: 2): it => block(width: 100%, above: if compact {8pt} else {15pt}, below: if compact {5pt} else {8pt}, inset: (bottom: 5pt), stroke: (bottom: 1pt + teal))[#it]
  show heading.where(level: 3): set text(size: 10.6pt, weight: "bold", fill: navy)
  show heading.where(level: 4): set text(size: 9.3pt, weight: "bold", fill: navy)
  set list(indent: 11pt, body-indent: 4pt, spacing: 3pt)
  set enum(indent: 11pt, body-indent: 4pt, spacing: 3pt)
  show link: set text(fill: teal)
  show raw: set text(font: "DejaVu Sans Mono")
  show raw: set text(size: 7.6pt)
  set table(inset: (x: 4.5pt, y: 4.5pt), align: left + top,
    stroke: 0.35pt + border,
    fill: (x, y) => if y == 0 {navy} else if calc.odd(y) {white} else {pale})
  show table: set text(size: 7.2pt)
  show table.cell.where(y: 0): set text(weight: "bold", fill: white)
  show figure.where(kind: table): set block(breakable: true)
  body
}

#let coverpage(background: none, body) = page("us-letter", margin: 0pt, header: none, footer: none, fill: navy)[
  #if background != none { place(top + left, background) }
  #block(width: 100%, height: 11in, inset: (x: 0.68in, top: 0.62in, bottom: 0.46in))[
    #set text(font: "Inter", size: 9.1pt, fill: white)
    #set par(leading: 0.35em, spacing: 0.7em)
    #set heading(outlined: false)
    #show heading.where(level: 1): set text(size: 37pt, weight: "bold", fill: white)
    #show heading.where(level: 2): set text(fill: white)
    #show strong: set text(fill: white)
    #show link: set text(fill: rgb("#bdebf0"))
    #body
  ]
]
#let cover-line(body) = block(below: 12pt, inset: (bottom: 9pt), stroke: (bottom: 0.6pt + rgb("#65949b")))[#text(size: 7.5pt, fill: rgb("#5ce0ed"), weight: "bold")[#body]]
#let cover-main(body) = block(above: 0.75in)[#body]
#let cover-bottom(body) = [#v(1fr)#block(above: 0.20in)[#text(size: 8pt)[#body]]]
#let cover-tag(body) = block(above: 8pt, below: 9pt)[#text(size: 7.4pt, weight: "bold", fill: rgb("#9fe0e6"))[#body]]
#let cover-note(body) = block(above: 8pt)[#text(size: 6.7pt, fill: rgb("#c5d4da"))[#body]]
#let hero(body) = block(width: 100%, inset: (x: 19pt, y: 16pt), fill: navy, stroke: (top: 4pt + teal), below: 14pt)[
  #set text(size: 9pt, fill: white)
  #show heading.where(level: 1): set text(size: 24pt, weight: "bold", fill: white)
  #show strong: set text(fill: white)
  #body
]
#let callout(body, warning: false) = block(width: 100%, inset: 10pt, above: 8pt, below: 8pt,
  fill: if warning {rgb("#fbf4ec")} else {pale},
  stroke: (left: 3pt + if warning {rgb("#ad6d34")} else {teal}), breakable: true)[#body]
#let card(body) = block(width: 100%, inset: 9pt, above: 5pt, below: 5pt, fill: pale,
  stroke: 0.5pt + border, radius: 3pt, breakable: false)[#set text(size: 8.5pt); #body]
#let decision-strip(body) = block(width: 100%, inset: 11pt, above: 8pt, below: 9pt, fill: navy)[
  #set text(size: 8.6pt, fill: white)
  #show heading: set text(fill: white)
  #show strong: set text(fill: white)
  #body
]
#let frontpage(body) = [#pagebreak(weak: true)#block[
  #set text(size: 8.5pt)
  #show heading.where(level: 1): set text(size: 24pt)
  #body
]#pagebreak(weak: true)]
#let tocpage(body) = [#pagebreak(weak: true)#block[
  #set text(size: 8.1pt)
  #set list(spacing: 3pt)
  #body
]#pagebreak(weak: true)]
#let horizontalRule = line(length: 100%, stroke: 0.5pt + border)

#let cover-description(body) = block(width: 5.4in, above: 10pt)[#set text(size: 10.7pt, fill: rgb("#d7e1e7")); #set par(leading: 0.55em); #body]

// Keep following paragraphs clear of the last line of card and detail blocks.
#let text-block(body) = block(above: 4pt, below: 6pt, breakable: true)[#body]
#let card-grid(..cells) = block(above: 6pt, below: 8pt)[#grid(columns: (1fr, 1fr), gutter: 12pt, ..cells)]
