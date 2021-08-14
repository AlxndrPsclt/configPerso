#!/usr/bin/env bash

CHOSEN_NETWORK=$(wpa_cli -i wlp3s0 list_network | fzf | cut -f 1)
wpa_cli -i wlp3s0 select_network $CHOSEN_NETWORK



