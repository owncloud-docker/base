# Changelog

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

## 2018-06-12

* Fixed
  * Escape shell scripts within find [#45](https://github.com/owncloud-docker/base/issues/45)
  * Allow quotes and spaces for occ command [#46](https://github.com/owncloud-docker/base/issues/46)
