#!/bin/sh
set -e

if [ -n "${GITHUB_WORKSPACE}" ] && [ -n "${INPUT_WORKDIR}" ]; then
  cd "${GITHUB_WORKSPACE}/${INPUT_WORKDIR}" || exit
fi

export REVIEWDOG_GITHUB_API_TOKEN="${INPUT_GITHUB_TOKEN}"

misspell -locale="${INPUT_LOCALE}" . \
  | reviewdog -efm="%f:%l:%c: %m" \
      -name="linter-name (misspell)" \
      -reporter="${INPUT_REPORTER:-github-pr-check}" \
      -level="${INPUT_LEVEL}" \
      ${INPUT_REVIEWDOG_FLAGS}
