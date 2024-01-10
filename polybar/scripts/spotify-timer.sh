#!/bin/bash

PLAYER="spotify"
length=$(playerctl metadata --player=$PLAYER --format "{{duration(mpris:length)}}")
position=$(playerctl metadata  --player=$PLAYER --format "{{duration(position)}}")
echo "($position | $length)"
