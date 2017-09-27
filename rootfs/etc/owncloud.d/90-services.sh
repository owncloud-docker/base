#!/usr/bin/env bash

echo "Setting rewrite base..."
occ config:system:set htaccess.RewriteBase --value ${OWNCLOUD_SUB_URL}
occ maintenance:update:htaccess

echo "Writing apache config..."
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

echo "Writing php config..."
  envsubst \
    '${OWNCLOUD_VOLUME_SESSIONS} ${OWNCLOUD_MAX_UPLOAD} ${OWNCLOUD_MAX_EXECUTION_TIME} ${OWNCLOUD_MAX_INPUT_TIME}' \
      < /root/owncloud/php.ini > /etc/php/7.0/mods-available/owncloud.ini

if [[ ${OWNCLOUD_CROND_ENABLED} == "true" ]]
then
  echo "Starting cron daemon..."
  service cron start >/dev/null
fi

echo "Starting apache daemon..."
service apache2 start >/dev/null

true
