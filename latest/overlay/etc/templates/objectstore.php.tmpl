<?php

function getObjectstoreFromEnv() {
  $OBJECTSTORE = [];

  if (getenv('OWNCLOUD_OBJECTSTORE_ENABLED') && getenv('OWNCLOUD_OBJECTSTORE_ENABLED') === 'true') {
    $OBJECTSTORE = [
      'objectstore' => [
        'class' => getenv('OWNCLOUD_OBJECTSTORE_CLASS'),
        'arguments' => [
          'bucket' => getenv('OWNCLOUD_OBJECTSTORE_BUCKET'),
          'part_size' => getenv('OWNCLOUD_OBJECTSTORE_PART_SIZE'),
          'concurrency' => getenv('OWNCLOUD_OBJECTSTORE_CONCURRENCY'),
          'options' => [
            'endpoint' => getenv('OWNCLOUD_OBJECTSTORE_ENDPOINT'),
            'version' => getenv('OWNCLOUD_OBJECTSTORE_VERSION'),
            'region' => getenv('OWNCLOUD_OBJECTSTORE_REGION'),
            'use_path_style_endpoint' => getenv('OWNCLOUD_OBJECTSTORE_PATHSTYLE') === 'true',
            'command.params' => [
              'PathStyle' => getenv('OWNCLOUD_OBJECTSTORE_PATHSTYLE') === 'true',
            ],
            'credentials' => [
              'key'   => getenv('OWNCLOUD_OBJECTSTORE_KEY'),
              'secret'  => getenv('OWNCLOUD_OBJECTSTORE_SECRET'),
            ],
          ],
        ],
      ],
    ];

    if (getenv('OWNCLOUD_OBJECTSTORE_AVAILABLE_STORAGE') != '') {
      $OBJECTSTORE['objectstore']['arguments']['availableStorage'] = getenv('OWNCLOUD_OBJECTSTORE_AVAILABLE_STORAGE');
    }
  }

  return $OBJECTSTORE;
}

$CONFIG = getObjectstoreFromEnv();
