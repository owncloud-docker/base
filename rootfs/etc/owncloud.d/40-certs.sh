#!/usr/bin/env bash

if [[ ! -f ${KEY} || ! -f ${CERT} ]]
then
  SUBJ="/C=DE/ST=Bavaria/L=Nuremberg/O=ownCloud GmbH/CN=localhost"
  KEY=${OWNCLOUD_VOLUME_CERTS}/ssl-cert.key
  CERT=${OWNCLOUD_VOLUME_CERTS}/ssl-cert.crt

  echo "Generating default cert..."
  openssl req -x509 -subj "${SUBJ}" -sha256 -nodes -days 1825 -newkey rsa:4096 -keyout ${KEY} -out ${CERT}
fi

true
