#!/bin/bash

initial_dir=`pwd`

cd ~/.config/perso/qutebrowser/userscripts/virtualenvs/qutebrowserscript

virtualenv_target_name="qutebrowserscript"

if [ -d "$WORKON_HOME/$virtualenv_target_name" ]; then
	echo "Virtualenv $virtualenv_target_name already exists. Delete it in case of problem and rerun.";
	exit
fi

python_version=`cat pyversion`

source `which virtualenvwrapper.sh`

mkvirtualenv "$virtualenv_target_name" -p "$python_version"
pip install -r requirements.txt 

cd $initial_dir
