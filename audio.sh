#! /usr/bin/bash


volume=$(pactl get-sink-volume @DEFAULT_SINK@ | awk 'NR==1{print $5}' | sed 's/\%//')


if [ $volume -gt 100 ]; then
  $(pactl set-sink-volume @DEFAULT_SINK@ 100%)
fi
