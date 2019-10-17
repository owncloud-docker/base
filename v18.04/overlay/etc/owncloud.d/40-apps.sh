#!/usr/bin/env bash

if dpkg --compare-versions $(occ config:system:get version | tail -1) "ge" "10.0"
then
  for VAL in $(echo ${OWNCLOUD_APPS_INSTALL} | tr "," " ")
  do
    if [[ "${VAL}" =~ ^http.* ]]
    then
      NAME=$(basename ${VAL} | cut -d? -f1)

      echo "Downloading ${NAME} app..."
      curl -sSfLo /tmp/${NAME} -H "Accept: application/octet-stream" ${VAL}

      echo "Installing ${NAME} app..."
      occ market:install -n -l /tmp/${NAME}

      echo "Deleting ${NAME} tarball..."
      rm -f /tmp/${NAME}
    else
      if [[ ! -d ${OWNCLOUD_VOLUME_APPS}/${VAL} ]]
      then
        echo "Installing ${VAL} app..."
        occ market:install -n ${VAL}
      fi
    fi
  done

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

  if [[ -n "${OWNCLOUD_APPS_UNINSTALL}" ]]
  then
    for VAL in $(echo ${OWNCLOUD_APPS_UNINSTALL} | tr "," " ")
    do
      if [[ -d ${OWNCLOUD_VOLUME_APPS}/${VAL} ]]
      then
        echo "Uninstalling ${VAL} app..."
        rm -r ${OWNCLOUD_VOLUME_APPS}/${VAL}
      fi

      if [[ -d /var/www/owncloud/apps/${VAL} ]]
      then
        echo "Uninstalling ${VAL} app..."
        rm -r /var/www/owncloud/apps/${VAL}
      fi
    done
  fi

  occ upgrade || true
fi

true
