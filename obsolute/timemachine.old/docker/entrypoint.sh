#!/bin/bash

set -e

AFP_LOGIN=`cat /etc/timemachine/secrets/username`
AFP_PASSWORD=`cat /etc/timemachine/secrets/password`
AFP_NAME=`cat /etc/timemachine/secrets/vol_name`
if [ -e /etc/timemachine/secrets/vol_root ]; then
    AFP_ROOT=`cat /etc/timemachine/secrets/vol_root`
else
    AFP_ROOT=/timemachine
fi
if [ -e /etc/timemachine/secrets/size_limit ]; then
    AFP_SIZE_LIMIT=`cat /etc/timemachine/secrets/size_limit`
fi
if [ -e /etc/timemachine/secrets/uid ]; then
    OPTION_PUID="-i `cat /etc/timemachine/secrets/uid`"
fi
if [ -e /etc/timemachine/secrets/gid ]; then
    OPTION_PGID="-g `cat /etc/timemachine/secrets/gid`"
fi

add-account $PUID $PGID "$AFP_LOGIN" "$AFP_PASSWORD" "$AFP_NAME" "$AFP_ROOT" $AFP_SIZE_LIMIT

exec /usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf
