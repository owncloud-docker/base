#!/usr/bin/env bash

echo "Finishing ownCloud launch..."
dockerize -stdout ${OWNCLOUD_VOLUME_FILES}/owncloud.log -stdout /var/log/apache2/access.log -stderr /var/log/apache2/error.log

true
