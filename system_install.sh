#!/bin/bash
# This script does its best to reinstall the commonly used software on my machine!

message="^^> Hi! If you are running the script, it seems everything is going smoothly. Up to now some general purpose software has been installed, and some classic configs made.\nYou will now have the possibility of installing some additional environments.\n"
todo="^^> We installed most of the software for you, but some things are not as easy as it seems; long story short; you need to do these things for the system to work ;)\n"


source ~/.config/perso/tools/generateLinks.sh

source ~/.config/perso/environments/minimal.sh

echo $message

title="The minimal installation is over."
prompt="Choose additional environements to install"
options=("desktop"
"dev"
"docker"
"musicCreation"
"sync"
"themes"
"webdev"
"work"
)

echo "$title"
PS3="$prompt "
select opt in "${options[@]}" "Quit"; do 

  case "$REPLY" in

    1 ) source ~/.config/perso/environments/desktop.sh;;
    2 ) source ~/.config/perso/environments/dev.sh;;
    3 ) source ~/.config/perso/environments/docker.sh;;
    4 ) source ~/.config/perso/environments/musicCreation.sh;;
    5 ) source ~/.config/perso/environments/sync.sh;;
    6 ) source ~/.config/perso/environments/themes.sh;;
    7 ) source ~/.config/perso/environments/webdev.sh;;
    8 ) source ~/.config/perso/environments/work.sh;;

    $(( ${#options[@]}+1 )) ) echo "Goodbye!"; break;;
    *) echo "Invalid option. Try another one.";continue;;

  esac

done


echo $todo

#Interactive stuff
echo "Last part, some interactive stuff like setting the default editor."
sudo update-alternatives --config editor
