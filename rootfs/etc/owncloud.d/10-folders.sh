#!/usr/bin/env bash

echo "Creating volume folders..."
mkdir -p \
  ${OWNCLOUD_VOLUME_CONFIG} \
  ${OWNCLOUD_VOLUME_FILES} \
  ${OWNCLOUD_VOLUME_CERTS} \
  ${OWNCLOUD_VOLUME_APPS} \
  ${OWNCLOUD_VOLUME_SESSIONS}

true
