#!/bin/bash

link="$(xsel --output --clipboard)"
[[ -z "$link" ]] && { echo "Clipboard empty" ; exit 1 ; }


group_to_post_to=$(cat ~/.config/perso/rofi/scripts/data/social_destinations | rofi -dmenu -theme social -p "Where to post $link ?")

[[ -z $group_to_post_to ]] && exit
echo $group_to_post_to

text=$(rofi -dmenu -theme social -p "Message to add to link")

echo $text

