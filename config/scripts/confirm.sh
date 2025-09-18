#!/usr/bin/env zsh

# Check if wofi (or another dialog tool like rofi/zenity) is installed
if ! command -v wofi &> /dev/null; then
    hyprctl notify -0 10000 "rgb(ff1ea3)" "Error: wofi not installed"
    exit 1
fi

# Display confirmation dialog using wofi
choice=$(echo -e "Yes\nNo" | wofi --dmenu --prompt "Confirm exit from Hyprland?")

# Act based on user choice
if [[ "$choice" == "Yes" ]]; then
    hyprctl dispatch exit
else
    hyprctl notify -0 5000 "rgb(00ff00)" "Exit cancelled"
fi
