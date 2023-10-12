#!/bin/bash

set -e

# shellcheck source=/dev/null
. /usr/local/containerbase/util.sh
# shellcheck source=/dev/null
. "/${CONTAINERBASE_DIR}/utils/v2/overrides.sh"

# trim leading v
TOOL_VERSION=${1#v}

if [[ "${DEBUG}" == "true" ]]; then
  set -x
fi

function main () {
  local tool_path
  local versioned_tool_path
  local file
  # https://archive.apache.org/dist/maven/maven-3/3.8.1/binaries/apache-maven-3.8.1-bin.tar.gz
  local URL='https://archive.apache.org/dist'
  local file_name="apache-${TOOL_NAME}-${TOOL_VERSION}-bin.tar.gz"
  local file_url="${TOOL_NAME}/${TOOL_NAME}-${MAJOR}/${TOOL_VERSION}/binaries/${file_name}"

  local checksum_file
  local checksum_algo
  local expected_checksum

  echo "Building ${TOOL_NAME} ${TOOL_VERSION}"

  echo "------------------------"
  echo "fetching archive"

  if [[ "$(file_exists "${URL}/${file_url}.sha512")" -eq 200 ]]; then
    checksum_file=$(get_from_url "${URL}/${file_url}.sha512")
    checksum_algo=sha512sum
    # get checksum from file
    expected_checksum=$(cut -d' ' -f1 "${checksum_file}")
  elif [[ "$(file_exists "${URL}/${file_url}.sha1")" -eq 200 ]]; then
    checksum_file=$(get_from_url "${URL}/${file_url}.sha1")
    checksum_algo=sha1sum
    # get checksum from file
    expected_checksum=$(cut -d' ' -f1 "${checksum_file}")
  else
    echo "Missing checksum"
    exit 1
  fi

  file=$(get_from_url \
    "${URL}/${file_url}" \
    "${file_name}" \
    "${expected_checksum}" \
    "${checksum_algo}" )

  echo "------------------------"
  echo "decompressing archive"
  versioned_tool_path=$(create_versioned_tool_path)
  bsdtar --strip 1 -C "${versioned_tool_path}" -xf "${file}"

  echo "------------------------"
  echo "testing"
  "${versioned_tool_path}/bin/mvn" --version

  echo "------------------------"
  echo "compressing archive"
  tool_path=$(find_tool_path)
  bsdtar -cJf "/cache/${TOOL_NAME}-${TOOL_VERSION}.tar.xz" -C "${tool_path}" "${TOOL_VERSION}"
}

check_semver "${TOOL_VERSION}" all
main
