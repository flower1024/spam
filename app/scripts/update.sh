#!/usr/bin/env bash

handleERR() {
    echo "$0 Error on line $1"
}
set -e
trap 'handleERR $LINENO' ERR

echo updating sa rules
for CHANNEL in $SA_CHANNELS; do
    echo loading SA rules from "$CHANNEL"
    sa-update --nogpg --channel "$CHANNEL" || echo "$CHANNEL" Failed with exit code $?
done

kill -SIGHUP "$(pidof spamd)"
