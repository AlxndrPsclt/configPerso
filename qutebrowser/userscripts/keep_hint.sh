#!/usr/bin/env sh


#Example of how to log errors from script
#whoami &>> /tmp/qtlog.txt


#already_exists=$(yq r ~/notes/trax.yml "(url==${QUTE_URL})")
#already_exists=$(yq e ".[] | select(.url == \"$QUTE_URL\")" ~/notes/trax.yml)
#already_registered_tags=$(yq e '.[] | select(.url == \"$QUTE_URL\")' ~/notes/trax.yml | yq e '.tags' -)
#notify-send "$already_registered_tags"

notify-send "Saving hint: $QUTE_URL"

echo "$QUTE_URL" >> /tmp/hints.list
