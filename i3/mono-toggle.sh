#!/bin/bash
if pgrep -f "picom.*grayscale"; then
  # If grayscale is running, kill it and start normal picom
  killall picom
  picom -b
  dunstify "Color Restored" "Monochrome mode deactivated."
else
  # If normal picom is running, kill it and start grayscale
  killall picom
  picom -b --backend glx --window-shader-fg ~/.config/picom/grayscale.glsl
  dunstify "Monochrome Active" "Distractions minimized."
fi
