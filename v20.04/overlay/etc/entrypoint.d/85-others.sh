#!/usr/bin/env bash

declare -x OWNCLOUD_CORS_ALLOWED_DOMAINS
[[ -z "${OWNCLOUD_CORS_ALLOWED_DOMAINS}" ]] && OWNCLOUD_CORS_ALLOWED_DOMAINS=""

declare -x OWNCLOUD_VERSION_HIDE
[[ -z "${OWNCLOUD_VERSION_HIDE}" ]] && OWNCLOUD_VERSION_HIDE=""

declare -x OWNCLOUD_SHOW_SERVER_HOSTNAME
[[ -z "${OWNCLOUD_SHOW_SERVER_HOSTNAME}" ]] && OWNCLOUD_SHOW_SERVER_HOSTNAME=""

declare -x OWNCLOUD_DEFAULT_APP
[[ -z "${OWNCLOUD_DEFAULT_APP}" ]] && OWNCLOUD_DEFAULT_APP=""

declare -x OWNCLOUD_KNOWLEDGEBASE_ENABLED
[[ -z "${OWNCLOUD_KNOWLEDGEBASE_ENABLED}" ]] && OWNCLOUD_KNOWLEDGEBASE_ENABLED=""

declare -x OWNCLOUD_ENABLE_AVATARS
[[ -z "${OWNCLOUD_ENABLE_AVATARS}" ]] && OWNCLOUD_ENABLE_AVATARS=""

declare -x OWNCLOUD_ALLOW_USER_TO_CHANGE_DISPLAY_NAME
[[ -z "${OWNCLOUD_ALLOW_USER_TO_CHANGE_DISPLAY_NAME}" ]] && OWNCLOUD_ALLOW_USER_TO_CHANGE_DISPLAY_NAME=""

declare -x OWNCLOUD_REMEMBER_LOGIN_COOKIE_LIFETIME
[[ -z "${OWNCLOUD_REMEMBER_LOGIN_COOKIE_LIFETIME}" ]] && OWNCLOUD_REMEMBER_LOGIN_COOKIE_LIFETIME=""

declare -x OWNCLOUD_SESSION_FORCED_LOGOUT_TIMEOUT
[[ -z "${OWNCLOUD_SESSION_FORCED_LOGOUT_TIMEOUT}" ]] && OWNCLOUD_SESSION_FORCED_LOGOUT_TIMEOUT=""

declare -x OWNCLOUD_SESSION_LIFETIME
[[ -z "${OWNCLOUD_SESSION_LIFETIME}" ]] && OWNCLOUD_SESSION_LIFETIME=""

declare -x OWNCLOUD_SESSION_KEEPALIVE
[[ -z "${OWNCLOUD_SESSION_KEEPALIVE}" ]] && OWNCLOUD_SESSION_KEEPALIVE=""

declare -x OWNCLOUD_TOKEN_AUTH_ENFORCED
[[ -z "${OWNCLOUD_TOKEN_AUTH_ENFORCED}" ]] && OWNCLOUD_TOKEN_AUTH_ENFORCED=""

declare -x OWNCLOUD_LOGIN_ALTERNATIVES
[[ -z "${OWNCLOUD_LOGIN_ALTERNATIVES}" ]] && OWNCLOUD_LOGIN_ALTERNATIVES=""

declare -x OWNCLOUD_CSRF_DISABLED
[[ -z "${OWNCLOUD_CSRF_DISABLED}" ]] && OWNCLOUD_CSRF_DISABLED=""

declare -x OWNCLOUD_SKELETON_DIRECTORY
[[ -z "${OWNCLOUD_SKELETON_DIRECTORY}" ]] && OWNCLOUD_SKELETON_DIRECTORY=""

declare -x OWNCLOUD_LOST_PASSWORD_LINK
[[ -z "${OWNCLOUD_LOST_PASSWORD_LINK}" ]] && OWNCLOUD_LOST_PASSWORD_LINK=""

declare -x OWNCLOUD_ACCOUNTS_ENABLE_MEDIAL_SEARCH
[[ -z "${OWNCLOUD_ACCOUNTS_ENABLE_MEDIAL_SEARCH}" ]] && OWNCLOUD_ACCOUNTS_ENABLE_MEDIAL_SEARCH=""

declare -x OWNCLOUD_USER_SEARCH_MIN_LENGTH
[[ -z "${OWNCLOUD_USER_SEARCH_MIN_LENGTH}" ]] && OWNCLOUD_USER_SEARCH_MIN_LENGTH=""

declare -x OWNCLOUD_OVERWRITE_HOST
[[ -z "${OWNCLOUD_OVERWRITE_HOST}" ]] && OWNCLOUD_OVERWRITE_HOST=""

declare -x OWNCLOUD_OVERWRITE_PROTOCOL
[[ -z "${OWNCLOUD_OVERWRITE_PROTOCOL}" ]] && OWNCLOUD_OVERWRITE_PROTOCOL=""

declare -x OWNCLOUD_OVERWRITE_WEBROOT
[[ -z "${OWNCLOUD_OVERWRITE_WEBROOT}" ]] && OWNCLOUD_OVERWRITE_WEBROOT=""

declare -x OWNCLOUD_OVERWRITE_COND_ADDR
[[ -z "${OWNCLOUD_OVERWRITE_COND_ADDR}" ]] && OWNCLOUD_OVERWRITE_COND_ADDR=""

declare -x OWNCLOUD_OVERWRITE_CLI_URL
[[ -z "${OWNCLOUD_OVERWRITE_CLI_URL}" ]] && OWNCLOUD_OVERWRITE_CLI_URL="${OWNCLOUD_PROTOCOL}://${OWNCLOUD_DOMAIN}${OWNCLOUD_SUB_URL}"

declare -x OWNCLOUD_HTACCESS_REWRITE_BASE
[[ -z "${OWNCLOUD_HTACCESS_REWRITE_BASE}" ]] && OWNCLOUD_HTACCESS_REWRITE_BASE="${OWNCLOUD_SUB_URL}"

declare -x OWNCLOUD_PROXY
[[ -z "${OWNCLOUD_PROXY}" ]] && OWNCLOUD_PROXY=""

declare -x OWNCLOUD_PROXY_USERPWD
[[ -z "${OWNCLOUD_PROXY_USERPWD}" ]] && OWNCLOUD_PROXY_USERPWD=""

declare -x OWNCLOUD_TRASHBIN_RETENTION_OBLIGATION
[[ -z "${OWNCLOUD_TRASHBIN_RETENTION_OBLIGATION}" ]] && OWNCLOUD_TRASHBIN_RETENTION_OBLIGATION=""

declare -x OWNCLOUD_TRASHBIN_PURGE_LIMIT
[[ -z "${OWNCLOUD_TRASHBIN_PURGE_LIMIT}" ]] && OWNCLOUD_TRASHBIN_PURGE_LIMIT=""

declare -x OWNCLOUD_VERSIONS_RETENTION_OBLIGATION
[[ -z "${OWNCLOUD_VERSIONS_RETENTION_OBLIGATION}" ]] && OWNCLOUD_VERSIONS_RETENTION_OBLIGATION=""

declare -x OWNCLOUD_UPDATE_CHECKER
[[ -z "${OWNCLOUD_UPDATE_CHECKER}" ]] && OWNCLOUD_UPDATE_CHECKER=""

declare -x OWNCLOUD_UPDATER_SERVER_URL
[[ -z "${OWNCLOUD_UPDATER_SERVER_URL}" ]] && OWNCLOUD_UPDATER_SERVER_URL=""

declare -x OWNCLOUD_HAS_INTERNET_CONNECTION
[[ -z "${OWNCLOUD_HAS_INTERNET_CONNECTION}" ]] && OWNCLOUD_HAS_INTERNET_CONNECTION=""

declare -x OWNCLOUD_CHECK_FOR_WORKING_WELLKNOWN_SETUP
[[ -z "${OWNCLOUD_CHECK_FOR_WORKING_WELLKNOWN_SETUP}" ]] && OWNCLOUD_CHECK_FOR_WORKING_WELLKNOWN_SETUP=""

declare -x OWNCLOUD_OPERATION_MODE
[[ -z "${OWNCLOUD_OPERATION_MODE}" ]] && OWNCLOUD_OPERATION_MODE=""

declare -x OWNCLOUD_ENABLE_PREVIEWS
[[ -z "${OWNCLOUD_ENABLE_PREVIEWS}" ]] && OWNCLOUD_ENABLE_PREVIEWS=""

declare -x OWNCLOUD_PREVIEW_MAX_X
[[ -z "${OWNCLOUD_PREVIEW_MAX_X}" ]] && OWNCLOUD_PREVIEW_MAX_X=""

declare -x OWNCLOUD_PREVIEW_MAX_Y
[[ -z "${OWNCLOUD_PREVIEW_MAX_Y}" ]] && OWNCLOUD_PREVIEW_MAX_Y=""

declare -x OWNCLOUD_PREVIEW_MAX_SCALE_FACTOR
[[ -z "${OWNCLOUD_PREVIEW_MAX_SCALE_FACTOR}" ]] && OWNCLOUD_PREVIEW_MAX_SCALE_FACTOR=""

declare -x OWNCLOUD_PREVIEW_MAX_FILESIZE_IMAGE
[[ -z "${OWNCLOUD_PREVIEW_MAX_FILESIZE_IMAGE}" ]] && OWNCLOUD_PREVIEW_MAX_FILESIZE_IMAGE=""

declare -x OWNCLOUD_PREVIEW_LIBREOFFICE_PATH
[[ -z "${OWNCLOUD_PREVIEW_LIBREOFFICE_PATH}" ]] && OWNCLOUD_PREVIEW_LIBREOFFICE_PATH=""

declare -x OWNCLOUD_PREVIEW_OFFICE_CL_PARAMETERS
[[ -z "${OWNCLOUD_PREVIEW_OFFICE_CL_PARAMETERS}" ]] && OWNCLOUD_PREVIEW_OFFICE_CL_PARAMETERS=""

declare -x OWNCLOUD_ENABLED_PREVIEW_PROVIDERS
[[ -z "${OWNCLOUD_ENABLED_PREVIEW_PROVIDERS}" ]] && OWNCLOUD_ENABLED_PREVIEW_PROVIDERS=""

declare -x OWNCLOUD_PREVIEW_MAX_DIMENSIONS
[[ -z "${OWNCLOUD_PREVIEW_MAX_DIMENSIONS}" ]] && OWNCLOUD_PREVIEW_MAX_DIMENSIONS=""

declare -x OWNCLOUD_COMMENTS_MANAGER_FACTORY
[[ -z "${OWNCLOUD_COMMENTS_MANAGER_FACTORY}" ]] && OWNCLOUD_COMMENTS_MANAGER_FACTORY=""

declare -x OWNCLOUD_SYSTEMTAGS_MANAGER_FACTORY
[[ -z "${OWNCLOUD_SYSTEMTAGS_MANAGER_FACTORY}" ]] && OWNCLOUD_SYSTEMTAGS_MANAGER_FACTORY=""

declare -x OWNCLOUD_ENABLE_CERTIFICATE_MANAGEMENT
[[ -z "${OWNCLOUD_ENABLE_CERTIFICATE_MANAGEMENT}" ]] && OWNCLOUD_ENABLE_CERTIFICATE_MANAGEMENT=""

declare -x OWNCLOUD_CACHE_CHUNK_GC_TTL
[[ -z "${OWNCLOUD_CACHE_CHUNK_GC_TTL}" ]] && OWNCLOUD_CACHE_CHUNK_GC_TTL=""

declare -x OWNCLOUD_DAV_CHUNK_BASE_DIR
[[ -z "${OWNCLOUD_DAV_CHUNK_BASE_DIR}" ]] && OWNCLOUD_DAV_CHUNK_BASE_DIR=""

declare -x OWNCLOUD_SHARING_MANAGER_FACTORY
[[ -z "${OWNCLOUD_SHARING_MANAGER_FACTORY}" ]] && OWNCLOUD_SHARING_MANAGER_FACTORY=""

declare -x OWNCLOUD_SHARING_FEDERATION_ALLOW_HTTP_FALLBACK
[[ -z "${OWNCLOUD_SHARING_FEDERATION_ALLOW_HTTP_FALLBACK}" ]] && OWNCLOUD_SHARING_FEDERATION_ALLOW_HTTP_FALLBACK=""

declare -x OWNCLOUD_TEMP_DIRECTORY
[[ -z "${OWNCLOUD_TEMP_DIRECTORY}" ]] && OWNCLOUD_TEMP_DIRECTORY=""

declare -x OWNCLOUD_HASHING_COST
[[ -z "${OWNCLOUD_HASHING_COST}" ]] && OWNCLOUD_HASHING_COST=""

declare -x OWNCLOUD_BLACKLISTED_FILES
[[ -z "${OWNCLOUD_BLACKLISTED_FILES}" ]] && OWNCLOUD_BLACKLISTED_FILES=""

declare -x OWNCLOUD_EXCLUDED_DIRECTORIES
[[ -z "${OWNCLOUD_EXCLUDED_DIRECTORIES}" ]] && OWNCLOUD_EXCLUDED_DIRECTORIES=""

declare -x OWNCLOUD_INTEGRITY_EXCLUDED_FILES
[[ -z "${OWNCLOUD_INTEGRITY_EXCLUDED_FILES}" ]] && OWNCLOUD_INTEGRITY_EXCLUDED_FILES=""

declare -x OWNCLOUD_INTEGRITY_IGNORE_MISSING_APP_SIGNATURE
[[ -z "${OWNCLOUD_INTEGRITY_IGNORE_MISSING_APP_SIGNATURE}" ]] && OWNCLOUD_INTEGRITY_IGNORE_MISSING_APP_SIGNATURE=""

declare -x OWNCLOUD_SHARE_FOLDER
[[ -z "${OWNCLOUD_SHARE_FOLDER}" ]] && OWNCLOUD_SHARE_FOLDER=""

declare -x OWNCLOUD_MINIMUM_SUPPORTED_DESKTOP_VERSION
[[ -z "${OWNCLOUD_MINIMUM_SUPPORTED_DESKTOP_VERSION}" ]] && OWNCLOUD_MINIMUM_SUPPORTED_DESKTOP_VERSION=""

declare -x OWNCLOUD_QUOTA_INCLUDE_EXTERNAL_STORAGE
[[ -z "${OWNCLOUD_QUOTA_INCLUDE_EXTERNAL_STORAGE}" ]] && OWNCLOUD_QUOTA_INCLUDE_EXTERNAL_STORAGE=""

declare -x OWNCLOUD_FILESYSTEM_CHECK_CHANGES
[[ -z "${OWNCLOUD_FILESYSTEM_CHECK_CHANGES}" ]] && OWNCLOUD_FILESYSTEM_CHECK_CHANGES=""

declare -x OWNCLOUD_PART_FILE_IN_STORAGE
[[ -z "${OWNCLOUD_PART_FILE_IN_STORAGE}" ]] && OWNCLOUD_PART_FILE_IN_STORAGE=""

declare -x OWNCLOUD_MOUNT_FILE
[[ -z "${OWNCLOUD_MOUNT_FILE}" ]] && OWNCLOUD_MOUNT_FILE=""

declare -x OWNCLOUD_FILESYSTEM_CACHE_READONLY
[[ -z "${OWNCLOUD_FILESYSTEM_CACHE_READONLY}" ]] && OWNCLOUD_FILESYSTEM_CACHE_READONLY=""

declare -x OWNCLOUD_TRUSTED_PROXIES
[[ -z "${OWNCLOUD_TRUSTED_PROXIES}" ]] && OWNCLOUD_TRUSTED_PROXIES=""

declare -x OWNCLOUD_FORWARDED_FOR_HEADERS
[[ -z "${OWNCLOUD_FORWARDED_FOR_HEADERS}" ]] && OWNCLOUD_FORWARDED_FOR_HEADERS=""

declare -x OWNCLOUD_MAX_FILESIZE_ANIMATED_GIFS_PUBLIC_SHARING
[[ -z "${OWNCLOUD_MAX_FILESIZE_ANIMATED_GIFS_PUBLIC_SHARING}" ]] && OWNCLOUD_MAX_FILESIZE_ANIMATED_GIFS_PUBLIC_SHARING=""

declare -x OWNCLOUD_FILELOCKING_TTL
[[ -z "${OWNCLOUD_FILELOCKING_TTL}" ]] && OWNCLOUD_FILELOCKING_TTL=""

declare -x OWNCLOUD_MEMCACHE_LOCKING
[[ -z "${OWNCLOUD_MEMCACHE_LOCKING}" ]] && OWNCLOUD_MEMCACHE_LOCKING=""

declare -x OWNCLOUD_UPGRADE_AUTOMATIC_APP_UPDATES
[[ -z "${OWNCLOUD_UPGRADE_AUTOMATIC_APP_UPDATES}" ]] && OWNCLOUD_UPGRADE_AUTOMATIC_APP_UPDATES=""

declare -x OWNCLOUD_FILES_EXTERNAL_ALLOW_NEW_LOCAL
[[ -z "${OWNCLOUD_FILES_EXTERNAL_ALLOW_NEW_LOCAL}" ]] && OWNCLOUD_FILES_EXTERNAL_ALLOW_NEW_LOCAL="${OWNCLOUD_ALLOW_EXTERNAL_LOCAL_STORAGE}"

declare -x OWNCLOUD_SMB_LOGGING_ENABLE
[[ -z "${OWNCLOUD_SMB_LOGGING_ENABLE}" ]] && OWNCLOUD_SMB_LOGGING_ENABLE=""

declare -x OWNCLOUD_DAV_ENABLE_ASYNC
[[ -z "${OWNCLOUD_DAV_ENABLE_ASYNC}" ]] && OWNCLOUD_DAV_ENABLE_ASYNC=""

declare -x OWNCLOUD_ENTRYPOINT_INITIALIZED
[[ -z "${OWNCLOUD_ENTRYPOINT_INITIALIZED}" ]] && OWNCLOUD_ENTRYPOINT_INITIALIZED="true"

declare -x OWNCLOUD_HTTP_COOKIE_SAMESITE
[[ -z "${OWNCLOUD_HTTP_COOKIE_SAMESITE}" ]] && OWNCLOUD_HTTP_COOKIE_SAMESITE=""

declare -x OWNCLOUD_ENABLE_OIDC_REWRITE_URL
[[ -z "${OWNCLOUD_ENABLE_OIDC_REWRITE_URL}" ]] && OWNCLOUD_ENABLE_OIDC_REWRITE_URL="false"

declare -x OWNCLOUD_PHP_DISABLE_FUNCTIONS
[[ -z "${OWNCLOUD_PHP_DISABLE_FUNCTIONS}" ]] && OWNCLOUD_PHP_DISABLE_FUNCTIONS="pcntl_alarm,pcntl_fork,pcntl_waitpid,pcntl_wait,pcntl_wifexited,pcntl_wifstopped,pcntl_wifsignaled,pcntl_wifcontinued,pcntl_wexitstatus,pcntl_wtermsig,pcntl_wstopsig,pcntl_signal,pcntl_signal_get_handler,pcntl_signal_dispatch,pcntl_get_last_error,pcntl_strerror,pcntl_sigprocmask,pcntl_sigwaitinfo,pcntl_sigtimedwait,pcntl_exec,pcntl_getpriority,pcntl_setpriority,pcntl_async_signals,pcntl_unshare,system,phpinfo,show_source,fopen_with_path,dbmopen,dbase_open,filepro_retrieve,posix_mkfifo"

declare -x OWNCLOUD_IOC_SCANNER_CONFIRMATION
[[ -z "${OWNCLOUD_IOC_SCANNER_CONFIRMATION}" ]] && OWNCLOUD_IOC_SCANNER_CONFIRMATION=""

true
