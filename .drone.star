def main(ctx):
  versions = [
    {
      'value': 'latest',
      'tarball': 'https://download.owncloud.org/community/owncloud-10.2.0.tar.bz2',
      'sha256': '9511d58278797d9c9380062a3f62f257124871d194de8949df94bb191681a6d3',
    },
    {
      'value': '19.10',
      'tarball': 'https://download.owncloud.org/community/owncloud-10.2.0.tar.bz2',
      'sha256': '9511d58278797d9c9380062a3f62f257124871d194de8949df94bb191681a6d3',
    },
    {
      'value': '19.04',
      'tarball': 'https://download.owncloud.org/community/owncloud-10.2.0.tar.bz2',
      'sha256': '9511d58278797d9c9380062a3f62f257124871d194de8949df94bb191681a6d3',
    },
    {
      'value': '18.10',
      'tarball': 'https://download.owncloud.org/community/owncloud-10.2.0.tar.bz2',
      'sha256': '9511d58278797d9c9380062a3f62f257124871d194de8949df94bb191681a6d3',
    },
    {
      'value': '18.04',
      'tarball': 'https://download.owncloud.org/community/owncloud-10.2.0.tar.bz2',
      'sha256': '9511d58278797d9c9380062a3f62f257124871d194de8949df94bb191681a6d3',
    },
    {
      'value': '16.04',
      'tarball': 'https://download.owncloud.org/community/owncloud-10.2.0.tar.bz2',
      'sha256': '9511d58278797d9c9380062a3f62f257124871d194de8949df94bb191681a6d3',
    },
  ]

  arches = [
    'amd64',
    'arm32v7',
    'arm64v8',
  ]

  stages = []

  for version in versions:
    for arch in arches:
      stages.append(docker(ctx, version, arch))
    stages.append(manifest(ctx, version, arches))

  after = [
    microbadger(ctx),
    rocketchat(ctx),
  ]

  for s in stages:
    for a in after:
      a['depends_on'].append(s['name'])

  return stages + after

def docker(ctx, version, arch):
  if version['value'] == 'latest':
    prefix = 'latest'
    tag = arch
  else:
    prefix = 'v%s' % version['value']
    tag = '%s-%s' % (version['value'], arch)

  if arch == 'amd64':
    platform = 'amd64'
    variant = ''

  if arch == 'arm64v8':
    platform = 'arm64'
    variant = 'v8'

  if arch == 'arm32v7':
    platform = 'arm'
    variant = 'v7'

  prepublish = '%s-%s' % (ctx.build.commit, tag)

  return {
    'kind': 'pipeline',
    'type': 'docker',
    'name': '%s-%s' % (arch, prefix),
    'platform': {
      'os': 'linux',
      'arch': platform,
      'variant': variant,
    },
    'steps': [
      {
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
          'source': version['tarball'],
          'sha256': version['sha256'],
          'destination': 'owncloud.tar.bz2'
        },
      },
      {
        'name': 'extract',
        'image': 'owncloud/ubuntu:latest',
        'pull': 'always',
        'commands': [
          'tar -xjf owncloud.tar.bz2 -C /var/www'
        ],
        'volumes': [
          {
            'name': 'owncloud',
            'path': '/var/www/owncloud'
          },
        ],
      },
      {
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
          'tags': prepublish,
          'dockerfile': '%s/Dockerfile.%s' % (prefix, arch),
          'repo': 'registry.drone.owncloud.com/build/base',
          'registry': 'registry.drone.owncloud.com',
          'context': prefix,
          'purge': False,
        },
        'volumes': [
          {
            'name': 'docker',
            'path': '/var/lib/docker'
          },
        ],
      },
      {
        'name': 'clair',
        'image': 'toolhippie/klar:latest',
        'pull': 'always',
        'environment': {
          'CLAIR_ADDR': 'clair.owncloud.com',
          'CLAIR_OUTPUT': 'High',
          'CLAIR_TIMEOUT': '5',
          'DOCKER_USER': {
            'from_secret': 'internal_username',
          },
          'DOCKER_PASSWORD': {
            'from_secret': 'internal_password',
          },
        },
        'commands': [
          'klar registry.drone.owncloud.com/build/base:%s' % prepublish,
        ],
      },
      {
        'name': 'server',
        'image': 'registry.drone.owncloud.com/build/base:%s' % prepublish,
        'pull': 'always',
        'detach': True,
        'commands': [
          '/usr/bin/owncloud server',
        ],
        'volumes': [
          {
            'name': 'owncloud',
            'path': '/var/www/owncloud'
          },
        ],
      },
      {
        'name': 'wait',
        'image': 'owncloud/ubuntu:latest',
        'pull': 'always',
        'commands': [
          'wait-for-it -t 600 server:8080',
        ],
      },
      {
        'name': 'test',
        'image': 'owncloud/ubuntu:latest',
        'pull': 'always',
        'commands': [
          'curl -sSf http://server:8080/status.php',
        ],
      },
      {
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
          'tags': tag,
          'dockerfile': '%s/Dockerfile.%s' % (prefix, arch),
          'repo': 'owncloud/base',
          'context': prefix,
        },
        'volumes': [
          {
            'name': 'docker',
            'path': '/var/lib/docker'
          },
        ],
        'when': {
          'ref': [
            'refs/heads/master',
          ],
        },
      },
      {
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
          'reg rm --username $DOCKER_USER --password $DOCKER_PASSWORD registry.drone.owncloud.com/build/base:%s' % prepublish,
        ],
        'when': {
          'status': [
            'success',
            'failure'
          ]
        }
      },
    ],
    'volumes': [
      {
        'name': 'docker',
        'temp': {},
      },
      {
        'name': 'owncloud',
        'temp': {},
      },
    ],
    'image_pull_secrets': [
      'dockerconfigjson',
    ],
    'depends_on': [],
    'trigger': {
      'ref': [
        'refs/heads/master',
        'refs/pull/**',
      ],
    },
  }

def manifest(ctx, version, arches):
  if version['value'] == 'latest':
    prefix = 'latest'
  else:
    prefix = 'v%s' % version['value']

  depends = []

  for arch in arches:
    depends.append('%s-%s' % (arch, prefix))

  return {
    'kind': 'pipeline',
    'type': 'docker',
    'name': 'manifest-%s' % prefix,
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
          'spec': '%s/manifest.tmpl' % prefix,
          'ignore_missing': 'true',
        },
      },
    ],
    'depends_on': depends,
    'trigger': {
      'ref': [
        'refs/heads/master',
      ]
    }
  }

def microbadger(ctx):
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
      ],
    },
  }

def rocketchat(ctx):
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
      ],
      'status': [
        'changed',
        'failure',
      ],
    },
  }
