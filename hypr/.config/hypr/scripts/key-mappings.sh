

#!/bin/bash
#Downloaded for this: wtype

direction=$1  # "prev" or "next"

active_app=$(hyprctl activewindow -j | grep -Po '"class": *"\K[^"]+')

# Debug message
notify-send "Focused class: $active_app, direction: $direction"

# Proceed only if Chrome or Chromium is focused
if [[ "$active_app" == "Google-chrome" || "$active_app" == "Chromium" ]]; then

	sleep 3
    if [[ "$direction" == "prev" ]]; then
        wtype -M ctrl -M shift Tab -m shift -m ctrl
    elif [[ "$direction" == "next" ]]; then
        wtype -M ctrl Tab -m ctrl
    fi
fi
