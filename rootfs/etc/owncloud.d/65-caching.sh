#!/usr/bin/env bash

echo "Configure caching..."
occ config:system:set memcache.local --value "${OWNCLOUD_CACHING_CLASS}"

true
