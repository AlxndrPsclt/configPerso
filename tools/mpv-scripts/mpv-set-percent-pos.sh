#!/usr/bin/env bash
if [[ -n "$1" ]]; then
  cmd='{"command": ["set_property", "percent-pos","'"$1"'"]}'
  echo $cmd
  echo $cmd | socat - /tmp/mpvsocket;
  #echo '{ "command": ["set_property", "percent-pos", "20" ] }' | socat - /tmp/mpvsocket

else
  echo 'Expected percent-pos argument not found' ;
fi

