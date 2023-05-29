#!/bin/zsh

# Get the URL of the current page from Qutebrowser's environment variables

# Use yt-dlp to get the channel ID
#CHANNEL_NAME=$(yt-dlp --print channel --skip-download "$QUTE_URL")


initial_dir=$(pwd)

select_action () {
	cd "$1"

	selected=$((fd . --follow --exact-depth 1 ; fd . --follow --min-depth 2) | dmenu -i -l 8 -fn 'Iosevka:size=40:style=bold' -nb '#2e3440' -nf '#81a1c1' -sb '#81a1c1' -sf '#2e3440')

	if [ -d "$selected" ];
	then
		select_action "$selected"
	else
		"./$selected" "$QUTE_URL"
	fi
}

select_action "/home/alex/.config/perso/qutebrowser/userscripts/actions/menu"

cd $initial_dir
