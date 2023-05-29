#!/bin/sh

# Input: YouTube video URL
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 youtube-url"
    exit 1
fi

# Use yt-dlp to get the channel ID
CHANNEL_NAME=$(yt-dlp --print channel_name--skip-download "$1")
CHANNEL_ID=$(yt-dlp --print channel_id --skip-download "$1")

# Construct the RSS feed URL for the channel
RSS_FEED_URL="https://www.youtube.com/feeds/videos.xml?channel_id=${CHANNEL_ID}"

echo "feed \"${CHANNEL_NAME}\" \"${RSS_FEED_URL}\""
