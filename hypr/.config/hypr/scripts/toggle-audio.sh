#!/usr/bin/env bash
set -euo pipefail

# >>> Replace these with your sink IDs <<<
SPEAKER_ID=45
HEADPHONES_ID=57

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
  target_id="$HEADPHONES_ID"
else
  target="speaker"
  target_id="$SPEAKER_ID"
fi

if wpctl set-default "$target_id"; then
  echo "$target" > "$STATE_FILE"
  command -v notify-send >/dev/null && notify-send "Audio Output" "Switched to ${target^}"
else
  command -v notify-send >/dev/null && notify-send "Audio Output" "Failed to switch to ${target^}" -u critical
  exit 1
fi
