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

echo "Writing config file..."
gomplate \
  -f /etc/templates/config.php \
  -o ${OWNCLOUD_VOLUME_CONFIG}/overwrite.config.php

true
