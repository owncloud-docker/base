#!/usr/bin/env bash

declare -x OWNCLOUD_CACHING_CLASS
[[ -z "${OWNCLOUD_CACHING_CLASS}" ]] && OWNCLOUD_CACHING_CLASS="\\OC\\Memcache\\APCu"

true
