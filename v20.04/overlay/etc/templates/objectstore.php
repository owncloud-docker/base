<?php

function getObjectstoreFromEnv() {
  if (getenv('OWNCLOUD_OBJECTSTORE_ENABLED') && getenv('OWNCLOUD_OBJECTSTORE_ENABLED') == 'true') {
    return [
      'objectstore' => [
        'class' => getenv('OWNCLOUD_OBJECTSTORE_CLASS'),
        'arguments' => [
          'bucket' => getenv('OWNCLOUD_OBJECTSTORE_BUCKET'),
          'autocreate' => getenv('OWNCLOUD_OBJECTSTORE_AUTOCREATE'),
          'options' => [
            'endpoint' => getenv('OWNCLOUD_OBJECTSTORE_ENDPOINT'),
            'version' => getenv('OWNCLOUD_OBJECTSTORE_VERSION'),
            'region' => getenv('OWNCLOUD_OBJECTSTORE_REGION'),
            'use_path_style_endpoint' => getenv('OWNCLOUD_OBJECTSTORE_PATHSTYLE') == 'true',
            'command.params' => [
              'PathStyle' => getenv('OWNCLOUD_OBJECTSTORE_PATHSTYLE') == 'true',
            ],
            'credentials' => [
              'key'   => getenv('OWNCLOUD_OBJECTSTORE_KEY'),
              'secret'  => getenv('OWNCLOUD_OBJECTSTORE_SECRET'),
            ],
          ],
        ],
      ],
    ];
  }

  return [];
}

$CONFIG = getObjectstoreFromEnv();
