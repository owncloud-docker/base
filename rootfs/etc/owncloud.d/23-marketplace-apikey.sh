#!/usr/bin/env bash

if [[ -n "${OWNCLOUD_LICENSE_KEY}" ]]
then
  echo "Copying marketplace apikey config..."
  envsubst \
    '${OWNCLOUD_MARKETPLACE_APIKEY}' \
      < /root/owncloud/marketplace.php > ${OWNCLOUD_VOLUME_CONFIG}/marketplace.config.php
else
  if [[ -f ${OWNCLOUD_VOLUME_CONFIG}/marketplace.config.php ]]
  then
    echo "Removing marketplace apikey config..."
    rm -f ${OWNCLOUD_VOLUME_CONFIG}/marketplace.config.php
    occ config:system:delete marketplace.key
  fi
fi

true
