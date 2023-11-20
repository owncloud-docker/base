def main(ctx):
    versions = [
        {
            "value": "20.04",
            "tarball": "https://download.owncloud.com/server/stable/owncloud-latest.tar.bz2",
            "tags": ["latest"],
        },
    ]

    config = {
        "version": None,
        "description": "ownCloud base image",
        "repo": ctx.repo.name,
    }

    stages = []
    shell = []

    for version in versions:
        config["path"] = "v%s" % version["value"]

        shell.extend(shellcheck(config))
        inner = []

        config["internal"] = "%s-%s-%s" % (ctx.build.commit, "${DRONE_BUILD_NUMBER}", config["path"])
        config["tags"] = version.get("tags", [])
        config["tags"].append(version["value"])

        d = docker(config)
        d["depends_on"].append(lint(shellcheck(config))["name"])
        inner.append(d)

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
        "name": "%s" % (config["path"]),
        "platform": {
            "os": "linux",
            "arch": "amd64",
        },
        "steps": steps(config),
        "volumes": volumes(config),
        "depends_on": [],
        "trigger": {
            "ref": [
                "refs/heads/master",
                "refs/pull/**",
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
                "image": "docker.io/chko/docker-pushrm:1",
                "environment": {
                    "DOCKER_PASS": {
                        "from_secret": "public_password",
                    },
                    "DOCKER_USER": {
                        "from_secret": "public_username",
                    },
                    "PUSHRM_FILE": "README.md",
                    "PUSHRM_TARGET": "owncloud/%s" % config["repo"],
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
                "image": "docker.io/plugins/slack",
                "failure": "ignore",
                "settings": {
                    "webhook": {
                        "from_secret": "rocketchat_talk_webhook",
                    },
                    "channel": {
                        "from_secret": "rocketchat_talk_channel",
                    },
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
        "image": "docker.io/plugins/download",
        "settings": {
            "source": config["version"]["tarball"],
            "destination": "owncloud.tar.bz2",
        },
    }]

def extract(config):
    return [{
        "name": "extract",
        "image": "docker.io/owncloud/ubuntu:20.04",
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
        "image": "docker.io/owncloudci/drone-docker-buildx:1",
        "settings": {
            "username": {
                "from_secret": "internal_username",
            },
            "password": {
                "from_secret": "internal_password",
            },
            "tags": config["internal"],
            "dockerfile": "%s/Dockerfile.multiarch" % (config["path"]),
            "repo": "registry.drone.owncloud.com/owncloud/%s" % config["repo"],
            "registry": "registry.drone.owncloud.com",
            "context": config["path"],
            "purge": False,
        },
        "environment": {
            "BUILDKIT_NO_CLIENT_TOKEN": True,
        },
    }]

def sleep(config):
    return [{
        "name": "sleep",
        "image": "docker.io/owncloudci/alpine",
        "environment": {
            "DOCKER_USER": {
                "from_secret": "internal_username",
            },
            "DOCKER_PASSWORD": {
                "from_secret": "internal_password",
            },
        },
        "commands": [
            "regctl registry login registry.drone.owncloud.com --user $DOCKER_USER --pass $DOCKER_PASSWORD",
            "retry -- 'regctl image digest registry.drone.owncloud.com/owncloud/%s:%s'" % (config["repo"], config["internal"]),
        ],
    }]

# container vulnerability scanning, see: https://github.com/aquasecurity/trivy
def trivy(config):
    return [
        {
            "name": "trivy-presets",
            "image": "docker.io/owncloudci/alpine",
            "commands": [
                'retry -t 3 -s 5 -- "curl -sSfL https://github.com/owncloud-docker/trivy-presets/archive/refs/heads/main.tar.gz | tar xz --strip-components=2 trivy-presets-main/base/"',
            ],
        },
        {
            "name": "trivy-scan",
            "image": "ghcr.io/aquasecurity/trivy",
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
                "TRIVY_SEVERITY": "HIGH,CRITICAL",
                "TRIVY_SKIP_FILES": "/usr/local/bin/gomplate",
            },
            "commands": [
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

def wait_server(config):
    return [{
        "name": "wait-server",
        "image": "docker.io/owncloud/ubuntu:20.04",
        "commands": [
            "wait-for-it -t 600 server:8080",
        ],
    }]

def tests(config):
    return [{
        "name": "test",
        "image": "docker.io/owncloud/ubuntu:20.04",
        "commands": [
            "curl -sSf http://server:8080/status.php",
        ],
    }]

def publish(config):
    return [{
        "name": "publish",
        "image": "docker.io/owncloudci/drone-docker-buildx:1",
        "settings": {
            "username": {
                "from_secret": "public_username",
            },
            "password": {
                "from_secret": "public_password",
            },
            "platforms": [
                "linux/amd64",
                "linux/arm64",
            ],
            "tags": config["tags"],
            "dockerfile": "%s/Dockerfile.multiarch" % (config["path"]),
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
        "image": "docker.io/owncloudci/alpine",
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
            "regctl registry login registry.drone.owncloud.com --user $DOCKER_USER --pass $DOCKER_PASSWORD",
            "regctl tag rm registry.drone.owncloud.com/owncloud/%s:%s" % (config["repo"], config["internal"]),
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
                "image": "docker.io/owncloudci/bazel-buildifier",
                "commands": [
                    "buildifier -d -diff_command='diff -u' .drone.star",
                ],
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
            "image": "docker.io/koalaman/shellcheck-alpine:stable",
            "commands": [
                "grep -ErlI '^#!(.*/|.*env +)(sh|bash|ksh)' %s/overlay/ | xargs -r shellcheck" % (config["path"]),
            ],
        },
    ]

def steps(config):
    return download(config) + extract(config) + prepublish(config) + sleep(config) + trivy(config) + server(config) + wait_server(config) + tests(config) + publish(config) + cleanup(config)
