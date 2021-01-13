#!/usr/bin/env bash

echo "Creating volume folders..."
mkdir -p \
  ${OWNCLOUD_VOLUME_CONFIG} \
  ${OWNCLOUD_VOLUME_FILES} \
  ${OWNCLOUD_VOLUME_APPS} \
  ${OWNCLOUD_VOLUME_SESSIONS}

echo "Creating hook folders..."
mkdir -p \
  ${OWNCLOUD_PRE_INSTALL_PATH} \
  ${OWNCLOUD_POST_INSTALL_PATH} \
  ${OWNCLOUD_PRE_SERVER_PATH} \
  ${OWNCLOUD_POST_SERVER_PATH} \
  ${OWNCLOUD_PRE_CRONJOB_PATH} \
  ${OWNCLOUD_POST_CRONJOB_PATH}

true
