#!/usr/bin/env bash

declare -x OWNCLOUD_MARKETPLACE_URL
[[ -z "${OWNCLOUD_MARKETPLACE_URL}" ]] && OWNCLOUD_MARKETPLACE_URL=""

declare -x OWNCLOUD_MARKETPLACE_CA
[[ -z "${OWNCLOUD_MARKETPLACE_CA}" ]] && OWNCLOUD_MARKETPLACE_CA=""

declare -x OWNCLOUD_MARKETPLACE_APIKEY
[[ -z "${OWNCLOUD_MARKETPLACE_APIKEY}" ]] && OWNCLOUD_MARKETPLACE_APIKEY=""