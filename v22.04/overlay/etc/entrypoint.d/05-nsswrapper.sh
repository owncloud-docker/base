#!/usr/bin/env bash

if ! getent passwd "$(id -u)" &>/dev/null && [ -e /usr/lib/libnss_wrapper.so ]; then
    USER_ID=$(id -u)
    GROUP_ID=$(id -g)
    HOME=/home/owncloud

    grep -v -e ^owncloud -e "^$USER_ID" /etc/passwd >"$HOME/passwd"
    echo "owncloud:x:${USER_ID}:${GROUP_ID}:ownCloud Application User:${HOME}:/sbin/nologin" >>"$HOME/passwd"

    export LD_PRELOAD=libnss_wrapper.so
    export NSS_WRAPPER_PASSWD=${HOME}/passwd
    export NSS_WRAPPER_GROUP=/etc/group
fi
