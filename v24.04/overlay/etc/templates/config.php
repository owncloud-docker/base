<?php

function getConfigFromEnv() {
  if (getenv('OWNCLOUD_TRUSTED_DOMAINS') != '') {
    $domain = array_map('trim', explode(',', getenv('OWNCLOUD_TRUSTED_DOMAINS')));
  } else {
    $domain = [explode(':', getenv('OWNCLOUD_DOMAIN'))[0]];
  }

  $config = [
    'apps_paths' => [
      0 => [
        "path" => OC::$SERVERROOT . "/apps",
        "url" => "/apps",
        "writable" => false
      ],
      1 => [
        "path" => OC::$SERVERROOT . "/custom",
        "url" => "/custom",
        "writable" => true
      ]
    ],
    'trusted_domains' => $domain,

    'datadirectory' => getenv('OWNCLOUD_VOLUME_FILES'),
    'dbtype' => getenv('OWNCLOUD_DB_TYPE'),
    'dbhost' => getenv('OWNCLOUD_DB_HOST'),
    'dbname' => getenv('OWNCLOUD_DB_NAME'),
    'dbuser' => getenv('OWNCLOUD_DB_USERNAME'),
    'dbpassword' => getenv('OWNCLOUD_DB_PASSWORD'),
    'dbtableprefix' => getenv('OWNCLOUD_DB_PREFIX'),

    'log_type' => 'owncloud',

    'supportedDatabases' => [
      'sqlite',
      'mysql',
      'pgsql',
    ],

    'upgrade.disable-web' => true,
    'web-updater.enabled' => false,
  ];

  if (getenv('OWNCLOUD_IOC_SCANNER_CONFIRMATION') != '') {
    $config['indicators-of-compromise-scanner.confirmation'] = getenv('OWNCLOUD_IOC_SCANNER_CONFIRMATION');
  }

  if (getenv('OWNCLOUD_CORS_ALLOWED_DOMAINS') != '') {
    $config['cors.allowed-domains'] = explode(',', getenv('OWNCLOUD_CORS_ALLOWED_DOMAINS'));
  }

  if (getenv('OWNCLOUD_VERSION_HIDE') != '') {
    $config['version.hide'] = getenv('OWNCLOUD_VERSION_HIDE') === 'true';
  }

  if (getenv('OWNCLOUD_SHOW_SERVER_HOSTNAME') != '') {
    $config['show_server_hostname'] = getenv('OWNCLOUD_SHOW_SERVER_HOSTNAME') === 'true';
  }

  if (getenv('OWNCLOUD_DEFAULT_LANGUAGE') != '') {
    $config['default_language'] = getenv('OWNCLOUD_DEFAULT_LANGUAGE');
  }

  if (getenv('OWNCLOUD_DEFAULT_APP') != '') {
    $config['defaultapp'] = getenv('OWNCLOUD_DEFAULT_APP');
  }

  if (getenv('OWNCLOUD_KNOWLEDGEBASE_ENABLED') != '') {
    $config['knowledgebaseenabled'] = getenv('OWNCLOUD_KNOWLEDGEBASE_ENABLED') === 'true';
  }

  if (getenv('OWNCLOUD_ENABLE_AVATARS') != '') {
    $config['enable_avatars'] = getenv('OWNCLOUD_ENABLE_AVATARS') === 'true';
  }

  if (getenv('OWNCLOUD_ALLOW_USER_TO_CHANGE_DISPLAY_NAME') != '') {
    $config['allow_user_to_change_display_name'] = getenv('OWNCLOUD_ALLOW_USER_TO_CHANGE_DISPLAY_NAME') === 'true';
  }

  if (getenv('OWNCLOUD_ALLOW_USER_TO_CHANGE_MAIL_ADDRESS') != '') {
    $config['allow_user_to_change_mail_address'] = getenv('OWNCLOUD_ALLOW_USER_TO_CHANGE_MAIL_ADDRESS') === 'true';
  }

  if (getenv('OWNCLOUD_ALLOW_SUBADMINS') != '') {
    $config['allow_subadmins'] = getenv('OWNCLOUD_ALLOW_SUBADMINS') === 'true';
  }

  if (getenv('OWNCLOUD_STRICT_LOGIN_ENFORCED') != '') {
    $config['strict_login_enforced'] = getenv('OWNCLOUD_STRICT_LOGIN_ENFORCED') === 'true';
  }

  if (getenv('OWNCLOUD_GROUPS_ENABLE_MEDIAL_SEARCH') != '') {
    $config['groups.enable_medial_search'] = getenv('OWNCLOUD_GROUPS_ENABLE_MEDIAL_SEARCH') === 'true';
  }

  if (getenv('OWNCLOUD_USE_RELATIVE_DOMAIN_NAME') != '') {
    $config['use_relative_domain_name'] = getenv('OWNCLOUD_USE_RELATIVE_DOMAIN_NAME') === 'true';
  }

  if (getenv('OWNCLOUD_REMEMBER_LOGIN_COOKIE_LIFETIME') != '') {
    $config['remember_login_cookie_lifetime'] = (int) getenv('OWNCLOUD_REMEMBER_LOGIN_COOKIE_LIFETIME');
  }

  if (getenv('OWNCLOUD_SESSION_LIFETIME') != '') {
    $config['session_lifetime'] = (int) getenv('OWNCLOUD_SESSION_LIFETIME');
  }

  if (getenv('OWNCLOUD_SESSION_KEEPALIVE') != '') {
    $config['session_keepalive'] = getenv('OWNCLOUD_SESSION_KEEPALIVE') === 'true';
  }

  if (getenv('OWNCLOUD_TOKEN_AUTH_ENFORCED') != '') {
    $config['token_auth_enforced'] = getenv('OWNCLOUD_TOKEN_AUTH_ENFORCED') === 'true';
  }

  if (getenv('OWNCLOUD_CSRF_DISABLED') != '') {
    $config['csrf.disabled'] = getenv('OWNCLOUD_CSRF_DISABLED') === 'true';
  }

  // Use the skeleton folder from the mounted volume when it holds content,
  // otherwise leave 'skeletondirectory' unset so core falls back to its
  // built-in core/skeleton default.
  $skeletonDirectory = getenv('OWNCLOUD_VOLUME_ROOT') . '/skeleton';
  if (is_dir($skeletonDirectory) && (new \FilesystemIterator($skeletonDirectory))->valid()) {
    $config['skeletondirectory'] = $skeletonDirectory;
  }

  if (getenv('OWNCLOUD_LOST_PASSWORD_LINK') != '') {
    $config['lost_password_link'] = getenv('OWNCLOUD_LOST_PASSWORD_LINK');
  }

  if (getenv('OWNCLOUD_ACCOUNTS_ENABLE_MEDIAL_SEARCH') != '') {
    $config['accounts.enable_medial_search'] = getenv('OWNCLOUD_ACCOUNTS_ENABLE_MEDIAL_SEARCH') === 'true';
  }

  if (getenv('OWNCLOUD_USER_SEARCH_MIN_LENGTH') != '') {
    $config['user.search_min_length'] = (int) getenv('OWNCLOUD_USER_SEARCH_MIN_LENGTH');
  }

  if (getenv('OWNCLOUD_MAIL_DOMAIN') != '') {
    $config['mail_domain'] = getenv('OWNCLOUD_MAIL_DOMAIN');
  }

  if (getenv('OWNCLOUD_MAIL_FROM_ADDRESS') != '') {
    $config['mail_from_address'] = getenv('OWNCLOUD_MAIL_FROM_ADDRESS');
  }

  if (getenv('OWNCLOUD_MAIL_SMTP_DEBUG') != '') {
    $config['mail_smtpdebug'] = getenv('OWNCLOUD_MAIL_SMTP_DEBUG') === 'true';
  }

  if (getenv('OWNCLOUD_MAIL_SMTP_MODE') != '') {
    $config['mail_smtpmode'] = getenv('OWNCLOUD_MAIL_SMTP_MODE');
  }

  if (getenv('OWNCLOUD_MAIL_SMTP_HOST') != '') {
    $config['mail_smtphost'] = getenv('OWNCLOUD_MAIL_SMTP_HOST');
  }

  if (getenv('OWNCLOUD_MAIL_SMTP_PORT') != '') {
    $config['mail_smtpport'] = (int) getenv('OWNCLOUD_MAIL_SMTP_PORT');
  }

  if (getenv('OWNCLOUD_MAIL_SMTP_TIMEOUT') != '') {
    $config['mail_smtptimeout'] = (int) getenv('OWNCLOUD_MAIL_SMTP_TIMEOUT');
  }

  if (getenv('OWNCLOUD_MAIL_SMTP_SECURE') != '') {
    $config['mail_smtpsecure'] = getenv('OWNCLOUD_MAIL_SMTP_SECURE');
  }

  if (getenv('OWNCLOUD_MAIL_SMTP_AUTH') != '') {
    $config['mail_smtpauth'] = getenv('OWNCLOUD_MAIL_SMTP_AUTH') === 'true';
  }

  if (getenv('OWNCLOUD_MAIL_SMTP_AUTH_TYPE') != '') {
    $config['mail_smtpauthtype'] = getenv('OWNCLOUD_MAIL_SMTP_AUTH_TYPE');
  }

  if (getenv('OWNCLOUD_MAIL_SMTP_NAME') != '') {
    $config['mail_smtpname'] = getenv('OWNCLOUD_MAIL_SMTP_NAME');
  }

  if (getenv('OWNCLOUD_MAIL_SMTP_PASSWORD') != '') {
    $config['mail_smtppassword'] = getenv('OWNCLOUD_MAIL_SMTP_PASSWORD');
  }

  if (getenv('OWNCLOUD_MAIL_REMOVE_SENDER_DISPLAY_NAME') != '') {
    $config['remove_sender_display_name'] = getenv('OWNCLOUD_MAIL_REMOVE_SENDER_DISPLAY_NAME') === 'true';
  }

  if (getenv('OWNCLOUD_OVERWRITE_HOST') != '') {
    $config['overwritehost'] = getenv('OWNCLOUD_OVERWRITE_HOST');
  }

  if (getenv('OWNCLOUD_OVERWRITE_PROTOCOL') != '') {
    $config['overwriteprotocol'] = getenv('OWNCLOUD_OVERWRITE_PROTOCOL');
  }

  if (getenv('OWNCLOUD_OVERWRITE_WEBROOT') != '') {
    $config['overwritewebroot'] = getenv('OWNCLOUD_OVERWRITE_WEBROOT');
  }

  if (getenv('OWNCLOUD_OVERWRITE_COND_ADDR') != '') {
    $config['overwritecondaddr'] = getenv('OWNCLOUD_OVERWRITE_COND_ADDR');
  }

  if (getenv('OWNCLOUD_OVERWRITE_CLI_URL') != '') {
    $config['overwrite.cli.url'] = getenv('OWNCLOUD_OVERWRITE_CLI_URL');
  }

  if (getenv('OWNCLOUD_HTACCESS_REWRITE_BASE') != '') {
    $config['htaccess.RewriteBase'] = getenv('OWNCLOUD_HTACCESS_REWRITE_BASE');
  }

  if (getenv('OWNCLOUD_PROXY') != '') {
    $config['proxy'] = getenv('OWNCLOUD_PROXY');
  }

  if (getenv('OWNCLOUD_PROXY_USERPWD') != '') {
    $config['proxyuserpwd'] = getenv('OWNCLOUD_PROXY_USERPWD');
  }

  if (getenv('OWNCLOUD_PROXY_IGNORE') != '') {
    $config['proxy_ignore'] = explode(',', getenv('OWNCLOUD_PROXY_IGNORE'));
  }

  if (getenv('OWNCLOUD_WEB_BASEURL') != '') {
    $config['web.baseUrl'] = getenv('OWNCLOUD_WEB_BASEURL');
  }

  if (getenv('OWNCLOUD_WEB_REWRITE_LINKS') != '') {
    $config['web.rewriteLinks'] = getenv('OWNCLOUD_WEB_REWRITE_LINKS') === 'true';
  }

  if (getenv('OWNCLOUD_TRASHBIN_RETENTION_OBLIGATION') != '') {
    $config['trashbin_retention_obligation'] = getenv('OWNCLOUD_TRASHBIN_RETENTION_OBLIGATION');
  }

  if (getenv('OWNCLOUD_TRASHBIN_PURGE_LIMIT') != '') {
    $config['trashbin_purge_limit'] = (int) getenv('OWNCLOUD_TRASHBIN_PURGE_LIMIT');
  }

  if (getenv('OWNCLOUD_TRASHBIN_SKIP_DIRECTORIES') != '') {
    $config['trashbin_skip_directories'] = explode(',', getenv('OWNCLOUD_TRASHBIN_SKIP_DIRECTORIES'));
  }

  if (getenv('OWNCLOUD_TRASHBIN_SKIP_EXTENSIONS') != '') {
    $config['trashbin_skip_extensions'] = explode(',', getenv('OWNCLOUD_TRASHBIN_SKIP_EXTENSIONS'));
  }

  if (getenv('OWNCLOUD_TRASHBIN_SKIP_SIZE_THRESHOLD') != '') {
    $config['trashbin_skip_size_threshold'] = getenv('OWNCLOUD_TRASHBIN_SKIP_SIZE_THRESHOLD');
  }

  if (getenv('OWNCLOUD_VERSIONS_RETENTION_OBLIGATION') != '') {
    $config['versions_retention_obligation'] = getenv('OWNCLOUD_VERSIONS_RETENTION_OBLIGATION');
  }

  if (getenv('OWNCLOUD_SAVE_VERSION_METADATA') != '') {
    $config['file_storage.save_version_metadata'] = getenv('OWNCLOUD_SAVE_VERSION_METADATA') === 'true';
  }

  if (getenv('OWNCLOUD_UPDATE_CHECKER') != '') {
    $config['updatechecker'] = getenv('OWNCLOUD_UPDATE_CHECKER') === 'true';
  }

  if (getenv('OWNCLOUD_UPDATER_SERVER_URL') != '') {
    $config['updater.server.url'] = getenv('OWNCLOUD_UPDATER_SERVER_URL');
  }

  if (getenv('OWNCLOUD_HAS_INTERNET_CONNECTION') != '') {
    $config['has_internet_connection'] = getenv('OWNCLOUD_HAS_INTERNET_CONNECTION') === 'true';
  }

  if (getenv('OWNCLOUD_INTERNET_CONNECTIVITY_DETECT_URL') != '') {
    $config['internet_connectivity_detect_url'] = getenv('OWNCLOUD_INTERNET_CONNECTIVITY_DETECT_URL');
  }

  if (getenv('OWNCLOUD_CHECK_FOR_WORKING_WELLKNOWN_SETUP') != '') {
    $config['check_for_working_wellknown_setup'] = getenv('OWNCLOUD_CHECK_FOR_WORKING_WELLKNOWN_SETUP') === 'true';
  }

  if (getenv('OWNCLOUD_OPERATION_MODE') != '') {
    $config['operation.mode'] = getenv('OWNCLOUD_OPERATION_MODE');
  }

  if (getenv('OWNCLOUD_LOG_FILE') != '') {
    $config['logfile'] = getenv('OWNCLOUD_LOG_FILE');
  }

  if (getenv('OWNCLOUD_LOG_LEVEL') != '') {
    $config['loglevel'] = (int) getenv('OWNCLOUD_LOG_LEVEL');
  }

  if (getenv('OWNCLOUD_LOG_DATE_FORMAT') != '') {
    $config['logdateformat'] = getenv('OWNCLOUD_LOG_DATE_FORMAT');
  }

  if (getenv('OWNCLOUD_LOG_TIMEZONE') != '') {
    $config['logtimezone'] = getenv('OWNCLOUD_LOG_TIMEZONE');
  }

  if (getenv('OWNCLOUD_CRON_LOG') != '') {
    $config['cron_log'] = getenv('OWNCLOUD_CRON_LOG') === 'true';
  }

  if (getenv('OWNCLOUD_LOG_ROTATE_SIZE') != '') {
    $config['log_rotate_size'] = (int) getenv('OWNCLOUD_LOG_ROTATE_SIZE');
  }

  // 'log.conditions' is a list of condition maps with mixed scalar/array
  // values (apps, users, logfile, loglevel, shared_secret), which the flat
  // env-var idioms used elsewhere here cannot represent. It is therefore
  // passed as a JSON-encoded array, e.g.:
  //   OWNCLOUD_LOG_CONDITIONS='[{"apps":["files_external"],"loglevel":0}]'
  if (getenv('OWNCLOUD_LOG_CONDITIONS') != '') {
    $logConditions = json_decode(getenv('OWNCLOUD_LOG_CONDITIONS'), true);
    if (is_array($logConditions)) {
      $config['log.conditions'] = $logConditions;
    }
  }

  if (getenv('OWNCLOUD_ENABLE_PREVIEWS') != '') {
    $config['enable_previews'] = getenv('OWNCLOUD_ENABLE_PREVIEWS') === 'true';
  }

  if (getenv('OWNCLOUD_PREVIEW_MAX_X') != '') {
    $config['preview_max_x'] = (int) getenv('OWNCLOUD_PREVIEW_MAX_X');
  }

  if (getenv('OWNCLOUD_PREVIEW_MAX_Y') != '') {
    $config['preview_max_y'] = (int) getenv('OWNCLOUD_PREVIEW_MAX_Y');
  }

  if (getenv('OWNCLOUD_PREVIEW_MAX_SCALE_FACTOR') != '') {
    $config['preview_max_scale_factor'] = (int) getenv('OWNCLOUD_PREVIEW_MAX_SCALE_FACTOR');
  }

  if (getenv('OWNCLOUD_PREVIEW_MAX_FILESIZE_IMAGE') != '') {
    $config['preview_max_filesize_image'] = getenv('OWNCLOUD_PREVIEW_MAX_FILESIZE_IMAGE');
  }

  if (getenv('OWNCLOUD_PREVIEW_JPEG_IMAGE_DISPLAY_QUALITY') != '') {
    $config['previewJPEGImageDisplayQuality'] = (int) getenv('OWNCLOUD_PREVIEW_JPEG_IMAGE_DISPLAY_QUALITY');
  }

  if (getenv('OWNCLOUD_PREVIEW_LIBREOFFICE_PATH') != '') {
    $config['preview_libreoffice_path'] = getenv('OWNCLOUD_PREVIEW_LIBREOFFICE_PATH');
  }

  if (getenv('OWNCLOUD_PREVIEW_OFFICE_CL_PARAMETERS') != '') {
    $config['preview_office_cl_parameters'] = getenv('OWNCLOUD_PREVIEW_OFFICE_CL_PARAMETERS');
  }

  if (getenv('OWNCLOUD_ENABLED_PREVIEW_PROVIDERS') != '') {
    $config['enabledPreviewProviders'] = explode(',', getenv('OWNCLOUD_ENABLED_PREVIEW_PROVIDERS'));
  }

  if (getenv('OWNCLOUD_ACTIVITY_EXPIRE_DAYS') != '') {
    $config['activity_expire_days'] = getenv('OWNCLOUD_ACTIVITY_EXPIRE_DAYS');
  }

  if (getenv('OWNCLOUD_PREVIEW_MAX_DIMENSIONS') != '') {
    $config['preview_max_dimensions'] = getenv('OWNCLOUD_PREVIEW_MAX_DIMENSIONS');
  }

  if (getenv('OWNCLOUD_COMMENTS_MANAGER_FACTORY') != '') {
    $config['comments.managerFactory'] = getenv('OWNCLOUD_COMMENTS_MANAGER_FACTORY');
  }

  if (getenv('OWNCLOUD_SYSTEMTAGS_MANAGER_FACTORY') != '') {
    $config['systemtags.managerFactory'] = getenv('OWNCLOUD_SYSTEMTAGS_MANAGER_FACTORY');
  }

  if (getenv('OWNCLOUD_MAINTENANCE') != '') {
    $config['maintenance'] = getenv('OWNCLOUD_MAINTENANCE') === 'true';
  }

  if (getenv('OWNCLOUD_SINGLEUSER') != '') {
    $config['singleuser'] = getenv('OWNCLOUD_SINGLEUSER') === 'true';
  }

  if (getenv('OWNCLOUD_ENABLE_CERTIFICATE_MANAGEMENT') != '') {
    $config['enable_certificate_management'] = getenv('OWNCLOUD_ENABLE_CERTIFICATE_MANAGEMENT');
  }

  if (getenv('OWNCLOUD_MEMCACHE_LOCAL') != '') {
    $config['memcache.local'] = getenv('OWNCLOUD_MEMCACHE_LOCAL');
  }

  if (getenv('OWNCLOUD_CACHE_PATH') != '') {
    $config['cache_path'] = getenv('OWNCLOUD_CACHE_PATH');
  }

  if (getenv('OWNCLOUD_CACHE_CHUNK_GC_TTL') != '') {
    $config['cache_chunk_gc_ttl'] = (int) getenv('OWNCLOUD_CACHE_CHUNK_GC_TTL');
  }

  if (getenv('OWNCLOUD_SESSION_FORCED_LOGOUT_TIMEOUT') != '') {
    $config['session_forced_logout_timeout'] = (int) getenv('OWNCLOUD_SESSION_FORCED_LOGOUT_TIMEOUT');
  }

  if (getenv('OWNCLOUD_DAV_CHUNK_BASE_DIR') != '') {
    $config['dav.chunk_base_dir'] = getenv('OWNCLOUD_DAV_CHUNK_BASE_DIR');
  }

  if (getenv('OWNCLOUD_SHARING_MANAGER_FACTORY') != '') {
    $config['sharing.managerFactory'] = getenv('OWNCLOUD_SHARING_MANAGER_FACTORY');
  }

  if (getenv('OWNCLOUD_SHARING_FEDERATION_ALLOW_HTTP_FALLBACK') != '') {
    $config['sharing.federation.allowHttpFallback'] = getenv('OWNCLOUD_SHARING_FEDERATION_ALLOW_HTTP_FALLBACK') === 'true';
  }

  if (getenv('OWNCLOUD_SQLITE_JOURNAL_MODE') != '') {
    $config['sqlite.journal_mode'] = getenv('OWNCLOUD_SQLITE_JOURNAL_MODE');
  }

  if (getenv('OWNCLOUD_MYSQL_UTF8MB4') != '') {
    $config['mysql.utf8mb4'] = getenv('OWNCLOUD_MYSQL_UTF8MB4') === 'true';
  }

  if (getenv('OWNCLOUD_TEMP_DIRECTORY') != '') {
    $config['tempdirectory'] = getenv('OWNCLOUD_TEMP_DIRECTORY');
  }

  if (getenv('OWNCLOUD_HASHING_COST') != '') {
    $config['hashingCost'] = (int) getenv('OWNCLOUD_HASHING_COST');
  }

  if (getenv('OWNCLOUD_BLACKLISTED_FILES') != '') {
    $config['blacklisted_files'] = explode(',', getenv('OWNCLOUD_BLACKLISTED_FILES'));
  }

  if (getenv('OWNCLOUD_EXCLUDED_DIRECTORIES') != '') {
    $config['excluded_directories'] = explode(',', getenv('OWNCLOUD_EXCLUDED_DIRECTORIES'));
  }

  if (getenv('OWNCLOUD_INTEGRITY_EXCLUDED_FILES') != '') {
    $config['integrity.excluded.files'] = explode(',', getenv('OWNCLOUD_INTEGRITY_EXCLUDED_FILES'));
  }

  if (getenv('OWNCLOUD_INTEGRITY_IGNORE_MISSING_APP_SIGNATURE') != '') {
    $config['integrity.ignore.missing.app.signature'] = explode(',', getenv('OWNCLOUD_INTEGRITY_IGNORE_MISSING_APP_SIGNATURE'));
  }

  if (getenv('OWNCLOUD_SHARE_FOLDER') != '') {
    $config['share_folder'] = getenv('OWNCLOUD_SHARE_FOLDER');
  }

  if (getenv('OWNCLOUD_CIPHER') != '') {
    $config['cipher'] = getenv('OWNCLOUD_CIPHER');
  }

  if (getenv('OWNCLOUD_MINIMUM_SUPPORTED_DESKTOP_VERSION') != '') {
    $config['minimum.supported.desktop.version'] = getenv('OWNCLOUD_MINIMUM_SUPPORTED_DESKTOP_VERSION');
  }

  if (getenv('OWNCLOUD_QUOTA_INCLUDE_EXTERNAL_STORAGE') != '') {
    $config['quota_include_external_storage'] = getenv('OWNCLOUD_QUOTA_INCLUDE_EXTERNAL_STORAGE') === 'true';
  }

  if (getenv('OWNCLOUD_FILESYSTEM_CHECK_CHANGES') != '') {
    $config['filesystem_check_changes'] = (int) getenv('OWNCLOUD_FILESYSTEM_CHECK_CHANGES');
  }

  if (getenv('OWNCLOUD_PART_FILE_IN_STORAGE') != '') {
    $config['part_file_in_storage'] = getenv('OWNCLOUD_PART_FILE_IN_STORAGE') === 'true';
  }

  if (getenv('OWNCLOUD_MOUNT_FILE') != '') {
    $config['mount_file'] = getenv('OWNCLOUD_MOUNT_FILE');
  }

  if (getenv('OWNCLOUD_FILESYSTEM_CACHE_READONLY') != '') {
    $config['filesystem_cache_readonly'] = getenv('OWNCLOUD_FILESYSTEM_CACHE_READONLY') === 'true';
  }

  if (getenv('OWNCLOUD_SECRET') != '') {
    $config['secret'] = getenv('OWNCLOUD_SECRET');
  }

  if (getenv('OWNCLOUD_TRUSTED_PROXIES') != '') {
    $config['trusted_proxies'] = explode(',', getenv('OWNCLOUD_TRUSTED_PROXIES'));
  }

  if (getenv('OWNCLOUD_FORWARDED_FOR_HEADERS') != '') {
    $config['forwarded_for_headers'] = explode(',', getenv('OWNCLOUD_FORWARDED_FOR_HEADERS'));
  }

  if (getenv('OWNCLOUD_MAX_FILESIZE_ANIMATED_GIFS_PUBLIC_SHARING') != '') {
    $config['max_filesize_animated_gifs_public_sharing'] = (int) getenv('OWNCLOUD_MAX_FILESIZE_ANIMATED_GIFS_PUBLIC_SHARING');
  }

  if (getenv('OWNCLOUD_FILELOCKING_ENABLED') != '') {
    $config['filelocking.enabled'] = getenv('OWNCLOUD_FILELOCKING_ENABLED') === 'true';
  }

  if (getenv('OWNCLOUD_FILELOCKING_TTL') != '') {
    $config['filelocking.ttl'] = (int) getenv('OWNCLOUD_FILELOCKING_TTL');
  }

  if (getenv('OWNCLOUD_MEMCACHE_LOCKING') != '') {
    $config['memcache.locking'] = getenv('OWNCLOUD_MEMCACHE_LOCKING');
  }

  if (getenv('OWNCLOUD_UPGRADE_AUTOMATIC_APP_UPDATES') != '') {
    $config['upgrade.automatic-app-update'] = getenv('OWNCLOUD_UPGRADE_AUTOMATIC_APP_UPDATES') === 'true';
  }

  if (getenv('OWNCLOUD_DEBUG') != '') {
    $config['debug'] = getenv('OWNCLOUD_DEBUG') === 'true';
  }

  if (getenv('OWNCLOUD_FILES_EXTERNAL_ALLOW_NEW_LOCAL') != '') {
    $config['files_external_allow_create_new_local'] = getenv('OWNCLOUD_FILES_EXTERNAL_ALLOW_NEW_LOCAL') === 'true';
  }

  if (getenv('OWNCLOUD_SMB_LOGGING_ENABLE') != '') {
    $config['smb.logging.enable'] = getenv('OWNCLOUD_SMB_LOGGING_ENABLE');
  }

  if (getenv('OWNCLOUD_DAV_ENABLE_ASYNC') != '') {
    $config['dav.enable.async'] = getenv('OWNCLOUD_DAV_ENABLE_ASYNC');
  }

  if (getenv('OWNCLOUD_DAV_PROPFIND_DEPTH_INFINITY') != '') {
    $config['dav.propfind.depth_infinity'] = getenv('OWNCLOUD_DAV_PROPFIND_DEPTH_INFINITY') === 'true';
  }

  if (getenv('OWNCLOUD_POLLINTERVAL') != '') {
    $config['pollinterval'] = (int) getenv('OWNCLOUD_POLLINTERVAL');
  }

  if (getenv('OWNCLOUD_FILESYSTEM_MAX_MOUNTPOINT_MOVE_ATTEMPTS') != '') {
    $config['filesystem.max_mountpoint_move_attempts'] = (int) getenv('OWNCLOUD_FILESYSTEM_MAX_MOUNTPOINT_MOVE_ATTEMPTS');
  }

  if (getenv('OWNCLOUD_BLACKLISTED_FILES_REGEX') != '') {
    $config['blacklisted_files_regex'] = explode(',', getenv('OWNCLOUD_BLACKLISTED_FILES_REGEX'));
  }

  if (getenv('OWNCLOUD_EXCLUDED_DIRECTORIES_REGEX') != '') {
    $config['excluded_directories_regex'] = explode(',', getenv('OWNCLOUD_EXCLUDED_DIRECTORIES_REGEX'));
  }

  if (getenv('OWNCLOUD_SHARING_SHOW_PUBLIC_LINK_QUICK_ACTION') != '') {
    $config['sharing.showPublicLinkQuickAction'] = getenv('OWNCLOUD_SHARING_SHOW_PUBLIC_LINK_QUICK_ACTION') === 'true';
  }

  if (getenv('OWNCLOUD_TELEMETRY_ENABLED') != '') {
    $config['telemetry.enabled'] = getenv('OWNCLOUD_TELEMETRY_ENABLED') === 'true';
  }

  if (getenv('OWNCLOUD_GRACE_PERIOD_DEMO_KEY_SHOW_POPUP') != '') {
    $config['grace_period.demo_key.show_popup'] = getenv('OWNCLOUD_GRACE_PERIOD_DEMO_KEY_SHOW_POPUP') === 'true';
  }

  if (getenv('OWNCLOUD_GRACE_PERIOD_DEMO_KEY_LINK') != '') {
    $config['grace_period.demo_key.link'] = getenv('OWNCLOUD_GRACE_PERIOD_DEMO_KEY_LINK');
  }

  if (getenv('OWNCLOUD_LICENSE_KEY') != '') {
    $config['license-key'] = getenv('OWNCLOUD_LICENSE_KEY');
  }

  if (getenv('OWNCLOUD_LICENSE_CLASS') != '') {
    $config['license-class'] = getenv('OWNCLOUD_LICENSE_CLASS');
  }

  if (getenv('OWNCLOUD_MARKETPLACE_KEY') != '') {
    $config['marketplace.key'] = getenv('OWNCLOUD_MARKETPLACE_KEY');
  }

  if (getenv('OWNCLOUD_MARKETPLACE_CA') != '') {
    $config['marketplace.ca'] = getenv('OWNCLOUD_MARKETPLACE_CA');
  }

  if (getenv('OWNCLOUD_APPSTORE_ENABLED') != '') {
    $config['appstoreenabled'] = getenv('OWNCLOUD_APPSTORE_ENABLED') === 'true';
  }

  if (getenv('OWNCLOUD_APPSTORE_URL') != '') {
    $config['appstoreurl'] = getenv('OWNCLOUD_APPSTORE_URL');
  }

  if (getenv('OWNCLOUD_HTTP_COOKIE_SAMESITE') != '') {
    $config['http.cookie.samesite'] = getenv('OWNCLOUD_HTTP_COOKIE_SAMESITE');
  }

  if (getenv('OWNCLOUD_LOGIN_ALTERNATIVES') != '') {
    $rows = explode(',', getenv('OWNCLOUD_LOGIN_ALTERNATIVES'));

    foreach ($rows as $key => $value) {
      parse_str($value, $opts);
      $config['login.alternatives'][$key] = $opts;
    }
  }

  if (getenv('OWNCLOUD_LOGIN_POLICY_ORDER') != '') {
    $config['loginPolicy.order'] = explode(',', getenv('OWNCLOUD_LOGIN_POLICY_ORDER'));
  }

  if (getenv('OWNCLOUD_OPENSSL_CONFIG') != '') {
    $config['openssl'] = ['config' => getenv('OWNCLOUD_OPENSSL_CONFIG')];
  }

  if (getenv('OWNCLOUD_DB_PLATFORM') != '') {
    $config['db.platform'] = getenv('OWNCLOUD_DB_PLATFORM');
  }

  // app: admin_audit
  if (getenv('OWNCLOUD_ADMIN_AUDIT_GROUPS') != '') {
    $config['admin_audit.groups'] = explode(',', getenv('OWNCLOUD_ADMIN_AUDIT_GROUPS'));
  }

  // app: files_antivirus
  if (getenv('OWNCLOUD_ANTIVIRUS_AV_PATH') != '') {
    $config['files_antivirus.av_path'] = getenv('OWNCLOUD_ANTIVIRUS_AV_PATH');
  }

  if (getenv('OWNCLOUD_ANTIVIRUS_AV_CMD_OPTIONS') != '') {
    $config['files_antivirus.av_cmd_options'] = getenv('OWNCLOUD_ANTIVIRUS_AV_CMD_OPTIONS');
  }

  // app: files_pdfviewer
  if (getenv('OWNCLOUD_PDF_VIEWER_ENABLE_SCRIPTING') != '') {
    $config['files_pdfviewer.enableScripting'] = getenv('OWNCLOUD_PDF_VIEWER_ENABLE_SCRIPTING');
  }

  // app: firstrunwizard
  if (getenv('OWNCLOUD_CUSTOMCLIENT_DESKTOP') != '') {
    $config['customclient_desktop'] = getenv('OWNCLOUD_CUSTOMCLIENT_DESKTOP');
  }

  if (getenv('OWNCLOUD_CUSTOMCLIENT_ANDROID') != '') {
    $config['customclient_android'] = getenv('OWNCLOUD_CUSTOMCLIENT_ANDROID');
  }

  if (getenv('OWNCLOUD_CUSTOMCLIENT_IOS') != '') {
    $config['customclient_ios'] = getenv('OWNCLOUD_CUSTOMCLIENT_IOS');
  }

  // app: user_ldap
  if (getenv('OWNCLOUD_LDAP_IGNORE_NAMING_RULES') != '') {
    $config['ldapIgnoreNamingRules'] = getenv('OWNCLOUD_LDAP_IGNORE_NAMING_RULES') === 'true';
  }

  if (getenv('OWNCLOUD_USER_LDAP_ENABLE_MEDIAL_SEARCH') != '') {
    $config['user_ldap.enable_medial_search'] = getenv('OWNCLOUD_USER_LDAP_ENABLE_MEDIAL_SEARCH') === 'true';
  }

  // app: metrics (enterprise)
  if (getenv('OWNCLOUD_METRICS_SHARED_SECRET') != '') {
    $config['metrics_shared_secret'] = getenv('OWNCLOUD_METRICS_SHARED_SECRET');
  }

  // app: richdocuments
  if (getenv('OWNCLOUD_COLLABORA_GROUP') != '') {
    $config['collabora_group'] = getenv('OWNCLOUD_COLLABORA_GROUP');
  }

  // app: workflow (enterprise)
  if (getenv('OWNCLOUD_WORKFLOW_RETENTION_ENGINE') != '') {
    $config['workflow.retention_engine'] = getenv('OWNCLOUD_WORKFLOW_RETENTION_ENGINE');
  }

  // app: wopi / microsoft office online (enterprise)
  if (getenv('OWNCLOUD_WOPI_TOKEN_KEY') != '') {
    $config['wopi.token.key'] = getenv('OWNCLOUD_WOPI_TOKEN_KEY');
  }

  if (getenv('OWNCLOUD_WOPI_OFFICE_ONLINE_SERVER') != '') {
    $config['wopi.office-online.server'] = getenv('OWNCLOUD_WOPI_OFFICE_ONLINE_SERVER');
  }

  if (getenv('OWNCLOUD_WOPI_GROUP') != '') {
    $config['wopi_group'] = getenv('OWNCLOUD_WOPI_GROUP');
  }

  if (getenv('OWNCLOUD_WOPI_PROXY_URL') != '') {
    $config['wopi.proxy.url'] = getenv('OWNCLOUD_WOPI_PROXY_URL');
  }

  if (getenv('OWNCLOUD_WOPI_BUSINESS_FLOW_ENABLED') != '') {
    $config['wopi.business-flow.enabled'] = getenv('OWNCLOUD_WOPI_BUSINESS_FLOW_ENABLED');
  }

  // app: windows_network_drive (wnd) (enterprise)
  if (getenv('OWNCLOUD_WND_ACTIVITY_REGISTER_EXTENSION') != '') {
    $config['wnd.activity.registerExtension'] = getenv('OWNCLOUD_WND_ACTIVITY_REGISTER_EXTENSION') === 'true';
  }

  if (getenv('OWNCLOUD_WND_ACTIVITY_SEND_TO_SHAREES') != '') {
    $config['wnd.activity.sendToSharees'] = getenv('OWNCLOUD_WND_ACTIVITY_SEND_TO_SHAREES') === 'true';
  }

  if (getenv('OWNCLOUD_WND_CONNECTOR_OPTS_TIMEOUT') != '') {
    $config['wnd.connector.opts.timeout'] = (int) getenv('OWNCLOUD_WND_CONNECTOR_OPTS_TIMEOUT');
  }

  if (getenv('OWNCLOUD_WND_ERROR_CODES_PASSWORD_RESET') != '') {
    $config['wnd.errorCodes.passwordReset'] = array_map('intval', explode(',', getenv('OWNCLOUD_WND_ERROR_CODES_PASSWORD_RESET')));
  }

  if (getenv('OWNCLOUD_WND_FILE_INFO_PARSE_ATTRS_MODE') != '') {
    $config['wnd.fileInfo.parseAttrs.mode'] = getenv('OWNCLOUD_WND_FILE_INFO_PARSE_ATTRS_MODE');
  }

  if (getenv('OWNCLOUD_WND_GROUP_MEMBERSHIP_CHECK_USER_FIRST') != '') {
    $config['wnd.groupmembership.checkUserFirst'] = getenv('OWNCLOUD_WND_GROUP_MEMBERSHIP_CHECK_USER_FIRST') === 'true';
  }

  if (getenv('OWNCLOUD_WND_IN_MEMORY_NOTIFIER_ENABLE') != '') {
    $config['wnd.in_memory_notifier.enable'] = getenv('OWNCLOUD_WND_IN_MEMORY_NOTIFIER_ENABLE') === 'true';
  }

  if (getenv('OWNCLOUD_WND_LISTEN_EVENTS_SMB_ACL') != '') {
    $config['wnd.listen_events.smb_acl'] = getenv('OWNCLOUD_WND_LISTEN_EVENTS_SMB_ACL') === 'true';
  }

  if (getenv('OWNCLOUD_WND_LISTEN_RECONNECT_AFTER_TIME') != '') {
    $config['wnd.listen.reconnectAfterTime'] = (int) getenv('OWNCLOUD_WND_LISTEN_RECONNECT_AFTER_TIME');
  }

  if (getenv('OWNCLOUD_WND_LOGGING_ENABLE') != '') {
    $config['wnd.logging.enable'] = getenv('OWNCLOUD_WND_LOGGING_ENABLE') === 'true';
  }

  if (getenv('OWNCLOUD_WND_PERMISSION_MANAGER_CACHE_SIZE') != '') {
    $config['wnd.permissionmanager.cache.size'] = (int) getenv('OWNCLOUD_WND_PERMISSION_MANAGER_CACHE_SIZE');
  }

  if (getenv('OWNCLOUD_WND2_CACHE_WRAPPER_NORMALIZE') != '') {
    $config['wnd2.cachewrapper.normalize'] = getenv('OWNCLOUD_WND2_CACHE_WRAPPER_NORMALIZE') === 'true';
  }

  if (getenv('OWNCLOUD_WND2_CACHE_WRAPPER_TTL') != '') {
    $config['wnd2.cachewrapper.ttl'] = (int) getenv('OWNCLOUD_WND2_CACHE_WRAPPER_TTL');
  }

  switch (true) {
    case getenv('OWNCLOUD_REDIS_ENABLED') && getenv('OWNCLOUD_REDIS_ENABLED') === 'true':
      $config = array_merge_recursive($config, [
        'memcache.distributed' => '\OC\Memcache\Redis',
        'memcache.locking' => '\OC\Memcache\Redis',
      ]);
      switch (true) {
        case getenv('OWNCLOUD_REDIS_SEEDS') != '':
          $config['redis.cluster']['seeds'] = explode(',', getenv('OWNCLOUD_REDIS_SEEDS'));

          if (getenv('OWNCLOUD_REDIS_PASSWORD') != '') {
            $config['redis.cluster']['password'] = getenv('OWNCLOUD_REDIS_PASSWORD');
          }

          if (getenv('OWNCLOUD_REDIS_TIMEOUT') != '') {
            $config['redis.cluster']['timeout'] = (float) getenv('OWNCLOUD_REDIS_TIMEOUT');
          }

          if (getenv('OWNCLOUD_REDIS_READ_TIMEOUT') != '') {
            $config['redis.cluster']['read_timeout'] = (float) getenv('OWNCLOUD_REDIS_READ_TIMEOUT');
          }

          if (getenv('OWNCLOUD_REDIS_FAILOVER_MODE') != '') {
            switch (getenv('OWNCLOUD_REDIS_FAILOVER_MODE')) {
              case 'FAILOVER_NONE':
                $config['redis.cluster']['failover_mode'] = \RedisCluster::FAILOVER_NONE;
              case 'FAILOVER_ERROR':
                $config['redis.cluster']['failover_mode'] = \RedisCluster::FAILOVER_ERROR;
              case 'FAILOVER_DISTRIBUTE':
                $config['redis.cluster']['failover_mode'] = \RedisCluster::FAILOVER_DISTRIBUTE;
            }
          }

          if (getenv('OWNCLOUD_REDIS_TLS_CAFILE') != '') {
            $config['redis.cluster']['connection_parameters']['cafile'] = getenv('OWNCLOUD_REDIS_TLS_CAFILE');
          }

          if (getenv('OWNCLOUD_REDIS_TLS_CAPATH') != '') {
            $config['redis.cluster']['connection_parameters']['capath'] = getenv('OWNCLOUD_REDIS_TLS_CAPATH');
          }

          if (getenv('OWNCLOUD_REDIS_TLS_LOCAL_CERT') != '') {
            $config['redis.cluster']['connection_parameters']['local_cert'] = getenv('OWNCLOUD_REDIS_TLS_LOCAL_CERT');
          }

          if (getenv('OWNCLOUD_REDIS_TLS_LOCAL_PK') != '') {
            $config['redis.cluster']['connection_parameters']['local_pk'] = getenv('OWNCLOUD_REDIS_TLS_LOCAL_PK');
          }

          if (getenv('OWNCLOUD_REDIS_TLS_PASSPHRASE') != '') {
            $config['redis.cluster']['connection_parameters']['passphrase'] = getenv('OWNCLOUD_REDIS_TLS_PASSPHRASE');
          }

          if (getenv('OWNCLOUD_REDIS_TLS_CIPHERS') != '') {
            $config['redis.cluster']['connection_parameters']['ciphers'] = getenv('OWNCLOUD_REDIS_TLS_CIPHERS');
          }

          if (getenv('OWNCLOUD_REDIS_TLS_PEER_NAME') != '') {
            $config['redis.cluster']['connection_parameters']['peer_name'] = getenv('OWNCLOUD_REDIS_TLS_PEER_NAME');
          }

          if (getenv('OWNCLOUD_REDIS_TLS_VERIFY_PEER') != '') {
            $config['redis.cluster']['connection_parameters']['verify_peer'] = getenv('OWNCLOUD_REDIS_TLS_VERIFY_PEER') === 'true';
          }

          if (getenv('OWNCLOUD_REDIS_TLS_VERIFY_PEER_NAME') != '') {
            $config['redis.cluster']['connection_parameters']['verify_peer_name'] = getenv('OWNCLOUD_REDIS_TLS_VERIFY_PEER_NAME') === 'true';
          }

          if (getenv('OWNCLOUD_REDIS_TLS_ALLOW_SELF_SIGNED') != '') {
            $config['redis.cluster']['connection_parameters']['allow_self_signed'] = getenv('OWNCLOUD_REDIS_TLS_ALLOW_SELF_SIGNED') === 'true';
          }

        case getenv('OWNCLOUD_REDIS_HOST') != '' && getenv('OWNCLOUD_REDIS_SEEDS') == '':
          $config['redis']['host'] = getenv('OWNCLOUD_REDIS_HOST');
          $config['redis']['port'] = getenv('OWNCLOUD_REDIS_PORT');

          if (getenv('OWNCLOUD_REDIS_DB') != '') {
            $config['redis']['dbindex'] = getenv('OWNCLOUD_REDIS_DB');
          }

          if (getenv('OWNCLOUD_REDIS_PASSWORD') != '') {
            $config['redis']['password'] = getenv('OWNCLOUD_REDIS_PASSWORD');
          }

          if (getenv('OWNCLOUD_REDIS_TIMEOUT') != '') {
            $config['redis']['timeout'] = (float) getenv('OWNCLOUD_REDIS_TIMEOUT');
          }

          if (getenv('OWNCLOUD_REDIS_TLS_CAFILE') != '') {
            $config['redis']['connection_parameters']['stream']['cafile'] = getenv('OWNCLOUD_REDIS_TLS_CAFILE');
          }

          if (getenv('OWNCLOUD_REDIS_TLS_CAPATH') != '') {
            $config['redis']['connection_parameters']['stream']['capath'] = getenv('OWNCLOUD_REDIS_TLS_CAPATH');
          }

          if (getenv('OWNCLOUD_REDIS_TLS_LOCAL_CERT') != '') {
            $config['redis']['connection_parameters']['stream']['local_cert'] = getenv('OWNCLOUD_REDIS_TLS_LOCAL_CERT');
          }

          if (getenv('OWNCLOUD_REDIS_TLS_LOCAL_PK') != '') {
            $config['redis']['connection_parameters']['stream']['local_pk'] = getenv('OWNCLOUD_REDIS_TLS_LOCAL_PK');
          }

          if (getenv('OWNCLOUD_REDIS_TLS_PASSPHRASE') != '') {
            $config['redis']['connection_parameters']['stream']['passphrase'] = getenv('OWNCLOUD_REDIS_TLS_PASSPHRASE');
          }

          if (getenv('OWNCLOUD_REDIS_TLS_CIPHERS') != '') {
            $config['redis']['connection_parameters']['stream']['ciphers'] = getenv('OWNCLOUD_REDIS_TLS_CIPHERS');
          }

          if (getenv('OWNCLOUD_REDIS_TLS_PEER_NAME') != '') {
            $config['redis']['connection_parameters']['stream']['peer_name'] = getenv('OWNCLOUD_REDIS_TLS_PEER_NAME');
          }

          if (getenv('OWNCLOUD_REDIS_TLS_VERIFY_PEER') != '') {
            $config['redis']['connection_parameters']['stream']['verify_peer'] = getenv('OWNCLOUD_REDIS_TLS_VERIFY_PEER') === 'true';
          }

          if (getenv('OWNCLOUD_REDIS_TLS_VERIFY_PEER_NAME') != '') {
            $config['redis']['connection_parameters']['stream']['verify_peer_name'] = getenv('OWNCLOUD_REDIS_TLS_VERIFY_PEER_NAME') === 'true';
          }

          if (getenv('OWNCLOUD_REDIS_TLS_ALLOW_SELF_SIGNED') != '') {
            $config['redis']['connection_parameters']['stream']['allow_self_signed'] = getenv('OWNCLOUD_REDIS_TLS_ALLOW_SELF_SIGNED') === 'true';
          }
      }

      break;
    case getenv('OWNCLOUD_MEMCACHED_ENABLED') && getenv('OWNCLOUD_MEMCACHED_ENABLED') === 'true':
      $config = array_merge_recursive($config, [
        'memcache.distributed' => '\OC\Memcache\Memcached',
        'memcache.locking' => '\OC\Memcache\Memcached',

        'memcached_servers' => [
          [
            getenv('OWNCLOUD_MEMCACHED_HOST'),
            getenv('OWNCLOUD_MEMCACHED_PORT'),
          ],
        ],
      ]);

      if (getenv('OWNCLOUD_MEMCACHED_OPTIONS') != '') {
        parse_str(getenv('OWNCLOUD_MEMCACHED_OPTIONS'), $opts);

        foreach($opts as $key => $value) {
          $config['memcached_options'][constant($key)] = $value;
        }
      }

      break;
  }

  return $config;
}

$CONFIG = getConfigFromEnv();
