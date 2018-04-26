#!/usr/bin/env bash

if [[ -n "${OWNCLOUD_LICENSE_KEY}" ]]
then
  echo "Copying marketplace config..."
  envsubst \
    '${OWNCLOUD_MARKETPLACE_APIKEY}' \
      < /root/owncloud/marketplace.php > ${OWNCLOUD_VOLUME_CONFIG}/marketplace.config.php
else
  if [[ -f ${OWNCLOUD_VOLUME_CONFIG}/marketplace.config.php ]]
  then
    echo "Removing marketplace config..."
    rm -f ${OWNCLOUD_VOLUME_CONFIG}/marketplace.config.php
  fi
fi

true
