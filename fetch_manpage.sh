#!/bin/sh

# This script will automatically install man pages via `apk` commands
# as Alpine Linux DOES NOT AUTOMATICALLY INSTALL documentation 
# dependencies that you cannot visit usage of command via `man <command name>`
# if `-doc` packages does not included in `apk add` command.

if [[ $UID != 0 && $EUID != 0 ]]; then
    echo "This script must be run as root" >&2
    exit 1
fi

apk list -I | sed -rn '/-doc/! s/([a-z-]+[a-z]).*/\1/p' | awk '{ print system("apk info \""$1"-doc\" > /dev/null") == 0 ? $1 "-doc" : "" }' | xargs apk --no-cache add
