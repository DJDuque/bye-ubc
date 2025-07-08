#let title_page(
  title: none,
  author: none,
  previous_degrees: (),
  degree: none,
  program: none,
  campus: none,
  month: none,
  year: none,
) = [
  #set align(center + horizon)

  #grid(
    rows: 1fr,
    gutter: (auto, 1fr, 1fr, auto),
    upper(title),
    [
      by

      #upper(author)

      #previous_degrees.map(degree => [
        #degree.abbr, #degree.institution, #degree.year \
      ]).join()
    ],
    [
      A DISSERTATION SUBMITTED IN PARTIAL FULFILLMENT OF \
      THE REQUIREMENTS FOR THE DEGREE OF

      #upper(degree)
      #v(1.5em)
      in
      #v(1.5em)
      THE FACULTY OF GRADUATE AND POSTDOCTORAL STUDIES

      (#program)
    ],
    [
      THE UNIVERSITY OF BRITISH COLUMBIA
      
      (#campus)
    ],
    [
      #month #year

      #sym.copyright #author, #year
    ]
  )
]

#let committee_page(
  title: none,
  author: none,
  degree: none,
  program: none,
  examining_committee: (),
  additional_committee: (),
) = [
  The following individuals certify that they have read, and recommend to the
  Faculty of Graduate and Postdoctoral Studies for acceptance, the dissertation
  entitled:

  #text(title, weight: "bold")

  submitted by #text(author, weight: "bold") in partial fulfilment of the
  requirements for the degree of #degree in #program.

  #v(1em)
  #text("Examining Committee:", weight: "bold")

  #examining_committee.map(member => [
    #text(member.name, weight: "bold"), #member.title, #member.department,
    #member.institution \
    #member.role
    #v(0.1em)
  ]).join()

  #if additional_committee.len() > 0 [
    #v(1em)
    #text("Additional Supervisory Committee Members:", weight: "bold")

    #additional_committee.map(member => [
      #text(member.name, weight: "bold"), #member.title, #member.department,
      #member.institution \
      #member.role
      #v(0.1em)
    ]).join()
  ]
]

#let thesis(
  title: [Thesis Title],
  author: "Your Name",
  previous_degrees: (),
  degree: "Your Degree",
  program: "Your Graduate Program",
  campus: "Your Campus",
  month: "Month",
  year: "Year",

  examining_committee: (
    (
      name: "Jane Doe",
      title: "Unemployed",
      department: "Department of Blindly Copying and Pasting",
      institution: "Example University",
      role: "Supervisor",
    ),
  ),
  additional_committee: (),

  abstract: lorem(350),
  lay_summary: lorem(150),

  body,
) = {
  set document(title: title, author: author)
  set page(width: 8.5in, height: 11in, number-align: right)
  show heading.where(level: 1): it => { pagebreak(weak: true); it }

  title_page(
    title: title,
    author: author,
    previous_degrees: previous_degrees,
    degree: degree,
    program: program,
    campus: campus,
    month: month,
    year: year,
  )

  set page(margin: (left: 1.25in, rest:1in), numbering: "i")

  committee_page(
    title: title,
    author: author,
    degree: degree,
    program: program,
    examining_committee: examining_committee,
    additional_committee: additional_committee,
  )

  heading("Abstract")
  abstract

  heading("Lay Summary")
  lay_summary

  body
}
