#!/usr/bin/env bash

declare -x OWNCLOUD_SESSION_SAVE_HANDLER
[[ -z "${OWNCLOUD_SESSION_SAVE_HANDLER}" ]] && OWNCLOUD_SESSION_SAVE_HANDLER="files"

declare -x OWNCLOUD_SESSION_SAVE_PATH
[[ -z "${OWNCLOUD_SESSION_SAVE_PATH}" ]] && OWNCLOUD_SESSION_SAVE_PATH="${OWNCLOUD_VOLUME_SESSIONS}"

declare -x OWNCLOUD_DEFAULT_SOCKET_TIMEOUT
[[ -z "${OWNCLOUD_DEFAULT_SOCKET_TIMEOUT}" ]] && OWNCLOUD_DEFAULT_SOCKET_TIMEOUT="60"

declare -x OWNCLOUD_REDIS_SESSION_LOCKING_ENABLED
[[ -z "${OWNCLOUD_REDIS_SESSION_LOCKING_ENABLED}" ]] && OWNCLOUD_REDIS_SESSION_LOCKING_ENABLED="1"

declare -x OWNCLOUD_REDIS_SESSION_LOCK_WAIT_TIME
[[ -z "${OWNCLOUD_REDIS_SESSION_LOCK_WAIT_TIME}" ]] && OWNCLOUD_REDIS_SESSION_LOCK_WAIT_TIME="20000"

declare -x OWNCLOUD_REDIS_SESSION_LOCK_RETRIES
[[ -z "${OWNCLOUD_REDIS_SESSION_LOCK_RETRIES}" ]] && OWNCLOUD_REDIS_SESSION_LOCK_RETRIES="750"

true
