#import "../lib.typ": thesis

#show: thesis.with(
  // Avoid using scientific symbols or Greek letters; spell out the words.
  title: [
    Systematic Studies of Antihydrogen Detection for Improved Antimatter Gravity
    Measurements in the ALPHA-g Experiment
  ],
  // Should be the name under which you are registered at UBC.
  author: "Daniel Duque",
  // Optional to list these. If listed, must have a degree (abbreviated, e.g.
  // MSc, BSc), institution and graduation year.
  previous_degrees: (
    /*
    (
      abbr: "MPhys",
      institution: "University of Manchester",
      year: "2020",
    ),
    (
      abbr: "BSc",
      institution: "Another University",
      year: "2017",
    ),
    */
  ),
  // Spell out degree in full e.g. Doctor of Philosophy, Master of Science,
  // Master of Arts.
  degree: "Doctor of Philosophy",
  // The specific graduate program in which you are registered. Check
  // SSC/Workday to confirm your program name.
  program: "Physics",
  // Vancouver or Okanagan.
  campus: "Vancouver",
  // The month and year in which your thesis is accepted.
  month: "October",
  year: "2026",
  // Include all committee members. For supervisory committee members who were
  // not part of the examining committee, include them below under
  // `additional_committee`.
  // Adding the external examiner is optional. Ask them whether or not they wish
  // to be listed in the committee page.
  examining_committee: (
    (
      name: "John Doe",
      title: "Research Scientist",
      department: "Physical Sciences Division",
      institution: "TRIUMF",
      role: "Research Co-supervisor",
    ),
    (
      name: "Jane Doe",
      title: "Professor",
      department: "Department of Chemistry",
      institution: "UBC",
      role: "Academic Co-supervisor",
    ),
  ),
  additional_committee: (),
)
