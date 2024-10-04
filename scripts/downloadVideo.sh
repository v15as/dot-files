#!/bin/bash

BOLD_GREEN='\e[0;32;1m'
if [[ -z $1 ]]; then
    echo "URL not specified";
else
    video_directory="$HOME/Videos"
    file=$(yt-dlp "$1" --skip-download --print title)
    yt-dlp "$1" -P $video_directory
    echo -e "\n${BOLD_GREEN}Video stored in ${video_directory}/${file}"
fi
