#!/usr/bin/env bash

echo "Enforcing cli url..."
occ config:system:set overwrite.cli.url --value http://localhost${OWNCLOUD_SUB_URL}

true
