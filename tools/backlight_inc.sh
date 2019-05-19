#!/bin/bash

LIGHT_LEVEL=$( sudo light )

if [ "$LIGHT_LEVEL" -gt 5 ]
then
  echo "Plus grand"
else
	echo "Plus petit"
fi

#sudo light -A 5
