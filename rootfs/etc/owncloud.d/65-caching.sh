#!/usr/bin/env bash

echo "Configure caching..."
occ config:system:set memcache.local --value "\OC\Memcache\APCu"
