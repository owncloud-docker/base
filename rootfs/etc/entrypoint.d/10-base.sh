#!/usr/bin/env bash
set -e

declare -x OWNCLOUD_DOMAIN
[[ -z "${OWNCLOUD_DOMAIN}" ]] && OWNCLOUD_DOMAIN="${HOSTNAME}"

declare -x OWNCLOUD_IPADDRESS
[[ -z "${OWNCLOUD_IPADDRESS}" ]] && OWNCLOUD_IPADDRESS="$(hostname -i)"

declare -x OWNCLOUD_LOGLEVEL
[[ -z "${OWNCLOUD_LOGLEVEL}" ]] && OWNCLOUD_LOGLEVEL="0"
