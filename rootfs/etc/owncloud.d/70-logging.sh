#!/usr/bin/env bash

echo "Touching log file..."
su-exec www-data touch ${OWNCLOUD_VOLUME_FILES}/owncloud.log

echo "Setting log level..."
occ config:system:set loglevel --value ${OWNCLOUD_LOGLEVEL}

true
