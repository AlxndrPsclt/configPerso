#!/usr/bin/env bash
while [[ true ]]; do
	selected_file=$(fd -t f . ~/documents/ | fzf);
	xdg-open "$selected_file" &
done
