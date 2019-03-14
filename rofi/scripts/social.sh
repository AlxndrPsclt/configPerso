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
      url_yt_groups_regex='(&list=.*&index=\d*)'
https://www.youtube.com/watch?v=9lZ55YXr-T0&list=UUh_cZ_qRf6uWdH26Zvca3hQ&index=4
    else
      continue=`echo "yes
no" | rofi -dmenu -theme social -p "No YTlink in clipboard; proceed anyway? $link."`
      if [ $continue != "yes" ]; then
        echo "Chose to leave"
        exit 1
      fi
    fi
else
    continue=`echo "yes
no" | rofi -dmenu -theme social -p "No link in clipboard; proceed anyway? $link."`
    if [ $continue != "yes" ]; then
      echo "Chose to leave"
      exit 1
    fi
fi


group_to_post_to=$(cat ~/.config/perso/rofi/scripts/data/social_destinations | rofi -dmenu -theme social -p "Where to post $link ?")

[[ -z $group_to_post_to ]] && exit 1
echo $group_to_post_to

text=$(rofi -dmenu -theme social -p "Message to add to link")

echo $text

