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

#let thesis(
  title: [Thesis Title],
  author: "Your Name",
  previous_degrees: (),
  degree: "Your Degree",
  program: "Your Graduate Program",
  campus: "Your Campus",
  month: "Month",
  year: "Year",

  body,
) = {
  set document(title: title, author: author)
  set page(width: 8.5in, height: 11in)

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

  set page(margin: (left: 1.25in, rest:1in))

  body
}
