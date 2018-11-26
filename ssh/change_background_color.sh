#!/usr/bin/env bash
source ~/.config/inventory/index_inventory.sh
source ~/.config/perso/bash_config/bash_specifics
GALAXY_LOCAL_COLOR=${galaxy_hosts_colors["$GALAXY_MACHINE_ID"]}
CHANGE_BACKGROUND="\033]11;$GALAXY_LOCAL_COLOR\007"
printf $CHANGE_BACKGROUND
