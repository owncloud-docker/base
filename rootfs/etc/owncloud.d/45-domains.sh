#!/usr/bin/env bash
set -e

echo "Configure domains..."
occ config:system:set trusted_domains 0 --value localhost
occ config:system:set trusted_domains 1 --value ${OWNCLOUD_IPADDRESS}
occ config:system:set trusted_domains 2 --value ${OWNCLOUD_DOMAIN}
occ config:system:set overwrite.cli.url --value http://${OWNCLOUD_DOMAIN}
