# ownCloud: Base

[![Build Status](https://drone.owncloud.com/api/badges/owncloud-docker/base/status.svg)](https://drone.owncloud.com/owncloud-docker/base)
[![](https://images.microbadger.com/badges/image/owncloud/base.svg)](https://microbadger.com/images/owncloud/base "Get your own image badge on microbadger.com")

This is our basic ownCloud webserver image that shares the functionality for the ownCloud community and enterprise edition, it is based on our [Ubuntu container](https://registry.hub.docker.com/u/owncloud/ubuntu/).


## Versions

To get an overview about the available versions please take a look at the [GitHub branches](https://github.com/owncloud-docker/base/branches/all) or our [Docker Hub tags](https://hub.docker.com/r/owncloud/base/tags/), these lists are always up to date. Please note that release candidates or alpha/beta versions are only temporary available, they will be removed after the final release of a version.


## Volumes

* /mnt/data


## Ports

* 8080


## Available environment variables

```
OWNCLOUD_ACCESSLOG_LOCATION /dev/stdout
OWNCLOUD_ACCOUNTS_ENABLE_MEDIAL_SEARCH
OWNCLOUD_ADMIN_PASSWORD admin
OWNCLOUD_ADMIN_USERNAME admin
OWNCLOUD_ALLOW_USER_TO_CHANGE_DISPLAY_NAME
OWNCLOUD_APPSTORE_URL ${OWNCLOUD_MARKETPLACE_URL}
OWNCLOUD_APPS_DISABLE
OWNCLOUD_APPS_ENABLE ${OWNCLOUD_APPS_INSTALL}
OWNCLOUD_APPS_INSTALL
OWNCLOUD_APPS_UNINSTALL
OWNCLOUD_BACKGROUND_MODE cron
OWNCLOUD_BLACKLISTED_FILES
OWNCLOUD_CACHE_CHUNK_GC_TTL
OWNCLOUD_CACHE_PATH
OWNCLOUD_CHECK_FOR_WORKING_WELLKNOWN_SETUP
OWNCLOUD_CIPHER
OWNCLOUD_COMMENTS_MANAGER_FACTORY
OWNCLOUD_CORS_ALLOWED_DOMAINS
OWNCLOUD_CROND_ENABLED true
OWNCLOUD_CRON_LOG
OWNCLOUD_CSRF_DISABLED
OWNCLOUD_DAV_CHUNK_BASE_DIR
OWNCLOUD_DAV_ENABLE_ASYNC
OWNCLOUD_DB_FAIL true
OWNCLOUD_DB_HOST
OWNCLOUD_DB_NAME owncloud
OWNCLOUD_DB_PASSWORD
OWNCLOUD_DB_PREFIX oc_
OWNCLOUD_DB_TIMEOUT 180
OWNCLOUD_DB_TYPE sqlite
OWNCLOUD_DB_USERNAME
OWNCLOUD_DEBUG
OWNCLOUD_DEFAULT_APP
OWNCLOUD_DEFAULT_LANGUAGE en
OWNCLOUD_DOMAIN localhost
OWNCLOUD_ENABLED_PREVIEW_PROVIDERS
OWNCLOUD_ENABLE_AVATARS
OWNCLOUD_ENABLE_CERTIFICATE_MANAGEMENT
OWNCLOUD_ENABLE_PREVIEWS
OWNCLOUD_ENTRYPOINT_INITIALIZED true
OWNCLOUD_ERRORLOG_LOCATION /dev/stderr
OWNCLOUD_EXCLUDED_DIRECTORIES
OWNCLOUD_FILELOCKING_ENABLED ${OWNCLOUD_LOCKING_ENABLED:-true}
OWNCLOUD_FILELOCKING_TTL
OWNCLOUD_FILESYSTEM_CACHE_READONLY
OWNCLOUD_FILESYSTEM_CHECK_CHANGES
OWNCLOUD_FILES_EXTERNAL_ALLOW_NEW_LOCAL ${OWNCLOUD_ALLOW_EXTERNAL_LOCAL_STORAGE}
OWNCLOUD_FORWARDED_FOR_HEADERS
OWNCLOUD_HASHING_COST
OWNCLOUD_HAS_INTERNET_CONNECTION
OWNCLOUD_HTACCESS_REWRITE_BASE ${OWNCLOUD_SUB_URL}
OWNCLOUD_INTEGRITY_EXCLUDED_FILES
OWNCLOUD_INTEGRITY_IGNORE_MISSING_APP_SIGNATURE
OWNCLOUD_KNOWLEDGEBASE_ENABLED
OWNCLOUD_LICENSE_KEY
OWNCLOUD_LOGIN_ALTERNATIVES
OWNCLOUD_LOG_DATE_FORMAT
OWNCLOUD_LOG_FILE ${OWNCLOUD_VOLUME_FILES}/owncloud.log
OWNCLOUD_LOG_LEVEL ${OWNCLOUD_LOGLEVEL:-2}
OWNCLOUD_LOG_ROTATE_SIZE ${OWNCLOUD_LOGSIZE}
OWNCLOUD_LOG_TIMEZONE
OWNCLOUD_LOST_PASSWORD_LINK
OWNCLOUD_MAIL_DOMAIN
OWNCLOUD_MAIL_FROM_ADDRESS
OWNCLOUD_MAIL_SMTP_AUTH
OWNCLOUD_MAIL_SMTP_AUTH_TYPE
OWNCLOUD_MAIL_SMTP_DEBUG
OWNCLOUD_MAIL_SMTP_HOST
OWNCLOUD_MAIL_SMTP_MODE
OWNCLOUD_MAIL_SMTP_NAME
OWNCLOUD_MAIL_SMTP_PASSWORD
OWNCLOUD_MAIL_SMTP_PORT
OWNCLOUD_MAIL_SMTP_SECURE
OWNCLOUD_MAIL_SMTP_TIMEOUT
OWNCLOUD_MAINTENANCE ${OWNCLOUD_MAINTENANCE_MODE}
OWNCLOUD_MARKETPLACE_CA
OWNCLOUD_MARKETPLACE_KEY ${OWNCLOUD_MARKETPLACE_APIKEY}
OWNCLOUD_MAX_EXECUTION_TIME 3600
OWNCLOUD_MAX_FILESIZE_ANIMATED_GIFS_PUBLIC_SHARING
OWNCLOUD_MAX_INPUT_TIME 3600
OWNCLOUD_MAX_UPLOAD 20G
OWNCLOUD_MEMCACHED_ENABLED false
OWNCLOUD_MEMCACHED_HOST memcached
OWNCLOUD_MEMCACHED_OPTIONS
OWNCLOUD_MEMCACHED_PORT 11211
OWNCLOUD_MEMCACHE_LOCAL ${OWNCLOUD_CACHING_CLASS:-\\OC\\Memcache\\APCu}
OWNCLOUD_MEMCACHE_LOCKING
OWNCLOUD_MINIMUM_SUPPORTED_DESKTOP_VERSION
OWNCLOUD_MOUNT_FILE
OWNCLOUD_MYSQL_UTF8MB4 ${OWNCLOUD_UTF8MB4_ENABLED}
OWNCLOUD_OBJECTSTORE_AUTOCREATE true
OWNCLOUD_OBJECTSTORE_BUCKET owncloud
OWNCLOUD_OBJECTSTORE_CLASS OCA\\ObjectStore\\S3
OWNCLOUD_OBJECTSTORE_ENABLED false
OWNCLOUD_OBJECTSTORE_ENDPOINT s3-${OWNCLOUD_OBJECTSTORE_REGION}.amazonaws.com
OWNCLOUD_OBJECTSTORE_KEY
OWNCLOUD_OBJECTSTORE_PATHSTYLE false
OWNCLOUD_OBJECTSTORE_REGION us-east-1
OWNCLOUD_OBJECTSTORE_SECRET
OWNCLOUD_OBJECTSTORE_VERSION 2006-03-01
OWNCLOUD_OPERATION_MODE
OWNCLOUD_OVERWRITE_CLI_URL ${OWNCLOUD_PROTOCOL}://${OWNCLOUD_DOMAIN}${OWNCLOUD_SUB_URL}
OWNCLOUD_OVERWRITE_COND_ADDR
OWNCLOUD_OVERWRITE_HOST
OWNCLOUD_OVERWRITE_PROTOCOL
OWNCLOUD_OVERWRITE_WEBROOT
OWNCLOUD_PART_FILE_IN_STORAGE
OWNCLOUD_POST_CRONJOB_PATH /etc/post_cronjob.d
OWNCLOUD_POST_INSTALL_PATH /etc/post_install.d
OWNCLOUD_POST_SERVER_PATH /etc/post_server.d
OWNCLOUD_PREVIEW_LIBREOFFICE_PATH
OWNCLOUD_PREVIEW_MAX_FILESIZE_IMAGE
OWNCLOUD_PREVIEW_MAX_SCALE_FACTOR
OWNCLOUD_PREVIEW_MAX_X
OWNCLOUD_PREVIEW_MAX_Y
OWNCLOUD_PREVIEW_OFFICE_CL_PARAMETERS
OWNCLOUD_PRE_CRONJOB_PATH /etc/pre_cronjob.d
OWNCLOUD_PRE_INSTALL_PATH /etc/pre_install.d
OWNCLOUD_PRE_SERVER_PATH /etc/pre_server.d
OWNCLOUD_PROTOCOL http
OWNCLOUD_PROXY
OWNCLOUD_PROXY_USERPWD
OWNCLOUD_QUOTA_INCLUDE_EXTERNAL_STORAGE
OWNCLOUD_REDIS_DB
OWNCLOUD_REDIS_ENABLED false
OWNCLOUD_REDIS_HOST redis
OWNCLOUD_REDIS_PASSWORD
OWNCLOUD_REDIS_PORT 6379
OWNCLOUD_REDIS_TIMEOUT
OWNCLOUD_REDIS_SEEDS
OWNCLOUD_REDIS_READ_TIMEOUT
OWNCLOUD_REDIS_FAILOVER_MODE
OWNCLOUD_REMEMBER_LOGIN_COOKIE_LIFETIME
OWNCLOUD_SECRET
OWNCLOUD_SESSION_KEEPALIVE
OWNCLOUD_SESSION_LIFETIME
OWNCLOUD_SESSION_SAVE_HANDLER files
OWNCLOUD_SESSION_SAVE_PATH ${OWNCLOUD_VOLUME_SESSIONS}
OWNCLOUD_SHARE_FOLDER
OWNCLOUD_SHARING_FEDERATION_ALLOW_HTTP_FALLBACK
OWNCLOUD_SHARING_MANAGER_FACTORY
OWNCLOUD_SHOW_SERVER_HOSTNAME
OWNCLOUD_SINGLEUSER
OWNCLOUD_SKELETON_DIRECTORY
OWNCLOUD_SKIP_CHMOD false
OWNCLOUD_SKIP_CHOWN false
OWNCLOUD_SMB_LOGGING_ENABLE
OWNCLOUD_SQLITE_JOURNAL_MODE
OWNCLOUD_SUB_URL /
OWNCLOUD_SYSTEMTAGS_MANAGER_FACTORY
OWNCLOUD_TEMP_DIRECTORY
OWNCLOUD_TOKEN_AUTH_ENFORCED
OWNCLOUD_TRASHBIN_PURGE_LIMIT
OWNCLOUD_TRASHBIN_RETENTION_OBLIGATION
OWNCLOUD_TRUSTED_PROXIES
OWNCLOUD_UPDATER_SERVER_URL
OWNCLOUD_UPDATE_CHECKER
OWNCLOUD_UPGRADE_AUTOMATIC_APP_UPDATES
OWNCLOUD_USER_SEARCH_MIN_LENGTH
OWNCLOUD_VERSIONS_RETENTION_OBLIGATION
OWNCLOUD_VERSION_HIDE
OWNCLOUD_VOLUME_APPS ${OWNCLOUD_VOLUME_ROOT}/apps
OWNCLOUD_VOLUME_CONFIG ${OWNCLOUD_VOLUME_ROOT}/config
OWNCLOUD_VOLUME_FILES ${OWNCLOUD_VOLUME_ROOT}/files
OWNCLOUD_VOLUME_ROOT /mnt/data
OWNCLOUD_VOLUME_SESSIONS ${OWNCLOUD_VOLUME_ROOT}/sessions
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
export HTTP_PORT=8080

docker volume create owncloud_files

docker run -d \
  --name owncloud \
  --link mariadb:db \
  --link redis:redis \
  -p ${HTTP_PORT}:8080 \
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
HTTP_PORT=8080
EOF

wget https://download.owncloud.org/community/owncloud-10.0.10.tar.bz2
tar -xjvf owncloud-10.0.10.tar.bz2

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
