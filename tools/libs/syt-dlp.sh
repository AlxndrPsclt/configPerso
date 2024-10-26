#!/bin/sh

# Ensure that yt-dlp and fzf are installed
if ! command -v yt-dlp >/dev/null 2>&1; then
  echo "yt-dlp not found. Install it to use this script." >&2
  exit 1
fi

if ! command -v fzf >/dev/null 2>&1; then
  echo "fzf not found. Install it to use this script." >&2
  exit 1
fi

# Check if a YouTube link is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <youtube_link>" >&2
  exit 1
fi

# Get the list of formats
formats=$(yt-dlp -F "$1" 2>/dev/null)

# Error handling if formats could not be fetched
if [ -z "$formats" ]; then
  echo "Failed to retrieve formats. Check your link or connection." >&2
  exit 1
fi

# Display formats and use fzf to select video format
video_format=$(echo "$formats" | awk '$2 ~ /^[0-9]+$/ {print $1 "\t" $3 "\t" $5 "\t" $7}' | fzf --prompt="Select video format: " --with-nth=2.. | awk '{print $1}')
if [ -z "$video_format" ]; then
  echo "No video format selected." >&2
  exit 1
fi

# Display formats again to select audio format
audio_format=$(echo "$formats" | awk '$2 ~ /^[0-9]+$/ && /audio/ {print $1 "\t" $3 "\t" $5}' | fzf --prompt="Select audio format: " --with-nth=2.. | awk '{print $1}')
if [ -z "$audio_format" ]; then
  echo "No audio format selected." >&2
  exit 1
fi

# Download with selected formats
yt-dlp -f "${video_format}+${audio_format}" "$1"

