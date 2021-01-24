#!/usr/bin/env bash
where=$(echo -e 'trax\nsets' | dmenu)
if [[ "$where" == 'trax' || "$where" == 'sets' ]]; then
  notify-send "Will download this track or set for later"
  tsp youtube-dl -x -f bestaudio/best -o "/home/alex/music/play/$where/%(title)s-%(id)s.%(ext)s" "$1"
  tsp notify-send "Download complete";
else
  notify-send "Unknown selected"
fi
