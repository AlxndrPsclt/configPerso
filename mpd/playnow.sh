#!/usr/bin/env bash

mpc insert file://"$1"
cmd_output=$(mpc queued)
if [ -n "$cmd_output" ]; then
	mpc play
	mpc next
		else
	mpc play
fi
