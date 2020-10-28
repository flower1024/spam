#!/usr/bin/env bash

handleERR() {
    echo "$0 Error on line $1"
}
set -e
trap 'handleERR $LINENO' ERR

if [ ! -d /home/spam/.spamassassin ]; then
    mkdir -p /home/spam/.spamassassin
fi

if [ ! -f /home/spam/.spamassassin/user_prefs ]; then
    cp /app/conf/user_prefs /home/spam/.spamassassin
fi

chown spam:spam -R /home/spam
chown spam:spam -R /tmp
chmod ugo+rwx -R /tmp

for CHANNEL in $SA_CHANNELS; do
    echo loading SA rules from $CHANNEL
    sa-update --nogpg --channel $CHANNEL || echo $CHANNEL Failed with exit code $?
done
