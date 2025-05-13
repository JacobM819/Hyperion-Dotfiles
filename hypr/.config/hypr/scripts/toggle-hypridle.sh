#!/bin/bash

STATUS_FILE="$HOME/.cache/hypridle_status"

if systemctl --user is-active --quiet hypridle.service; then
    systemctl --user stop hypridle.service
    echo "deactivated" > "$STATUS_FILE"
else
    systemctl --user start hypridle.service
    echo "activated" > "$STATUS_FILE"
fi

