#!/usr/bin/env bash

handleERR() {
    echo "$0 Error on line $1"
}
set -e
trap 'handleERR $LINENO' ERR

if [ ! -f /home/spam/pwd ]
then
    isbg \
        --imaphost="$MAILSERVER" \
        --imapuser="$MAILUSER" \
        --imappasswd="$MAILPASS" \
        --ignorelockfile \
        --noninteractive \
        --savepw \
        --dryrun \
        --passwdfilename="/home/spam/pwd" \
        --imapinbox="$IMAPINBOX" \
        --spaminbox="$SPAMINBOX"
fi
