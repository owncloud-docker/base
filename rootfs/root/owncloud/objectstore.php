<?php
$CONFIG = array (
  'objectstore' => [
    'class' => '${OWNCLOUD_OBJECTSTORE_CLASS}',
    'arguments' => [
      'bucket' => '${OWNCLOUD_OBJECTSTORE_BUCKET}',
      'autocreate' => ${OWNCLOUD_OBJECTSTORE_AUTOCREATE},
      'options' => [
        'version' => '${OWNCLOUD_OBJECTSTORE_VERSION}',
        'region' => '${OWNCLOUD_OBJECTSTORE_REGION}',
        'credentials' => [
          'key' => '${OWNCLOUD_OBJECTSTORE_KEY}',
          'secret' => '${OWNCLOUD_OBJECTSTORE_SECRET}',
        ],
        'endpoint' => '${OWNCLOUD_OBJECTSTORE_ENDPOINT}',
        'command.params' => [
          'PathStyle' => ${OWNCLOUD_OBJECTSTORE_PATHSTYLE},
        ]
      ]
    ]
  ]
);
