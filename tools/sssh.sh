#!/usr/bin/env sh

selected_host=$(grep -r '^Host' ~/.ssh/ | awk '{print $2}' | fzf --keep-right);
ssh "$selected_host"
