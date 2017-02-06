#!/usr/bin/env bash
set -e

echo "Starting Cron..."
service cron start >/dev/null

echo "Starting Apache..."
service apache2 start >/dev/null
