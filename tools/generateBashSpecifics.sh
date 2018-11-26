#!/usr/bin/env bash

if [ ! -f ~/.bash_specifics ]; then
  echo "Generating default bash_specifics with a mew unique machine ID"
  touch ~/.config/perso/bash_config/bash_specifics
  NEW_ID=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 20)
  echo "GALAXY_MACHINE_ID=$NEW_ID">>~/.config/perso/bash_config/bash_specifics
  ln -s ~/.config/perso/bash_config/bash_specifics ~/.bash_specifics
  source ~/.bash_specifics
fi
