#!/usr/bin/env sh
echo '{ "command": ["get_property", "percent-pos"] }' | socat - /tmp/mpvsocket | jq '.data'
