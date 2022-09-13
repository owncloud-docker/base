#!/usr/bin/env bash

if [[ -d "${OWNCLOUD_PRE_INSTALL_PATH}" ]]; then
  for FILE in $(find "${OWNCLOUD_PRE_INSTALL_PATH}" -iname "*.sh" | sort); do
    # shellcheck disable=SC1090,SC2086
    source ${FILE}
  done
fi

if /usr/bin/owncloud installed; then
  for VAL in $(echo "${OWNCLOUD_APPS_DEPRECATED}" | tr "," " "); do
    echo "Disabling deprecated ${VAL}..."
    /usr/bin/occ app:disable "${VAL}" || true
  done

  echo "Upgrading server database..."
  /usr/bin/owncloud migrate
else
  echo "Installing server database..."
  /usr/bin/owncloud install
fi

if [[ -d "${OWNCLOUD_POST_INSTALL_PATH}" ]]; then
  for FILE in $(find "${OWNCLOUD_POST_INSTALL_PATH}" -iname "*.sh" | sort); do
    # shellcheck disable=SC1090,SC2086
    source ${FILE}
  done
fi

true
