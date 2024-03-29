#!/usr/bin/env bash

declare -x OWNCLOUD_MEMCACHED_ENABLED
[[ -z "${OWNCLOUD_MEMCACHED_ENABLED}" ]] && OWNCLOUD_MEMCACHED_ENABLED="false"

declare -x OWNCLOUD_MEMCACHED_HOST
[[ -z "${OWNCLOUD_MEMCACHED_HOST}" ]] && OWNCLOUD_MEMCACHED_HOST="memcached"

declare -x OWNCLOUD_MEMCACHED_PORT
[[ -z "${OWNCLOUD_MEMCACHED_PORT}" ]] && OWNCLOUD_MEMCACHED_PORT="11211"

declare -x OWNCLOUD_MEMCACHED_OPTIONS
[[ -z "${OWNCLOUD_MEMCACHED_OPTIONS}" ]] && OWNCLOUD_MEMCACHED_OPTIONS=""

declare -x OWNCLOUD_MEMCACHED_STARTUP_TIMEOUT
[[ -z "${OWNCLOUD_MEMCACHED_STARTUP_TIMEOUT}" ]] && OWNCLOUD_MEMCACHED_STARTUP_TIMEOUT="180"

true
