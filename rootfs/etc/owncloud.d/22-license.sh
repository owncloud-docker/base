#!/usr/bin/env bash

if [[ -n "${OWNCLOUD_LICENSE_KEY}" ]]
then
  echo "Copying license config..."
  envsubst \
    '${OWNCLOUD_LICENSE_KEY}' \
      < /root/owncloud/license.php > ${OWNCLOUD_VOLUME_CONFIG}/license.config.php
else
  if [[ -f ${OWNCLOUD_VOLUME_CONFIG}/license.config.php ]]
  then
    echo "Removing license config..."
    rm -f ${OWNCLOUD_VOLUME_CONFIG}/license.config.php
  fi
fi

true
