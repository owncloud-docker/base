# ownCloud: Base

[![Build Status](https://drone.owncloud.com/api/badges/owncloud-docker/base/status.svg)](https://drone.owncloud.com/owncloud-docker/base)
[![](https://images.microbadger.com/badges/image/owncloud/base.svg)](https://microbadger.com/images/owncloud/base "Get your own image badge on microbadger.com")

This is our basic ownCloud webserver image that shares the functionality for the ownCloud community and enterprise edition, it is based on our [Ubuntu container](https://registry.hub.docker.com/u/owncloud/ubuntu/).


## Versions

To get an overview about the available versions please take a look at the [GitHub branches](https://github.com/owncloud-docker/server/branches/all) or our [Docker Hub tags](https://hub.docker.com/r/owncloud/server/tags/), these lists are always up to date. Please note that release candidates or alpha/beta versions are only temporary available, they will be removed after the final release of a version.


## Volumes

* /mnt/data


## Ports

* 80
* 443


## Available environment variables

```
OWNCLOUD_DOMAIN localhost
OWNCLOUD_LOGLEVEL 0
OWNCLOUD_LOGSIZE
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
OWNCLOUD_APPS_DISABLE
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
OWNCLOUD_ACCESSLOG_LOCATION /var/log/apache2/access.log
OWNCLOUD_ACCESSLOG_DESTINATION stdout
OWNCLOUD_ERRORLOG_LOCATION /var/log/apache2/error.log
OWNCLOUD_ERRORLOG_DESTINATION stderr
```


## Inherited environment variables

* [owncloud/ubuntu](https://github.com/owncloud-docker/ubuntu#available-environment-variables)



## Build locally

The available versions should be already pushed to the Docker Hub, but in case you want to try a change locally you can always execute the following command (run from a cloned GitHub repository) to get an image built locally:

```
docker pull owncloud/ubuntu:latest
docker build -t owncloud/base:latest .
```


### Launch with plain `docker`

The installation of `docker` is not covered by this instructions, please follow the [official installation instructions](https://docs.docker.com/engine/installation/). After the installation of docker you can continue with the required MariaDB and Redis containers:

```bash
docker volume create owncloud_redis

docker run -d \
  --name redis \
  -e REDIS_DATABASES=1 \
  --volume owncloud_redis:/var/lib/redis \
  webhippie/redis:latest

docker volume create owncloud_mysql
docker volume create owncloud_backup

docker run -d \
  --name mariadb \
  -e MARIADB_ROOT_PASSWORD=owncloud \
  -e MARIADB_USERNAME=owncloud \
  -e MARIADB_PASSWORD=owncloud \
  -e MARIADB_DATABASE=owncloud \
  --volume owncloud_mysql:/var/lib/mysql \
  --volume owncloud_backup:/var/lib/backup \
  webhippie/mariadb:latest
```

Then you can download an ownCloud tarball and start the ownCloud web server, you can customize the used environment variables as needed:

```bash
wget https://download.owncloud.org/community/owncloud-10.0.8.tar.bz2
tar -xjvf owncloud-10.0.8.tar.bz2

export OWNCLOUD_DOMAIN=localhost
export ADMIN_USERNAME=admin
export ADMIN_PASSWORD=admin
export HTTP_PORT=80
export HTTPS_PORT=443

docker volume create owncloud_files

docker run -d \
  --name owncloud \
  --link mariadb:db \
  --link redis:redis \
  -p ${HTTP_PORT}:80 \
  -p ${HTTPS_PORT}:443 \
  -e OWNCLOUD_DOMAIN=${OWNCLOUD_DOMAIN} \
  -e OWNCLOUD_DB_TYPE=mysql \
  -e OWNCLOUD_DB_NAME=owncloud \
  -e OWNCLOUD_DB_USERNAME=owncloud \
  -e OWNCLOUD_DB_PASSWORD=owncloud \
  -e OWNCLOUD_DB_HOST=db \
  -e OWNCLOUD_ADMIN_USERNAME=${ADMIN_USERNAME} \
  -e OWNCLOUD_ADMIN_PASSWORD=${ADMIN_PASSWORD} \
  -e OWNCLOUD_REDIS_ENABLED=true \
  -e OWNCLOUD_REDIS_HOST=redis \
  --volume owncloud_files:/mnt/data \
  --volume $(pwd)/owncloud:/var/www/owncloud \
  owncloud/base:latest
```


### Launch with `docker-compose`

The installation of `docker-compose` is not covered by these instructions, please follow the [official installation instructions](https://docs.docker.com/compose/install/). Be aware that you must install version `1.12.0+`. After the installation of `docker-compose` you can continue with the following commands to start the ownCloud stack. First we are defining some required environment variables, then we are downloading the required ownCloud tarball and the `docker-compose.yml` file. The `.env` and `docker-compose.yml` are expected in the current working directory, when running `docker-compose` commands:

```bash
cat << EOF >| .env
OWNCLOUD_DOMAIN=localhost
ADMIN_USERNAME=admin
ADMIN_PASSWORD=admin
HTTP_PORT=80
HTTPS_PORT=443
EOF

wget https://download.owncloud.org/community/owncloud-10.0.8.tar.bz2
tar -xjvf owncloud-10.0.8.tar.bz2

wget -O docker-compose.yml https://raw.githubusercontent.com/owncloud-docker/base/master/docker-compose.yml

# Finally start the containers in the background
docker-compose up -d
```

More commands of interest (try adding `-h` for help):

```bash
docker-compose exec owncloud bash
docker-compose stop
docker-compose start
docker-compose down
docker-compose logs
```

By default `docker-compose up` will start Redis, MariaDB and ownCloud containers, the content gets stored in named volumes persistently. The container ports `80` and `443` are bound as configured in the `.env` file.

### Commandline commands

You can run `occ` commands inside the ownCloud docker image, without caring for sudo and apache user, as the command is wrapped in a little script caring for that. Just run:

```
occ user:report
```

You can also run commands via `docker exec`, or `docker-compse exec`:

```
docker exec -ti example_owncloud_1 occ user:report
docker-compose exec owncloud occ user:report
```


## Issues, Feedback and Ideas

Open an [Issue](https://github.com/owncloud-docker/base/issues)


## Contributing

Fork -> Patch -> Push -> Pull Request


## Authors

* [Thomas Boerger](https://github.com/tboerger)
* [Felix Boehm](https://github.com/felixboehm)


## License

MIT


## Copyright

```
Copyright (c) 2018 Thomas Boerger <tboerger@owncloud.com>
```
