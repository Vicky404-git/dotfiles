#!/bin/bash

# Check if either program is running
if pgrep -x "glava" >/dev/null || pgrep -x "sptlrx" >/dev/null; then
  # If running, kill them. (Kitty will automatically close when sptlrx dies)
  killall glava
  killall sptlrx
else
  # If not running, launch them detached from the main shell
  glava &
  kitty --class floating_lyrics -o background_opacity=0.2 -o window_padding_width=60 -o font_size=18 -e sptlrx &
fi
