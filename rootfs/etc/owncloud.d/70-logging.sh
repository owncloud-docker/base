#!/usr/bin/env bash

echo "Touching log file..."
su-exec www-data touch ${OWNCLOUD_VOLUME_FILES}/owncloud.log

echo "Setting log level..."
occ config:system:set loglevel --value ${OWNCLOUD_LOGLEVEL}

if [[ -n "${OWNCLOUD_LOGSIZE}" ]]
then
  echo "Setting log size..."
  occ config:system:set log_rotate_size --value ${OWNCLOUD_LOGSIZE}
fi

true
