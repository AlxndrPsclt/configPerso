# ~/.bash_logout: executed by bash(1) when login shell exits.

# when leaving the console clear the screen to increase privacy

if [ "$SHLVL" = 1 ]; then
    [ -x /usr/bin/clear_console ] && /usr/bin/clear_console -q
fi

if [[ -n "$SSH_CLIENT" ]]; then
	GALAXY_PREVIOUS_HOST=`cat /tmp/previous_ssh_host`
	GALAXY_LOCAL_COLOR=${galaxy_hosts_colors["$GALAXY_PREVIOUS_HOST"]}
	CHANGE_BACKGROUND="\033]11;$GALAXY_LOCAL_COLOR\007"
	printf $CHANGE_BACKGROUND
fi
