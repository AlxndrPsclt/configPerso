#!/usr/bin/env sh
echo '{ "command": ["observe_property", 1, "percent-pos"] }' | socat - /tmp/mpvsocket
