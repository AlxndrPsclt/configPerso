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
"Edit bash_funcs"
"Edit bash_completion"
"Edit your /etc/environment"
"Commit and push config"
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
	6 ) source ~/.config/perso/bash_config/.bashrc;
		source ~/.config/perso/bash_config/.bash_profile;;
	7 ) vim ~/.config/perso/bash_config/.bashrc;;
	8 ) vim ~/.config/perso/bash_config/.bash_aliases;;
	9 ) vim ~/.config/perso/bash_config/.bash_funcs;;
	10 ) vim ~/.config/perso/bash_config/.bash_completion;;
	11 ) sudo vim /etc/environment;;
	12 ) ~/.config/perso/gitSaveConfig.sh;;

    $(( ${#options[@]}+1 )) ) echo "Goodbye!"; break;;
    *) echo "Invalid option. Try another one.";continue;;

  esac

done
