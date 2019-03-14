#!/bin/bash

link="$(xsel --output --clipboard)"
[[ -z "$link" ]] && { echo "Clipboard empty" ; exit 1 ; }
echo $link


url_regex='(https?|ftp|file)://[-A-Za-z0-9\+&@#/%?=~_|!:,.;]*[-A-Za-z0-9\+&@#/%=~_|]'
if [[ $link =~ $url_regex ]]
then 
  url_yt_regex='(https?)://(www\.)?(youtube.com|youtu.be|yt.be)[-A-Za-z0-9\+&@#/%?=~_|!:,.;]*[-A-Za-z0-9\+&@#/%=~_|]'
  if [[ $link =~ $url_yt_regex ]]
  then
    echo "Valid youtube link."
    url_yt_groups_regex='(https://(www\.)?(youtube.com|youtu.be|yt.be)/watch\?v=((\w|-)*))(\&list=(.*)&index=([[:digit:]]*))?'
    yt_video_link=$([[ "$yt_link" =~ $url_yt_groups_regex ]] && echo "${BASH_REMATCH[1]}")
    if [[ ! -z $yt_video_link ]]; then
      echo "Extracting youtube link $yt_video_link without playlist or index"
      $link=$yt_video_link
    fi
  else
    continue=`echo "yes
    no" | rofi -dmenu -theme social -p "No YTlink in clipboard; proceed anyway? $link."`
    if [ $continue != "yes" ]; then
      echo "Chose to leave"
      exit 1
    fi
  fi
else
  continue=`printf "yes\nno" | rofi -dmenu -theme social -p "No link in clipboard; proceed anyway? $link."`
  if [ $continue != "yes" ]; then
    echo "Abort sending to social media"
    exit 1
  fi
fi


group_to_post_to=$(cat ~/.config/perso/rofi/scripts/data/social_destinations | rofi -dmenu -theme social -p "Where to post $link ?")

[[ -z $group_to_post_to ]] && exit 1
echo $group_to_post_to
notify-send "Preparing to post\n$link\nto\n$group_to_post_to"

text=$(rofi -dmenu -theme social -p "Message to add to link")

echo $text
notify-send "Posted\n$link\nto\n$group_to_post_to:\n$text"

