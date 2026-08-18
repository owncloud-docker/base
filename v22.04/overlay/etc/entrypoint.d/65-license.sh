#!/usr/bin/env bash

declare -x OWNCLOUD_LICENSE_KEY
# ":+x" keeps the value out of the xtrace output when DEBUG=true
[[ -z "${OWNCLOUD_LICENSE_KEY:+x}" ]] && OWNCLOUD_LICENSE_KEY=""

declare -x OWNCLOUD_LICENSE_CLASS
[[ -z "${OWNCLOUD_LICENSE_CLASS}" ]] && OWNCLOUD_LICENSE_CLASS=""

true
