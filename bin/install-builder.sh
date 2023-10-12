#!/bin/bash

set -e

if [[ "${DEBUG}" == "true" ]]; then
  set -x
fi

# shellcheck source=/dev/null
. /usr/local/containerbase/util.sh
# shellcheck source=/dev/null
. "/${CONTAINERBASE_DIR}/utils/v2/overrides.sh"

function main () {
  mkdir -p /cache
  create_tool_path > /dev/null
}

main
