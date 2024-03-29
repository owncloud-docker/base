#!/usr/bin/env bash

declare -x OWNCLOUD_APPS_INSTALL
[[ -z "${OWNCLOUD_APPS_INSTALL}" ]] && OWNCLOUD_APPS_INSTALL=""

declare -x OWNCLOUD_APPS_INSTALL_MAJOR
[[ -z "${OWNCLOUD_APPS_INSTALL_MAJOR}" ]] && OWNCLOUD_APPS_INSTALL_MAJOR="false"

declare -x OWNCLOUD_APPS_ENABLE
[[ -z "${OWNCLOUD_APPS_ENABLE}" ]] && OWNCLOUD_APPS_ENABLE="${OWNCLOUD_APPS_INSTALL}"

declare -x OWNCLOUD_APPS_UNINSTALL
[[ -z "${OWNCLOUD_APPS_UNINSTALL}" ]] && OWNCLOUD_APPS_UNINSTALL=""

declare -x OWNCLOUD_APPS_DISABLE
[[ -z "${OWNCLOUD_APPS_DISABLE}" ]] && OWNCLOUD_APPS_DISABLE=""

declare -x OWNCLOUD_APPS_DEPRECATED
[[ -z "${OWNCLOUD_APPS_DEPRECATED}" ]] && OWNCLOUD_APPS_DEPRECATED=""

true
