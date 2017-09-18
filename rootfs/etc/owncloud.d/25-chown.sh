#!/usr/bin/env bash

if [[ ${OWNCLOUD_SKIP_CHOWN} == "true" ]]
then
  echo "Skipping chown as requested..."
else
  echo "Fixing base perms..."
  find /var/www/owncloud \( \! -user www-data -o \! -group www-data \) -print0 | xargs -r -0 chown www-data:www-data

  echo "Fixing data perms..."
  find ${OWNCLOUD_VOLUME_ROOT} \( \! -user www-data -o \! -group www-data \) -print0 | xargs -r -0 chown www-data:www-data

  if [[ ! ${OWNCLOUD_VOLUME_CONFIG} =~ ^${OWNCLOUD_VOLUME_ROOT} ]]
  then
    echo "Fixing config perms..."
    find ${OWNCLOUD_VOLUME_CONFIG} \( \! -user www-data -o \! -group www-data \) -print0 | xargs -r -0 chown www-data:www-data
  fi

  if [[ ! ${OWNCLOUD_VOLUME_FILES} =~ ^${OWNCLOUD_VOLUME_ROOT} ]]
  then
    echo "Fixing file perms..."
    find ${OWNCLOUD_VOLUME_FILES} \( \! -user www-data -o \! -group www-data \) -print0 | xargs -r -0 chown www-data:www-data
  fi

  if [[ ! ${OWNCLOUD_VOLUME_CERTS} =~ ^${OWNCLOUD_VOLUME_ROOT} ]]
  then
    echo "Fixing cert perms..."
    find ${OWNCLOUD_VOLUME_CERTS} \( \! -user www-data -o \! -group www-data \) -print0 | xargs -r -0 chown www-data:www-data
  fi

  if [[ ! ${OWNCLOUD_VOLUME_APPS} =~ ^${OWNCLOUD_VOLUME_ROOT} ]]
  then
    echo "Fixing app perms..."
    find ${OWNCLOUD_VOLUME_APPS} \( \! -user www-data -o \! -group www-data \) -print0 | xargs -r -0 chown www-data:www-data
  fi

  if [[ ! ${OWNCLOUD_VOLUME_SESSIONS} =~ ^${OWNCLOUD_VOLUME_ROOT} ]]
  then
    echo "Fixing session perms..."
    find ${OWNCLOUD_VOLUME_SESSIONS} \( \! -user www-data -o \! -group www-data \) -print0 | xargs -r -0 chown www-data:www-data
  fi
fi

true
