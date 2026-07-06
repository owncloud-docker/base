# agents.md — base

## Repository Overview

This repository builds the official **ownCloud base** Docker image
(`owncloud/base` on Docker Hub). It is the ownCloud-specific foundation layer:
it sits on top of [`owncloud/php`](https://github.com/owncloud-docker/php) and
adds ownCloud runtime defaults, environment-variable handling and an optional
root-filesystem overlay. Higher-level images such as
[`owncloud/server`](https://github.com/owncloud-docker/server) build `FROM` it.
Images are multi-architecture and built via GitHub Actions.

- **Classification:** Docker image build (base layer)
- **Activity Status:** Active
- **License:** MIT
- **Language:** Dockerfile, Shell

## Architecture & Key Paths

- `v20.04/`, `v22.04/`, `v24.04/` — one directory per Ubuntu base release
  - `<version>/Dockerfile.multiarch` — image definition (`FROM owncloud/php:<version>`)
  - `<version>/overlay/` — files copied into the image root (`ADD overlay /`)
- `ENVIRONMENT.md` — full reference of the environment variables this image
  consumes (the README links here for the complete list)
- `CLAUDE.md` — repository overview / instructions for Claude Code
- `.github/workflows/main.yml` — **active** CI (build, smoke test, scan, publish)
- `.github/workflows/lint-pr-title.yml` — Conventional-Commit PR-title enforcement
- `.github/dependabot.yml` — weekly GitHub Actions dependency updates
- `.renovaterc.json` — Renovate preset for Docker digest updates
- `.editorconfig` — formatting rules (2-space indent, LF, trailing newline)
- `.trivyignore` — accepted-CVE exclusions for the Trivy scan
- `CHANGELOG.md` — flat, date-based changelog at repo root
- `LICENSE` — MIT

## Build & CI

There is no local application build (no Node/pnpm/Make toolchain). The image is
built by `.github/workflows/main.yml`, which calls reusable workflows hosted in
[`owncloud-docker/ubuntu`](https://github.com/owncloud-docker/ubuntu):

- Matrix builds the supported Ubuntu releases (`22.04`, `24.04`), each via
  `v<version>/Dockerfile.multiarch`.
- Smoke test: `php -r "echo 'OK';" | grep -q OK`.
- Trivy vulnerability scan (`.trivyignore`).
- On `master`: push to Docker Hub and sync the README as the image description.

To build locally:

```bash
docker build -f v22.04/Dockerfile.multiarch v22.04
```

The image exposes port `8080` and declares volume `/mnt/data`.

## Development Conventions

- Date-based `CHANGELOG.md` at repo root — **not** a `changelog/unreleased/`
  directory. Prepend a new `## YYYY-MM-DD` section for notable changes.
- Conventional-Commit PR titles, enforced by `lint-pr-title.yml`.
- `.editorconfig` governs formatting.
- GitHub Actions are pinned to full commit SHAs.

## OSPO Policy Constraints

### GitHub Actions
- **Only** use actions owned by `owncloud`, created by GitHub (`actions/*`),
  verified on the GitHub Marketplace, or verified by the ownCloud Maintainers.
- Pin all actions to their full commit SHA (not tags): `uses: actions/checkout@<SHA> # vX.Y.Z`.
- Never introduce actions from unverified third parties.

### Dependency Management
- Dependabot is configured for GitHub Actions updates; Renovate handles Docker
  base-image digest updates.
- Review and merge dependency PRs as part of regular maintenance.

### Git Workflow
- **Rebase policy**: Always rebase; never create merge commits.
- **Signed commits**: All commits **must** be PGP/GPG signed (`git commit -S`).
- **DCO sign-off**: Every commit needs a `Signed-off-by` line (`git commit -s`).
- **Conventional Commits & Squash Merge**: PR titles must follow
  [Conventional Commits](https://www.conventionalcommits.org/); the PR title
  becomes the squash-merge commit message and is enforced by CI.

## Context for AI Agents

- This is a small Docker-image packaging repo, not an application codebase.
- The `v*/` directories are near-identical; changes usually apply to all of them.
- The `overlay/` directories are the image root filesystem — add files there to
  ship them in the image.
- The active build system is GitHub Actions (`main.yml`).
- The README is published verbatim as the Docker Hub image description — keep it
  accurate and self-contained.
- License is **MIT** (permissive, already compatible with Apache-2.0); no
  copyleft dependency audit is required for relicensing.
