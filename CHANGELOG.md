# Changelog

## 2018-12-17

* Fixed
  * Only touch logfile if it does not exist
  * Fix apache default output to stdout

## 2018-10-18

* Fixed
  * Fix chown to `www-data:root`, these are correct perms

## 2018-10-12

* Fixed
  * Load objectstore config later in the processing

## 2018-10-09

* Added
  * Added scripts folder before and after cronjob
  * Test built image with Clair before publishing
* Changed
  * Change to environment-based configuration
  * Reduce amount of shell script magic
  * Use the new `owncloud/php` Docker image
  * Combined `owncloud-*` scripts to `owncloud`
  * Moved templates to `/etc/templates`
  * Reduced amount of required templates
* Removed
  * Removed Apache configuration, part of base image now
  * Removed `/usr/local/bin` scripts, moved to `/usr/bin`
* Deprecated
  * Replaced env variable `OWNCLOUD_MARKETPLACE_URL` with `OWNCLOUD_APPSTORE_URL`
  * Replaced env variable `OWNCLOUD_LOCKING_ENABLED` with `OWNCLOUD_FILELOCKING_ENABLED`
  * Replaced env variable `OWNCLOUD_ALLOW_EXTERNAL_LOCAL_STORAGE` with `OWNCLOUD_FILES_EXTERNAL_ALLOW_NEW_LOCAL`
  * Replaced env variable `OWNCLOUD_LOGSIZE` with `OWNCLOUD_LOG_ROTATE_SIZE`
  * Replaced env variable `OWNCLOUD_MAINTENANCE_MODE` with `OWNCLOUD_MAINTENANCE`
  * Replaced env variable `OWNCLOUD_MARKETPLACE_APIKEY` with `OWNCLOUD_MARKETPLACE_KEY`
  * Replaced env variable `OWNCLOUD_CACHING_CLASS` with `OWNCLOUD_MEMCACHE_LOCAL`
  * Replaced env variable `OWNCLOUD_UTF8MB4_ENABLED` with `OWNCLOUD_MYSQL_UTF8MB4`

## 2018-06-12

* Fixed
  * Escape shell scripts within find [#45](https://github.com/owncloud-docker/base/issues/45)
  * Allow quotes and spaces for occ command [#46](https://github.com/owncloud-docker/base/issues/46)
