# ownCloud: Base

[![Build Status](https://img.shields.io/drone/build/owncloud-docker/base?logo=drone&server=https%3A%2F%2Fdrone.owncloud.com)](https://drone.owncloud.com/owncloud-docker/base)
[![Docker Hub](https://img.shields.io/docker/v/owncloud/base?logo=docker&label=dockerhub&sort=semver&logoColor=white)](https://hub.docker.com/r/owncloud/base)
[![GitHub contributors](https://img.shields.io/github/contributors/owncloud-docker/base)](https://github.com/owncloud-docker/base/graphs/contributors)
[![Source: GitHub](https://img.shields.io/badge/source-github-blue.svg?logo=github&logoColor=white)](https://github.com/owncloud-docker/base)
[![License: MIT](https://img.shields.io/github/license/owncloud-docker/base)](https://github.com/owncloud-docker/base/blob/master/LICENSE)

ownCloud Docker base image.

## Quick reference

- **Where to file issues:**\
  [owncloud-docker/base](https://github.com/owncloud-docker/base/issues)

- **Supported architectures:**\
  `amd64`, `arm32v7`, `arm64v8`

- **Inherited environments:**\
  [owncloud/ubuntu](https://github.com/owncloud-docker/ubuntu#environment-variables),
  [owncloud/php](https://github.com/owncloud-docker/php#environment-variables)

## Docker Tags and respective Dockerfile links

- [`latest`](https://github.com/owncloud-docker/base/blob/master/latest/Dockerfile.amd64) available as `owncloud/base:latest`
- [`20.04`](https://github.com/owncloud-docker/base/blob/master/v20.04/Dockerfile.amd64) available as `owncloud/base:20.04`

## Default volumes

- `/mnt/data`

## Exposed ports

- 8080

## Environment variables

```Shell
OWNCLOUD_ACCESSLOG_LOCATION /dev/stdout
OWNCLOUD_ACCOUNTS_ENABLE_MEDIAL_SEARCH
OWNCLOUD_ADMIN_PASSWORD admin
OWNCLOUD_ADMIN_USERNAME admin
OWNCLOUD_ALLOW_USER_TO_CHANGE_DISPLAY_NAME
OWNCLOUD_APPSTORE_URL ${OWNCLOUD_MARKETPLACE_URL}
OWNCLOUD_APPS_DEPRECATED
OWNCLOUD_APPS_DISABLE
OWNCLOUD_APPS_ENABLE ${OWNCLOUD_APPS_INSTALL}
OWNCLOUD_APPS_INSTALL
OWNCLOUD_APPS_UNINSTALL
OWNCLOUD_BACKGROUND_MODE cron
OWNCLOUD_BLACKLISTED_FILES
OWNCLOUD_CACHE_CHUNK_GC_TTL
OWNCLOUD_CACHE_PATH
OWNCLOUD_CHECK_FOR_WORKING_WELLKNOWN_SETUP
OWNCLOUD_CIPHER
OWNCLOUD_COMMENTS_MANAGER_FACTORY
OWNCLOUD_CORS_ALLOWED_DOMAINS
OWNCLOUD_CROND_ENABLED true
OWNCLOUD_CRON_LOG
OWNCLOUD_CSRF_DISABLED
OWNCLOUD_DAV_CHUNK_BASE_DIR
OWNCLOUD_DAV_ENABLE_ASYNC
OWNCLOUD_DB_FAIL true
OWNCLOUD_DB_HOST
OWNCLOUD_DB_NAME owncloud
OWNCLOUD_DB_PASSWORD
OWNCLOUD_DB_PREFIX oc_
OWNCLOUD_DB_TIMEOUT 180
OWNCLOUD_DB_TYPE sqlite
OWNCLOUD_DB_USERNAME
OWNCLOUD_DEBUG
OWNCLOUD_DEFAULT_APP
OWNCLOUD_DEFAULT_LANGUAGE en
OWNCLOUD_DOMAIN localhost
OWNCLOUD_ENABLED_PREVIEW_PROVIDERS
OWNCLOUD_ENABLE_AVATARS
OWNCLOUD_ENABLE_CERTIFICATE_MANAGEMENT
OWNCLOUD_ENABLE_PREVIEWS
OWNCLOUD_ENTRYPOINT_INITIALIZED true
OWNCLOUD_ERRORLOG_LOCATION /dev/stderr
OWNCLOUD_EXCLUDED_DIRECTORIES
OWNCLOUD_FILELOCKING_ENABLED ${OWNCLOUD_LOCKING_ENABLED:-true}
OWNCLOUD_FILELOCKING_TTL
OWNCLOUD_FILESYSTEM_CACHE_READONLY
OWNCLOUD_FILESYSTEM_CHECK_CHANGES
OWNCLOUD_FILES_EXTERNAL_ALLOW_NEW_LOCAL ${OWNCLOUD_ALLOW_EXTERNAL_LOCAL_STORAGE}
OWNCLOUD_FORWARDED_FOR_HEADERS
OWNCLOUD_HASHING_COST
OWNCLOUD_HAS_INTERNET_CONNECTION
OWNCLOUD_HTACCESS_REWRITE_BASE ${OWNCLOUD_SUB_URL}
OWNCLOUD_HTTP_COOKIE_SAMESITE
OWNCLOUD_INTEGRITY_EXCLUDED_FILES
OWNCLOUD_INTEGRITY_IGNORE_MISSING_APP_SIGNATURE
OWNCLOUD_KNOWLEDGEBASE_ENABLED
OWNCLOUD_LICENSE_KEY
OWNCLOUD_LICENSE_CLASS
OWNCLOUD_LOGIN_ALTERNATIVES
OWNCLOUD_LOG_DATE_FORMAT
OWNCLOUD_LOG_FILE ${OWNCLOUD_VOLUME_FILES}/owncloud.log
OWNCLOUD_LOG_LEVEL ${OWNCLOUD_LOGLEVEL:-2}
OWNCLOUD_LOG_ROTATE_SIZE ${OWNCLOUD_LOGSIZE}
OWNCLOUD_LOG_TIMEZONE
OWNCLOUD_LOST_PASSWORD_LINK
OWNCLOUD_MAIL_DOMAIN
OWNCLOUD_MAIL_FROM_ADDRESS
OWNCLOUD_MAIL_SMTP_AUTH
OWNCLOUD_MAIL_SMTP_AUTH_TYPE
OWNCLOUD_MAIL_SMTP_DEBUG
OWNCLOUD_MAIL_SMTP_HOST
OWNCLOUD_MAIL_SMTP_MODE
OWNCLOUD_MAIL_SMTP_NAME
OWNCLOUD_MAIL_SMTP_PASSWORD
OWNCLOUD_MAIL_SMTP_PORT
OWNCLOUD_MAIL_SMTP_SECURE
OWNCLOUD_MAIL_SMTP_TIMEOUT
OWNCLOUD_MAINTENANCE ${OWNCLOUD_MAINTENANCE_MODE}
OWNCLOUD_MARKETPLACE_CA
OWNCLOUD_MARKETPLACE_KEY ${OWNCLOUD_MARKETPLACE_APIKEY}
OWNCLOUD_MAX_EXECUTION_TIME 3600
OWNCLOUD_MAX_FILESIZE_ANIMATED_GIFS_PUBLIC_SHARING
OWNCLOUD_MAX_INPUT_TIME 3600
OWNCLOUD_MAX_UPLOAD 20G
OWNCLOUD_MEMCACHED_ENABLED false
OWNCLOUD_MEMCACHED_HOST memcached
OWNCLOUD_MEMCACHED_OPTIONS
OWNCLOUD_MEMCACHED_PORT 11211
OWNCLOUD_MEMCACHE_LOCAL ${OWNCLOUD_CACHING_CLASS:-\\OC\\Memcache\\APCu}
OWNCLOUD_MEMCACHE_LOCKING
OWNCLOUD_MINIMUM_SUPPORTED_DESKTOP_VERSION
OWNCLOUD_MOUNT_FILE
OWNCLOUD_MYSQL_UTF8MB4 ${OWNCLOUD_UTF8MB4_ENABLED}
OWNCLOUD_OBJECTSTORE_AUTOCREATE true
OWNCLOUD_OBJECTSTORE_BUCKET owncloud
OWNCLOUD_OBJECTSTORE_CLASS OCA\\ObjectStore\\S3
OWNCLOUD_OBJECTSTORE_ENABLED false
OWNCLOUD_OBJECTSTORE_ENDPOINT s3-${OWNCLOUD_OBJECTSTORE_REGION}.amazonaws.com
OWNCLOUD_OBJECTSTORE_KEY
OWNCLOUD_OBJECTSTORE_PATHSTYLE false
OWNCLOUD_OBJECTSTORE_REGION us-east-1
OWNCLOUD_OBJECTSTORE_SECRET
OWNCLOUD_OBJECTSTORE_VERSION 2006-03-01
OWNCLOUD_OPERATION_MODE
OWNCLOUD_OVERWRITE_CLI_URL ${OWNCLOUD_PROTOCOL}://${OWNCLOUD_DOMAIN}${OWNCLOUD_SUB_URL}
OWNCLOUD_OVERWRITE_COND_ADDR
OWNCLOUD_OVERWRITE_HOST
OWNCLOUD_OVERWRITE_PROTOCOL
OWNCLOUD_OVERWRITE_WEBROOT
OWNCLOUD_PART_FILE_IN_STORAGE
OWNCLOUD_POST_CRONJOB_PATH /etc/post_cronjob.d
OWNCLOUD_POST_INSTALL_PATH /etc/post_install.d
OWNCLOUD_POST_SERVER_PATH /etc/post_server.d
OWNCLOUD_PREVIEW_LIBREOFFICE_PATH
OWNCLOUD_PREVIEW_MAX_FILESIZE_IMAGE
OWNCLOUD_PREVIEW_MAX_SCALE_FACTOR
OWNCLOUD_PREVIEW_MAX_X
OWNCLOUD_PREVIEW_MAX_Y
OWNCLOUD_PREVIEW_OFFICE_CL_PARAMETERS
OWNCLOUD_PRE_CRONJOB_PATH /etc/pre_cronjob.d
OWNCLOUD_PRE_INSTALL_PATH /etc/pre_install.d
OWNCLOUD_PRE_SERVER_PATH /etc/pre_server.d
OWNCLOUD_PROTOCOL http
OWNCLOUD_PROXY
OWNCLOUD_PROXY_USERPWD
OWNCLOUD_QUOTA_INCLUDE_EXTERNAL_STORAGE
OWNCLOUD_REDIS_DB
OWNCLOUD_REDIS_ENABLED false
OWNCLOUD_REDIS_FAILOVER_MODE
OWNCLOUD_REDIS_HOST redis
OWNCLOUD_REDIS_PASSWORD
OWNCLOUD_REDIS_PORT 6379
OWNCLOUD_REDIS_READ_TIMEOUT
OWNCLOUD_REDIS_SEEDS
OWNCLOUD_REDIS_SESSION_LOCKING_ENABLED 1
OWNCLOUD_REDIS_SESSION_LOCK_RETRIES 750
OWNCLOUD_REDIS_SESSION_LOCK_WAIT_TIME 20000
OWNCLOUD_REDIS_TIMEOUT
OWNCLOUD_REMEMBER_LOGIN_COOKIE_LIFETIME
OWNCLOUD_SECRET
OWNCLOUD_SESSION_KEEPALIVE
OWNCLOUD_SESSION_LIFETIME
OWNCLOUD_SESSION_SAVE_HANDLER files
OWNCLOUD_SESSION_SAVE_PATH ${OWNCLOUD_VOLUME_SESSIONS}
OWNCLOUD_SHARE_FOLDER
OWNCLOUD_SHARING_FEDERATION_ALLOW_HTTP_FALLBACK
OWNCLOUD_SHARING_MANAGER_FACTORY
OWNCLOUD_SHOW_SERVER_HOSTNAME
OWNCLOUD_SINGLEUSER
OWNCLOUD_SKELETON_DIRECTORY
OWNCLOUD_SKIP_CHMOD false
OWNCLOUD_SKIP_CHOWN false
OWNCLOUD_SMB_LOGGING_ENABLE
OWNCLOUD_SQLITE_JOURNAL_MODE
OWNCLOUD_SUB_URL /
OWNCLOUD_SYSTEMTAGS_MANAGER_FACTORY
OWNCLOUD_TEMP_DIRECTORY
OWNCLOUD_TOKEN_AUTH_ENFORCED
OWNCLOUD_TRASHBIN_PURGE_LIMIT
OWNCLOUD_TRASHBIN_RETENTION_OBLIGATION
OWNCLOUD_TRUSTED_PROXIES
OWNCLOUD_UPDATER_SERVER_URL
OWNCLOUD_UPDATE_CHECKER
OWNCLOUD_UPGRADE_AUTOMATIC_APP_UPDATES
OWNCLOUD_USER_SEARCH_MIN_LENGTH
OWNCLOUD_VERSIONS_RETENTION_OBLIGATION
OWNCLOUD_VERSION_HIDE
OWNCLOUD_VOLUME_APPS ${OWNCLOUD_VOLUME_ROOT}/apps
OWNCLOUD_VOLUME_CONFIG ${OWNCLOUD_VOLUME_ROOT}/config
OWNCLOUD_VOLUME_FILES ${OWNCLOUD_VOLUME_ROOT}/files
OWNCLOUD_VOLUME_ROOT /mnt/data
OWNCLOUD_VOLUME_SESSIONS ${OWNCLOUD_VOLUME_ROOT}/sessions
```

## License

This project is licensed under the MIT License - see the [LICENSE](https://github.com/owncloud-docker/base/blob/master/LICENSE) file for details.

## Copyright

```Text
Copyright (c) 2021 ownCloud GmbH
```
