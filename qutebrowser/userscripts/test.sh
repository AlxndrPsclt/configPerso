#!/usr/bin/env bash


#Example of how to log errors from script
#whoami &>> /tmp/qtlog.txt

#already_exists=$(yq r ~/notes/trax.yml "(url==${QUTE_URL})")

select_tags() {
  selected_tags=$(cat $1 | dmenu -p "$2"| tr '\n' ',' | sed 's/.\{1\}$//')
  echo $selected_tags
}

join_tags() {
  if [[ -n "$1" ]]; then
    joined_tags="$1,$2"
  else
    joined_tags="$2"
  fi
  all_tags_comma=$(echo "$joined_tags" | sed 's/,/\n/g' | awk '!a[$0]++' | tr '\n' ',')
  all_tags=${all_tags_comma::-1}   #Removes last ,
  echo $all_tags
}

all_tags=''

add_tags() {
  selected_tags=$(select_tags "$1" "$2")
  all_tags=$(join_tags "$all_tags" "$selected_tags")

  notify-send "$all_tags"

  while [[ -n "$selected_tags" ]]; do
    selected_tags=$(select_tags "$tags_file" "$all_tags")
    all_tags=$(join_tags "$all_tags" "$selected_tags")
  done

  all_tags_final=${all_tags::-1}   #Removes last ,
  echo "$all_tags_final"
}

removing_tags() {
  echo "removing tags"
}

tags_file='/home/alex/.config/perso/tools/actions/data/music_tags'
tags_prompt='Add tags :'

add_tags $tags_file $tags_prompt
