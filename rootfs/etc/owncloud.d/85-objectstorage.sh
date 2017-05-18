#!/usr/bin/env bash

if [[ ${OWNCLOUD_OBJECTSTORE_ENABLED} == "true" ]]
then
  echo "Enabling object storage..."
  envsubst \
    '${OWNCLOUD_OBJECTSTORE_CLASS} ${OWNCLOUD_OBJECTSTORE_BUCKET} ${OWNCLOUD_OBJECTSTORE_AUTOCREATE} ${OWNCLOUD_OBJECTSTORE_VERSION} ${OWNCLOUD_OBJECTSTORE_REGION} ${OWNCLOUD_OBJECTSTORE_KEY} ${OWNCLOUD_OBJECTSTORE_SECRET} ${OWNCLOUD_OBJECTSTORE_ENDPOINT} ${OWNCLOUD_OBJECTSTORE_PATHSTYLE}' \
      < /root/owncloud/objectstore.php > /var/www/owncloud/config/objectstore.config.php
else
  echo "Removing object storae..."
  rm -f /var/www/owncloud/config/objectstore.config.php

  echo "Disabling object storage..."
  occ config:system:delete objectstore
fi

true
