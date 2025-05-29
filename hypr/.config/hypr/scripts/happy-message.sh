#!/bin/bash

# Define your array of messages
messages=(
  "Hyprland is love, Hyprland is life."
  "I use arch btw ;)"
  "You got this!"
  "Remember to hydrate."
  "Focus mode: activated."
  "Have a nice day!"
)

# Get a random index
index=$((RANDOM % ${#messages[@]}))

# Output the random message
echo "${messages[$index]}"
