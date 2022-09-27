#!/usr/bin/env zsh

#notify-send `whoami`
initial_dir=$(pwd)

select_action () {
	cd "$1"

	selected=$((fd . --follow --exact-depth 1 ; fd . --follow --min-depth 2) | dmenu -i -l 8 -fn 'Iosevka:size=40:style=bold' -nb '#2e3440' -nf '#81a1c1' -sb '#81a1c1' -sf '#2e3440')

	if [ -d "$selected" ];
	then
		select_action "$selected"
	else
		"./$selected"
	fi
}

select_action "/home/alex/.config/perso/tools/actions/menu"

cd $initial_dir
