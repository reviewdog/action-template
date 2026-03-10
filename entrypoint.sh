#!/bin/sh

if [ "${RUNNER_DEBUG}" = "1" ] ; then
  set -x
fi

swiftlint_version="${1:-${INPUT_SWIFTLINT_VERSION}}"

if [ -n "${swiftlint_version}" ]; then
  wget -O /tmp/swiftlint.zip -q "https://github.com/realm/SwiftLint/releases/download/${swiftlint_version}/swiftlint_linux_arm64.zip"
  unzip -o /tmp/swiftlint.zip -d /tmp
  chmod a+x /tmp/swiftlint
  mv /tmp/swiftlint /usr/local/bin/swiftlint
  rm -f /tmp/swiftlint.zip
fi

if [ -n "${GITHUB_WORKSPACE}" ]; then
  cd "${GITHUB_WORKSPACE}" || exit
  git config --global --add safe.directory "${GITHUB_WORKSPACE}" || exit 1
fi

export REVIEWDOG_GITHUB_API_TOKEN="${INPUT_GITHUB_TOKEN}"

swiftlint lint --reporter checkstyle \
  | reviewdog \
      -f=checkstyle \
      -name="${INPUT_TOOL_NAME}" \
      -reporter="${INPUT_REPORTER}" \
      -filter-mode="${INPUT_FILTER_MODE}" \
      -fail-level="${INPUT_FAIL_LEVEL}" \
      -level="${INPUT_LEVEL}" \
      ${INPUT_REVIEWDOG_FLAGS}

exit_code=$?

exit $exit_code
