#!/usr/bin/env bash

if [[ ${OWNCLOUD_CACHING_CLASS} == "false" ]]
then
  echo "Disable caching..."
  occ config:system:delete memcache.local
else
  echo "Configure caching..."
  occ config:system:set memcache.local --value "${OWNCLOUD_CACHING_CLASS}"
fi

true
