
#!/bin/bash

# Define the list of windows to check for
TARGET_WINDOWS=("Google-chrome" "pycharm" "kitty")

# Function to get the current focused window
get_focused_window() {
  hyprctl activewindow -j | jq -r '.class'
}

remap_active=false

# Main loop to monitor active window and remap keys
while true; do
    focused_window=$(get_focused_window)
    notify-send "Focused: $focused_window"

    # Check if the focused window matches any of the target windows
    if [[ " ${TARGET_WINDOWS[*]} " == *" $focused_window "* ]]; then
        if [[ $remap_active == false ]]; then
            notify-send "Remapping for $focused_window"
            systemctl --user start caps2esc.service
            remap_active=true
        fi
    else
        if [[ $remap_active == true ]]; then
            notify-send "Restoring default mapping"
            systemctl --user stop caps2esc.service
            remap_active=false
        fi
    fi

    sleep 1
done
