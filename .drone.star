def main(ctx):
    versions = [
        {
            "value": "latest",
            "tarball": "https://download.owncloud.com/server/stable/owncloud-latest.tar.bz2",
        },
        {
            "value": "20.04",
            "tarball": "https://download.owncloud.com/server/stable/owncloud-latest.tar.bz2",
        },
    ]

    arches = [
        "amd64",
        "arm32v7",
        "arm64v8",
    ]

    config = {
        "version": None,
        "arch": None,
        "description": "ownCloud base image",
        "repo": ctx.repo.name,
    }

    stages = []
    shell = []

    for version in versions:
        config["version"] = version

        if config["version"]["value"] == "latest":
            config["path"] = "latest"
        else:
            config["path"] = "v%s" % config["version"]["value"]

        m = manifest(config)
        shell.extend(shellcheck(config))
        inner = []

        for arch in arches:
            config["arch"] = arch

            if config["version"]["value"] == "latest":
                config["tag"] = arch
            else:
                config["tag"] = "%s-%s" % (config["version"]["value"], arch)

            if config["arch"] == "amd64":
                config["platform"] = "amd64"

            if config["arch"] == "arm64v8":
                config["platform"] = "arm64"

            if config["arch"] == "arm32v7":
                config["platform"] = "arm"

            config["internal"] = "%s-%s-%s" % (ctx.build.commit, "${DRONE_BUILD_NUMBER}", config["tag"])

            d = docker(config)
            d["depends_on"].append(lint(shellcheck(config))["name"])
            m["depends_on"].append(d["name"])

            inner.append(d)

        inner.append(m)
        stages.extend(inner)

    after = [
        documentation(config),
        rocketchat(config),
    ]

    for s in stages:
        for a in after:
            a["depends_on"].append(s["name"])

    return [lint(shell)] + stages + after

def docker(config):
    return {
        "kind": "pipeline",
        "type": "docker",
        "name": "%s-%s" % (config["arch"], config["path"]),
        "platform": {
            "os": "linux",
            "arch": config["platform"],
        },
        "steps": steps(config),
        "volumes": volumes(config),
        "image_pull_secrets": [
            "registries",
        ],
        "depends_on": [],
        "trigger": {
            "ref": [
                "refs/heads/master",
                "refs/pull/**",
            ],
        },
    }

def manifest(config):
    return {
        "kind": "pipeline",
        "type": "docker",
        "name": "manifest-%s" % config["path"],
        "platform": {
            "os": "linux",
            "arch": "amd64",
        },
        "steps": [
            {
                "name": "manifest",
                "image": "plugins/manifest",
                "settings": {
                    "username": {
                        "from_secret": "public_username",
                    },
                    "password": {
                        "from_secret": "public_password",
                    },
                    "spec": "%s/manifest.tmpl" % config["path"],
                    "ignore_missing": "true",
                },
            },
        ],
        "depends_on": [],
        "trigger": {
            "ref": [
                "refs/heads/master",
                "refs/tags/**",
            ],
        },
    }

def documentation(config):
    return {
        "kind": "pipeline",
        "type": "docker",
        "name": "documentation",
        "platform": {
            "os": "linux",
            "arch": "amd64",
        },
        "steps": [
            {
                "name": "link-check",
                "image": "ghcr.io/tcort/markdown-link-check:stable",
                "commands": [
                    "/src/markdown-link-check README.md",
                ],
            },
            {
                "name": "publish",
                "image": "chko/docker-pushrm:1",
                "environment": {
                    "DOCKER_PASS": {
                        "from_secret": "public_password",
                    },
                    "DOCKER_USER": {
                        "from_secret": "public_username",
                    },
                    "PUSHRM_FILE": "README.md",
                    "PUSHRM_TARGET": "owncloud/${DRONE_REPO_NAME}",
                    "PUSHRM_SHORT": config["description"],
                },
                "when": {
                    "ref": [
                        "refs/heads/master",
                    ],
                },
            },
        ],
        "depends_on": [],
        "trigger": {
            "ref": [
                "refs/heads/master",
                "refs/tags/**",
                "refs/pull/**",
            ],
        },
    }

def rocketchat(config):
    return {
        "kind": "pipeline",
        "type": "docker",
        "name": "rocketchat",
        "platform": {
            "os": "linux",
            "arch": "amd64",
        },
        "clone": {
            "disable": True,
        },
        "steps": [
            {
                "name": "notify",
                "image": "plugins/slack",
                "failure": "ignore",
                "settings": {
                    "webhook": {
                        "from_secret": "public_rocketchat",
                    },
                    "channel": "docker",
                },
            },
        ],
        "depends_on": [],
        "trigger": {
            "ref": [
                "refs/heads/master",
                "refs/tags/**",
            ],
            "status": [
                "changed",
                "failure",
            ],
        },
    }

def download(config):
    return [{
        "name": "download",
        "image": "plugins/download",
        "settings": {
            "username": {
                "from_secret": "download_username",
            },
            "password": {
                "from_secret": "download_password",
            },
            "source": config["version"]["tarball"],
            "destination": "owncloud.tar.bz2",
        },
    }]

def extract(config):
    return [{
        "name": "extract",
        "image": "owncloud/ubuntu:20.04",
        "commands": [
            "tar -xjf owncloud.tar.bz2 -C /var/www",
        ],
        "volumes": [
            {
                "name": "owncloud",
                "path": "/var/www/owncloud",
            },
        ],
    }]

def prepublish(config):
    return [{
        "name": "prepublish",
        "image": "plugins/docker",
        "settings": {
            "username": {
                "from_secret": "internal_username",
            },
            "password": {
                "from_secret": "internal_password",
            },
            "tags": config["internal"],
            "dockerfile": "%s/Dockerfile.%s" % (config["path"], config["arch"]),
            "repo": "registry.drone.owncloud.com/owncloud/%s" % config["repo"],
            "registry": "registry.drone.owncloud.com",
            "context": config["path"],
            "purge": False,
        },
    }]

def sleep(config):
    return [{
        "name": "sleep",
        "image": "owncloudci/alpine:latest",
        "environment": {
            "DOCKER_USER": {
                "from_secret": "internal_username",
            },
            "DOCKER_PASSWORD": {
                "from_secret": "internal_password",
            },
        },
        "commands": [
            "retry -- 'reg digest --username $DOCKER_USER --password $DOCKER_PASSWORD registry.drone.owncloud.com/owncloud/%s:%s'" % (config["repo"], config["internal"]),
        ],
    }]

# container vulnerability scanning, see: https://github.com/aquasecurity/trivy
def trivy(config):
    if config["arch"] != "amd64":
        return []

    return [
        {
            "name": "trivy-presets",
            "image": "owncloudci/alpine",
            "commands": [
                'retry -t 3 -s 5 -- "curl -sSfL https://github.com/owncloud-docker/trivy-presets/archive/refs/heads/main.tar.gz | tar xz --strip-components=2 trivy-presets-main/base/"',
            ],
        },
        {
            "name": "trivy-db",
            "image": "plugins/download",
            "settings": {
                "source": {
                    "from_secret": "trivy_db_download_url",
                },
            },
        },
        {
            "name": "trivy-scan",
            "image": "aquasec/trivy",
            "environment": {
                "TRIVY_AUTH_URL": "https://registry.drone.owncloud.com",
                "TRIVY_USERNAME": {
                    "from_secret": "internal_username",
                },
                "TRIVY_PASSWORD": {
                    "from_secret": "internal_password",
                },
                "TRIVY_NO_PROGRESS": True,
                "TRIVY_IGNORE_UNFIXED": True,
                "TRIVY_TIMEOUT": "5m",
                "TRIVY_EXIT_CODE": "1",
                "TRIVY_DB_SKIP_UPDATE": True,
                "TRIVY_SEVERITY": "HIGH,CRITICAL",
                "TRIVY_CACHE_DIR": "/drone/src/trivy",
            },
            "commands": [
                "tar -xf trivy.tar.gz",
                "trivy -v",
                "trivy image registry.drone.owncloud.com/owncloud/%s:%s" % (config["repo"], config["internal"]),
            ],
        },
    ]

def server(config):
    return [{
        "name": "server",
        "image": "registry.drone.owncloud.com/owncloud/%s:%s" % (config["repo"], config["internal"]),
        "detach": True,
        "environment": {
            "OWNCLOUD_TRUSTED_DOMAINS": "server",
        },
        "commands": [
            "owncloud server",
        ],
        "volumes": [
            {
                "name": "owncloud",
                "path": "/var/www/owncloud",
            },
        ],
    }]

def wait(config):
    return [{
        "name": "wait",
        "image": "owncloud/ubuntu:20.04",
        "commands": [
            "wait-for-it -t 600 server:8080",
        ],
    }]

def tests(config):
    return [{
        "name": "test",
        "image": "owncloud/ubuntu:20.04",
        "commands": [
            "curl -sSf http://server:8080/status.php",
        ],
    }]

def publish(config):
    return [{
        "name": "publish",
        "image": "plugins/docker",
        "settings": {
            "username": {
                "from_secret": "public_username",
            },
            "password": {
                "from_secret": "public_password",
            },
            "tags": config["tag"],
            "dockerfile": "%s/Dockerfile.%s" % (config["path"], config["arch"]),
            "repo": "owncloud/%s" % config["repo"],
            "context": config["path"],
            "pull_image": False,
        },
        "when": {
            "ref": [
                "refs/heads/master",
            ],
        },
    }]

def cleanup(config):
    return [{
        "name": "cleanup",
        "image": "owncloudci/alpine:latest",
        "failure": "ignore",
        "environment": {
            "DOCKER_USER": {
                "from_secret": "internal_username",
            },
            "DOCKER_PASSWORD": {
                "from_secret": "internal_password",
            },
        },
        "commands": [
            "reg rm --username $DOCKER_USER --password $DOCKER_PASSWORD registry.drone.owncloud.com/owncloud/%s:%s" % (config["repo"], config["internal"]),
        ],
        "when": {
            "status": [
                "success",
                "failure",
            ],
        },
    }]

def volumes(config):
    return [
        {
            "name": "docker",
            "temp": {},
        },
        {
            "name": "owncloud",
            "temp": {},
        },
    ]

def lint(shell):
    lint = {
        "kind": "pipeline",
        "type": "docker",
        "name": "lint",
        "steps": [
            {
                "name": "starlark-format",
                "image": "owncloudci/bazel-buildifier",
                "commands": [
                    "buildifier --mode=check .drone.star",
                ],
            },
            {
                "name": "starlark-diff",
                "image": "owncloudci/bazel-buildifier",
                "commands": [
                    "buildifier --mode=fix .drone.star",
                    "git diff",
                ],
                "when": {
                    "status": [
                        "failure",
                    ],
                },
            },
        ],
        "depends_on": [],
        "trigger": {
            "ref": [
                "refs/heads/master",
                "refs/pull/**",
            ],
        },
    }

    lint["steps"].extend(shell)

    return lint

def shellcheck(config):
    return [
        {
            "name": "shellcheck-%s" % (config["path"]),
            "image": "koalaman/shellcheck-alpine:stable",
            "commands": [
                "grep -ErlI '^#!(.*/|.*env +)(sh|bash|ksh)' %s/overlay/ | xargs -r shellcheck" % (config["path"]),
            ],
        },
    ]

def steps(config):
    return download(config) + extract(config) + prepublish(config) + sleep(config) + trivy(config) + server(config) + wait(config) + tests(config) + publish(config) + cleanup(config)
