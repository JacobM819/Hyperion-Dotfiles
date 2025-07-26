
#!/bin/bash

LAT="40.8"
LON="-77.9"
PIDFILE="/tmp/wlsunset.pid"
TEMPFILE="/tmp/nightlight_temp.tmp"

# If wofi is already open, close it
if pgrep -x "wofi" > /dev/null; then
    pkill -x wofi
    exit 0
fi

# Temperature list + "Off" option
temps=$(echo -e "Off\n$(seq 3000 250 5000)")

# Show wofi
chosen=$(echo "$temps" | wofi --dmenu --no-search --normal-window --autoclose --width 300)

# User cancelled or closed
[[ -z "$chosen" ]] && exit 0

# Turn off nightlight
if [[ "$chosen" == "Off" ]]; then
    if [[ -f "$PIDFILE" ]] && kill -0 "$(cat "$PIDFILE")" 2>/dev/null; then
        kill "$(cat "$PIDFILE")"
        rm -f "$PIDFILE"
    fi
    notify-send "Nightlight" "Disabled"
    exit 0
fi

# Validate selection is numeric
if [[ "$chosen" =~ ^[0-9]+$ ]]; then
    echo "$chosen" > "$TEMPFILE"

    # Kill previous wlsunset
    if [[ -f "$PIDFILE" ]] && kill -0 "$(cat "$PIDFILE")" 2>/dev/null; then
        kill "$(cat "$PIDFILE")"
        rm -f "$PIDFILE"
    fi

    # Start new wlsunset with a small delta to force temperature
    wlsunset -t "$((chosen - 1))" -T "$chosen" -l "$LAT" -L "$LON" &
    echo $! > "$PIDFILE"
    message=$(~/.config/hypr/scripts/happy-message.sh)
    notify-send "Nightlight" "Set to $chosen K\n$message"
fi
