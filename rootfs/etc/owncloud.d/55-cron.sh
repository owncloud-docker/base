#!/usr/bin/env bash

echo "Enabling background cron..."
occ background:cron

if [[ ${OWNCLOUD_CROND_ENABLED} == "true" ]]
then
  echo "Touching cron configs..."
  touch /etc/cron.d/*

  echo "Starting cron daemon..."
  /usr/sbin/cron -l
fi

true
