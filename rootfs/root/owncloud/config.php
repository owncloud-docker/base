<?php
$CONFIG = array(
  "datadirectory" => "${OWNCLOUD_VOLUME_FILES}",
  "updatechecker" => false,
  "upgrade.disable-web" => true,
  "files_external_allow_create_new_local" => "${OWNCLOUD_ALLOW_EXTERNAL_LOCAL_STORAGE}",
  "apps_paths" => array(
    0 => array(
      "path" => OC::$SERVERROOT . "/apps",
      "url" => "/apps",
      "writable" => false
    ),
    1 => array(
      "path" => OC::$SERVERROOT . "/custom",
      "url" => "/custom",
      "writable" => true
    )
  )
);
