<?php

if (isset($_SERVER["HTTP_X_FORWARDED_HOST"])) {
  $domain = $_SERVER["HTTP_X_FORWARDED_HOST"];
} else if (isset($_SERVER["SERVER_NAME"])) {
  $domain = $_SERVER["SERVER_NAME"];
} else {
  $domain = "localhost";
}

$CONFIG = array(
  "trusted_domains" => array(
    0 => $domain
  )
);

var_dump($CONFIG);
