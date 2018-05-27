#!/bin/bash
# This script does its best to reinstall the commonly used software on my machine!

message="^^> Hi! If you are running the script, it seems everything is going smoothly. Up to now some general purpose software has been installed, and some classic configs made.\nYou will now have the possibility of installing some additional environments.\n"
todo="^^> We installed most of the software for you, but some things are not as easy as it seems; long story short; you need to do these things for the system to work ;)\n"


rm ~/.bashrc
rm ~/.bash_aliases
rm ~/.bash_profile
rm ~/.bash_funcs
rm ~/.bash_completion
ln -s ~/.config/perso/bash_config/bashrc ~/.bashrc
ln -s ~/.config/perso/bash_config/bash_aliases ~/.bash_aliases
ln -s ~/.config/perso/bash_config/bash_profile ~/.bash_profile
ln -s ~/.config/perso/bash_config/bash_funcs ~/.bash_funcs
ln -s ~/.config/perso/bash_config/bash_completion ~/.bash_completion
rm -rf ~/.byobu
ln -s ~/.config/perso/byobu/ .byobu

if [ ! -f ~/.bash_specifics ]; then
  echo "Copying a default bash_specifics; you might want to go edit this file."
  cp ~/.config/perso/bash_config/bash_specifics ~/.bash_specifics
fi

source ~/.config/perso/environments/minimal.sh

echo $message

title="The minimal installation is over."
prompt="Choose additional environements to install"
options=("desktop"
"webdev"
"musicCreation"
"sync"
)

echo "$title"
PS3="$prompt "
select opt in "${options[@]}" "Quit"; do 

  case "$REPLY" in

    1 ) source ~/.config/perso/environments/desktop.sh;;
    2 ) source ~/.config/perso/environments/webdev.sh;;
    3 ) source ~/.config/perso/environments/musicCreation.sh;;
    3 ) source ~/.config/perso/environments/sync.sh;;

    $(( ${#options[@]}+1 )) ) echo "Goodbye!"; break;;
    *) echo "Invalid option. Try another one.";continue;;

  esac

done


echo $todo

#Interactive stuff
echo "Last part, some interactive stuff like setting the default editor."
sudo update-alternatives --config editor
