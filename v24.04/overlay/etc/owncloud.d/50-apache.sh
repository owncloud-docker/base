#!/usr/bin/env bash

echo "Updating htaccess config..."
occ maintenance:update:htaccess

echo "Writing apache config..."
gomplate \
  -f /etc/templates/apache.conf.tmpl \
  -o /etc/apache2/sites-enabled/default.conf

true
