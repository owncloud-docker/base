#!/usr/bin/env bash

SUBJ="/C=DE/ST=Bavaria/L=Nuremberg/O=ownCloud GmbH/CN=${OWNCLOUD_DOMAIN}"
KEY=${OWNCLOUD_VOLUME_CERTS}/ssl-cert.key
CERT=${OWNCLOUD_VOLUME_CERTS}/ssl-cert.crt

if [[ ! -f ${KEY} || ! -f ${CERT} ]]
then
  echo "Generating default cert..."
  openssl req -x509 -subj "${SUBJ}" -sha256 -nodes -days 1825 -newkey rsa:4096 -keyout ${KEY} -out ${CERT}
fi

true
