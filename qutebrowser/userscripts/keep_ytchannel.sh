#!/bin/bash

#Example of how to log errors from script
#whoami &>> /tmp/qtlog.txt

QUTEBROWSER_SCRIPTS_PATH="$HOME/.config/perso/qutebrowser/userscripts"
analysis=`virtualpy qutebrowserscript "$QUTEBROWSER_SCRIPTS_PATH/keep_ytchannel.py"`
