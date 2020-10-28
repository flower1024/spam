#!/usr/bin/env bash

handleERR() {
    echo "$0 Error on line $1"
}
set -e
trap 'handleERR $LINENO' ERR

if [ -f /tmp/isbg.lock ]; then
    exit
fi

touch /tmp/isbg.lock

echo "Learning HAM/SPAM"
isbg \
    --teachonly \
    --imaphost="$MAILSERVER" \
    --imapuser="$MAILUSER" \
    --learnspambox="$LEARNINBOX" \
    --learnhambox="$LEARNHAMBOX" \
    --learnthendestroy \
    --noninteractive \
    --ignorelockfile \
    --passwdfilename="/home/spam/pwd" \
    --spamc

echo "Filter new Mails"
isbg \
    --delete \
    --imaphost="$MAILSERVER" \
    --imapuser="$MAILUSER" \
    --imapinbox="$IMAPINBOX" \
    --spaminbox="$SPAMINBOX" \
    --noninteractive \
    --ignorelockfile \
    --passwdfilename="/home/spam/pwd" \
    --spamc 

date +%s > /tmp/lastrun

rm /tmp/isbg.lock
