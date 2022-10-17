#!/usr/bin/env sh


#Example of how to log errors from script
#whoami &>> /tmp/qtlog.txt


#already_exists=$(yq r ~/notes/trax.yml "(url==${QUTE_URL})")
#already_exists=$(yq e ".[] | select(.url == \"$QUTE_URL\")" ~/notes/trax.yml)
#already_registered_tags=$(yq e '.[] | select(.url == \"$QUTE_URL\")' ~/notes/trax.yml | yq e '.tags' -)
#notify-send "$already_registered_tags"

notify-send "Saving track: $QUTE_TITLE
The current URL: $QUTE_URL"

tags=$(sh /home/alex/.config/perso/qutebrowser/userscripts/select_tags.sh)

echo "Tags computed"
echo "$tags"
notify-send "$tags"

echo $QUTE_TITLE
echo $QUTE_URL
echo $QUTEBROWSER_SCRIPTS_PATH

sed "s/TITLE/${QUTE_TITLE//&/\\&}/" /home/alex/.config/perso/tools/actions/templates/track.yml.template | sed "s/DATE/$(date +'%y-%m-%d %H:%M')/" | sed "s|URL|${QUTE_URL//&/\\&}|" |  sed "s/TAGS/$tags/" >> ~/notes/trax.yml

#else
#  notify-send "Already exists"
#  tags=$(echo "$already_registered_tags" | sed 's/^\[//' | sed 's/\]$//' | sed 's/ //g')
#
#  tags=$(/home/alex/.config/perso/qutebrowser/userscripts/select_tags.sh /home/alex/.config/perso/tools/actions/data/music_tags "$tags" "$tags")

  #yq w ~/notes/trax.yml "(url==$QUTE_URL) tags" "[$tags]"


#QUTEBROWSER_SCRIPTS_PATH="$HOME/.config/perso/qutebrowser/userscripts"
#analysis=`virtualpy qutebrowserscript "$QUTEBROWSER_SCRIPTS_PATH/keep_tracks.py"`
