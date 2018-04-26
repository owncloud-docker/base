#!/usr/bin/env bash

if [[ ${OWNCLOUD_LOCKING_ENABLED} == "true" ]]
then
  echo "Enabling file locking..."
  occ config:system:set filelocking.enabled --value true
else
  echo "Disabling file locking..."
  occ config:system:set filelocking.enabled --value false
fi

true
