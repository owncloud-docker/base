<?php

$CONFIG = array(
  "data_directory" => "/mnt/data/files",
  "apps_paths" => array(
    0 => array(
      "path" => OC::$SERVERROOT . "/apps",
      "url" => "/apps",
      "writable" => false
    ),
    1 => array(
      "path" => "/mnt/data/apps",
      "url" => "/custom",
      "writable" => true
    )
  )
);
