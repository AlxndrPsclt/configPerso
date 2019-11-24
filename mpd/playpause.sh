#!/usr/bin/env bash
echo "yo" >> /tmp/control.log
export MPD_HOST=~/.local/run/mpd/socket
mpc toggle

