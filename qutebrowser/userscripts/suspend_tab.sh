#!/usr/bin/env sh


#Example of how to log errors from script
#whoami &>> /tmp/qtlog.txt

notify-send "Caching current page $(echo $QUTE_URL | xargs)"

uuid=$(uuidgen)
echo "- $uuid.png: $QUTE_URL" >> /home/alex/atelier/qutebrowser_cache/cache.yml
echo "screenshot /home/alex/atelier/qutebrowser_cache/screenshots/$uuid.png" >> "$QUTE_FIFO"
