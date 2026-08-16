#!/usr/bin/env bash

# Define the visual options
options="🗡 Medieval\n🎮 Game\n🌸 Anime\n🖥️ OldPCs "

# Pipe into Rofi and capture the selection
chosen=$(echo -e "$options" | rofi -dmenu -i -p "🔮 Vibe: ")

# Execute the Sozo-tracked theme switcher based on the choice
case "$chosen" in
*"Medieval"*)
  ~/.config/i3/theme_switch.sh medieval
  ;;
*"Game"*)
  ~/.config/i3/theme_switch.sh game
  ;;
*"Anime"*)
  ~/.config/i3/theme_switch.sh anime
  ;;
*"OldPCs"*)
  ~/.config/i3/theme_switch.sh oldPCs
  ;;
esac
