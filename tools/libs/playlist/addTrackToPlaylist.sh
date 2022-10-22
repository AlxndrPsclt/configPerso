#!/usr/bin/env sh

#Script to save some usefull info regarding youtube music

echo ${1} >> /var/log/qutebrowser_scripts.log
yt-dlp -j ${1} > /tmp/track.json
cat /tmp/track.json | jq '{title: .title, uploader: .uploader, id: .id, webpage_url: .webpage_url, upload_date: .upload_date, duration_string: .duration_string, channel_url: .channel_url, tags: .tags, categories: .categories, view_count: .view_count, description: .description, thumbnail: .thumbnail}' | yq -P >> /home/alex/music/play/data/webcollection.yml
