#!/usr/bin/env bash

if dpkg --compare-versions $(occ config:system:get version | tail -1) "ge" "10.0"
then
  if [[ -n "${OWNCLOUD_MARKETPLACE_URL}" ]]
  then
    echo "Setting marketplace url..."
    occ config:system:set appstoreurl --value ${OWNCLOUD_MARKETPLACE_URL}
  fi

  if [[ -n "${OWNCLOUD_MARKETPLACE_CA}" ]]
  then
    echo "Setting marketplace ca..."
    occ config:system:set marketplace.ca --value ${OWNCLOUD_MARKETPLACE_CA}
  fi
fi

true
