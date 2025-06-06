#!/usr/bin/env bash



# Rofi dmenu mode, -i make search case-insensitive, -l is the number of line
wofi_command() {
	if pgrep -x "wofi" > /dev/null; then
		pkill -x wofi
	else
  		wofi -d --normal-window --autoclose --config ~/.config/wofi/power.conf
	fi
}

shutdown="󰐥 | Shutdown"
reboot=" | Restart"
lock=" | Lock"
suspend="󰤄 | Suspend"
logout="󰍂 | Logout"

options="$shutdown\n$reboot\n$logout\n$suspend\n$lock"

chosen="$(echo -e "$options" | wofi_command)"
echo "$chosen"
case $chosen in
"$shutdown")
  systemctl poweroff
  ;;
"$reboot")
  systemctl reboot
  ;;
"$lock")
  # Install swaylock-effects for better configuration
  # hyprlock
  hyprlock
  ;;
"$suspend")
  mpc -q pause
  amixer set Master mute
  systemctl suspend
  ;;
"$logout")
  # For Hyprland, Use Command for your WM/DE
  if [[ "$DESKTOP_SESSION" == "hyprland" ]]; then
    hyprctl dispatch exit
  elif [[ "$DESKTOP_SESSION" == "sway" ]]; then
    swaymsg exit
  elif [[ "$DESKTOP_SESSION" == "i3" ]]; then
    i3-msg exit
  elif [[ "$DESKTOP_SESSION" == "river" ]]; then
    riverctl exit
  elif [[ "$DESKTOP_SESSION" == "Openbox" ]]; then
    openbox --exit
  elif [[ "$DESKTOP_SESSION" == "bspwm" ]]; then
    bspc quit
  elif [[ "$DESKTOP_SESSION" == "xfce" ]]; then
    killall xfce4-session
  fi
  ;;
esac
