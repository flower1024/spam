#!/usr/bin/env bash

handleERR() {
    echo "$0 Error on line $1"
}
set -e
trap 'handleERR $LINENO' ERR

exec spamd --allow-tell --create-prefs --max-children 5 -u spam