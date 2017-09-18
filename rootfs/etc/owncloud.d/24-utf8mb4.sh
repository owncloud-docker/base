#!/usr/bin/env bash

if [[ ${OWNCLOUD_UTF8MB4_ENABLED} == "true" ]]
then
  echo "Copying utf8mb4 config..."
  cp \
    /root/owncloud/utf8mb4.php \
    ${OWNCLOUD_VOLUME_CONFIG}/utf8mb4.config.php
else
  if [[ -f ${OWNCLOUD_VOLUME_CONFIG}/utf8mb4.config.php ]]
  then
    echo "Removing utf8mb4 config..."
    rm -f ${OWNCLOUD_VOLUME_CONFIG}/utf8mb4.config.php
  fi
fi

true
