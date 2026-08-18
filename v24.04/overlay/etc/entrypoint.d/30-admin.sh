#!/usr/bin/env bash

declare -x OWNCLOUD_ADMIN_USERNAME
[[ -z "${OWNCLOUD_ADMIN_USERNAME}" ]] && OWNCLOUD_ADMIN_USERNAME="admin"

declare -x OWNCLOUD_ADMIN_PASSWORD
# ":+x" keeps the value out of the xtrace output when DEBUG=true
[[ -z "${OWNCLOUD_ADMIN_PASSWORD:+x}" ]] && OWNCLOUD_ADMIN_PASSWORD="admin"

true
