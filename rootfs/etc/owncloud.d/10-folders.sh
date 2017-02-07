#!/usr/bin/env bash

echo "Creating folders..."
mkdir -p /mnt/data/{config,files,certs,apps}

echo "Data permissions..."
chown www-data:www-data /mnt/data/*
