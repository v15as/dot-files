#!/bin/bash

#while true
#do
#  length=$(playerctl metadata --format "{{duration(mpris:length)}}")
#  position=$(playerctl metadata --format "{{duration(position)}}")
#  echo "$position - $length"
#  sleep 1s
#done
length=$(playerctl metadata --format "{{duration(mpris:length)}}")
position=$(playerctl metadata --format "{{duration(position)}}")
echo "($position | $length)"
