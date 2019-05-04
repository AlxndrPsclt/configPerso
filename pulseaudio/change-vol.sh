#!/bin/bash

DEFAULT_SINK="$(pactl info | grep 'Default Sink' | awk '{ print $3 }')"

if [ -z "$1" ]
	  then
			echo "No action specified"
		else
			if [ $1 == "+" ]
			then
				pactl set-sink-volume $DEFAULT_SINK +5% #increase sound volume
				CURRENT_VOLUME="$( pamixer --get-volume-human )"
				notify-send " $CURRENT_VOLUME"
			elif [ $1 == "-" ]
			then
				pactl set-sink-volume $DEFAULT_SINK -5% #decrease sound volume
				CURRENT_VOLUME="$( pamixer --get-volume-human )"
				notify-send " $CURRENT_VOLUME"
			elif [ $1 == "0" ]
			then
				pactl set-sink-mute $DEFAULT_SINK toggle
				CURRENT_VOLUME="$( pamixer --get-volume-human )"
				notify-send "X $CURRENT_VOLUME"
			else
				echo "Unknown option"
			fi
fi
