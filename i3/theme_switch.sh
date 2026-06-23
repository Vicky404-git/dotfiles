#!/usr/bin/env bash

# The Grimoire: Minimal Theme Switcher

THEME=$1
BASE_DIR="$HOME/.config/wallpapers"

if [ -z "$THEME" ]; then
  echo "Usage: ./theme_switch.sh [medieval|game|anime]"
  exit 1
fi

# Remove the old 'current' link and point it to the new theme
rm -f "$BASE_DIR/current"
ln -s "$BASE_DIR/$THEME" "$BASE_DIR/current"

# Refresh the current wallpaper to apply the change immediately
# This reads the active i3 workspace and sets that specific image
ACTIVE_WS=$(i3-msg -t get_workspaces | jq '.[] | select(.focused==true).num')

# Fallback to wallpaper 1 if it can't detect the workspace
if [ -z "$ACTIVE_WS" ] || [ "$ACTIVE_WS" -gt 5 ]; then
  ACTIVE_WS=1
fi

feh --bg-fill "$BASE_DIR/current/$ACTIVE_WS.jpg"

echo "Theme switched to: $THEME"
