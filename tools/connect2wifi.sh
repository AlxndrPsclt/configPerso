#!/usr/bin/env sh

CHOSEN_NETWORK=$(wpa_cli -i wlan0 list_network | fzf | cut -f 1)
wpa_cli -i wlan0 select_network $CHOSEN_NETWORK
