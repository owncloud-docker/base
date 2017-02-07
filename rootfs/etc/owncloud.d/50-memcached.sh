#!/usr/bin/env bash

if [[ ${OWNCLOUD_MEMCACHED_ENABLED} == "true" ]]
then
  echo "Waiting for Memcached..."
  wait-for-it -t 60 ${OWNCLOUD_MEMCACHED_HOST}:${OWNCLOUD_MEMCACHED_PORT}

  if [[ $? -ne 0 ]]
  then
    echo "Memcached didn't came up in time!"
    exit 1
  fi

  echo "Enabling memcached..."
  occ config:system:set memcache.distributed --value "\OC\Memcache\Memcached"
  occ config:system:set memcache.locking --value "\OC\Memcache\Memcached"
  occ config:system:set memcached_servers --value MEMCACHED

  sed -i "s|'MEMCACHED'|array('${OWNCLOUD_MEMCACHED_HOST}', ${OWNCLOUD_MEMCACHED_PORT})|" /var/www/owncloud/config/config.php
else
  echo "Disabling memcached..."
  occ config:system:delete memcache.distributed
  occ config:system:delete memcache.locking
  occ config:system:delete memcached_servers
fi
