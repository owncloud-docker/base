#!/usr/bin/env bash

if [[ -d "${OWNCLOUD_PRE_INSTALL_PATH}" ]]
then
  for FILE in $(find ${OWNCLOUD_PRE_INSTALL_PATH} -iname *.sh | sort)
  do
    source ${FILE}
  done
fi

if /usr/bin/owncloud installed
then
  for VAL in $(echo ${OWNCLOUD_APPS_DEPRECATED} | tr "," " ")
  do
    if /usr/bin/occ app:list -nq ${VAL} | grep -q Enabled
    then
      echo "Disabling deprecated ${VAL}..."
      /usr/bin/occ app:disable ${VAL}
    fi
  done

  echo "Upgrading server database..."
  /usr/bin/owncloud migrate
else
  echo "Installing server database..."
  /usr/bin/owncloud install
fi

if [[ -d "${OWNCLOUD_POST_INSTALL_PATH}" ]]
then
  for FILE in $(find ${OWNCLOUD_POST_INSTALL_PATH} -iname *.sh | sort)
  do
    source ${FILE}
  done
fi

true
