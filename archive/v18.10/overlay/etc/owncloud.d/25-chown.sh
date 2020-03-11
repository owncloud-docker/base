#!/usr/bin/env bash

if [[ ${OWNCLOUD_SKIP_CHOWN} == "true" ]]
then
  echo "Skipping chown as requested..."
else
  echo "Fixing base perms..."
  find /var/www/owncloud \( \! -user www-data -o \! -group root \) -print0 | xargs -r -0 chown www-data:root

  echo "Fixing data perms..."
  find ${OWNCLOUD_VOLUME_ROOT} \( \! -user www-data -o \! -group root \) -print0 | xargs -r -0 chown www-data:root

  if [[ ! ${OWNCLOUD_VOLUME_CONFIG} =~ ^${OWNCLOUD_VOLUME_ROOT} ]]
  then
    echo "Fixing config perms..."
    find ${OWNCLOUD_VOLUME_CONFIG} \( \! -user www-data -o \! -group root \) -print0 | xargs -r -0 chown www-data:root
  fi

  if [[ ! ${OWNCLOUD_VOLUME_FILES} =~ ^${OWNCLOUD_VOLUME_ROOT} ]]
  then
    echo "Fixing file perms..."
    find ${OWNCLOUD_VOLUME_FILES} \( \! -user www-data -o \! -group root \) -print0 | xargs -r -0 chown www-data:root
  fi

  if [[ ! ${OWNCLOUD_VOLUME_APPS} =~ ^${OWNCLOUD_VOLUME_ROOT} ]]
  then
    echo "Fixing app perms..."
    find ${OWNCLOUD_VOLUME_APPS} \( \! -user www-data -o \! -group root \) -print0 | xargs -r -0 chown www-data:root
  fi

  if [[ ! ${OWNCLOUD_VOLUME_SESSIONS} =~ ^${OWNCLOUD_VOLUME_ROOT} ]]
  then
    echo "Fixing session perms..."
    find ${OWNCLOUD_VOLUME_SESSIONS} \( \! -user www-data -o \! -group root \) -print0 | xargs -r -0 chown www-data:root
  fi
fi

if [[ ${OWNCLOUD_SKIP_CHMOD} == "true" ]]
then
  echo "Skipping chmod as requested..."
else
  echo "Fixing hook perms..."
  find ${OWNCLOUD_PRE_INSTALL_PATH} -iname *.sh  -print0 | xargs -r -0 chmod +x
  find ${OWNCLOUD_POST_INSTALL_PATH} -iname *.sh -print0 | xargs -r -0 chmod +x
  find ${OWNCLOUD_PRE_SERVER_PATH} -iname *.sh -print0 | xargs -r -0 chmod +x
  find ${OWNCLOUD_POST_SERVER_PATH} -iname *.sh -print0 | xargs -r -0 chmod +x
  find ${OWNCLOUD_PRE_CRONJOB_PATH} -iname *.sh -print0 | xargs -r -0 chmod +x
  find ${OWNCLOUD_POST_CRONJOB_PATH} -iname *.sh -print0 | xargs -r -0 chmod +x
fi

true
