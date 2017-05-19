#!/usr/bin/env bash

if [[ -n "${OWNCLOUD_DOMAIN_FILE}" && -f "${OWNCLOUD_DOMAIN_FILE}" ]]
then
  OWNCLOUD_DOMAIN="${OWNCLOUD_DOMAIN} $(cat ${OWNCLOUD_DOMAIN_FILE})"
fi

if dpkg --compare-versions $(occ config:system:get version | tail -1) "lt" "9.0"
then
  echo "Configure trusted domains..."
  occ config:system:set trusted_domains --value DOMAINS

  COUNTER=0
  RESULT="array("

  for DOMAIN in localhost ${OWNCLOUD_IPADDRESS} $(echo ${OWNCLOUD_DOMAIN} | tr "," "\n")
  do
    RESULT="${RESULT}${COUNTER}=>\"${DOMAIN}\","
    let COUNTER+=1
  done

  RESULT="${RESULT})"
  sed -i "s|'DOMAINS'|${RESULT}|" /var/www/owncloud/config/config.php
else
  echo "Configure trusted domains..."
  COUNTER=0

  for DOMAIN in localhost ${OWNCLOUD_IPADDRESS} $(echo ${OWNCLOUD_DOMAIN} | tr "," "\n")
  do
    occ config:system:set trusted_domains ${COUNTER} --value ${DOMAIN}
    let COUNTER+=1
  done
fi

echo "Enforcing cli url..."
occ config:system:set overwrite.cli.url --value http://localhost${OWNCLOUD_SUB_URL}

true
