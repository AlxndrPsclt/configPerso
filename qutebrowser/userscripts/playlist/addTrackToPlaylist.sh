#!/usr/bin/env sh


#Example of how to log errors from script
#whoami &>> /tmp/qtlog.txt

if [[ -n "$QUTE_URL" ]]; then
  /home/alex/.config/perso/tools/libs/playlist/addTrackToPlaylist.sh ${QUTE_URL}
fi
