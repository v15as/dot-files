#!/bin/bash

length=$(playerctl metadata --format "{{duration(mpris:length)}}")
position=$(playerctl metadata --format "{{duration(position)}}")
echo "($position | $length)"
