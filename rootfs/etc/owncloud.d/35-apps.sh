#!/usr/bin/env bash

echo "Enabling files_external app..."
occ app:enable files_external || true >/dev/null 2>&1
occ app:enable files_external || true  >/dev/null 2>&1

if dpkg --compare-versions $(occ config:system:get version | tail -1) "ge" "10.0"
then
  if [[ -n "${OWNCLOUD_APPS_INSTALL}" ]]
  then
    for VAL in $(echo ${OWNCLOUD_APPS_INSTALL} | tr "," " ")
    do
      if [[ ! -d ${OWNCLOUD_VOLUME_APPS}/${VAL} ]]
      then
        echo "Installing ${VAL} app..."
        occ market:install -n ${VAL}
      fi
    done
  fi

  if [[ -n "${OWNCLOUD_APPS_ENABLE}" ]]
  then
    for VAL in $(echo ${OWNCLOUD_APPS_ENABLE} | tr "," " ")
    do
      if [[ -d ${OWNCLOUD_VOLUME_APPS}/${VAL} || -d /var/www/owncloud/apps/${VAL} ]]
      then
        echo "Enabling ${VAL} app..."
        occ app:enable -n ${VAL}
      fi
    done
  fi

  if [[ -n "${OWNCLOUD_APPS_DISABLE}" ]]
  then
    for VAL in $(echo ${OWNCLOUD_APPS_DISABLE} | tr "," " ")
    do
      if [[ -d ${OWNCLOUD_VOLUME_APPS}/${VAL} || -d /var/www/owncloud/apps/${VAL} ]]
      then
        echo "Disabling ${VAL} app..."
        occ app:disable -n ${VAL}
      fi
    done
  fi

  occ upgrade || true
fi

true
