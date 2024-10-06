#!/usr/bin/env zsh

#notify-send `whoami`
initial_dir=$(pwd)

select_action () {
  cd "$1"

  selected=$((fd . --follow --exact-depth 1 ; fd . --follow --min-depth 2) | bemenu-contxtl)

  if [ -d "$selected" ];
  then
    select_action "$selected"
  else
    "./$selected"
  fi
}

select_action "/home/alex/.config/perso/tools/actions/menu"

cd $initial_dir
