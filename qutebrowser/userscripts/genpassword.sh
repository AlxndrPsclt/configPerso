#!/usr/bin/env bash


#Example of how to log errors from script
#whoami &>> /tmp/qtlog.txt


#already_exists=$(yq r ~/notes/trax.yml "(url==${QUTE_URL})")
#already_exists=$(yq e ".[] | select(.url == \"$QUTE_URL\")" ~/notes/trax.yml)
QUTE_URL="https://www.cyberciti.biz/faq/get-extract-domain-name-from-url-in-linux-unix-bash/"
domain=$(echo "$QUTE_URL" | awk -F/ '{print $3}' | sed 's/^www\.//')
notify-send "$domain"

#QUTEBROWSER_SCRIPTS_PATH="$HOME/.config/perso/qutebrowser/userscripts"
#analysis=`virtualpy qutebrowserscript "$QUTEBROWSER_SCRIPTS_PATH/keep_tracks.py"`
