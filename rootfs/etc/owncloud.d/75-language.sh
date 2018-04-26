#!/usr/bin/env bash

echo "Setting default language..."
occ config:system:set default_language --value ${OWNCLOUD_DEFAULT_LANGUAGE}

true
