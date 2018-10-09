#!/usr/bin/env bash

echo "Writing php config..."
gomplate \
  -f /etc/templates/owncloud.ini \
  -o /etc/php/7.2/mods-available/owncloud.ini

true
