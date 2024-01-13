#!/usr/bin/env sh

ip addr show edgevpn0
ping -c 2 10.1.0.100
ping -c 2 10.1.0.50
