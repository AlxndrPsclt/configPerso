#!/bin/bash

title="Welcome to my AdminTools!"
prompt="Pick an option:"
options=("Show shortcuts" "Edit shortcuts" "Run install script"
  "Edit install script" "Edit this AdminTools script")

echo "$title"
PS3="$prompt "
select opt in "${options[@]}" "Quit"; do 

  case "$REPLY" in

    1 ) shortcuts;;
    2 ) eshortcuts;;
    3 ) ~/.config/perso/system_install.sh;;
    4 ) vim ~/.config/perso/system_install.sh;;
    5 ) vim ~/.config/perso/adminTools.sh;
      break;;

    $(( ${#options[@]}+1 )) ) echo "Goodbye!"; break;;
    *) echo "Invalid option. Try another one.";continue;;

  esac

done
