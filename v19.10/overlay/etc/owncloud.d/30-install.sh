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
