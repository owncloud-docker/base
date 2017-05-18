#!/usr/bin/env bash

if [[ ${OWNCLOUD_REDIS_ENABLED} == "true" ]]
then
  echo "Waiting for Redis..."
  wait-for-it -t 60 ${OWNCLOUD_REDIS_HOST}:${OWNCLOUD_REDIS_PORT}

  if [[ $? -ne 0 ]]
  then
    echo "Redis didn't came up in time!"
    exit 1
  fi

  echo "Enabling redis config..."
  occ config:system:set memcache.distributed --value "\OC\Memcache\Redis"
  occ config:system:set memcache.locking --value "\OC\Memcache\Redis"
  occ config:system:set redis --value REDIS

  sed -i "s|'REDIS'|array('host' => '${OWNCLOUD_REDIS_HOST}', 'port' => ${OWNCLOUD_REDIS_PORT})|" /var/www/owncloud/config/config.php
else
  echo "Disabling redis config..."
  occ config:system:delete memcache.distributed
  occ config:system:delete memcache.locking
  occ config:system:delete redis
fi

true
