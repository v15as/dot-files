#!/bin/bash

BOLD_GREEN='\e[0;32;1m'

if [[ -z $1 ]]; then
    echo "URL not specified";
fi

video_directory="$HOME/Videos"

if [[ -n "$2" ]]; then
    resolution=$2
    echo "Downloading video in resolution: $resolution"
    yt-dlp -o "%(title)s.%(ext)s" "$1" -S "res:$resolution" -P "$video_directory"
else
    echo "Downloading video in original resolution"
    yt-dlp -o "%(title)s.%(ext)s" "$1" -P "$video_directory"
fi

file=$(yt-dlp "$1" --skip-download --print title)

echo -e "\n${BOLD_GREEN}Video stored in ${video_directory}/${file}"
