#!/usr/bin/env sh

tags=$(cat /home/alex/.config/perso/tools/actions/data/music_tags | dmenu | tr '\n' ', ' | sed 's/.\{1\}$//')
all_tags="$tags"

notify-send $all_tags

while [[ -n $tags ]]; do
  tags=$(cat /home/alex/.config/perso/tools/actions/data/music_tags | dmenu -p "$all_tags" | tr '\n' ', ' | sed 's/.\{1\}$//')
  joined_tags="$all_tags,$tags"
  notify-send "#joined_tags"
  all_tags=$(echo "$joined_tags" | sed 's/,/\n/g' | awk '!a[$0]++' | tr '\n' ',' | sed 's/.\{1\}$//')
done


echo "$all_tags"
