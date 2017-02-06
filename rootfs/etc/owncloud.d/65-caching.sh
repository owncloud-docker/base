#!/usr/bin/env bash
set -e

echo "Configure caching..."
occ config:system:set memcache.local --value "\OC\Memcache\APCu"
