#!/bin/bash

#Example of how to log errors from script
#whoami &>> /tmp/qtlog.txt

QUTEBROWSER_SCRIPTS_PATH="$HOME/.config/perso/qutebrowser/userscripts"
analysis=`virtualpy qutebrowserscript "$QUTEBROWSER_SCRIPTS_PATH/myscript.py"` &>> /tmp/qtlog.txt

#cd $HOME/Notes

#find -L -type f | awk '{print substr($0, 3, length($0)-5)}' | rofi -dmenu -theme social -p "Select the list to add this track ?"
