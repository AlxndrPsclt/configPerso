#!/usr/bin/env bash


#Example of how to log errors from script
#whoami &>> /tmp/qtlog.txt

#already_exists=$(yq r ~/notes/trax.yml "(url==${QUTE_URL})")

select_tags_file() {
  selected_tags=$(cat $1 | dmenu -p "$2"| tr '\n' ',' | sed 's/.\{1\}$//')
  echo $selected_tags
}

select_tags() {
  selected_tags=$(echo -e "$1" | dmenu -p "$2"| tr '\n' ',' | sed 's/.\{1\}$//')
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
  selected_tags=$(select_tags_file "$1" "$2") all_tags=$(join_tags "$all_tags" "$selected_tags")
  notify-send "$all_tags"

  while [[ -n "$selected_tags" ]]; do
    selected_tags=$(select_tags_file "$tags_file" "$all_tags")
    all_tags=$(join_tags "$all_tags" "$selected_tags")
  done

  all_tags_final=${all_tags::-1}   #Removes last ,
  echo "$all_tags_final"
}

list2csv() {
  # Take a series of lines; turns them to comma separated values
  csv=$(echo "$1" | tr '\n' ',' | sed 's/.\{1\}$//')
  echo "$csv"
}

csv2list() {
  # Take a series comma separated values; turns them to a list of lines
  list=$(echo "$1" | sed 's/,/\n/g')
  echo -e "$list"
}

remove_tags() {
  remaining_tags_csv="$1"
  remaining_tags_list=$(csv2list "$1")

  to_remove_tags='placeholder_to_remove'

  #TODO: Correct problem when tags are empty
  while [[ $to_remove_tags ]]; do
    to_remove_tags=$(select_tags "$remaining_tags_list" "DEL $remaining_tags_csv")
    #TODO: Correct problem of multiple selection of items to remove failing
    remaining_tags_list_bis=$(echo "$remaining_tags_list" | sed "/^$to_remove_tags$/d")
    remaining_tags_list="$remaining_tags_list_bis"
    remaining_tags_csv=$(list2csv "$remaining_tags_list")
  done
  echo "$remaining_tags_csv"
  #all_tags=$(join_tags "$all_tags" "$selected_tags")
}

tags_file='/home/alex/.config/perso/tools/actions/data/music_tags'
tags_prompt='Add tags :'

all_tags_csv=$(add_tags $tags_file $tags_prompt)

while [[ $will!='Done' ]]; do
  
  will=$(echo -e "Done\nRemove some tags\nAdd more tags" | dmenu -p "$all_tags_csv")
  will=${will:-"Done"}

  if [[ $will == 'Done' ]]; then
    notify-send "Il faut save puis on se casse"
    exit 0
  elif [[ $will == 'Remove some tags' ]]; then
    notify-send "Need to remove"
    all_tags_csv_bis=$(remove_tags "$all_tags_csv")
    all_tags_csv="$all_tags_csv_bis"
  elif [[ $will == 'Add more tags' ]]; then
    notify-send "Need to add"
    #TODO: Adds the handling of lists properly; to hide the already selected
    all_tags_csv_bis=$(add_tags "$tags_file" "$all_tags_csv")
    all_tags_csv="$all_tags_csv_bis"
  fi 
done
