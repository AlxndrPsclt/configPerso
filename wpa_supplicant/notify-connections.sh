#!/usr/bin/env bash

case "$2" in
    CONNECTED)
        current_network=$(wpa_cli status | grep ^ssid | cut -d "=" -f 2)
        notify-send " CONNECTED TO $current_network";
        ;;
    DISCONNECTED)
        notify-send " WIFI DISCONNECTED";
        ;;
esac
