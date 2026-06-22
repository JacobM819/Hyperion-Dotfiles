#!/bin/bash

if pgrep -x "nmtui" > /dev/null; then
    pkill -x nmtui
else
    kitty --class nmtui-popup nmtui &
fi
