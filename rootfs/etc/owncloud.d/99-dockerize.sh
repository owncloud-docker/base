#!/usr/bin/env bash

echo "Finishing launch..."
dockerize -stdout /mnt/data/files/owncloud.log -stdout /var/log/apache2/access.log -stderr /var/log/apache2/error.log
