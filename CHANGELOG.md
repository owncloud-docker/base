# Changelog

## 2026-07-09

* Added
  * Env variable `OWNCLOUD_OPENID_CONNECT` for the `openid-connect` app config key
    [#492](https://github.com/owncloud-docker/base/issues/492)

## 2026-07-08

* Added
  * Env variable `OWNCLOUD_USER_BACKENDS` for the `user_backends` config key
    [#490](https://github.com/owncloud-docker/base/issues/490)
  * Env variables `OWNCLOUD_CUSTOMGROUPS_DISALLOW_ADMIN_ACCESS_ALL` and
    `OWNCLOUD_CUSTOMGROUPS_DISALLOWED_GROUPS` for the `customgroups.*` config keys
    [#491](https://github.com/owncloud-docker/base/issues/491)
  * Env variable `OWNCLOUD_LOGIN_POLICY_GROUP_FORBID_MAP` for the
    `loginPolicy.groupLoginPolicy.forbidMap` config key
    [#493](https://github.com/owncloud-docker/base/issues/493)

## 2026-07-06

* Added
  * OSPO community health files (agents.md, CODE_OF_CONDUCT.md, CONTRIBUTING.md,
    SECURITY.md, SUPPORT.md) and README community/OSPO sections as part of the
    Kiteworks OSPO community health rollout v2

## 2020-05-25

* Added
  * Add Ubuntu 20.04 for owncloud-community-10.5.0beta1

## 2020-02-06

* Added
  * Add env variables for redis session handler

## 2020-03-10

* Fixed
  * Split HTTP_X_FORWARDED_HOST for getting first domain

## 2020-02-06

* Added
  * Add env variables for redis session handler

## 2019-10-16

* Changed
  * Switch to single branch development
  * Use drone starlark instead of yaml
  * Prepare multi architecture support

## 2019-07-29

* Removed
  * Drop docker and docker-compose examples

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
