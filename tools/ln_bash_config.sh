#!/bin/bash
# This script links to another users bash config

message="^^> Hi! This script will backup (to /tmp/bash_config.old/), erase you bash_config (bash_aliases, bash_completion, bash_funcs, bash_profile, bashrc), and link to the config found in the home folder of the user given as argument."
echo $message


BACKUP_DESTINATION=bash_config.old/

if [ ! -d $BACKUP_DESTINATION ]; then
	echo "Creating destination folder..."
	mkdir $BACKUP_DESTINATION
fi

mv -vn ~/.bashrc $BACKUP_DESTINATION
mv -vn ~/.bash_aliases $BACKUP_DESTINATION
mv -vn ~/.bash_profile $BACKUP_DESTINATION
mv -vn ~/.bash_funcs $BACKUP_DESTINATION
mv -vn ~/.bash_completion $BACKUP_DESTINATION
ln -s ~/.config/perso/bash_config/bashrc ~/.bashrc
ln -s ~/.config/perso/bash_config/bash_aliases ~/.bash_aliases
ln -s ~/.config/perso/bash_config/bash_profile ~/.bash_profile
ln -s ~/.config/perso/bash_config/bash_funcs ~/.bash_funcs
ln -s ~/.config/perso/bash_config/bash_completion ~/.bash_completion

