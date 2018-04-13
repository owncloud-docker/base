#!/usr/bin/env bash

echo "Enforcing cli url..."
occ config:system:set overwrite.cli.url --value http://${OWNCLOUD_DOMAIN}${OWNCLOUD_SUB_URL}

echo "Disabling update checks..."
occ config:system:set updatechecker --value false

true
