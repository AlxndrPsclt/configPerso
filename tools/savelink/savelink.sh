#!/usr/bin/env bash
folder=${1-~/documents/}
class=${2-pop-finder}

selected_tags=$(cat tags.list | fzf -m --marker "#" --expect=ctrl-space --print-query)

echo $selected_tags

#while [[ true ]]; do
#	selected_file=$(fd -t f -t d . $folder | fzf --tiebreak=end --keep-right);
#	if [ ! -z $selected_file ]; then
#		xdg-open "$selected_file" &
#	fi
#	i3-msg [class="$class"] move scratchpad
#done
