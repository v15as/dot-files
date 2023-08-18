#!/bin/bash

xrandr --output VIRTUAL1 --mode 1366x768 --right-of eDP1

sleep 3
i3-msg restart
~/Downloads/Deskreen-2.0.4.AppImage

