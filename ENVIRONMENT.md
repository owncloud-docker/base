# ownCloud: Base

## Environment variables

- `OWNCLOUD_ACCESSLOG_LOCATION=/dev/stdout` \
  Location of the access log.
- `OWNCLOUD_ACCOUNTS_ENABLE_MEDIAL_SEARCH=` \
  Allow medial search on user account properties (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#allow-medial-search-on-user-account-properties)).
- `OWNCLOUD_ADMIN_PASSWORD=admin` \
  ownCloud admin password.
- `OWNCLOUD_ADMIN_USERNAME=admin` \
  ownCloud admin username.
- `OWNCLOUD_ALLOW_USER_TO_CHANGE_DISPLAY_NAME=` \
  Allow or disallow users to change their display names (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#allow-or-disallow-users-to-change-their-display-names)).
- `OWNCLOUD_APPS_DEPRECATED=` \
  List of deprecated apps that must be removed (automatically) before performing an ownCloud upgrade to avoid upgrade issues.
- `OWNCLOUD_APPS_DISABLE=` \
  List of apps to disable on container startup.
- `OWNCLOUD_APPS_ENABLE=${OWNCLOUD_APPS_INSTALL}` \
  List of apps to enable on container startup.
- `OWNCLOUD_APPS_INSTALL=` \
  List of apps to install on container startup.
- `OWNCLOUD_APPS_INSTALL_MAJOR=false` \
  By default ownCloud will not install a new major version of an already installed app. To enforce major updates for apps this option need to be set to `true`.
- `OWNCLOUD_APPS_UNINSTALL=` \
  List of apps to remove on container startup.
- `OWNCLOUD_BACKGROUND_MODE=cron` \
  Service to execute ownCloud backgrouns jobs. It is recommended to keep the default (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/background_jobs_configuration.html)).
- `OWNCLOUD_BLACKLISTED_FILES=` \
  Define blacklisted files (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#define-blacklisted-files)).
- `OWNCLOUD_CACHE_CHUNK_GC_TTL=` \
  Define the TTL for garbage collection (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#define-the-ttl-for-garbage-collection)).
- `OWNCLOUD_CACHE_PATH=` \
  Define the location of the cache folder (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#define-the-location-of-the-cache-folder)).
- `OWNCLOUD_CHECK_FOR_WORKING_WELLKNOWN_SETUP=` \
  Check for a .well-known setup (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#check-for-a-well-known-setup)).
- `OWNCLOUD_CIPHER=` \
  Define the default cipher for encrypting files (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#define-the-default-cipher-for-encrypting-files)).
- `OWNCLOUD_COMMENTS_MANAGER_FACTORY=` \
  Define an alternative Comments Manager (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#define-an-alternative-comments-manager)).
- `OWNCLOUD_CORS_ALLOWED_DOMAINS=` \
  Define global list of CORS domains (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#define-global-list-of-cors-domains)).
- `OWNCLOUD_CROND_ENABLED=true` \
  Enable or disable the system cron service. Required for `OWNCLOUD_BACKGROUND_MODE=cron`.
- `OWNCLOUD_CROND_SCHEDULE="*/1 * * * *"` \
  Cron schedule to run ownCloud background jobs.
- `OWNCLOUD_CRON_LOG=` \
  Define logging if cron ran successfully(see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#define-logging-if-cron-ran-successfully))
- `OWNCLOUD_CSRF_DISABLED=` \
  Enable or disable ownCloud’s built-in CSRF protection mechanism (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#enable-or-disable-ownclouds-built-in-csrf-protection-mechanism)).
- `OWNCLOUD_DAV_CHUNK_BASE_DIR=` \
  Define the DAV chunk base directory (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#define-the-dav-chunk-base-directory)).
- `OWNCLOUD_DAV_ENABLE_ASYNC=` \
  Enable or disable async DAV extensions (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#enable-or-disable-async-dav-extensions)).
- `OWNCLOUD_DB_FAIL=true` \
  Exit container if the database can't reached during the startup.
- `OWNCLOUD_DB_HOST=` \
  Define the database server host name (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#define-the-database-server-host-name)).
- `OWNCLOUD_DB_NAME=owncloud` \
  Define the ownCloud database name (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#define-the-owncloud-database-name)).
- `OWNCLOUD_DB_PASSWORD=` \
  Define the password for the database user (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#define-the-password-for-the-database-user)).
- `OWNCLOUD_DB_PREFIX=oc_` \
  Define the prefix for the ownCloud tables in the database (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#define-the-prefix-for-the-owncloud-tables-in-the-database)).
- `OWNCLOUD_DB_TIMEOUT=180` \
  Time to wait for a successful connection to the database on container startup.
- `OWNCLOUD_DB_TYPE=sqlite` \
  Identify the database used with this installation (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#identify-the-database-used-with-this-installation)).
- `OWNCLOUD_DB_USERNAME=` \
  Define the ownCloud database user (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#define-the-owncloud-database-user)).
- `OWNCLOUD_DEBUG=` \
  Place this ownCloud instance into debugging mode (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#place-this-owncloud-instance-into-debugging-mode)).
- `OWNCLOUD_DEFAULT_APP=` \
  Define the default app to open on user login (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#define-the-default-app-to-open-on-user-login)).
- `OWNCLOUD_DEFAULT_LANGUAGE=en` \
  Define the default language of your ownCloud instance (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#define-the-default-language-of-your-owncloud-instance)).
- `OWNCLOUD_DOMAIN=localhost` \
  Base domain used in `OWNCLOUD_OVERWRITE_CLI_URL` by default.
- `OWNCLOUD_TRUSTED_DOMAINS=${OWNCLOUD_DOMAIN}` \
  List of trusted domains to prevent host header poisoning (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#define-list-of-trusted-domains-that-users-can-log-into)). Multiple domains need to be comma-separated.
- `OWNCLOUD_ENABLED_PREVIEW_PROVIDERS=` \
  Define preview providers (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#define-preview-providers)).
- `OWNCLOUD_ENABLE_AVATARS=` \
  Enable or disable avatars or user profile photos (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#enable-or-disable-avatars-or-user-profile-photos)).
- `OWNCLOUD_ENABLE_CERTIFICATE_MANAGEMENT=` \
  Allow the configuration of system-wide trusted certificates (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#allow-the-configuration-of-system-wide-trusted-certificates)).
- `OWNCLOUD_ENABLE_PREVIEWS=` \
  Enable preview generation (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#enable-preview-generation)).
- `OWNCLOUD_ENABLE_OIDC_REWRITE_URL=false` \
  Rewrites OpenID Connect wellknown URL `.well-known/openid-configuration` to the ownCloud OIDC configuration endpoint (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/user/oidc/oidc.html#set-up-service-discovery)).
- `OWNCLOUD_ENTRYPOINT_INITIALIZED=true` \
  Enable or disable loading of files from `/etc/entrypoint.d`. It is recommended to keep the default.
- `OWNCLOUD_ERRORLOG_LOCATION=/dev/stderr` \
  Output location for the Apache error log.
- `OWNCLOUD_EXCLUDED_DIRECTORIES=` \
  Define excluded directories (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#define-excluded-directories)).
- `OWNCLOUD_FILELOCKING_ENABLED=${OWNCLOUD_LOCKING_ENABLED:-true}` \
  Enable transactional file locking (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#enable-transactional-file-locking)).
- `OWNCLOUD_FILELOCKING_TTL=` \
  Define the TTL for file locking (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#define-the-ttl-for-file-locking)).
- `OWNCLOUD_FILESYSTEM_CACHE_READONLY=` \
  Prevent cache changes due to changes in the filesystem (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#prevent-cache-changes-due-to-changes-in-the-filesystem)).
- `OWNCLOUD_FILESYSTEM_CHECK_CHANGES=` \
  Define how often filesystem changes are detected (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#define-how-often-filesystem-changes-are-detected)).
- `OWNCLOUD_FILES_EXTERNAL_ALLOW_NEW_LOCAL=${OWNCLOUD_ALLOW_EXTERNAL_LOCAL_STORAGE}` \
  Enable or disable the files_external local mount option (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#enable-or-disable-the-files_external-local-mount-option)).
- `OWNCLOUD_FORWARDED_FOR_HEADERS=` \
  Define forwarded_for_headers (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#define-forwarded_for_headers)).
- `OWNCLOUD_HASHING_COST=` \
  Define the hashing cost (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#define-the-hashing-cost)).
- `OWNCLOUD_HAS_INTERNET_CONNECTION=` \
  Check for an internet connection (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#check-for-an-internet-connection)).
- `OWNCLOUD_HTACCESS_REWRITE_BASE=${OWNCLOUD_SUB_URL}` \
  Define clean URLs without /index.php (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#define-clean-urls-without-index-php)).
- `OWNCLOUD_HTTP_COOKIE_SAMESITE=` \
  Define how to relax same site cookie settings (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#define-how-to-relax-same-site-cookie-settings)).
- `OWNCLOUD_INTEGRITY_EXCLUDED_FILES=` \
  Define files that are excluded from integrity checking (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#define-files-that-are-excluded-from-integrity-checking)).
- `OWNCLOUD_INTEGRITY_IGNORE_MISSING_APP_SIGNATURE=` \
  Define apps or themes that are excluded from integrity checking (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#define-apps-or-themes-that-are-excluded-from-integrity-checking)).
- `OWNCLOUD_KNOWLEDGEBASE_ENABLED=`
- `OWNCLOUD_APPSTORE_ENABLED=`
- `OWNCLOUD_LICENSE_KEY=` \
  ownCloud Enterprise License Key (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/enterprise/installation/install.html#license-keys)).
- `OWNCLOUD_LICENSE_CLASS=`
- `OWNCLOUD_LOGIN_ALTERNATIVES=` \
  Define additional login buttons on the logon screen (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#define-additional-login-buttons-on-the-logon-screen)).
- `OWNCLOUD_LOG_DATE_FORMAT=` \
  Define the log date format (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#define-the-log-date-format)).
- `OWNCLOUD_LOG_FILE=${OWNCLOUD_VOLUME_FILES}/owncloud.log` \
  Define the log path (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#define-the-log-path)).
- `OWNCLOUD_LOG_LEVEL=` \
  Define the log level (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#define-the-log-level)).
- `OWNCLOUD_LOG_ROTATE_SIZE=${OWNCLOUD_LOGSIZE}` \
  Define the maximum log rotation file size (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#define-the-maximum-log-rotation-file-size)).
- `OWNCLOUD_LOG_TIMEZONE=` \
  Define the log timezone (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#define-the-log-timezone)).
- `OWNCLOUD_LOST_PASSWORD_LINK=` \
  Define a custom link to reset passwords (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#define-a-custom-link-to-reset-passwords)).
- `OWNCLOUD_MAIL_DOMAIN=` \
  Define the email RETURN address (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#define-the-email-return-address)).
- `OWNCLOUD_MAIL_FROM_ADDRESS=` \
  Define the email FROM address (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#define-the-email-from-address)).
- `OWNCLOUD_MAIL_SMTP_AUTH=` \
  Define the SMTP authentication (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#define-the-smtp-authentication)).
- `OWNCLOUD_MAIL_SMTP_AUTH_TYPE=` \
  Define the SMTP authentication type (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#define-the-smtp-authentication-type)).
- `OWNCLOUD_MAIL_SMTP_DEBUG=` \
  Enable or disable SMTP class debugging (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#enable-or-disable-smtp-class-debugging)).
- `OWNCLOUD_MAIL_SMTP_HOST=` \
  Define the IP address of your mail server host (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#define-the-ip-address-of-your-mail-server-host)).
- `OWNCLOUD_MAIL_SMTP_MODE=` \
  Define the mode for sending an email (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#define-the-mode-for-sending-an-email)).
- `OWNCLOUD_MAIL_SMTP_NAME=` \
  Define the SMTP authentication username (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#define-the-smtp-authentication-username)).
- `OWNCLOUD_MAIL_SMTP_PASSWORD=` \
  Define the SMTP authentication password (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#define-the-smtp-authentication-password)).
- `OWNCLOUD_MAIL_SMTP_PORT=` \
  Define the port for sending an email (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#define-the-port-for-sending-an-email)).
- `OWNCLOUD_MAIL_SMTP_SECURE=` \
  Define the SMTP security style (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#define-the-smtp-security-style)).
- `OWNCLOUD_MAIL_SMTP_TIMEOUT=` \
  Define the SMTP server timeout (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#define-the-smtp-server-timeout)).
- `OWNCLOUD_MAINTENANCE=${OWNCLOUD_MAINTENANCE_MODE}` \
  Enable maintenance mode to disable ownCloud (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#enable-maintenance-mode-to-disable-owncloud)).
- `OWNCLOUD_MARKETPLACE_CA=` \
  Developer option to connect to Marketplace testing instances.
- `OWNCLOUD_MARKETPLACE_KEY=${OWNCLOUD_MARKETPLACE_APIKEY}` \
  Developer option to get access to unreleased Apps in your Marketplace account.
- `OWNCLOUD_MAX_EXECUTION_TIME=3600` \
  Sets PHP option `max_execution_time`. It is recommended to keep the default (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/files/big_file_upload_configuration.html#configuring-via-php-global-settings)).
- `OWNCLOUD_MAX_FILESIZE_ANIMATED_GIFS_PUBLIC_SHARING=` \
  Define the maximum filesize for animated GIF´s (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#define-the-maximum-filesize-for-animated-gifs)).
- `OWNCLOUD_MAX_INPUT_TIME=3600` \
  Sets PHP option `max_input_time`. It is recommended to keep the default (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/files/big_file_upload_configuration.html#configuring-via-php-global-settings)).
- `OWNCLOUD_MAX_UPLOAD=20G` \
  Sets PHP option `upload_max_filesize` and `post_max_size`. It is recommended to keep the default (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/files/big_file_upload_configuration.html#configuring-via-php-global-settings)).
- `OWNCLOUD_MEMCACHED_ENABLED=false` \
  Enabled memory caching via memcached (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#memory-caching-backend-for-distributed-data)).
- `OWNCLOUD_MEMCACHED_HOST=memcached` \
  Defines the hosts for memcached (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#define-server-details-for-memcached-servers-to-use-for-memory-caching)).
- `OWNCLOUD_MEMCACHED_OPTIONS=` \
  Define connection options for memcached (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#define-connection-options-for-memcached)).
- `OWNCLOUD_MEMCACHED_PORT=11211` \
  Defines the ports for memcached (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#define-server-details-for-memcached-servers-to-use-for-memory-caching)).
- `OWNCLOUD_MEMCACHED_STARTUP_TIMEOUT=180` \
  Time to wait for a successful connection to the memcached service on container startup.
- `OWNCLOUD_MEMCACHE_LOCAL=${OWNCLOUD_CACHING_CLASS:-\\OC\\Memcache\\APCu}` \
  Memory caching backend for locally stored data (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#memory-caching-backend-for-locally-stored-data)).
- `OWNCLOUD_MEMCACHE_LOCKING=` \
  Define the memory caching backend for file locking (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#define-the-memory-caching-backend-for-file-locking)).
- `OWNCLOUD_MINIMUM_SUPPORTED_DESKTOP_VERSION=` \
  Define the minimum supported ownCloud desktop client version (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#define-the-minimum-supported-owncloud-desktop-client-version)).
- `OWNCLOUD_MOUNT_FILE=`
- `OWNCLOUD_MYSQL_UTF8MB4=${OWNCLOUD_UTF8MB4_ENABLED}` \
  Define MySQL 3/4 byte character handling (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#define-mysql-34-byte-character-handling)).
- `OWNCLOUD_OBJECTSTORE_BUCKET=owncloud` \
  Bucket name to store data.
- `OWNCLOUD_OBJECTSTORE_CLASS=OCA\Files_Primary_S3\S3Storage` \
  Class to use for the objectstore. It is recommended to keep the default (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/files/external_storage/s3_compatible_object_storage_as_primary.html)).
- `OWNCLOUD_OBJECTSTORE_ENABLED=false` \
  Enabled or disables the objectstore configuration.
- `OWNCLOUD_OBJECTSTORE_ENDPOINT=https://s3.${OWNCLOUD_OBJECTSTORE_REGION}.amazonaws.com` \
  Endpoint of the objectstore provider (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/files/external_storage/s3_compatible_object_storage_as_primary.html)).
- `OWNCLOUD_OBJECTSTORE_KEY=` \
  Access key for the objectstore (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/files/external_storage/s3_compatible_object_storage_as_primary.html)).
- `OWNCLOUD_OBJECTSTORE_PATHSTYLE=false` \
  Enabled or disables path style for the objectstore (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/files/external_storage/s3_compatible_object_storage_as_primary.html)).
- `OWNCLOUD_OBJECTSTORE_REGION=us-east-1` \
  Objectstore region to use (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/files/external_storage/s3_compatible_object_storage_as_primary.html)).
- `OWNCLOUD_OBJECTSTORE_SECRET=` \
  Secret key for the objectstore (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/files/external_storage/s3_compatible_object_storage_as_primary.html)).
- `OWNCLOUD_OBJECTSTORE_VERSION=2006-03-01` \
  Objectstore version to use (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/files/external_storage/s3_compatible_object_storage_as_primary.html)).
- `OWNCLOUD_OBJECTSTORE_PART_SIZE=5242880` \
  Part size, in bytes, applies to uploads between ownCloud and S3 (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/files/external_storage/s3_compatible_object_storage_as_primary.html)).
- `OWNCLOUD_OBJECTSTORE_CONCURRENCY=3` \
  Maximum number of concurrent UploadPart operations allowed during the multipart upload (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/files/external_storage/s3_compatible_object_storage_as_primary.html)).
- `OWNCLOUD_OBJECTSTORE_AVAILABLE_STORAGE=` \
  Indicates available storage size in the objectstore in bytes (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/files/external_storage/s3_compatible_object_storage_as_primary.html)).
- `OWNCLOUD_OPERATION_MODE=` \
  Define ownCloud operation modes (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#define-owncloud-operation-modes)).
- `OWNCLOUD_OVERWRITE_CLI_URL=\${OWNCLOUD_PROTOCOL}://\${OWNCLOUD_DOMAIN}${OWNCLOUD_SUB_URL}` \
  Override cli URL (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#override-cli-url)).
- `OWNCLOUD_OVERWRITE_COND_ADDR=` \
  Override condition for the remote IP address with a regular expression (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#override-condition-for-the-remote-ip-address-with-a-regular-expression)).
- `OWNCLOUD_OVERWRITE_HOST=` \
  Override automatic proxy detection (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#override-automatic-proxy-detection)).
- `OWNCLOUD_OVERWRITE_PROTOCOL=` \
  Override protocol (http/https) usage (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#override-protocol-httphttps-usage)).
- `OWNCLOUD_OVERWRITE_WEBROOT=` \
  Override ownClouds webroot (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#override-ownclouds-webroot)).
- `OWNCLOUD_PART_FILE_IN_STORAGE=` \
  Define where part files are located (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#define-where-part-files-are-located)).
- `OWNCLOUD_POST_CRONJOB_PATH=/etc/post_cronjob.d` \
  Path to custom scripts that need to be executed after a cron run.
- `OWNCLOUD_POST_INSTALL_PATH=/etc/post_install.d` \
  Path to custom scripts that need to be executed after an ownCoud installation command.
- `OWNCLOUD_POST_SERVER_PATH=/etc/post_server.d` \
  Path to custom scripts that need to be executed after an ownCloud server startup.
- `OWNCLOUD_PREVIEW_LIBREOFFICE_PATH=` \
  Define the custom path for the LibreOffice / OpenOffice binary (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#define-the-custom-path-for-the-libreoffice-openoffice-binary)).
- `OWNCLOUD_PREVIEW_MAX_FILESIZE_IMAGE=` \
  Define the maximum preview filesize limit (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#define-the-maximum-preview-filesize-limit)).
- `OWNCLOUD_PREVIEW_MAX_SCALE_FACTOR=` \
  Define the maximum preview scale factor (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#define-the-maximum-preview-scale-factor)).
- `OWNCLOUD_PREVIEW_MAX_X=` \
  Define the maximum x-axis width for previews (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#define-the-maximum-x-axis-width-for-previews)).
- `OWNCLOUD_PREVIEW_MAX_Y=` \
  Define the maximum y-axis width for previews (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#define-the-maximum-y-axis-width-for-previews)).
- `OWNCLOUD_PREVIEW_OFFICE_CL_PARAMETERS=` \
  Define additional arguments for LibreOffice / OpenOffice (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#define-additional-arguments-for-libreoffice-openoffice)).
- `OWNCLOUD_PRE_CRONJOB_PATH=/etc/pre_cronjob.d` \
  Path to custom scripts that need to be executed before a cron run.
- `OWNCLOUD_PRE_INSTALL_PATH=/etc/pre_install.d` \
  Path to custom scripts that need to be executed before an ownCoud installation command.
- `OWNCLOUD_PRE_SERVER_PATH=/etc/pre_server.d` \
  Path to custom scripts that need to be executed before an ownCloud server startup.
- `OWNCLOUD_PROTOCOL=http` \
  Protocol used in `OWNCLOUD_OVERWRITE_CLI_URL` by default.
- `OWNCLOUD_PROXY=` \
  Define the URL of your proxy server (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#define-the-url-of-your-proxy-server)).
- `OWNCLOUD_PROXY_USERPWD=` \
  Define proxy authentication (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#define-proxy-authentication)).
- `OWNCLOUD_QUOTA_INCLUDE_EXTERNAL_STORAGE=` \
  Define whether to include external storage in quota calculation (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#define-whether-to-include-external-storage-in-quota-calculation)).
- `OWNCLOUD_REDIS_DB=` \
  Define Redis connection details sets the dbindex (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#define-redis-connection-details)).
- `OWNCLOUD_REDIS_ENABLED=false` \
  Sets memcache to Redis (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#memory-caching-backend-for-distributed-data)). If sessions need to be stored in redis as well, you must also set `OWNCLOUD_SESSION_SAVE_HANDLER=redis`.
- `OWNCLOUD_REDIS_FAILOVER_MODE=` \
  Sets redis failover mode (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#define-redis-cluster-connection-details)). Possible values: `FAILOVER_NONE` for `\RedisCluster::FAILOVER_NONE`, `FAILOVER_ERROR` for `\RedisCluster::FAILOVER_ERROR` or `FAILOVER_DISTRIBUTE` for `\RedisCluster::FAILOVER_DISTRIBUTE`.
- `OWNCLOUD_REDIS_HOST=redis` \
  Sets redis host (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#define-redis-connection-details)).
- `OWNCLOUD_REDIS_PASSWORD=` \
  Set redis password (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#define-redis-connection-details)).
- `OWNCLOUD_REDIS_PORT=6379` \
  Set redis port (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#define-redis-connection-details)).
- `OWNCLOUD_REDIS_READ_TIMEOUT=` \
  Sets redis read timeout (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#define-redis-cluster-connection-details)).
- `OWNCLOUD_REDIS_SEEDS=` \
  Sets the redis cluster servers (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#define-redis-cluster-connection-details)).
- `OWNCLOUD_REDIS_SESSION_LOCKING_ENABLED=1` \
  Sets PHP option `redis.session.locking_enabled` if `OWNCLOUD_SESSION_SAVE_HANDLER=redis`.
- `OWNCLOUD_REDIS_SESSION_LOCK_RETRIES=750` \
  Sets PHP option `redis.session.lock_retries` if `OWNCLOUD_SESSION_SAVE_HANDLER=redis`.
- `OWNCLOUD_REDIS_SESSION_LOCK_WAIT_TIME=20000` \
  Sets PHP option `redis.session.lock_wait_time` if `OWNCLOUD_SESSION_SAVE_HANDLER=redis`.
- `OWNCLOUD_REDIS_STARTUP_TIMEOUT=180` \
  Time to wait for a successful connection to the redis service on container startup.
- `OWNCLOUD_REDIS_TIMEOUT=` \
  Sets the redis timeout value (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#define-redis-cluster-connection-details)).
- `OWNCLOUD_REMEMBER_LOGIN_COOKIE_LIFETIME=` \
  Define the lifetime of the remember-login cookie (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#define-the-lifetime-of-the-remember-login-cookie)).
- `OWNCLOUD_SECRET=` \
  Define ownClouds internal secret (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#define-ownclouds-internal-secret)).
- `OWNCLOUD_SESSION_KEEPALIVE=` \
  Enable or disable session keep-alive when a user is logged in to the Web UI (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#enable-or-disable-session-keep-alive-when-a-user-is-logged-in-to-the-web-ui)).
- `OWNCLOUD_SESSION_LIFETIME=` \
  Define the lifetime of a session after inactivity (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#define-the-lifetime-of-a-session-after-inactivity)).
- `OWNCLOUD_SESSION_FORCED_LOGOUT_TIMEOUT=` \
  Force the user to get logged out after the specified number of seconds when the tab or browser gets closed. Please read the documentation carefully before changing this option (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#enable-to-force-user-logout)).
- `OWNCLOUD_SESSION_SAVE_HANDLER=files` \
  Sets PHP option `session.save_handler`.
- `OWNCLOUD_DEFAULT_SOCKET_TIMEOUT=60` \
  Sets PHP option `default_socket_timeout`.
- `OWNCLOUD_SESSION_SAVE_PATH=${OWNCLOUD_VOLUME_SESSIONS}` \
  Sets the PHP option `session.save_path`. If `OWNCLOUD_SESSION_SAVE_HANDLER=redis` is used, this must be set to a proper connection URL including authentication parameters if required by the redis server. It usually follows the following scheme: `tcp://IPADDRESS:PORT?auth=REDISPASSWORD`.
- `OWNCLOUD_SHARE_FOLDER=` \
  Define a default folder for shared files and folders other than root (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#define-a-default-folder-for-shared-files-and-folders-other-than-root)).
- `OWNCLOUD_SHARING_FEDERATION_ALLOW_HTTP_FALLBACK=` \
  Allow schema fallback for federated sharing servers (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#allow-schema-fallback-for-federated-sharing-servers)).
- `OWNCLOUD_SHARING_MANAGER_FACTORY=` \
  Define an alternative Share Provider (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#define-an-alternative-share-provider)).
- `OWNCLOUD_SHOW_SERVER_HOSTNAME=` \
  Show or hide the server hostname in status.php (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#show-or-hide-the-server-hostname-in-status-php)).
- `OWNCLOUD_SINGLEUSER=` \
  Enable or disable single user mode (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#enable-or-disable-single-user-mode)).
- `OWNCLOUD_SKELETON_DIRECTORY=` \
  Define the directory where the skeleton files are located (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#define-the-directory-where-the-skeleton-files-are-located)).
- `OWNCLOUD_SKIP_CHMOD=false` \
  Enable or disable automatic file permissions correction on container startup.
- `OWNCLOUD_SKIP_CHOWN=false` \
  Enable or disable automatic file ownership correction on container startup.
- `OWNCLOUD_SMB_LOGGING_ENABLE=` \
  Enable or disable debug logging for SMB access (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#enable-or-disable-debug-logging-for-smb-access)).
- `OWNCLOUD_SQLITE_JOURNAL_MODE=` \
  Define sqlite3 journal mode (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#define-sqlite3-journal-mode)).
- `OWNCLOUD_SUB_URL=/` \
  URL path if ownCloud is deployed to a URL sub-path of a domain.
- `OWNCLOUD_SYSTEMTAGS_MANAGER_FACTORY=` \
  Define an alternative System Tags Manager (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#define-an-alternative-system-tags-manager)).
- `OWNCLOUD_TEMP_DIRECTORY=` \
  Define the location for temporary files (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#define-the-location-for-temporary-files)).
- `OWNCLOUD_TOKEN_AUTH_ENFORCED=` \
  Enforce token only authentication for apps and clients connecting to ownCloud (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#enforce-token-only-authentication-for-apps-and-clients-connecting-to-owncloud)).
- `OWNCLOUD_TRASHBIN_PURGE_LIMIT=` \
  Define the trashbin purge limit (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#define-the-trashbin-purge-limit)).
- `OWNCLOUD_TRASHBIN_RETENTION_OBLIGATION=` \
  Define the trashbin retention obligation (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#define-the-trashbin-retention-obligation)).
- `OWNCLOUD_TRUSTED_PROXIES=` \
  Define list of trusted proxy servers (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#define-list-of-trusted-proxy-servers)).
- `OWNCLOUD_UPDATER_SERVER_URL=` \
  Define the updatechecker URL (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#define-the-updatechecker-url)).
- `OWNCLOUD_UPDATE_CHECKER=` \
  Enable or disable updatechecker (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#enable-or-disable-updatechecker)).
- `OWNCLOUD_UPGRADE_AUTOMATIC_APP_UPDATES=` \
  Define whether or not to enable automatic update of market apps (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#define-whether-or-not-to-enable-automatic-update-of-market-apps)).
- `OWNCLOUD_USER_SEARCH_MIN_LENGTH=` \
  Define minimum characters entered before a search returns results (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#define-minimum-characters-entered-before-a-search-returns-results)).
- `OWNCLOUD_VERSIONS_RETENTION_OBLIGATION=` \
  Define the files versions retention obligation (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#define-the-files-versions-retention-obligation)).
- `OWNCLOUD_VERSION_HIDE=` \
  Show or hide the ownCloud version information in status.php (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#show-or-hide-the-owncloud-version-information-in-status-php)).
- `OWNCLOUD_VOLUME_APPS=${OWNCLOUD_VOLUME_ROOT}/apps` \
  Base directory used to store custom installed apps.
- `OWNCLOUD_VOLUME_CONFIG=${OWNCLOUD_VOLUME_ROOT}/config` \
  Base directory used to store the ownCloud configuration.
- `OWNCLOUD_VOLUME_FILES=${OWNCLOUD_VOLUME_ROOT}/files` \
  Define the directory where user files are stored (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#define-the-directory-where-user-files-are-stored)).
- `OWNCLOUD_VOLUME_ROOT=/mnt/data` \
  Base data directory for ownCloud.
- `OWNCLOUD_VOLUME_SESSIONS=${OWNCLOUD_VOLUME_ROOT}/sessions` \
  Base directory to store session files. Only used if `OWNCLOUD_SESSION_SAVE_HANDLER=file`.
