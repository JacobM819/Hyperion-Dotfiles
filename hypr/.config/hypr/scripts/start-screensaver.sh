#!/bin/bash

pkill mpvpaper
pkill waybar

mpvpaper \
  -o "--loop --no-audio --fullscreen --ontop" \
  '*' ~/Videos/screensaver.mp4
