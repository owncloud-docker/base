#!/usr/bin/env bash

if [[ ! -L /var/www/owncloud/custom ]]
then
  echo "Removing custom folder..."
  rm -rf /var/www/owncloud/custom

  echo "Linking custom folder..."
  ln -sf ${OWNCLOUD_VOLUME_APPS} /var/www/owncloud/custom
fi

if [[ ! -L /var/www/owncloud/config ]]
then
  echo "Removing config folder..."
  rm -rf /var/www/owncloud/config

  echo "Linking config folder..."
  ln -sf ${OWNCLOUD_VOLUME_CONFIG} /var/www/owncloud/config
fi

if [[ ! -f ${OWNCLOUD_VOLUME_CONFIG}/config.php ]]
then
  echo "Copying config file..."
  envsubst \
    '${OWNCLOUD_VOLUME_FILES} ${OWNCLOUD_VOLUME_APPS}' \
      < /root/owncloud/config.php > ${OWNCLOUD_VOLUME_CONFIG}/config.php
fi

if [[ ! -f ${OWNCLOUD_VOLUME_CONFIG}/domains.config.php ]]
then
  echo "Copying domains file..."
  cp \
    /root/owncloud/domains.php \
    ${OWNCLOUD_VOLUME_CONFIG}/domains.config.php
fi

echo "Copying db file..."
envsubst \
  '${OWNCLOUD_DB_TYPE} ${OWNCLOUD_DB_HOST} ${OWNCLOUD_DB_NAME} ${OWNCLOUD_DB_USERNAME} ${OWNCLOUD_DB_PASSWORD} ${OWNCLOUD_DB_PREFIX}' \
    < /root/owncloud/database.php > ${OWNCLOUD_VOLUME_CONFIG}/database.config.php

true
