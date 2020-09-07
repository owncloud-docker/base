def main(ctx):
  versions = [
    {
      'value': 'latest',
      'tarball': 'https://download.owncloud.org/community/testing/owncloud-10.5.0beta1.tar.bz2',
      'tarball_sha': '1d89e25106ede5c4d5827edd995dbe9311194b1dfafcada22a89f3ed16dafdf5',
    },

    {
      'value': '20.04',
      'tarball': 'https://download.owncloud.org/community/testing/owncloud-10.5.0beta1.tar.bz2',
      'tarball_sha': '1d89e25106ede5c4d5827edd995dbe9311194b1dfafcada22a89f3ed16dafdf5',
    },

    {
      'value': '19.10',
      'tarball': 'https://download.owncloud.org/community/owncloud-10.3.0.tar.bz2',
      'tarball_sha': '3fc96799af93e10f1228970371668c83d8c07a3fdca67369105e56420ff36e64',
    },

    {
      'value': '18.04',
      'tarball': 'https://download.owncloud.org/community/owncloud-10.3.0.tar.bz2',
      'tarball_sha': '3fc96799af93e10f1228970371668c83d8c07a3fdca67369105e56420ff36e64',
    },
    {
      'value': '16.04',
      'tarball': 'https://download.owncloud.org/community/owncloud-10.3.0.tar.bz2',
      'tarball_sha': '3fc96799af93e10f1228970371668c83d8c07a3fdca67369105e56420ff36e64',
    },
  ]

  arches = [
    'amd64',
    'arm32v7',
    'arm64v8',
  ]

  config = {
    'version': None,
    'arch': None,
    'downstream': [
      'owncloud-docker/server@master',
      'owncloud-docker/enterprise@master',
      'owncloud-docker/appliance@master',
    ],
  }

  stages = []

  for version in versions:
    config['version'] = version

    if config['version']['value'] == 'latest':
      config['path'] = 'latest'
    else:
      config['path'] = 'v%s' % config['version']['value']

    m = manifest(config)
    inner = []

    if version['value'] == 'latest' or version['value'] == '20.04':
      # skip arm32v7-20.04 while https://bugs.launchpad.net/ubuntu/+source/glibc/+bug/1867675
      myarches = [ 'amd64', 'arm64v8' ]
    else:
      myarches = arches

    for arch in myarches:
      config['arch'] = arch

      if config['version']['value'] == 'latest':
        config['tag'] = arch
      else:
        config['tag'] = '%s-%s' % (config['version']['value'], arch)

      if config['arch'] == 'amd64':
        config['platform'] = 'amd64'

      if config['arch'] == 'arm64v8':
        config['platform'] = 'arm64'

      if config['arch'] == 'arm32v7':
        config['platform'] = 'arm'

      config['internal'] = '%s-%s' % (ctx.build.commit, config['tag'])

      d = docker(config)
      m['depends_on'].append(d['name'])

      inner.append(d)

    inner.append(m)
    stages.extend(inner)

  after = downstream(config) + [
    microbadger(config),
    rocketchat(config),
  ]

  for s in stages:
    for a in after:
      a['depends_on'].append(s['name'])

  return stages + after

def docker(config):
  return {
    'kind': 'pipeline',
    'type': 'docker',
    'name': '%s-%s' % (config['arch'], config['path']),
    'platform': {
      'os': 'linux',
      'arch': config['platform'],
    },
    'steps': steps(config),
    'volumes': volumes(config),
    'image_pull_secrets': [
      'registries',
    ],
    'depends_on': [],
    'trigger': {
      'ref': [
        'refs/heads/master',
        'refs/pull/**',
      ],
    },
  }

def manifest(config):
  return {
    'kind': 'pipeline',
    'type': 'docker',
    'name': 'manifest-%s' % config['path'],
    'platform': {
      'os': 'linux',
      'arch': 'amd64',
    },
    'steps': [
      {
        'name': 'manifest',
        'image': 'plugins/manifest',
        'pull': 'always',
        'settings': {
          'username': {
            'from_secret': 'public_username',
          },
          'password': {
            'from_secret': 'public_password',
          },
          'spec': '%s/manifest.tmpl' % config['path'],
          'ignore_missing': 'true',
        },
      },
    ],
    'depends_on': [],
    'trigger': {
      'ref': [
        'refs/heads/master',
        'refs/tags/**',
      ],
    },
  }

def downstream(config):
  if len(config['downstream']) == 0:
    return []

  return [{
    'kind': 'pipeline',
    'type': 'docker',
    'name': 'downstream',
    'platform': {
      'os': 'linux',
      'arch': 'amd64',
    },
    'clone': {
      'disable': True,
    },
    'steps': [
      {
        'name': 'notify',
        'image': 'plugins/downstream',
        'pull': 'always',
        'failure': 'ignore',
        'settings': {
          'token': {
            'from_secret': 'drone_token',
          },
          'server': 'https://cloud.drone.io',
          'repositories': config['downstream'],
        },
      },
    ],
    'depends_on': [],
    'trigger': {
      'ref': [
        'refs/heads/master',
        'refs/tags/**',
      ],
    },
  }]

def microbadger(config):
  return {
    'kind': 'pipeline',
    'type': 'docker',
    'name': 'microbadger',
    'platform': {
      'os': 'linux',
      'arch': 'amd64',
    },
    'clone': {
      'disable': True,
    },
    'steps': [
      {
        'name': 'notify',
        'image': 'plugins/webhook',
        'pull': 'always',
        'failure': 'ignore',
        'settings': {
          'urls': {
            'from_secret': 'microbadger_url',
          },
        },
      },
    ],
    'depends_on': [],
    'trigger': {
      'ref': [
        'refs/heads/master',
        'refs/tags/**',
      ],
    },
  }

def rocketchat(config):
  return {
    'kind': 'pipeline',
    'type': 'docker',
    'name': 'rocketchat',
    'platform': {
      'os': 'linux',
      'arch': 'amd64',
    },
    'clone': {
      'disable': True,
    },
    'steps': [
      {
        'name': 'notify',
        'image': 'plugins/slack',
        'pull': 'always',
        'failure': 'ignore',
        'settings': {
          'webhook': {
            'from_secret': 'public_rocketchat',
          },
          'channel': 'docker',
        },
      },
    ],
    'depends_on': [],
    'trigger': {
      'ref': [
        'refs/heads/master',
        'refs/tags/**',
      ],
      'status': [
        'changed',
        'failure',
      ],
    },
  }

def download(config):
  return [{
    'name': 'download',
    'image': 'plugins/download',
    'pull': 'always',
    'settings': {
      'username': {
        'from_secret': 'download_username',
      },
      'password': {
        'from_secret': 'download_password',
      },
      'source': config['version']['tarball'],
      'sha256': config['version']['tarball_sha'],
      'destination': 'owncloud.tar.bz2',
    },
    'volumes': [
      {
        'name': 'docker',
        'path': '/var/lib/docker',
      },
    ],
  }]

def extract(config):
  return [{
    'name': 'extract',
    'image': 'owncloud/ubuntu:19.10',
    'pull': 'always',
    'commands': [
      'tar -xjf owncloud.tar.bz2 -C /var/www',
    ],
    'volumes': [
      {
        'name': 'owncloud',
        'path': '/var/www/owncloud',
      },
    ],
  }]

def prepublish(config):
  return [{
    'name': 'prepublish',
    'image': 'plugins/docker',
    'pull': 'always',
    'settings': {
      'username': {
        'from_secret': 'internal_username',
      },
      'password': {
        'from_secret': 'internal_password',
      },
      'tags': config['internal'],
      'dockerfile': '%s/Dockerfile.%s' % (config['path'], config['arch']),
      'repo': 'registry.drone.owncloud.com/owncloud/base',
      'registry': 'registry.drone.owncloud.com',
      'context': config['path'],
      'purge': False,
    },
    'volumes': [
      {
        'name': 'docker',
        'path': '/var/lib/docker',
      },
    ],
  }]

def sleep(config):
  return [{
    'name': 'sleep',
    'image': 'toolhippie/reg:latest',
    'pull': 'always',
    'environment': {
      'DOCKER_USER': {
        'from_secret': 'internal_username',
      },
      'DOCKER_PASSWORD': {
        'from_secret': 'internal_password',
      },
    },
    'commands': [
      'retry -- reg digest --username $DOCKER_USER --password $DOCKER_PASSWORD registry.drone.owncloud.com/owncloud/base:%s' % config['internal'],
    ],
  }]

# container vulnerability scanning, see: https://github.com/aquasecurity/trivy
def trivy(config):
  if config['arch'] != 'amd64':
    return []

  return [
    {
      'name': 'database',
      'image': 'plugins/download',
      'pull': 'always',
      'settings': {
        'source': 'https://download.owncloud.com/internal/trivy.tar.gz',
        'username': {
          'from_secret': 'download_username',
        },
        'password': {
          'from_secret': 'download_password',
        },
      },
    },
    {
      'name': 'trivy',
      'image': 'aquasec/trivy',
      'environment': {
        'TRIVY_AUTH_URL': 'https://registry.drone.owncloud.com',
        'TRIVY_USERNAME': {
          'from_secret': 'internal_username',
        },
        'TRIVY_PASSWORD': {
          'from_secret': 'internal_password',
        },
        'TRIVY_NO_PROGRESS': True,
        'TRIVY_IGNORE_UNFIXED': True,
        'TRIVY_TIMEOUT': '5m',
        'TRIVY_EXIT_CODE': '1',
        'TRIVY_SKIP_UPDATE': True,
        'TRIVY_SEVERITY': 'HIGH,CRITICAL',
        'TRIVY_CACHE_DIR': '/drone/src/trivy'
      },
      'commands': [
        'trivy registry.drone.owncloud.com/owncloud/base:%s' % config['internal'],
      ],
    },
  ]

def server(config):
  return [{
    'name': 'server',
    'image': 'registry.drone.owncloud.com/owncloud/base:%s' % config['internal'],
    'pull': 'always',
    'detach': True,
    'commands': [
      'owncloud server',
    ],
    'volumes': [
      {
        'name': 'owncloud',
        'path': '/var/www/owncloud',
      },
    ],
  }]

def wait(config):
  return [{
    'name': 'wait',
    'image': 'owncloud/ubuntu:19.10',
    'pull': 'always',
    'commands': [
      'wait-for-it -t 600 server:8080',
    ],
  }]

def tests(config):
  return [{
    'name': 'test',
    'image': 'owncloud/ubuntu:19.10',
    'pull': 'always',
    'commands': [
      'curl -sSf http://server:8080/status.php',
    ],
  }]

def publish(config):
  return [{
    'name': 'publish',
    'image': 'plugins/docker',
    'pull': 'always',
    'settings': {
      'username': {
        'from_secret': 'public_username',
      },
      'password': {
        'from_secret': 'public_password',
      },
      'tags': config['tag'],
      'dockerfile': '%s/Dockerfile.%s' % (config['path'], config['arch']),
      'repo': 'owncloud/base',
      'context': config['path'],
      'pull_image': False,
    },
    'volumes': [
      {
        'name': 'docker',
        'path': '/var/lib/docker',
      },
    ],
    'when': {
      'ref': [
        'refs/heads/master',
      ],
    },
  }]

def cleanup(config):
  return [{
    'name': 'cleanup',
    'image': 'toolhippie/reg:latest',
    'pull': 'always',
    'failure': 'ignore',
    'environment': {
      'DOCKER_USER': {
        'from_secret': 'internal_username',
      },
      'DOCKER_PASSWORD': {
        'from_secret': 'internal_password',
      },
    },
    'commands': [
      'reg rm --username $DOCKER_USER --password $DOCKER_PASSWORD registry.drone.owncloud.com/owncloud/base:%s' % config['internal'],
    ],
    'when': {
      'status': [
        'success',
        'failure',
      ],
    },
  }]

def volumes(config):
  return [
    {
      'name': 'docker',
      'temp': {},
    },
    {
      'name': 'owncloud',
      'temp': {},
    },
  ]

def steps(config):
  return download(config) + extract(config) + prepublish(config) + sleep(config) + trivy(config) + server(config) + wait(config) + tests(config) + publish(config) + cleanup(config)
