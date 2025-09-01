# Changelog

Note that this project adheres to
[Semantic Versioning](https://semver.org/spec/v2.0.0.html) and all notable
changes will be documented in this file.

<!-- next-header -->

## [Unreleased] - ReleaseDate

## [0.2.2] - 2025-08-31

### Fixed

- Fixed appendix numbering. It now correctly shows the colon in headers and
  outline (e.g. `Appendix A:`). It shows up correctly when referenced in text
  without the colon (e.g. `Appendix A`).
- Fixed indentation in table of contents. Each body level 2 entry was indented
  to match the "Appendix X:" supplement horizontal position. It now all has a
  fixed relative length indentation.

## [0.2.1] - 2025-07-12

### Changed

- Changed `#include("file.typ")` to `#include "file.typ"` throughout the
  template. This is more idiomatic in Typst as `include` is not a function
  but a keyword.

## [0.2.0] - 2025-07-11

### Breaking Changes

- Template renamed to `bye-ubc`. This was done to adhere to Typst packages
  naming rules for non-endorsed templates.

### Fixed

- Set text font to `Libertinus Serif`.
- Set text size to `12pt`.
- Justify text in the main body.

## [0.1.0] - 2025-07-09

First usable version of the template.

<!-- next-url -->
[Unreleased]: https://github.com/DJDuque/bye-ubc/compare/v0.2.2...HEAD
[0.2.2]: https://github.com/DJDuque/bye-ubc/compare/v0.2.1...v0.2.2
[0.2.1]: https://github.com/DJDuque/bye-ubc/compare/v0.2.0...v0.2.1
[0.2.0]: https://github.com/DJDuque/bye-ubc/compare/v0.1.0...v0.2.0
[0.1.0]: https://github.com/DJDuque/bye-ubc/compare/ff59a76890c1153a5329b0744f315aa6307a4c42...v0.1.0
