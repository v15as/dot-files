#! /usr/bin/bash


volume=$(pactl get-sink-volume @DEFAULT_SINK@ | awk 'NR==1{print $5}' | sed 's/\%//')


if [ $volume -lt 100 ]; then
  $(pactl set-sink-volume @DEFAULT_SINK@ +1%)
fi
