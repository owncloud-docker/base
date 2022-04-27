# ownCloud: Base

[![Build Status]([documentation](https://img.shields.io/drone/build/owncloud-docker/base?logo=drone&server=[documentation](https%3A%2F%2Fdrone.owncloud.com)]([documentation](https://drone.owncloud.com/owncloud-docker/base))
[![Docker Hub]([documentation](https://img.shields.io/docker/v/owncloud/base?logo=docker&label=dockerhub&sort=semver&logoColor=white)]([documentation](https://hub.docker.com/r/owncloud/base))
[![GitHub contributors]([documentation](https://img.shields.io/github/contributors/owncloud-docker/base)]([documentation](https://github.com/owncloud-docker/base/graphs/contributors))
[![Source: GitHub]([documentation](https://img.shields.io/badge/source-github-blue.svg?logo=github&logoColor=white)]([documentation](https://github.com/owncloud-docker/base))
[![License: MIT]([documentation](https://img.shields.io/github/license/owncloud-docker/base)]([documentation](https://github.com/owncloud-docker/base/blob/master/LICENSE))

ownCloud Docker base image.

## Quick reference

- **Where to file issues:**\
  [owncloud-docker/base]([documentation](https://github.com/owncloud-docker/base/issues))

- **Supported architectures:**\
  `amd64`, `arm32v7`, `arm64v8`

- **Inherited environments:**\
  [owncloud/ubuntu]([documentation](https://github.com/owncloud-docker/ubuntu#environment-variables)),
  [owncloud/php]([documentation](https://github.com/owncloud-docker/php#environment-variables))

## Docker Tags and respective Dockerfile links

- [`latest`]([documentation](https://github.com/owncloud-docker/base/blob/master/latest/Dockerfile.amd64) available as `owncloud/base:latest)`
- [`20.04`]([documentation](https://github.com/owncloud-docker/base/blob/master/v20.04/Dockerfile.amd64) available as `owncloud/base:20.04)`

## Default volumes

- `/mnt/data`

## Exposed ports

- 8080

## Environment variables

* `OWNCLOUD_ACCESSLOG_LOCATION=/dev/stdout`<br>
  Location of the access log
* `OWNCLOUD_ACCOUNTS_ENABLE_MEDIAL_SEARCH=`<br>
  Allow medial search on user account properties (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#allow-medial-search-on-user-account-properties))
* `OWNCLOUD_ADMIN_PASSWORD=admin`<br>
  ownCloud admin password
* `OWNCLOUD_ADMIN_USERNAME=admin`<br>
  ownCloud admin username
* `OWNCLOUD_ALLOW_USER_TO_CHANGE_DISPLAY_NAME=`<br>
  Allow or disallow users to change their display names (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#allow-or-disallow-users-to-change-their-display-names))
* `OWNCLOUD_APPSTORE_URL=${OWNCLOUD_MARKETPLACE_URL}`<br>
   **appstoreurl not found**
* `OWNCLOUD_APPS_DEPRECATED=`<br>
  **not found in overwrite**
* `OWNCLOUD_APPS_DISABLE=`<br>
  **not found in overwrite**
* `OWNCLOUD_APPS_ENABLE=${OWNCLOUD_APPS_INSTALL}`<br>
  **not found in overwrite**  
* `OWNCLOUD_APPS_INSTALL=`<br>
  **not found in overwrite**
* `OWNCLOUD_APPS_INSTALL_MAJOR=false`<br>
  **not found in overwrite**
* `OWNCLOUD_APPS_UNINSTALL=`<br>
  **not found in overwrite**
* `OWNCLOUD_BACKGROUND_MODE=cron`<br>
  **not found in overwrite**
* `OWNCLOUD_BLACKLISTED_FILES=`<br>
  Define blacklisted files (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#define-blacklisted-files))
* `OWNCLOUD_CACHE_CHUNK_GC_TTL=`<br>
  Define the TTL for garbage collection (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#define-the-ttl-for-garbage-collection))
* `OWNCLOUD_CACHE_PATH=`<br>
  Define the location of the cache folder (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#define-the-location-of-the-cache-folder))
* `OWNCLOUD_CHECK_FOR_WORKING_WELLKNOWN_SETUP=`<br>
  Check for a .well-known setup (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#check-for-a-well-known-setup))
* `OWNCLOUD_CIPHER=`<br>
  Define the default cipher for encrypting files (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#define-the-default-cipher-for-encrypting-files))
* `OWNCLOUD_COMMENTS_MANAGER_FACTORY=`<br>
  Define an alternative Comments Manager (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#define-an-alternative-comments-manager))
* `OWNCLOUD_CORS_ALLOWED_DOMAINS=`<br>
  Define global list of CORS domains (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#define-global-list-of-cors-domains))
* `OWNCLOUD_CROND_ENABLED=true`<br>
  **not found in overwrite**
* `OWNCLOUD_CROND_SCHEDULE="*/1 * * * *"`<br>
  **not found in overwrite**
* `OWNCLOUD_CRON_LOG=`<br>
  Define logging if Cron ran successfully(see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#define-logging-if-cron-ran-successfully))
* `OWNCLOUD_CSRF_DISABLED=`<br>
  Enable or disable ownCloud’s built-in CSRF protection mechanism (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#enable-or-disable-ownclouds-built-in-csrf-protection-mechanism))
* `OWNCLOUD_DAV_CHUNK_BASE_DIR=`<br>
  Define the DAV chunk base directory (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#define-the-dav-chunk-base-directory))
* `OWNCLOUD_DAV_ENABLE_ASYNC=`<br>
  Enable or disable async DAV extensions (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#enable-or-disable-async-dav-extensions))
* `OWNCLOUD_DB_FAIL=true`<br>
  **not found in overwrite**
* `OWNCLOUD_DB_HOST=`<br>
  Define the database server host name (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#define-the-database-server-host-name))
* `OWNCLOUD_DB_NAME=owncloud`<br>
  Define the ownCloud database name (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#define-the-owncloud-database-name))
* `OWNCLOUD_DB_PASSWORD=`<br>
  Define the password for the database user (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#define-the-password-for-the-database-user))
* `OWNCLOUD_DB_PREFIX=oc_`<br>
  Define the prefix for the ownCloud tables in the database (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#define-the-prefix-for-the-owncloud-tables-in-the-database))
* `OWNCLOUD_DB_TIMEOUT=180`<br>
  **not found in overwrite**
* `OWNCLOUD_DB_TYPE=sqlite`<br>
  Identify the database used with this installation (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#identify-the-database-used-with-this-installation))
* `OWNCLOUD_DB_USERNAME=`<br>
  Define the ownCloud database user (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#define-the-owncloud-database-user))
* `OWNCLOUD_DEBUG=`<br>
  Place this ownCloud instance into debugging mode (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#place-this-owncloud-instance-into-debugging-mode))
* `OWNCLOUD_DEFAULT_APP=`<br>
  Define the default app to open on user login (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#define-the-default-app-to-open-on-user-login))
* `OWNCLOUD_DEFAULT_LANGUAGE=en`<br>
  Define the default language of your ownCloud instance (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#define-the-default-language-of-your-owncloud-instance))
* `OWNCLOUD_DOMAIN=localhost`<br>
  **not found in overwrite**
* `OWNCLOUD_ENABLED_PREVIEW_PROVIDERS=`<br>
  Define preview providers (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#define-preview-providers))
* `OWNCLOUD_ENABLE_AVATARS=`<br>
  Enable or disable avatars or user profile photos (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#enable-or-disable-avatars-or-user-profile-photos))
* `OWNCLOUD_ENABLE_CERTIFICATE_MANAGEMENT=`<br>
  Allow the configuration of system-wide trusted certificates (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#allow-the-configuration-of-system-wide-trusted-certificates))
* `OWNCLOUD_ENABLE_PREVIEWS=`<br>
  Enable preview generation (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#enable-preview-generation))
* `OWNCLOUD_ENABLE_OIDC_REWRITE_URL=false`<br>
  **not found in overwrite**
* `OWNCLOUD_ENTRYPOINT_INITIALIZED=true`<br>
  **not found in overwrite**
* `OWNCLOUD_ERRORLOG_LOCATION=/dev/stderr`<br>
  **not found in overwrite**
* `OWNCLOUD_EXCLUDED_DIRECTORIES=`<br>
  Define excluded directories (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#define-excluded-directories))
* `OWNCLOUD_FILELOCKING_ENABLED=${OWNCLOUD_LOCKING_ENABLED:-true}`<br>
  Enable transactional file locking (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#enable-transactional-file-locking))
* `OWNCLOUD_FILELOCKING_TTL=`<br>
  Define the TTL for file locking (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#define-the-ttl-for-file-locking))
* `OWNCLOUD_FILESYSTEM_CACHE_READONLY=`<br>
  Prevent cache changes due to changes in the filesystem (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#prevent-cache-changes-due-to-changes-in-the-filesystem))
* `OWNCLOUD_FILESYSTEM_CHECK_CHANGES=`<br>
  Define how often filesystem changes are detected (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#define-how-often-filesystem-changes-are-detected))
* `OWNCLOUD_FILES_EXTERNAL_ALLOW_NEW_LOCAL=${OWNCLOUD_ALLOW_EXTERNAL_LOCAL_STORAGE}`<br>
  Enable or disable the files_external local mount option (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#enable-or-disable-the-files_external-local-mount-option))
* `OWNCLOUD_FORWARDED_FOR_HEADERS=`<br>
  Define forwarded_for_headers (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#define-forwarded_for_headers))
* `OWNCLOUD_HASHING_COST=`<br>
  Define the hashing cost (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#define-the-hashing-cost))
* `OWNCLOUD_HAS_INTERNET_CONNECTION=`<br>
  Check for an internet connection (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#check-for-an-internet-connection))
* `OWNCLOUD_HTACCESS_REWRITE_BASE=${OWNCLOUD_SUB_URL}`<br>
  Define clean URLs without /index.php (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#define-clean-urls-without-index-php))
* `OWNCLOUD_HTTP_COOKIE_SAMESITE=`<br>
  Define how to relax same site cookie settings (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#define-how-to-relax-same-site-cookie-settings))
* `OWNCLOUD_INTEGRITY_EXCLUDED_FILES=`<br>
  Define files that are excluded from integrity checking (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#define-files-that-are-excluded-from-integrity-checking))
* `OWNCLOUD_INTEGRITY_IGNORE_MISSING_APP_SIGNATURE=`<br>
  Define apps or themes that are excluded from integrity checking (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#define-apps-or-themes-that-are-excluded-from-integrity-checking))
* `OWNCLOUD_KNOWLEDGEBASE_ENABLED=`<br>
  **knowledgebaseenabled not found**
* `OWNCLOUD_LICENSE_KEY=`<br>
  **license-key not found**
* `OWNCLOUD_LICENSE_CLASS=`<br>
  **license-class not found**
* `OWNCLOUD_LOGIN_ALTERNATIVES=`<br>
  Define additional login buttons on the logon screen (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#define-additional-login-buttons-on-the-logon-screen))
* `OWNCLOUD_LOG_DATE_FORMAT=`<br>
  Define the log date format (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#define-the-log-date-format))
* `OWNCLOUD_LOG_FILE=${OWNCLOUD_VOLUME_FILES}/owncloud.log`<br>
  Define the log path (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#define-the-log-path))
* `OWNCLOUD_LOG_LEVEL=`<br>
  Define the log level (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#define-the-log-level))
* `OWNCLOUD_LOG_ROTATE_SIZE=${OWNCLOUD_LOGSIZE}`<br>
  Define the maximum log rotation file size (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#define-the-maximum-log-rotation-file-size))
* `OWNCLOUD_LOG_TIMEZONE=`<br>
  Define the log timezone (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#define-the-log-timezone))
* `OWNCLOUD_LOST_PASSWORD_LINK=`<br>
  Define a custom link to reset passwords (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#define-a-custom-link-to-reset-passwords))
* `OWNCLOUD_MAIL_DOMAIN=`<br>
  Define the email RETURN address (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#define-the-email-return-address))
* `OWNCLOUD_MAIL_FROM_ADDRESS=`<br>
  Define the email FROM address (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#define-the-email-from-address))
* `OWNCLOUD_MAIL_SMTP_AUTH=`<br>
  Define the SMTP authentication (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#define-the-smtp-authentication))
* `OWNCLOUD_MAIL_SMTP_AUTH_TYPE=`<br>
  Define the SMTP authentication type (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#define-the-smtp-authentication-type))
* `OWNCLOUD_MAIL_SMTP_DEBUG=`<br>
  Enable or disable SMTP class debugging (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#enable-or-disable-smtp-class-debugging))
* `OWNCLOUD_MAIL_SMTP_HOST=`<br>
  Define the IP address of your mail server host (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#define-the-ip-address-of-your-mail-server-host))
* `OWNCLOUD_MAIL_SMTP_MODE=`<br>
  Define the mode for sending an email (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#define-the-mode-for-sending-an-email))
* `OWNCLOUD_MAIL_SMTP_NAME=`<br>
  Define the SMTP authentication username (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#define-the-smtp-authentication-username))
* `OWNCLOUD_MAIL_SMTP_PASSWORD=`<br>
  Define the SMTP authentication password (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#define-the-smtp-authentication-password))
* `OWNCLOUD_MAIL_SMTP_PORT=`<br>
  Define the port for sending an email (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#define-the-port-for-sending-an-email))
* `OWNCLOUD_MAIL_SMTP_SECURE=`<br>
  Define the SMTP security style (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#define-the-smtp-security-style))
* `OWNCLOUD_MAIL_SMTP_TIMEOUT=`<br>
  Define the SMTP server timeout (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#define-the-smtp-server-timeout))
* `OWNCLOUD_MAINTENANCE=${OWNCLOUD_MAINTENANCE_MODE}`<br>
  Enable maintenance mode to disable ownCloud (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#enable-maintenance-mode-to-disable-owncloud))
* `OWNCLOUD_MARKETPLACE_CA=`<br>
  **marketplace.ca not found**
* `OWNCLOUD_MARKETPLACE_KEY=${OWNCLOUD_MARKETPLACE_APIKEY}`<br>
  **marketplace.key not found**
* `OWNCLOUD_MAX_EXECUTION_TIME=3600`<br>
  **not found in overwrite**
* `OWNCLOUD_MAX_FILESIZE_ANIMATED_GIFS_PUBLIC_SHARING=`<br>
  Define the maximum filesize for animated GIF´s (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#define-the-maximum-filesize-for-animated-gifs))
* `OWNCLOUD_MAX_INPUT_TIME=3600`<br>
  **not found in overwrites**
* `OWNCLOUD_MAX_UPLOAD=20G`<br>
  **not found in overwrites**
* `OWNCLOUD_MEMCACHED_ENABLED=false`<br>
  Enabled memory caching via memcached (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#memory-caching-backend-for-distributed-data))
* `OWNCLOUD_MEMCACHED_HOST=memcached`<br>
  Defines the hosts for memcached (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#define-server-details-for-memcached-servers-to-use-for-memory-caching))
* `OWNCLOUD_MEMCACHED_OPTIONS=`<br>
  Define connection options for memcached (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#define-connection-options-for-memcached))
* `OWNCLOUD_MEMCACHED_PORT=11211`<br>
  Defines the ports for memcached (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#define-server-details-for-memcached-servers-to-use-for-memory-caching))
* `OWNCLOUD_MEMCACHE_LOCAL=${OWNCLOUD_CACHING_CLASS:-\\OC\\Memcache\\APCu}`<br>
  Memory caching backend for locally stored data (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#memory-caching-backend-for-locally-stored-data))
* `OWNCLOUD_MEMCACHE_LOCKING=`<br>
  Define the memory caching backend for file locking (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#define-the-memory-caching-backend-for-file-locking))
* `OWNCLOUD_MINIMUM_SUPPORTED_DESKTOP_VERSION=`<br>
  Define the minimum supported ownCloud desktop client version (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#define-the-minimum-supported-owncloud-desktop-client-version))
* `OWNCLOUD_MOUNT_FILE=`<br>
  **mount_file not found**
* `OWNCLOUD_MYSQL_UTF8MB4=${OWNCLOUD_UTF8MB4_ENABLED}`<br>
  Define MySQL 3/4 byte character handling (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#define-mysql-34-byte-character-handling))
* `OWNCLOUD_OBJECTSTORE_AUTOCREATE=true`<br>
  **not found in overwrite**
* `OWNCLOUD_OBJECTSTORE_BUCKET=owncloud`<br>
  **not found in overwrite**
* `OWNCLOUD_OBJECTSTORE_CLASS=OCA\\ObjectStore\\S3`<br>
  **not found in overwrite**
* `OWNCLOUD_OBJECTSTORE_ENABLED=false`<br>
  **not found in overwrite**
* `OWNCLOUD_OBJECTSTORE_ENDPOINT=s3-${OWNCLOUD_OBJECTSTORE_REGION}.amazonaws.com`<br>
  **not found in overwrite**
* `OWNCLOUD_OBJECTSTORE_KEY=`<br>
  **not found in overwrite**
* `OWNCLOUD_OBJECTSTORE_PATHSTYLE=false`<br>
  **not found in overwrite**
* `OWNCLOUD_OBJECTSTORE_REGION=us-east-1`<br>
  **not found in overwrite**
* `OWNCLOUD_OBJECTSTORE_SECRET=`<br>
  **not found in overwrite**
* `OWNCLOUD_OBJECTSTORE_VERSION=2006-03-01`<br>
  **not found in overwrite**
* `OWNCLOUD_OPERATION_MODE=`<br>
  Define ownCloud operation modes (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#define-owncloud-operation-modes))
* `OWNCLOUD_OVERWRITE_CLI_URL=\${OWNCLOUD_PROTOCOL}://\${OWNCLOUD_DOMAIN}${OWNCLOUD_SUB_URL}`<br>
  Override cli URL (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#override-cli-url))
* `OWNCLOUD_OVERWRITE_COND_ADDR=`<br>
  Override condition for the remote IP address with a regular expression (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#override-condition-for-the-remote-ip-address-with-a-regular-expression))
* `OWNCLOUD_OVERWRITE_HOST=`<br>
  Override automatic proxy detection (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#override-automatic-proxy-detection))
* `OWNCLOUD_OVERWRITE_PROTOCOL=`<br>
  Override protocol (http/[documentation](https) usage (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#override-protocol-http[documentation](https-usage))
* `OWNCLOUD_OVERWRITE_WEBROOT=`<br>
  Override ownClouds webroot (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#override-ownclouds-webroot))
* `OWNCLOUD_PART_FILE_IN_STORAGE=`<br>
  Define where part files are located (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#define-where-part-files-are-located))
* `OWNCLOUD_POST_CRONJOB_PATH=/etc/post_cronjob.d`<br>
  **not found in overwrite**
* `OWNCLOUD_POST_INSTALL_PATH=/etc/post_install.d`<br>
  **not found in overwrite**
* `OWNCLOUD_POST_SERVER_PATH=/etc/post_server.d`<br>
  **not found in overwrite**
* `OWNCLOUD_PREVIEW_LIBREOFFICE_PATH=`<br>
  Define the custom path for the LibreOffice / OpenOffice binary (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#define-the-custom-path-for-the-libreoffice-openoffice-binary))
* `OWNCLOUD_PREVIEW_MAX_FILESIZE_IMAGE=`<br>
  Define the maximum preview filesize limit (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#define-the-maximum-preview-filesize-limit))
* `OWNCLOUD_PREVIEW_MAX_SCALE_FACTOR=`<br>
  Define the maximum preview scale factor (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#define-the-maximum-preview-scale-factor))
* `OWNCLOUD_PREVIEW_MAX_X=`<br>
  Define the maximum x-axis width for previews (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#define-the-maximum-x-axis-width-for-previews))
* `OWNCLOUD_PREVIEW_MAX_Y=`<br>
  Define the maximum y-axis width for previews (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#define-the-maximum-y-axis-width-for-previews))
* `OWNCLOUD_PREVIEW_OFFICE_CL_PARAMETERS=`<br>
  Define additional arguments for LibreOffice / OpenOffice (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#define-additional-arguments-for-libreoffice-openoffice))
* `OWNCLOUD_PRE_CRONJOB_PATH=/etc/pre_cronjob.d`<br>
  **not found in overwrite**
* `OWNCLOUD_PRE_INSTALL_PATH=/etc/pre_install.d`<br>
  **not found in overwrite**
* `OWNCLOUD_PRE_SERVER_PATH=/etc/pre_server.d`<br>
  **not found in overwrite**
* `OWNCLOUD_PROTOCOL=http`<br>
  **not found in overwrite**
* `OWNCLOUD_PROXY=`<br>
  Define the URL of your proxy server (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#define-the-url-of-your-proxy-server))
* `OWNCLOUD_PROXY_USERPWD=`<br>
  Define proxy authentication (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#define-proxy-authentication))
* `OWNCLOUD_QUOTA_INCLUDE_EXTERNAL_STORAGE=`<br>
  Define whether to include external storage in quota calculation (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#define-whether-to-include-external-storage-in-quota-calculation))
* `OWNCLOUD_REDIS_DB=`<br>
  Define Redis connection details sets the dbindex (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#define-redis-connection-details))
* `OWNCLOUD_REDIS_ENABLED=false`<br>
  Sets memcache to Redis (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#memory-caching-backend-for-distributed-data))
* `OWNCLOUD_REDIS_FAILOVER_MODE=`<br>
  Sets redis failover mode (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#define-redis-cluster-connection-details))
* `OWNCLOUD_REDIS_HOST=redis`<br>
  Sets redis host (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#define-redis-connection-details))
* `OWNCLOUD_REDIS_PASSWORD=`<br>
  Set redis password (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#define-redis-connection-details))
* `OWNCLOUD_REDIS_PORT=6379`<br>
  Set redis port (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#define-redis-connection-details))
* `OWNCLOUD_REDIS_READ_TIMEOUT=`<br>
  Sets redis read timeout (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#define-redis-cluster-connection-details))
* `OWNCLOUD_REDIS_SEEDS=`<br>
  Sets the redis cluster servers (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#define-redis-cluster-connection-details))
* `OWNCLOUD_REDIS_SESSION_LOCKING_ENABLED=1`<br>
  **not found in overwrite**
* `OWNCLOUD_REDIS_SESSION_LOCK_RETRIES=750`<br>
  **not found in overwrite**
* `OWNCLOUD_REDIS_SESSION_LOCK_WAIT_TIME=20000`<br>
  **not found in overwrite**
* `OWNCLOUD_REDIS_TIMEOUT=`<br>
  Sets the redis timeout value (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#define-redis-cluster-connection-details))
* `OWNCLOUD_REMEMBER_LOGIN_COOKIE_LIFETIME=`<br>
  Define the lifetime of the remember-login cookie (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#define-the-lifetime-of-the-remember-login-cookie))
* `OWNCLOUD_SECRET=`<br>
  Define ownClouds internal secret (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#define-ownclouds-internal-secret))
* `OWNCLOUD_SESSION_KEEPALIVE=`<br>
  Enable or disable session keep-alive when a user is logged in to the Web UI (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#enable-or-disable-session-keep-alive-when-a-user-is-logged-in-to-the-web-ui))
* `OWNCLOUD_SESSION_LIFETIME=`<br>
  Define the lifetime of a session after inactivity (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#define-the-lifetime-of-a-session-after-inactivity))
* `OWNCLOUD_SESSION_SAVE_HANDLER=files`<br>
  **not found in overwrite**
* `OWNCLOUD_SESSION_SAVE_PATH=${OWNCLOUD_VOLUME_SESSIONS}`<br>
  **not found in overwrite**
* `OWNCLOUD_SHARE_FOLDER=`<br>
  Define a default folder for shared files and folders other than root (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#define-a-default-folder-for-shared-files-and-folders-other-than-root))
* `OWNCLOUD_SHARING_FEDERATION_ALLOW_HTTP_FALLBACK=`<br>
  Allow schema fallback for federated sharing servers (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#allow-schema-fallback-for-federated-sharing-servers))
* `OWNCLOUD_SHARING_MANAGER_FACTORY=`<br>
  Define an alternative Share Provider (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#define-an-alternative-share-provider))
* `OWNCLOUD_SHOW_SERVER_HOSTNAME=`<br>
  **not found in overwrite**
* `OWNCLOUD_SINGLEUSER=`<br>
  Enable or disable single user mode (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#enable-or-disable-single-user-mode))
* `OWNCLOUD_SKELETON_DIRECTORY=`<br>
  Define the directory where the skeleton files are located (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#define-the-directory-where-the-skeleton-files-are-located))
* `OWNCLOUD_SKIP_CHMOD=false`<br>
  **not found in overwrite**
* `OWNCLOUD_SKIP_CHOWN=false`<br>
  **not found in overwrite**
* `OWNCLOUD_SMB_LOGGING_ENABLE=`<br>
  Enable or disable debug logging for SMB access (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#enable-or-disable-debug-logging-for-smb-access))
* `OWNCLOUD_SQLITE_JOURNAL_MODE=`<br>
  Define sqlite3 journal mode (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#define-sqlite3-journal-mode))
* `OWNCLOUD_SUB_URL=/`<br>
  **not found in overwrite**
* `OWNCLOUD_SYSTEMTAGS_MANAGER_FACTORY=`<br>
  Define an alternative System Tags Manager (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#define-an-alternative-system-tags-manager))
* `OWNCLOUD_TEMP_DIRECTORY=`<br>
  Define the location for temporary files (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#define-the-location-for-temporary-files))
* `OWNCLOUD_TOKEN_AUTH_ENFORCED=`<br>
  Enforce token only authentication for apps and clients connecting to ownCloud (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#enforce-token-only-authentication-for-apps-and-clients-connecting-to-owncloud))
* `OWNCLOUD_TRASHBIN_PURGE_LIMIT=`<br>
  Define the trashbin purge limit (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#define-the-trashbin-purge-limit))
* `OWNCLOUD_TRASHBIN_RETENTION_OBLIGATION=`<br>
  Define the trashbin retention obligation (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#define-the-trashbin-retention-obligation))
* `OWNCLOUD_TRUSTED_PROXIES=`<br>
  Define list of trusted proxy servers (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#define-list-of-trusted-proxy-servers))
* `OWNCLOUD_UPDATER_SERVER_URL=`<br>
  Define the updatechecker URL (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#define-the-updatechecker-url))
* `OWNCLOUD_UPDATE_CHECKER=`<br>
  Enable or disable updatechecker (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#enable-or-disable-updatechecker))
* `OWNCLOUD_UPGRADE_AUTOMATIC_APP_UPDATES=`<br>
  Define whether or not to enable automatic update of market apps (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#define-whether-or-not-to-enable-automatic-update-of-market-apps))
* `OWNCLOUD_USER_SEARCH_MIN_LENGTH=`<br>
  Define minimum characters entered before a search returns results (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#define-minimum-characters-entered-before-a-search-returns-results))
* `OWNCLOUD_VERSIONS_RETENTION_OBLIGATION=`<br>
  Define the files versions retention obligation (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#define-the-files-versions-retention-obligation))
* `OWNCLOUD_VERSION_HIDE=`<br>
  Show or hide the ownCloud version information in status.php (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#show-or-hide-the-owncloud-version-information-in-status-php))
* `OWNCLOUD_VOLUME_APPS=${OWNCLOUD_VOLUME_ROOT}/apps`<br>
  **not found in overwrite**
* `OWNCLOUD_VOLUME_CONFIG=${OWNCLOUD_VOLUME_ROOT}/config`<br>
  **not found in overwrite**
* `OWNCLOUD_VOLUME_FILES=${OWNCLOUD_VOLUME_ROOT}/files`<br>
  Define the directory where user files are stored (see [documentation](https://doc.owncloud.com/server/next/admin_manual/configuration/server/config_sample_php_parameters.html#define-the-directory-where-user-files-are-stored))
* `OWNCLOUD_VOLUME_ROOT=/mnt/data`<br>
  **not found in overwrite**
* `OWNCLOUD_VOLUME_SESSIONS=${OWNCLOUD_VOLUME_ROOT}/sessions`<br>
  **not found in overwrite**


## License

This project is licensed under the MIT License - see the [LICENSE]([documentation](https://github.com/owncloud-docker/base/blob/master/LICENSE) file for details).

## Copyright

```Text
Copyright (c) 2022 ownCloud GmbH
```
