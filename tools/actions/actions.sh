#!/usr/bin/env bash

cd ~/.config/perso/tools/actions/menu

selected=$((fd . --follow --exact-depth 1 ; fd . --follow --exact-depth 2) | dmenu -i -fn 'Iosevka:size=40:style=bold' -nb '#2e3440' -nf '#81a1c1' -sb '#81a1c1' -sf '#2e3440')

notify-send $selected

cd -
