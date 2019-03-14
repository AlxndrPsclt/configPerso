#!/bin/bash

LINK="$(xsel --output --clipboard)"
[[ -z "$LINK" ]] && { echo "Clipboard empty" ; exit 1 ; }
echo $LINK


URL_REGEX='(https?|ftp|file)://[-A-Za-z0-9\+&@#/%?=~_|!:,.;]*[-A-Za-z0-9\+&@#/%=~_|]'
if [[ $LINK =~ $URL_REGEX ]]
then 
  URL_YT_REGEX='(https?)://(www\.)?(youtube.com|youtu.be|yt.be)[-A-Za-z0-9\+&@#/%?=~_|!:,.;]*[-A-Za-z0-9\+&@#/%=~_|]'
  if [[ $LINK =~ $URL_YT_REGEX ]]
  then
    echo "Valid youtube link."
		URL_YT_GROUPS_REGEX='(https://(www\.)?(youtube.com|youtu.be|yt.be)/watch\?v=((\w|-)*))(&list=(.*)|&index=([[:digit:]]*)|&t=([[:digit:]]*)s)+'
    YT_VIDEO_LINK=$([[ "$LINK" =~ $URL_YT_GROUPS_REGEX ]] && echo "${BASH_REMATCH[1]}")
    if [[ ! -z $YT_VIDEO_LINK ]]; then
      echo "Extracting youtube link $YT_VIDEO_LINK without playlist or index"
      LINK="$YT_VIDEO_LINK"
    fi
  else
    CONTINUE=`printf "yes\nno" | rofi -dmenu -theme social -p "No YTlink in clipboard; proceed anyway? $LINK."`
    if [ $CONTINUE != "yes" ]; then
      echo "Abort sending to social media"
      exit 1
    fi
  fi
else
  CONTINUE=`printf "yes\nno" | rofi -dmenu -theme social -p "No link in clipboard; proceed anyway? $LINK."`
  if [ $CONTINUE != "yes" ]; then
    echo "Abort sending to social media"
    exit 1
  fi
fi


group_to_post_to=$(cat ~/.config/perso/rofi/scripts/data/social_destinations | rofi -dmenu -theme social -p "Where to post $LINK ?")

[[ -z $group_to_post_to ]] && exit 1
echo $group_to_post_to
notify-send "Preparing to post\n$LINK\nto\n$group_to_post_to"

text=$(rofi -dmenu -theme social -p "Message to add to link")

echo $text
notify-send "Posted\n$LINK\nto\n$group_to_post_to:\n$text"

