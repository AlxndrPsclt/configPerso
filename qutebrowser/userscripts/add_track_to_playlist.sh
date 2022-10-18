#!/usr/bin/env sh


#Example of how to log errors from script
#whoami &>> /tmp/qtlog.txt

notify-send "Saving selected URL $(echo $QUTE_SELECTED_TEXT | xargs)"

read -r -d '' RESULT_JSON << EOM
- title: "$(echo $QUTE_SELECTED_TEXT | xargs)"
  url:   "${QUTE_URL}"
  date:  "$(date +'%y-%m-%d %H:%M')"
EOM

echo "$RESULT_JSON" >> ~/music/play/linksQueue.yml
