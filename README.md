# ownCloud: Base

[![](https://images.microbadger.com/badges/image/owncloud/base.svg)](https://microbadger.com/images/owncloud/base "Get your own image badge on microbadger.com")

This is our basic ownCloud webserver image that shares the functionality for the ownCloud community and enterprise edition, it is based on our [Ubuntu container](https://registry.hub.docker.com/u/owncloud/ubuntu/).


## Build locally

The available versions should be already pushed to the Docker Hub, but in case you want to try a change locally you can always execute the following command to get this image built locally:

```
IMAGE_NAME=owncloud/base:latest ./hooks/build
```


## Versions

To get an overview about the available versions please take a look at the [GitHub branches](https://github.com/owncloud-docker/base/branches/all) or our [Docker Hub tags](https://hub.docker.com/r/owncloud/base/tags/), these lists are always up to date.


## Volumes

* /mnt/data


## Ports

* 80
* 443


## Available environment variables

```
OWNCLOUD_DOMAIN localhost
OWNCLOUD_LOGLEVEL 0
OWNCLOUD_MAX_UPLOAD 20G
OWNCLOUD_MAX_EXECUTION_TIME 3600
OWNCLOUD_MAX_INPUT_TIME 3600
OWNCLOUD_DEFAULT_LANGUAGE en
OWNCLOUD_CROND_ENABLED true
OWNCLOUD_DB_TYPE sqlite
OWNCLOUD_DB_HOST
OWNCLOUD_DB_NAME owncloud
OWNCLOUD_DB_USERNAME
OWNCLOUD_DB_PASSWORD
OWNCLOUD_DB_PREFIX oc_
OWNCLOUD_DB_TIMEOUT 180
OWNCLOUD_DB_FAIL true
OWNCLOUD_ADMIN_USERNAME admin
OWNCLOUD_ADMIN_PASSWORD admin
OWNCLOUD_REDIS_ENABLED false
OWNCLOUD_REDIS_HOST redis
OWNCLOUD_REDIS_PORT 6379
OWNCLOUD_REDIS_PASSWORD
OWNCLOUD_REDIS_DB
OWNCLOUD_MEMCACHED_ENABLED false
OWNCLOUD_MEMCACHED_HOST memcached
OWNCLOUD_MEMCACHED_PORT 11211
OWNCLOUD_OBJECTSTORE_ENABLED false
OWNCLOUD_OBJECTSTORE_CLASS OCA\\ObjectStore\\S3
OWNCLOUD_OBJECTSTORE_BUCKET owncloud
OWNCLOUD_OBJECTSTORE_AUTOCREATE true
OWNCLOUD_OBJECTSTORE_VERSION 2006-03-01
OWNCLOUD_OBJECTSTORE_REGION us-east-1
OWNCLOUD_OBJECTSTORE_KEY
OWNCLOUD_OBJECTSTORE_SECRET
OWNCLOUD_OBJECTSTORE_ENDPOINT s3-${OWNCLOUD_OBJECTSTORE_REGION}.amazonaws.com
OWNCLOUD_OBJECTSTORE_PATHSTYLE false
OWNCLOUD_CACHING_CLASS \\OC\\Memcache\\APCu
OWNCLOUD_SUB_URL /
OWNCLOUD_VOLUME_ROOT /mnt/data
OWNCLOUD_VOLUME_CONFIG $OWNCLOUD_VOLUME_ROOT/config
OWNCLOUD_VOLUME_FILES $OWNCLOUD_VOLUME_ROOT/files
OWNCLOUD_VOLUME_CERTS $OWNCLOUD_VOLUME_ROOT/certs
OWNCLOUD_VOLUME_APPS $OWNCLOUD_VOLUME_ROOT/apps
OWNCLOUD_VOLUME_SESSIONS $OWNCLOUD_VOLUME_ROOT/sessions
OWNCLOUD_APPS_INSTALL
OWNCLOUD_APPS_ENABLE
OWNCLOUD_LICENSE_KEY
OWNCLOUD_MARKETPLACE_APIKEY
OWNCLOUD_UTF8MB4_ENABLED false
OWNCLOUD_SKIP_CHOWN false
OWNCLOUD_PRE_INSTALL_PATH /etc/pre_install.d
OWNCLOUD_POST_INSTALL_PATH /etc/post_install.d
OWNCLOUD_PRE_SERVER_PATH /etc/pre_server.d
OWNCLOUD_POST_SERVER_PATH /etc/post_server.d
OWNCLOUD_LOCKING_ENABLED true
OWNCLOUD_ALLOW_EXTERNAL_LOCAL_STORAGE false
OWNCLOUD_MAINTENANCE_MODE false
```


## Issues, Feedback and Ideas

Open an [Issue](https://github.com/owncloud-docker/base/issues)


## Contributing

Fork -> Patch -> Push -> Pull Request


## Authors

* [Felix Boehm](https://github.com/felixboehm)
* [Thomas Boerger](https://github.com/tboerger)


## License

MIT


## Copyright

```
Copyright (c) 2017 Felix Böhm <felix@owncloud.com>
```
