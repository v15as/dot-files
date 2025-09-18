#!/bin/bash
if pgrep -x "hyprsunset" >/dev/null; then
    notify-send "Night Light" "Off" -u "Low"
    killall -9 "hyprsunset"
else
    notify-send "Night Light" "On" -u "Low"
    hyprsunset --temperature 2500
fi

