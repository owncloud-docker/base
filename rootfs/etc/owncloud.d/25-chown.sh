#!/usr/bin/env bash

echo "Fixing base..."
find /var/www/owncloud \( \! -user www-data -o \! -group www-data \) -print0 | xargs -0 chown www-data:www-data

echo "Fixing data..."
find /mnt/data \( \! -user www-data -o \! -group www-data \) -print0 | xargs -0 chown www-data:www-data
