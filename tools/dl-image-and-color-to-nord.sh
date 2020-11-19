#!/usr/bin/env bash

mkdir -p /tmp/wallpapers

downloaded_file=$(mktemp -p /tmp/wallpapers)
converted_file=$downloaded_file.conv

wget -O $downloaded_file $1 &&
recolor-image-to-nord.sh $downloaded_file 16 $converted_file &&
feh $converted_file &

