#!/usr/bin/env bash

export HOME="${HOME:-/var/www/owncloud}"
export LANG="${LANG:-C}"

export APACHE_ERROR_LOG="${OWNCLOUD_ERRORLOG_LOCATION:-/dev/stderr}"
export APACHE_ACCESS_LOG="${OWNCLOUD_ACCESSLOG_LOCATION:-/dev/stdout}"
export APACHE_DOCUMENT_ROOT="${APACHE_DOCUMENT_ROOT:-/var/www/owncloud}"
export APACHE_LISTEN="${APACHE_LISTEN:-8080}"

# Write env to file for crond
env >| /etc/environment

true
