#!/usr/bin/env bash


#Example of how to log errors from script
#whoami &>> /tmp/qtlog.txt

notify-send "The current URL: $QUTE_URL
The current title: $QUTE_TITLE"

already_exists=$(yq r ~/notes/trax.yml "(url==${QUTE_URL})")

add_tags() {
  tags=$(cat /home/alex/.config/perso/tools/actions/data/music_tags | dmenu | tr '\n' ',' | sed 's/.\{1\}$//')
  all_tags="$tags"

  notify-send $all_tags

  while [[ -n $tags ]]; do
    tags=$(cat /home/alex/.config/perso/tools/actions/data/music_tags | dmenu -p "$all_tags" | tr '\n' ',' | sed 's/.\{1\}$//')
    joined_tags="$all_tags,$tags"
    notify-send "$joined_tags"
    all_tags_comma=$(echo "$joined_tags" | sed 's/,/\n/g' | awk '!a[$0]++' | tr '\n' ',')
    all_tags=${all_tags_comma::-1}   #Removes last ,
    notify-send "$all_tags"
  done

  echo "$all_tags"
}


if [ -z "$already_exists" ]; then
  notify-send "This is a new trac"
  tags=$(add_tags)

  notify-send "$tags"


  sed "s/TITLE/$QUTE_TITLE/" /home/alex/.config/perso/tools/actions/templates/track.yml.template | sed "s|URL|$QUTE_URL|" | sed "s/TAGS/$tags/" >> ~/notes/trax.yml

else
  notify-send "Already exists"

  add_or_remove=$(echo -e "Add tags?\nRemove tags?" | dmenu)

  tags=$(echo $already_exists | yq r - 'tags')
  notify-send "$add_or_remove"
fi

#QUTEBROWSER_SCRIPTS_PATH="$HOME/.config/perso/qutebrowser/userscripts"
#analysis=`virtualpy qutebrowserscript "$QUTEBROWSER_SCRIPTS_PATH/keep_tracks.py"`
