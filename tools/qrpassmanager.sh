#!/usr/bin/env bash
while [[ true ]]; do
	spass
	i3-msg [class="pop-qrpass"] move scratchpad
done
