#let userData = json("data.json")

#set text(font: "Cambria", size: 12pt)
#show heading: set text(font: "Georgia")
#box(height: 5cm, columns(2)[
  #align(bottom)[
    = #userData.name
    #userData.contact.email | #userData.contact.phone
  ]
  
  #colbreak()
  
  #align(end)[
    #block(
      stroke: black,
      radius: 50%,
      height: 100%,
      clip: true,
      image("avatar.png"),
    )
  ]
])

== Why consider me?
#userData.motivation

== Education
* #userData.education.degree | #userData.education.university | #userData.education.graduationYear *

- Developed a web application using HTML, CSS, and JavaScript for a university
  project.

== Experience

#for e in userData.experience [
  * #e.position | #e.company | #e.startYear - #e.endYear *
  #for r in e.responsibilities [
    - #r
  ]
]

== Skills
#grid(
  columns: (auto, auto, auto, auto),
  gutter: 10pt,
  ..userData.skills.map(s => [
    #box(stroke: black, inset: 5pt)[
      #s
    ]
  ])
)