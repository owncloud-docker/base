#!/usr/bin/env bash
set -e

echo "Touching logfile..."
su-exec www-data touch /mnt/data/files/owncloud.log

echo "Setting loglevel..."
occ config:system:set loglevel --value ${OWNCLOUD_LOGLEVEL}
