#!/usr/bin/env sh

echo "$1" >> /var/log/qutebrowser_scripts.log
youtube-dl -j "$1" > /tmp/track.json
cat /tmp/track.json | jq '{title: .title, uploader: .uploader, genre: .genre, url: "coucou"}') >> /var/log/qutebrowser_scripts.log
