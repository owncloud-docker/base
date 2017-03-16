#!/usr/bin/env bash

if [[ ! -L /var/www/owncloud/custom ]]
then
  echo "Removing custom..."
  rm -rf /var/www/owncloud/custom

  echo "Linking custom..."
  ln -sf /mnt/data/apps /var/www/owncloud/custom
fi

if [[ ! -L /var/www/owncloud/config ]]
then
  echo "Removing folder..."
  rm -rf /var/www/owncloud/config

  echo "Linking folder..."
  ln -sf /mnt/data/config /var/www/owncloud/config
fi

if [[ ! -f /mnt/data/config/config.php ]]
then
  echo "Copying config..."
  cp /root/owncloud/config.php /mnt/data/config/
fi

true
