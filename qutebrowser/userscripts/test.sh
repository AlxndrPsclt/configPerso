#!/usr/bin/env sh


#Example of how to log errors from script
#whoami &>> /tmp/qtlog.txt

#already_exists=$(yq r ~/notes/trax.yml "(url==${QUTE_URL})")

select_tags_file() {
  local dmenu_prompt=$1
  local selected_tags=$(cat $tags_file | dmenu -p "$dmenu_prompt"| tr '\n' ',' | sed 's/.\{1\}$//')
  echo $selected_tags
}

select_tags_from_csv() {
  local choices=$(csv2list "$1")
  local dmenu_prompt="$2"
  local selected_tags=$(echo -e "$choices" | dmenu -p "$dmenu_prompt"| tr '\n' ',' | sed 's/.\{1\}$//')
  notify-send "From select_tags_from_csv $selected_tags"
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


add_tags() {
  if [[ -n $1 ]]; then
    local tags_prompt=$1
  else
    local tags_prompt=$all_tags
  fi
  local selected_tags='placeholder'
  local current_tags='placeholder'

  while [[ -n "$selected_tags" ]]; do
    selected_tags=$(select_tags_file "$tags_prompt")
    current_tags=$(join_tags "$all_tags" "$selected_tags")
    all_tags=$(echo "$current_tags" | sed -E 's/,$//')
    tags_prompt=$current_tags
  done
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
  local to_remove_tag='placeholder_to_remove'
  local remaining_tags="$all_tags"

  #TODO: Correct problem when tags are empty
  while [[ -n "$to_remove_tag" ]]; do
    to_remove_tag=$(select_tags_from_csv "$all_tags" "DEL: ")
    #TODO: Correct problem of multiple selection of items to remove failing
    if [[ -n "$to_remove_tag" ]]; then
      remaining_tags=$(echo "$all_tags" | sed -E "s/($to_remove_tag,|^$to_remove_tag$|,$to_remove_tag)//" | sed -E 's/,$//')
      all_tags="$remaining_tags"
      if [[ -z "$all_tags" ]]; then
        unset to_remove_tag
        add_tags "$tags_prompt"
      fi
    fi
  done
  #all_tags=$(join_tags "$all_tags" "$selected_tags")
}

tags_file='/home/alex/.config/perso/tools/actions/data/music_tags'
tags_prompt='Add tags :'
all_tags=''


add_tags "$tags_prompt"

while [[ $will!='Done' ]]; do

  will=$(echo -e "Done\nRemove some tags\nAdd more tags" | dmenu -p "$all_tags")
  will=${will:-"Done"}

  if [[ $will == 'Done' ]]; then
    notify-send "Il faut save puis on se casse"
    exit 0
  elif [[ $will == 'Remove some tags' ]]; then
    notify-send "Need to remove"
    remove_tags
  elif [[ $will == 'Add more tags' ]]; then
    notify-send "Need to add"
    #TODO: Adds the handling of lists properly; to hide the already selected
    add_tags
  fi
done
