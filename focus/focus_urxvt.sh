#!/bin/bash
if [[ -z $1 ]] ; then
	FILE_TO_EDIT=~/.config/perso/focus/focus_default_text.md
	echo "Launch default file"
else
	FILE_TO_EDIT=$1
	echo "Launch $1 file"
fi

urxvt -name "FocusVim" -name "FocusVim" -fn "xft:Cousine for Powerline:style=Regular:size=20, xft:FontAwesome:style=Bold:size=20" -e ~/.config/perso/focus/focusvim $FILE_TO_EDIT

