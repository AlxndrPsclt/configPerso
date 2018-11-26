#!/bin/bash
# This script does its best to reinstall the commonly used software on my machine!

message="^^> Hi! If you are running the script, it seems everything is going smoothly. Up to now some general purpose software has been installed, and some classic configs made.\nYou will now have the possibility of installing some additional environments.\n"
todo="^^> We installed most of the software for you, but some things are not as easy as it seems; long story short; you need to do these things for the system to work ;)\n"


rm ~/.bashrc
rm ~/.bash_aliases
source ~/.bash_aliases
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

ln -s ~/.config/perso/ssh/rc .ssh/rc
ln -s ~/.config/perso/ssh/change_background_color.sh .ssh/

source ~/.config/perso/tools/generateBashSpecifics.sh

rm ~/.Xresources
ln -s ~/.config/perso/bash_config/urxvt/Xresources ~/.Xresources
rm ~/.urxvt
ln -s ~/.config/perso/urxvt ~/.urxvt

ln -s ~/.config/perso/urxvt/reload_xresource.sh ~/.reload_xresource.sh

ln -s ~/.config/perso/qutebrowser/ ~/.config/qutebrowser

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
