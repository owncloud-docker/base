#!/usr/bin/env bash

case ${OWNCLOUD_DB_TYPE} in
"mysql")
  if ! grep -q ":" <<<"${OWNCLOUD_DB_HOST}"; then
    OWNCLOUD_DB_HOST=${OWNCLOUD_DB_HOST}:3306
  fi

  echo "Waiting for MySQL..."
  wait_error=false
  wait-for-it -t "${OWNCLOUD_DB_TIMEOUT}" "${OWNCLOUD_DB_HOST}" || wait_error=true

  if [[ "${wait_error}" == true && "${OWNCLOUD_DB_FAIL}" == "true" ]]; then
    echo "Database didn't come up in time!"
    exit 1
  fi
  ;;
"pgsql")
  if ! grep -q ":" <<<"${OWNCLOUD_DB_HOST}"; then
    OWNCLOUD_DB_HOST=${OWNCLOUD_DB_HOST}:5432
  fi

  echo "Waiting for PostgreSQL..."
  wait_error=false
  wait-for-it -t "${OWNCLOUD_DB_TIMEOUT}" "${OWNCLOUD_DB_HOST}" || wait_error=true

  if [[ "${wait_error}" == true && "${OWNCLOUD_DB_FAIL}" == "true" ]]; then
    echo "Database didn't come up in time!"
    exit 1
  fi
  ;;
esac

if [[ ${OWNCLOUD_MEMCACHED_ENABLED} == "true" ]]; then
  echo "Waiting for Memcached..."
  wait_error=false
  wait-for-it -t "${OWNCLOUD_MEMCACHED_STARTUP_TIMEOUT}" "${OWNCLOUD_MEMCACHED_HOST}":"${OWNCLOUD_MEMCACHED_PORT}" || wait_error=true

  if [[ "${wait_error}" == true ]]; then
    echo "Memcached didn't come up in time!"
    exit 1
  fi
fi

if [[ ${OWNCLOUD_REDIS_ENABLED} == "true" ]] && [[ ${OWNCLOUD_REDIS_SEEDS} == "" ]] && [[ ${OWNCLOUD_REDIS_PORT} != "0" ]]; then
  echo "Waiting for Redis..."
  wait_error=false
  wait-for-it -t "${OWNCLOUD_REDIS_STARTUP_TIMEOUT}" "${OWNCLOUD_REDIS_HOST#tls://}:${OWNCLOUD_REDIS_PORT}" || wait_error=true

  if [[ "${wait_error}" == true ]]; then
    echo "Redis didn't come up in time!"
    exit 1
  fi
fi

true
