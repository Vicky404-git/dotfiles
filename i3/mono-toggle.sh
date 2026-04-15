#!/bin/bash

# Check if picom is currently running with the grayscale shader
if pgrep -f "grayscale.glsl" >/dev/null; then
  # It is running. Kill it and start normal picom.
  killall picom
  # Give it a split second to die safely
  sleep 0.2
  picom -b
  notify-send "Color Restored" "Monochrome mode deactivated."
else
  # It is NOT running. Kill normal picom and start the grayscale version.
  # Note: Shaders require the GLX backend to work!
  killall picom
  sleep 0.2
  picom -b --backend glx --window-shader-fg ~/.config/picom/grayscale.glsl
  notify-send "Monochrome Active" "Deep focus enabled."
fi
