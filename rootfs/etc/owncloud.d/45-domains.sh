#!/usr/bin/env bash

echo "Configure domains..."
COUNTER=0

for DOMAIN in localhost ${OWNCLOUD_IPADDRESS} $(echo ${OWNCLOUD_DOMAIN} | tr "," "\n")
do
  occ config:system:set trusted_domains ${COUNTER} --value ${DOMAIN}
  let COUNTER+=1
done

occ config:system:set overwrite.cli.url --value http://localhost

true
