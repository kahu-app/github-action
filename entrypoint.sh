#!/bin/sh

set -o errexit
set -o noglob
set -o nounset

if test "${INPUT_DEBUG-0}" == "1"; then
  echo "[!] DEBUG MODE ACTIVE [!]"
  set -o xtrace
fi

if ! test -z "${INPUT_KAHU_TOKEN-}"; then
  echo "Authenticating"
  /usr/bin/kahu-cli auth:login --with-token="${INPUT_KAHU_TOKEN}"
fi

LOCK_FILE="${INPUT_LOCK_FILE:-.\/composer.lock}"
REPORT_ID=$(/usr/bin/kahu-cli manifest:upload --id-only "${LOCK_FILE}")

if ! test $? -eq 0; then
  echo "Manifest upload failed"

  exit 1;
fi

WAIT_TIMEOUT="${INPUT_WAIT_TIMEOUT:-300}"
RULE_FILE="${INPUT_RULE_FILE:-.\/rules.json}"

echo "Waiting analysis to be completed"
/usr/bin/kahu-cli manifest:report --wait --timeout="${WAIT_TIMEOUT}" "${REPORT_ID}" && \
/usr/bin/kahu-cli manifest:validate --file="${RULE_FILE}" "${REPORT_ID}"
