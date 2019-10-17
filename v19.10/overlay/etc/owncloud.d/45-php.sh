#!/usr/bin/env bash

echo "Writing objectstore config..."
gomplate \
  -f /etc/templates/objectstore.php \
  -o ${OWNCLOUD_VOLUME_CONFIG}/objectstore.config.php

echo "Writing php config..."
gomplate \
  -f /etc/templates/owncloud.ini \
  -o /etc/php/7.3/mods-available/owncloud.ini

true
