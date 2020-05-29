#!/usr/bin/env bash
folder=${1-~/music/collection/}
class=${2-pop-finder-music}

while [[ true ]]; do
	selected_file=$(fd -t f -t d -E *_data '(.*\.(mp3|wav|flac))' $folder | fzf --tiebreak=end --keep-right --prompt "♪ " --color=16 --preview='play {} trim 01:10 5' --preview-window=up:hidden --bind=ctrl-p:toggle-preview);
	if [ ! -z $selected_file ]; then
		xdg-open "$selected_file" &
	fi
	i3-msg [class="$class"] move scratchpad
done
