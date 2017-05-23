# ownCloud: Base

[![](https://images.microbadger.com/badges/image/owncloud/base.svg)](https://microbadger.com/images/owncloud/base "Get your own image badge on microbadger.com")

This is our basic ownCloud webserver image that shares the functionality for the ownCloud community and enterprise edition, it is based on our [Ubuntu container](https://registry.hub.docker.com/u/owncloud/ubuntu/).


## Usage

```bash
docker run -ti \
  --name base \
  owncloud/base:latest
```


## Build locally

The available versions should be already pushed to the Docker Hub, but in case you want to try a change locally you can always execute the following command to get this image built locally:

```
IMAGE_NAME=owncloud/base ./hooks/build
```


## Versions

* [latest](https://github.com/owncloud-docker/base/tree/master) available as ```owncloud/base:latest``` at [Docker Hub](https://registry.hub.docker.com/u/owncloud/base/)
* [7.1](https://github.com/owncloud-docker/base/tree/7.1) available as ```owncloud/base:7.1``` at [Docker Hub](https://registry.hub.docker.com/u/owncloud/base/)
* [7.0](https://github.com/owncloud-docker/base/tree/7.0) available as ```owncloud/base:7.0``` at [Docker Hub](https://registry.hub.docker.com/u/owncloud/base/)
* [5.6](https://github.com/owncloud-docker/base/tree/5.6) available as ```owncloud/base:5.6``` at [Docker Hub](https://registry.hub.docker.com/u/owncloud/base/)
* [5.4](https://github.com/owncloud-docker/base/tree/5.4) available as ```owncloud/base:5.4``` at [Docker Hub](https://registry.hub.docker.com/u/owncloud/base/)


## Volumes

* /mnt/data


## Ports

* 80
* 443


## Available environment variables

```
OWNCLOUD_LOGLEVEL 0
OWNCLOUD_MAX_UPLOAD 20G
OWNCLOUD_DEFAULT_LANGUAGE en
OWNCLOUD_DB_TYPE sqlite
OWNCLOUD_DB_HOST
OWNCLOUD_DB_NAME owncloud
OWNCLOUD_DB_USERNAME
OWNCLOUD_DB_PASSWORD
OWNCLOUD_DB_PREFIX
OWNCLOUD_DB_TIMEOUT 180
OWNCLOUD_DB_FAIL true
OWNCLOUD_ADMIN_USERNAME admin
OWNCLOUD_ADMIN_PASSWORD admin
OWNCLOUD_REDIS_ENABLED false
OWNCLOUD_REDIS_HOST redis
OWNCLOUD_REDIS_PORT 6379
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
