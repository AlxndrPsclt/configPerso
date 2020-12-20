#!/bin/bash

#Example of how to log errors from script

QUTEBROWSER_SCRIPTS_PATH="$HOME/.config/perso/qutebrowser/userscripts"
analysis=`virtualpy qutebrowserscript "$QUTEBROWSER_SCRIPTS_PATH/keep_ytchannel.py"`
echo "launch $analysis" &>> /tmp/qtlog.txt
