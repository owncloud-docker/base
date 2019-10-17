#!/usr/bin/env bash

if [[ ! -e ${OWNCLOUD_LOG_FILE} ]]
then
  if [[ "$(id -u)" == "0" ]]
  then
    echo "Touching log file..."
    su-exec www-data touch ${OWNCLOUD_LOG_FILE}
  else
    echo "Touching log file..."
    touch ${OWNCLOUD_LOG_FILE}
  fi
fi

true
