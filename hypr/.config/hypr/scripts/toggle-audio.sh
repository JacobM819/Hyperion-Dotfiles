#!/usr/bin/env bash
set -euo pipefail

# The name of the devices to toggle betwee. The ID's change on system startup, so we need to use the names
SPEAKER_NAME="USB2.0 Device"
HEADPHONES_NAME="AUX Headphones"

STATE_DIR="${XDG_STATE_HOME:-$HOME/.local/state}/audio-toggle"
STATE_FILE="$STATE_DIR/state"
mkdir -p "$STATE_DIR"

# Lock so repeated keypresses don't race
exec 200>"$STATE_DIR/.lock"
flock -n 200 || exit 0

# Initialize: assume last used was "speaker" so first toggle goes to headphones
if [[ ! -f "$STATE_FILE" ]]; then
  echo "speaker" > "$STATE_FILE"
fi

last=$(<"$STATE_FILE")
if [[ "$last" == "speaker" ]]; then
  target="headphones"
  target_id=$(wpctl status | grep -E "\. ${HEADPHONES_NAME^}\b" | awk '{print $2}' | sed 's/\.//')
else
  target="speaker"
  target_id=$(wpctl status | awk '$0 ~ /Sinks:/ {in_sinks=1; next} $0 ~ /Sources:/ {in_sinks=0} in_sinks && $0 ~ /\. USB2\.0/ {print $2}' | sed 's/\.//')
fi

if wpctl set-default "$target_id"; then
  echo "$target" > "$STATE_FILE"
  command -v notify-send >/dev/null && notify-send "Audio Output" "Switched to ${target^}"
else
  command -v notify-send >/dev/null && notify-send "Audio Output" "Failed to switch to ${target^}" -u critical
  exit 1
fi
