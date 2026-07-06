# ownCloud: Base

[![Build Status](https://drone.owncloud.com/api/badges/owncloud-docker/base/status.svg)](https://drone.owncloud.com/owncloud-docker/base)
[![Docker Hub](https://img.shields.io/docker/v/owncloud/base?logo=docker&label=dockerhub&sort=semver&logoColor=white)](https://hub.docker.com/r/owncloud/base)
[![GitHub contributors](https://img.shields.io/github/contributors/owncloud-docker/base)](https://github.com/owncloud-docker/base/graphs/contributors)
[![Source: GitHub](https://img.shields.io/badge/source-github-blue.svg?logo=github&logoColor=white)](https://github.com/owncloud-docker/base)
[![License: MIT](https://img.shields.io/github/license/owncloud-docker/base)](https://github.com/owncloud-docker/base/blob/master/LICENSE)
[![ownCloud OSPO](https://img.shields.io/badge/OSPO-ownCloud-blue)](https://kiteworks.com/opensource)

ownCloud Docker base image.

## Quick reference

- **Where to file issues:**\
  [owncloud-docker/base](https://github.com/owncloud-docker/base/issues)

- **Supported architectures:**\
  `amd64`, `arm64v8`

- **Inherited environments:**\
  [owncloud/ubuntu](https://github.com/owncloud-docker/ubuntu#environment-variables),
  [owncloud/php](https://github.com/owncloud-docker/php#environment-variables)

- **Build & maintenance:**\
  [How these images are built, scanned, updated and published](https://github.com/owncloud-docker/.github/blob/master/docs/IMAGE-LIFECYCLE.md)

## Docker Tags and respective Dockerfile links

- [`20.04`](https://github.com/owncloud-docker/base/blob/master/v20.04/Dockerfile.multiarch) available as `owncloud/base:20.04`, `owncloud/base:latest`
- [`22.04`](https://github.com/owncloud-docker/base/blob/master/v22.04/Dockerfile.multiarch) available as `owncloud/base:22.04`

## Default volumes

- `/mnt/data`

## Exposed ports

- 8080

## Environment variables

> **INFO:** The following list contains only a small subset of commonly used environment variables to get started. A complete list of all available environment variables can be found [here](https://github.com/owncloud-docker/base/blob/master/ENVIRONMENT.md#environment-variables).

- `OWNCLOUD_DOMAIN=localhost` \
  Base domain used in `OWNCLOUD_OVERWRITE_CLI_URL` by default.
- `OWNCLOUD_TRUSTED_DOMAINS=${OWNCLOUD_DOMAIN}` \
  List of trusted domains to prevent host header poisoning (see [documentation](https://doc.owncloud.com/server/latest/admin_manual/configuration/server/config_sample_php_parameters.html#define-list-of-trusted-domains-that-users-can-log-into)).
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

## Community & Support

- [ownCloud Website](https://owncloud.com)
- [Community Discussions](https://github.com/orgs/owncloud/discussions)
- [Matrix Chat](https://app.element.io/#/room/#owncloud:matrix.org)
- [Documentation](https://doc.owncloud.com)
- [Enterprise Support](https://owncloud.com/contact-us/)
- [OSPO Home](https://kiteworks.com/opensource)

See [SUPPORT.md](SUPPORT.md) for the full list of support channels.

## Contributing

We welcome contributions! Please read the [Contributing Guidelines](CONTRIBUTING.md)
and our [Code of Conduct](CODE_OF_CONDUCT.md) before getting started.

- **Rebase Early, Rebase Often!** We use a rebase workflow — rebase on the target
  branch before submitting a PR.
- **Signed commits**: All commits **must** be PGP/GPG signed and carry a DCO
  `Signed-off-by` line (`git commit -S -s`).
- **Conventional Commits**: PR titles must follow the
  [Conventional Commits](https://www.conventionalcommits.org/) format — enforced
  by CI.
- **GitHub Actions Policy**: Workflows may only use actions owned by `owncloud`,
  created by GitHub (`actions/*`), or verified in the GitHub Marketplace, pinned
  to a full commit SHA.

## Security

**Do not open a public GitHub issue for security vulnerabilities.**

Report vulnerabilities at **<https://security.owncloud.com>** — see [SECURITY.md](SECURITY.md).

Bug bounty: [YesWeHack ownCloud Program](https://yeswehack.com/programs/owncloud-bug-bounty-program)

## About the ownCloud OSPO

The [Kiteworks Open Source Program Office](https://kiteworks.com/opensource), operating under
the [ownCloud](https://owncloud.com) brand, launched on May 5, 2026, to steward the open source
ecosystem around ownCloud's products. The OSPO ensures transparent governance, license compliance,
community health, and sustainable collaboration between the open source community and
[Kiteworks](https://www.kiteworks.com), which acquired ownCloud in 2023.

- **OSPO Home**: <https://kiteworks.com/opensource>
- **GitHub**: <https://github.com/owncloud>
- **ownCloud**: <https://owncloud.com>

For questions about the OSPO or licensing, contact ospo@kiteworks.com.

This repository is licensed under the permissive **MIT License**, which is already
compatible with the [Apache License 2.0](https://www.apache.org/licenses/LICENSE-2.0)
that the OSPO is adopting across the ecosystem. No relicensing or copyleft
dependency audit is required.

## License

This project is licensed under the MIT License - see the [LICENSE](https://github.com/owncloud-docker/base/blob/master/LICENSE) file for details.

## Copyright

```Text
Copyright (c) 2022 ownCloud GmbH
```
