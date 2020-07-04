#!/bin/bash

set -e

USER=`cat /etc/timemachine/secrets/username`
PASSWORD=`cat /etc/timemachine/secrets/password`
if [ -e /etc/timehome/secrets/vol_name ] ; then
    VOLUME_NAME=`cat /etc/timemachine/secrets/vol_root`
else
    VOLUME_NAME=/timemachine
fi
if [ -e /etc/timemachine/secrets/uid ]; then
    UID="--uid `cat /etc/timemachine/secrets/uid`"
fi
if [ -e /etc/timemachine/secrets/gid ]; then
    GID="--gid `cat /etc/timemachine/secrets/gid`"
fi

addusr $UID $GID $USER
mkdir $VOLUME_NAME/backups
chown -R $USER $VOLUME_NAME

cat <<'EOF' >> /etc/samba/smb.conf
[backups]
    comment = Backups
    path = $VOLUME_NAME/backups
    valid users = mudge
    read only = no
    vfs objects = catia fruit streams_xattr
    fruit:time machine = yes
EOF

smbpass -a $USER 

testparm -s

service smbd reload

