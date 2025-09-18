#!/bin/bash

xrandr --addmode VIRTUAL1 1366x768
# Script to add a virtual monitor and turn on Deskreen
xrandr --output VIRTUAL1 --mode 1366x768 --right-of eDP1

sleep 3
i3-msg restart
~/Deskreen-2.0.4.AppImage

