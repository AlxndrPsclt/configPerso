#!/usr/bin/env bash

. ~/.bash_aliases

	if [ -z $@ ];
		then
			link=$(readlink -f ./)
		else
			link=$(readlink -f $@)
	fi
echo "Copied: $link"
echo $link | copy
