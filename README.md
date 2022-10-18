# ownCloud: Base

[![Build Status](https://img.shields.io/drone/build/owncloud-docker/base?logo=drone&server=https%3A%2F%2Fdrone.owncloud.com)](https://drone.owncloud.com/owncloud-docker/base)
[![Docker Hub](https://img.shields.io/docker/v/owncloud/base?logo=docker&label=dockerhub&sort=semver&logoColor=white)](https://hub.docker.com/r/owncloud/base)
[![GitHub contributors](https://img.shields.io/github/contributors/owncloud-docker/base)](https://github.com/owncloud-docker/base/graphs/contributors)
[![Source: GitHub](https://img.shields.io/badge/source-github-blue.svg?logo=github&logoColor=white)](https://github.com/owncloud-docker/base)
[![License: MIT](https://img.shields.io/github/license/owncloud-docker/base)](https://github.com/owncloud-docker/base/blob/master/LICENSE)

ownCloud Docker base image.

> **IMPORTANT:** We had to change the behavior of the ownCloud setting for trusted domains. Instead of automatic detection, it is now required to set all trusted domains with the environment variable "OWNCLOUD_TRUSTED_DOMAINS".

## Quick reference

- **Where to file issues:**\
  [owncloud-docker/base](https://github.com/owncloud-docker/base/issues)

- **Supported architectures:**\
  `amd64`, `arm32v7`, `arm64v8`

- **Inherited environments:**\
  [owncloud/ubuntu](https://github.com/owncloud-docker/ubuntu#environment-variables),
  [owncloud/php](https://github.com/owncloud-docker/php#environment-variables)

## Docker Tags and respective Dockerfile links

- [`latest`](https://github.com/owncloud-docker/base/blob/master/latest/Dockerfile.amd64) available as `owncloud/base:latest`
- [`20.04`](https://github.com/owncloud-docker/base/blob/master/v20.04/Dockerfile.amd64) available as `owncloud/base:20.04`

## Default volumes

- `/mnt/data`

## Exposed ports

- 8080

## Environment variables

> **INFO:** The following list contains only a small subset of commonly used environment variables to get started. A complete list of all available environment variables can be found [here](https://github.com/owncloud-docker/base/blob/master/ENVIRONMENT.md#environment-variables).

- `OWNCLOUD_DOMAIN=localhost` \
  Base domain used in `OWNCLOUD_OVERWRITE_CLI_URL` by default.
- `OWNCLOUD_TRUSTED_DOMAINS=localhost` \
  List of trusted domains to prevent host header poisoning (see [documentation](https://doc.owncloud.com/server/10.11/admin_manual/configuration/server/config_sample_php_parameters.html#define-list-of-trusted-domains-that-users-can-log-into)).
- `OWNCLOUD_DB_TYPE=sqlite` \
  Identify the database used with this installation (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#identify-the-database-used-with-this-installation)).
- `OWNCLOUD_DB_NAME=owncloud` \
  Define the ownCloud database name (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#define-the-owncloud-database-name)).
- `OWNCLOUD_DB_USERNAME=` \
  Define the ownCloud database user (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#define-the-owncloud-database-user)).
- `OWNCLOUD_DB_PASSWORD=` \
  Define the password for the database user (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#define-the-password-for-the-database-user)).
- `OWNCLOUD_DB_HOST=` \
  Define the database server host name (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#define-the-database-server-host-name)).
- `OWNCLOUD_ADMIN_USERNAME=admin` \
  ownCloud admin username.
- `OWNCLOUD_ADMIN_PASSWORD=admin` \
  ownCloud admin password.
- `OWNCLOUD_LICENSE_KEY=` \
  ownCloud Enterprise License Key (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/enterprise/installation/install.html#license-keys)).

## License

This project is licensed under the MIT License - see the [LICENSE](https://github.com/owncloud-docker/base/blob/master/LICENSE) file for details.

## Copyright

```Text
Copyright (c) 2022 ownCloud GmbH
```
