#!/bin/bash
# ~/.config/waybar/nightlight_wofi.sh

TEMP_FILE="/tmp/nightlight_temp"
LAT=40.8
LON=-77.9
PIDFILE="/tmp/wlsunset.pid"

# Define preset temperature options
temps=$(seq 2000 250 4500)

# Use wofi to pick one
chosen=$(echo "$temps" | wofi --dmenu --prompt "Nightlight Temp (K)" --insensitive --width 300)

# If user selects a valid temperature
if [[ "$chosen" =~ ^[0-9]+$ ]]; then
  echo "$chosen" > "$TEMP_FILE"

  # Kill previous instance if running
  if [[ -f "$PIDFILE" ]] && kill -0 "$(cat $PIDFILE)" 2>/dev/null; then
    kill "$(cat $PIDFILE)"
    rm -f "$PIDFILE"
  fi

  # Start new wlsunset instance with chosen temp
  wlsunset -t "$chosen" -T "$chosen" -l "$LAT" -L "$LON" &
  echo $! > "$PIDFILE"
fi
