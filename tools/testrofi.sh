#!/bin/bash

group_to_post_to=$(echo "Fais péter ton ons!
Deepspace Dreams" | rofi -dmenu -p "Where to post current link?")

[[ -z $group_to_post_to ]] && exit
echo $group_to_post_to

text=$(rofi -dmenu -p "Message to add to link")

echo $text
