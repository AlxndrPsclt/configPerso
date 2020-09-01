#!/usr/bin/env bash
folder=${1-~/downloads/}
class=${2-pop-finder}

while [[ true ]]; do
	selected_file=$(fd -t f -t d . $folder | fzf --tiebreak=end --keep-right);
	if [ ! -z $selected_file ]; then
		xdg-open "$selected_file" &
	fi
	i3-msg [class="$class"] move scratchpad
done
