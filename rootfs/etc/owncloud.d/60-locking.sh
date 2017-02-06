#!/usr/bin/env bash
set -e

if [[ ${OWNCLOUD_LOCKING_ENABLED} == "true" ]]
then
  echo "Enabling locking..."
  occ config:system:set filelocking.enabled --value true
else
  echo "Disabling locking..."
  occ config:system:set filelocking.enabled --value false
fi
