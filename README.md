# action-docker-template

<!-- TODO: replace action-docker-template with your repo name -->
[![Test](https://github.com/haya14busa/action-docker-template/workflows/Test/badge.svg)](https://github.com/haya14busa/action-docker-template/actions?query=workflow%3ATest)
[![reviewdog](https://github.com/haya14busa/action-docker-template/workflows/reviewdog/badge.svg)](https://github.com/haya14busa/action-docker-template/actions?query=workflow%3Areviewdog)
[![release](https://github.com/haya14busa/action-docker-template/workflows/release/badge.svg)](https://github.com/haya14busa/action-docker-template/actions?query=workflow%3Arelease)
[![GitHub release (latest SemVer)](https://img.shields.io/github/v/release/haya14busa/action-docker-template?logo=github&sort=semver)](https://github.com/haya14busa/action-docker-template/releases)

This is a template repository for [reviewdog](https://github.com/reviewdog/reviewdog) action with release automation.
Click `Use this template` button to create your action based on this template.

A sample action is to get GitHub star counts from a given repository.

## Input

<!-- TODO: update -->
```yaml
inputs:
  github_token:
    description: 'GITHUB_TOKEN'
    default: '${{ github.token }}'
  ### Flags for reviewdog ###
  level:
    description: 'Report level for reviewdog [info,warning,error]'
    default: 'error'
  reporter:
    description: 'Reporter of reviewdog command [github-pr-check,github-pr-review].'
    default: 'github-pr-check'
  ### Flags for <linter-name> ###
  locale:
    description: '-locale flag of misspell. (US/UK)'
    default: ''
```

## Usage
<!-- TODO: update -->

TODO

## Development

### Release

#### [haya14busa/action-bumpr](https://github.com/haya14busa/action-bumpr)
You can bump version on merging Pull Requests with specific labels (bump:major,bump:minor,bump:patch).
Pushing tag manually by yourself also work.

#### [haya14busa/action-update-semver](https://github.com/haya14busa/action-update-semver)

This action updates major/minor release tags on a tag push. e.g. Update v1 and v1.2 tag when released v1.2.3.
ref: https://help.github.com/en/articles/about-actions#versioning-your-action

### Lint - reviewdog integration

![reviewdog integration](https://user-images.githubusercontent.com/3797062/72735107-7fbb9600-3bde-11ea-8087-12af76e7ee6f.png)

Supported linters:

- [reviewdog/action-shellcheck](https://github.com/reviewdog/action-shellcheck)
- [reviewdog/action-hadolint](https://github.com/reviewdog/action-hadolint)
- [reviewdog/action-misspell](https://github.com/reviewdog/action-misspell)

### Dependencies Update Automation
This repository uses [haya14busa/action-depup](https://github.com/haya14busa/action-depup) to update
reviewdog version.
