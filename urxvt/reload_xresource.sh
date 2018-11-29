#!/usr/bin/env bash
GALAXY_LOCAL_COLOR=${galaxy_hosts_colors["$GALAXY_MACHINE_ID"]}
xrdb -DDEFAULT_BACKGROUND_COLOR="$GALAXY_LOCAL_COLOR" -merge ~/.Xresources
