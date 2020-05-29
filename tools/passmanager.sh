#!/usr/bin/env bash
while [[ true ]]; do
	spass
	i3-msg [class="pop-pass"] move scratchpad
done
