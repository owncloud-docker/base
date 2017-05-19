#!/usr/bin/env bash

echo "Writing apache env..."
if [[ "${OWNCLOUD_SUB_URL}" == "/" ]]
then
  envsubst \
    '${OWNCLOUD_SUB_URL} ${OWNCLOUD_VOLUME_CERTS}' \
      < /root/owncloud/toppath.conf > /etc/apache2/sites-enabled/000-default.conf
else
  envsubst \
    '${OWNCLOUD_SUB_URL} ${OWNCLOUD_VOLUME_CERTS}' \
      < /root/owncloud/subpath.conf > /etc/apache2/sites-enabled/000-default.conf
fi

echo "Starting cron daemon..."
service cron start >/dev/null

echo "Starting apache daemon..."
service apache2 start >/dev/null

true
