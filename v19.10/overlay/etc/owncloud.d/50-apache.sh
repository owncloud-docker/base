#!/usr/bin/env bash

if dpkg --compare-versions $(occ config:system:get version | tail -1) "ge" "9.0.3"
then
  echo "Updating htaccess config..."
  occ maintenance:update:htaccess
fi

echo "Writing apache config..."
gomplate \
  -f /etc/templates/apache.conf \
  -o /etc/apache2/sites-enabled/default.conf

true
