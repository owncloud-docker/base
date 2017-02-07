#!/usr/bin/env bash

if /usr/local/bin/owncloud-installed
then
  echo "Upgrading database..."
  /usr/local/bin/owncloud-migrate
else
  echo "Installing database..."
  /usr/local/bin/owncloud-install
fi

true
