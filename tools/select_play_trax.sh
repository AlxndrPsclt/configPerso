#!/usr/bin/env sh

search_path="/home/alex/music/play/trax/"
selected=$(ls -c "$search_path" | awk '{ if (length($0) > 60) { print substr($0,0,60)"..."} else { print $0 }}' | dmenu)
notify-send "$selected"
