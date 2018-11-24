#!/usr/bin/env bash

if [ ! -f ~/.bash_specifics ]; then
  echo "Generating default bash_specifics with a mew unique machine ID"
  touch ~/.config/perso/bash_config/bash_specifics
  echo "GALAXY_MACHINE_ID=`genpass`">>~/.config/perso/bash_config/bash_specifics
  ln -s ~/.config/perso/bash_config/bash_specifics ~/.bash_specifics
  source ~/.bash_specifics
fi
