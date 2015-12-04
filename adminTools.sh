#!/bin/bash

title="Welcome to my AdminTools!"
prompt="Pick an option:"
options=("Show shortcuts"
"Edit shortcuts"
"Run install script"
"Edit install script"
"Edit this AdminTools script"
"Source bashrc/_aliases/_profile"
"Edit bashrc"
"Edit bash_aliases"
)

echo "$title"
PS3="$prompt "
select opt in "${options[@]}" "Quit"; do 

  case "$REPLY" in

    1 ) less ~/.config/perso/shortcuts;;
    2 ) vim ~/.config/perso/shortcuts;;
    3 ) ~/.config/perso/system_install.sh;;
    4 ) vim ~/.config/perso/system_install.sh;;
    5 ) vim ~/.config/perso/adminTools.sh;
      break;;
	6 ) source ~/.config/perso/.bash_config/bashrc;
		source ~/.config/perso/.bash_config/bash_profile;
		source ~/.config/perso/.bash_config/bash_aliases;;
	7 ) vim ~/.config/perso/bash_config/bashrc;;
	8 ) vim ~/.config/perso/bash_config/bash_aliases;;

    $(( ${#options[@]}+1 )) ) echo "Goodbye!"; break;;
    *) echo "Invalid option. Try another one.";continue;;

  esac

done
