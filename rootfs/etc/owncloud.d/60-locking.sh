#!/usr/bin/env bash

if [[ ${OWNCLOUD_LOCKING_ENABLED} == "true" ]]
then
  echo "Enabling locking..."
  occ config:system:set filelocking.enabled --value true
else
  echo "Disabling locking..."
  occ config:system:set filelocking.enabled --value false
fi
