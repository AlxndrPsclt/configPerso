#!/bin/bash
# This script links to another users bash config

message="^^> Hi! This script will backup (to /tmp/ORIGINUSER_bash_config.old), erase you bash_config (bash_aliases, bash_completion, bash_funcs, bash_profile, bashrc), and link to the config found in the home folder of the user given as argument."
echo $message

ORIGIN_USER=$1

if [ "$ORIGIN_USER" == "" ]; then
	echo "You must specify the user to copy!"
	exit 1
fi

ORIGIN_HOME_FOLDER=/home/$ORIGIN_USER
END_OF_FOLDERNAME=_bash_config.old
BACKUP_DESTINATION=/tmp/$ORIGIN_USER$END_OF_FOLDERNAME

echo $BACKUP_DESTINATION

if [ ! -d $ORIGIN_HOME_FOLDER ]; then
	echo "Specified folder $ORIGIN_HOME_FOLDER does not exist!"
	exit 1
fi

if [ ! -f $ORIGIN_HOME_FOLDER/.bashrc ]; then
	echo "No .bashrc found in $ORIGIN_HOME_FOLDER"
	exit 1
fi

if [ ! -d $BACKUP_DESTINATION ]; then
	echo "Creating destination folder..."
	mkdir $BACKUP_DESTINATION
fi

echo "All is well"
exit 1


mv ~/.bashrc $BACKUP_DESTINATION
mv ~/.bash_aliases $BACKUP_DESTINATION
mv ~/.bash_profile $BACKUP_DESTINATION
mv ~/.bash_funcs $BACKUP_DESTINATION
mv ~/.bash_completion $BACKUP_DESTINATION
ln -s ~/.config/perso/bash_config/bashrc ~/.bashrc
ln -s ~/.config/perso/bash_config/bash_aliases ~/.bash_aliases
ln -s ~/.config/perso/bash_config/bash_profile ~/.bash_profile
ln -s ~/.config/perso/bash_config/bash_funcs ~/.bash_funcs
ln -s ~/.config/perso/bash_config/bash_completion ~/.bash_completion



ln -s $ORIGINE_HOME_FOLDER/.bashrc ~/.bashrc
ln -s $ORIGINE_HOME_FOLDER/.bash_aliases ~/.bash_aliases
ln -s $ORIGINE_HOME_FOLDER/.bash_profile ~/.bash_profile
ln -s $ORIGINE_HOME_FOLDER/.bash_funcs ~/.bash_funcs
ln -s $ORIGINE_HOME_FOLDER/.bash_completion ~/.bash_completion
