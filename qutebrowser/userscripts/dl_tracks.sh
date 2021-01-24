#!/usr/bin/env bash


#Example of how to log errors from script
#whoami &>> /tmp/qtlog.txt

if [[ -n "$QUTE_URL" ]]; then
  /home/alex/.config/perso/tools/enqueueTrack.sh \"$QUTE_URL\"
fi
