#!/usr/bin/env bash

if [[ ${OWNCLOUD_MAINTENANCE_MODE} == "true" ]]
then
  echo "Enabling maintenance mode..."
  occ maintenance:mode --on
else
  echo "Disabling maintenance mode..."
  occ maintenance:mode --off
fi

true
