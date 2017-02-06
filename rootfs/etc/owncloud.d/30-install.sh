#!/usr/bin/env bash
set -e

if /usr/local/bin/owncloud-installed
then
  echo "Upgrading database..."
  /usr/local/bin/owncloud-migrate
else
  echo "Installing database..."
  /usr/local/bin/owncloud-install
fi
