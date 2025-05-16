#!/bin/bash

BOLD_GREEN='\e[0;32;1m'

help_message(){
    echo "Usage: downloadAudio [options] URL"
    echo "Options:"
    echo "  [URL]       URL of the video to extract audio as MP3"
    echo "  -h          Show help message"
    echo "  -m URL      Download audio from URL in FLAC format"
}

download_music(){
    local format=$1
    local url=$2
    if [ "$format" = "mp3" ]; then
        video_directory="$HOME/Videos"
    else 
        video_directory="$HOME/Music"
    fi
    file=$(yt-dlp "$url" --skip-download --print title)
    yt-dlp "$url" --extract-audio --audio-format $format -P $video_directory
    echo -e "\n${BOLD_GREEN}Audio stored in ${video_directory}/${file}"
}

if [[ -z $1 ]]; then
    echo "Invalid usage";
    echo "Use 'downloadAudio -h' for more information";
    exit 1
fi

flac_mode=false
vide_url=""

while getopts "hm:" OPTION; do
    case "$OPTION" in
        h)
            help_message
            exit 0
            ;;
        m)
            flac_mode=true
            video_url=$OPTARG
            if [[ -z $video_url ]]; then
                exit 1
            fi
            ;;
        \?)
            echo "Use 'downloadAudio -h' for more information";
            exit 1
            ;;
    esac
done

# Remove as opções da linha de comando
shift $((OPTIND - 1))

if [[ -z $video_url && -n $1 ]]; then
    video_url=$1
fi

if [[ -z $video_url ]]; then
    echo "URL not specified"
    exit 1
fi


if $flac_mode; then
    download_music "flac" "$video_url"
else
    download_music "mp3" "$video_url"
fi
