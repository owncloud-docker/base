#!/usr/bin/env bash

echo "Writing objectstore config..."
gomplate \
  -f /etc/templates/objectstore.php.tmpl \
  -o "${OWNCLOUD_VOLUME_CONFIG}/objectstore.config.php"

echo "Writing php config..."
gomplate \
  -f /etc/templates/owncloud.ini.tmpl \
  -o /etc/php/7.4/mods-available/owncloud.ini

true
