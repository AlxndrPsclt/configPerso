#!/usr/bin/env bash


#Example of how to log errors from script
#whoami &>> /tmp/qtlog.txt


already_exists=$(yq r ~/notes/trax.yml "(url==${QUTE_URL})")

if [ -z "$already_exists" ]; then
  notify-send "Saving track: $QUTE_TITLE
  The current URL: $QUTE_URL"

  tags=$(sh /home/alex/.config/perso/qutebrowser/userscripts/select_tags.sh)

  notify-send "$tags"

  sed "s/TITLE/$QUTE_TITLE/" /home/alex/.config/perso/tools/actions/templates/track.yml.template | sed "s|URL|$QUTE_URL|" | sed "s/TAGS/$tags/" >> ~/notes/trax.yml

else
  notify-send "Already exists"
  tags=$(echo "$already_exists" | yq r - 'tags' | sed 's/^\[//' | sed 's/\]$//' | sed 's/ //g')

  tags=$(sh /home/alex/.config/perso/qutebrowser/userscripts/select_tags.sh /home/alex/.config/perso/tools/actions/data/music_tags "$tags" "$tags")
  yq w ~/notes/trax.yml "(url==$QUTE_URL) tags" "[$tags]"

fi

#QUTEBROWSER_SCRIPTS_PATH="$HOME/.config/perso/qutebrowser/userscripts"
#analysis=`virtualpy qutebrowserscript "$QUTEBROWSER_SCRIPTS_PATH/keep_tracks.py"`
