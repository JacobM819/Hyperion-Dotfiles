if pgrep -x "waybar" > /dev/null; then
	pkill -x waybar
else
	waybar & waybar -c ~/.config/waybar/config-vert-monitor.jsonc
fi
