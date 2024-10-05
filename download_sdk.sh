#!/usr/bin/env bash

# Script to download an upstream SDK release

set -eux

: "${INPUT_VERSION_TAG:?INPUT_VERSION_TAG needs to be set}"
: "${INPUT_FILENAME:?INPUT_FILENAME needs to be set}"

VERSION="${INPUT_VERSION_TAG:1}"

# https://repo.huaweicloud.com/openharmony/os/4.0-Release/ohos-sdk-windows_linux-public.tar.gz

URL_BASE="https://repo.huaweicloud.com/openharmony/os"

DOWNLOAD_URL="${URL_BASE}/${VERSION}-Release/${INPUT_FILENAME}"

echo "Downloading OHOS SDK from ${DOWNLOAD_URL}"

curl --fail -L --remote-name "${DOWNLOAD_URL}"
curl --fail -L --remote-name "${DOWNLOAD_URL}.sha256"

echo "$(cat "${INPUT_FILENAME}".sha256) ${INPUT_FILENAME}" | sha256sum --check --status
