#!/usr/bin/env sh

touch /tmp/shared_clipboard
ls /tmp/shared_clipboard | entr -s 'cat /tmp/shared_clipboard| wl-copy'
