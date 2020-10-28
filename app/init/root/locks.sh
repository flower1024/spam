#!/usr/bin/env bash

handleERR() {
    echo "$0 Error on line $1"
}
set -e
trap 'handleERR $LINENO' ERR

if [ -f /home/spam/.spamassassin/bayes.lock ]; then
    rm /home/spam/.spamassassin/bayes.lock
fi

if [ -f /tmp/isbg.lock ]; then
    rm /tmp/isbg.lock
fi
