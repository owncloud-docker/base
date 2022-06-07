#!/usr/bin/env bash

case ${OWNCLOUD_DB_TYPE} in
  "mysql")
    if ! grep -q ":" <<<${OWNCLOUD_DB_HOST}
    then
      OWNCLOUD_DB_HOST=${OWNCLOUD_DB_HOST}:3306
    fi

    echo "Waiting for MySQL..."
    wait-for-it -t ${OWNCLOUD_DB_TIMEOUT} ${OWNCLOUD_DB_HOST}

    if [[ $? -ne 0 && "${OWNCLOUD_DB_FAIL}" == "true" ]]
    then
      echo "Database didn't came up in time!"
      exit 1
    fi
    ;;
  "pgsql")
    if ! grep -q ":" <<<${OWNCLOUD_DB_HOST}
    then
      OWNCLOUD_DB_HOST=${OWNCLOUD_DB_HOST}:5432
    fi

    echo "Waiting for PostgreSQL..."
    wait-for-it -t ${OWNCLOUD_DB_TIMEOUT} ${OWNCLOUD_DB_HOST}

    if [[ $? -ne 0 && "${OWNCLOUD_DB_FAIL}" == "true" ]]
    then
      echo "Database didn't came up in time!"
      exit 1
    fi
    ;;
esac

if [[ ${OWNCLOUD_MEMCACHED_ENABLED} == "true" ]]
then
  echo "Waiting for Memcached..."
  wait-for-it -t ${OWNCLOUD_MEMCACHED_STARTUP_TIMEOUT} ${OWNCLOUD_MEMCACHED_HOST}:${OWNCLOUD_MEMCACHED_PORT}

  if [[ $? -ne 0 ]]
  then
    echo "Memcached didn't came up in time!"
    exit 1
  fi
fi

if [[ ${OWNCLOUD_REDIS_ENABLED} == "true" ]] && [[ ${OWNCLOUD_REDIS_SEEDS} == "" ]] && [[ ${OWNCLOUD_REDIS_PORT} != "0" ]]
then
  echo "Waiting for Redis..."
  wait-for-it -t ${OWNCLOUD_REDIS_STARTUP_TIMEOUT} ${OWNCLOUD_REDIS_HOST}:${OWNCLOUD_REDIS_PORT}

  if [[ $? -ne 0 ]]
  then
    echo "Redis didn't came up in time!"
    exit 1
  fi
fi

true
