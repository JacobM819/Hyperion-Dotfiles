#!/bin/bash
pkill mpvpaper
pkill waybar
waybar & waybar -c ~/.config/waybar/config-vert-monitor.jsonc
exec hyprlock

