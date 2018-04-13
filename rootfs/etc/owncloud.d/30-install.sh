#!/usr/bin/env bash

if [[ -d "${OWNCLOUD_PRE_INSTALL_PATH}" ]]
then
  for FILE in $(find ${OWNCLOUD_PRE_INSTALL_PATH} -iname *.sh | sort)
  do
    source ${FILE}
  done
fi

if /usr/local/bin/owncloud-installed
then
  echo "Upgrading server database..."
  /usr/local/bin/owncloud-migrate
else
  echo "Installing server database..."
  /usr/local/bin/owncloud-install
fi

if [[ -d "${OWNCLOUD_POST_INSTALL_PATH}" ]]
then
  for FILE in $(find ${OWNCLOUD_POST_INSTALL_PATH} -iname *.sh | sort)
  do
    source ${FILE}
  done
fi

true
