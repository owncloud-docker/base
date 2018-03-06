#!/usr/bin/env bash

if [[ ${OWNCLOUD_MAINTENANCE_MODE} == "true" ]]
then
  echo "Enabling maintenace mode..."
  occ maintenance:mode --on
else
  echo "Disabling maintenace mode..."
  occ maintenance:mode --off
fi

true
