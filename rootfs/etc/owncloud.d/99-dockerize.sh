#!/usr/bin/env bash

echo "Finishing ownCloud launch..."
DOCKERIZE="dockerize -stdout ${OWNCLOUD_VOLUME_FILES}/owncloud.log"

case ${OWNCLOUD_ACCESSLOG_DESTINATION} in
  "stdout")
    DOCKERIZE="${DOCKERIZE} -stdout ${OWNCLOUD_ACCESSLOG_LOCATION}"
    ;;
  "stderr")
    DOCKERIZE="${DOCKERIZE} -stderr ${OWNCLOUD_ACCESSLOG_LOCATION}"
    ;;
esac

case ${OWNCLOUD_ERRORLOG_DESTINATION} in
  "stdout")
    DOCKERIZE="${DOCKERIZE} -stdout ${OWNCLOUD_ERRORLOG_LOCATION}"
    ;;
  "stderr")
    DOCKERIZE="${DOCKERIZE} -stderr ${OWNCLOUD_ERRORLOG_LOCATION}"
    ;;
esac

exec ${DOCKERIZE}

true
