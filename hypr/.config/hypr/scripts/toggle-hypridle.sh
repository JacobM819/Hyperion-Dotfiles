#!/bin/bash

if systemctl --user is-active --quiet hypridle.service; then
    systemctl --user stop hypridle.service
    message=$(~/.config/hypr/scripts/happy-message.sh)
    notify-send "Idle disabled." "$message"
else
    systemctl --user start hypridle.service
    message=$(~/.config/hypr/scripts/happy-message.sh)
    notify-send "Idle enabled." "$message"
fi

# Send a signal to Waybar to force-refresh the module
#pkill -RTMIN+10 waybar
