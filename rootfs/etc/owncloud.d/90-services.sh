#!/usr/bin/env bash

echo "Setting rewrite base..."
occ config:system:set htaccess.RewriteBase --value ${OWNCLOUD_SUB_URL}
occ maintenance:update:htaccess

if [[ -n "${OWNCLOUD_ALLOW_EXTERNAL_LOCAL_STORAGE}" ]]
then
  if [[ "${OWNCLOUD_ALLOW_EXTERNAL_LOCAL_STORAGE}" == "true" ]] || [[ "${OWNCLOUD_ALLOW_EXTERNAL_LOCAL_STORAGE}" == "false" ]]
  then
    echo "Setting files_external_allow_create_new_local to ${OWNCLOUD_ALLOW_EXTERNAL_LOCAL_STORAGE}..."
    occ config:system:set files_external_allow_create_new_local --type=boolean --value=${OWNCLOUD_ALLOW_EXTERNAL_LOCAL_STORAGE}
  fi
fi

echo "Writing apache config..."
if [[ "${OWNCLOUD_SUB_URL}" == "/" ]]
then
  envsubst \
    '${OWNCLOUD_SUB_URL} ${OWNCLOUD_VOLUME_CERTS} ${OWNCLOUD_ERRORLOG_LOCATION} ${OWNCLOUD_ACCESSLOG_LOCATION}' \
      < /root/owncloud/toppath.conf > /etc/apache2/sites-enabled/000-default.conf
else
  envsubst \
    '${OWNCLOUD_SUB_URL} ${OWNCLOUD_VOLUME_CERTS} ${OWNCLOUD_ERRORLOG_LOCATION} ${OWNCLOUD_ACCESSLOG_LOCATION}' \
      < /root/owncloud/subpath.conf > /etc/apache2/sites-enabled/000-default.conf
fi

echo "Writing php config..."
  envsubst \
    '${OWNCLOUD_VOLUME_SESSIONS} ${OWNCLOUD_MAX_UPLOAD} ${OWNCLOUD_MAX_EXECUTION_TIME} ${OWNCLOUD_MAX_INPUT_TIME}' \
      < /root/owncloud/php.ini > /etc/php/7.2/mods-available/owncloud.ini

if [[ ${OWNCLOUD_CROND_ENABLED} == "true" ]]
then
  echo "Touching cron configs..."
  touch /etc/cron.d/*

  echo "Starting cron daemon..."
  service cron start >/dev/null
fi

if [[ -d "${OWNCLOUD_PRE_SERVER_PATH}" ]]
then
  for FILE in $(find ${OWNCLOUD_PRE_SERVER_PATH} -iname *.sh | sort)
  do
    source ${FILE}
  done
fi

echo "Starting apache daemon..."
service apache2 start >/dev/null

if [[ -d "${OWNCLOUD_POST_SERVER_PATH}" ]]
then
  for FILE in $(find ${OWNCLOUD_POST_SERVER_PATH} -iname *.sh | sort)
  do
    source ${FILE}
  done
fi

true
