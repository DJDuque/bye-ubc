# Contributing

## Pull Requests

All contributions to `thesis-ubc` happen through pull requests. It is highly
recommended to discuss any change by opening an
[issue](https://github.com/DJDuque/thesis-ubc/issues) before you start working
on a pull request. Additionally, please look at the GitHub actions
[workflows](https://github.com/DJDuque/thesis-ubc/tree/main/.github/workflows)
to find out all the checks that your code has to pass before it can be
reviewed/merged.

## Release Process (maintainers notes)

The release process is currently very manual (hopefully this will change in the
future). Once you have implemented all the fixes/features you want to release,
make sure you are on the `main` branch and it is up-to-date.

### Step 1: Make a new release branch

```nu
git switch -c release
```

### Step 2: Update the changelog

Check the
[CHANGELOG](https://github.com/DJDuque/thesis-ubc/blob/main/CHANGELOG.md) and
include anything relevant that was not already there. Then commit the
changes to the changelog:

```nu
git commit -am "docs: Update CHANGELOG.md"
```

### Step 3: Determine the version number

Check all the changes since the last release and determine the new
semver-compatible version number.

```nu
$env.NEXT_THESIS_UBC_VERSION = "X.Y.Z"
```

### Set 4: Make all replacements

Run the following commands to update the version number in all relevant files.

```nu
# New version in typst.toml
open typst.toml | upsert package.version $env.NEXT_THESIS_UBC_VERSION | save -f typst.toml

# New version imported in `template/main.typ`
open --raw template/main.typ
| str replace --regex '^#import "@preview/thesis-ubc:\d+\.\d+\.\d+": thesis' $"#import \"@preview/thesis-ubc:($env.NEXT_THESIS_UBC_VERSION)\": thesis"
| save --raw -f template/main.typ

# Changelog updates
open --raw CHANGELOG.md
| str replace --all "Unreleased" $env.NEXT_THESIS_UBC_VERSION
| str replace "...HEAD" $"...v($env.NEXT_THESIS_UBC_VERSION)"
| str replace "ReleaseDate" (date now | format date '%Y-%m-%d')
| str replace "<!-- next-header -->" "<!-- next-header -->\n\n## [Unreleased] - ReleaseDate"
| str replace "<!-- next-url -->" $"<!-- next-url -->\n[Unreleased]: https://github.com/DJDuque/thesis-ubc/compare/v($env.NEXT_THESIS_UBC_VERSION)...HEAD"
| save --raw -f CHANGELOG.md
```

### Step 5: Commit and push

```nu
git commit -am $"chore: Prepare release v($env.NEXT_THESIS_UBC_VERSION)"
git push origin release
```

### Step 6: Create a pull request to `main`

### Step 7: Tag the release (once merged)

```nu
git switch main
git pull
git branch release -d
git tag $"v($env.NEXT_THESIS_UBC_VERSION)"
git push origin tag $"v($env.NEXT_THESIS_UBC_VERSION)"
```
