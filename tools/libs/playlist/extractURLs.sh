#!/usr/bin/env sh

grep http "$1" | sed 's/http/\nhttp/g' | grep -E "^http" | sed 's/\(^http[^ <]*\)\(.*\)/\1/g' | grep -E 'youtu|soundcloud|bandcamp' > downloadURLS.sh
