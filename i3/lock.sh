#!/bin/bash

# --- The Grimoire Color Palette ---
B='#282828AA' # Transparent dark background
C='#33ccffFF' # Cyan ring
D='#141414FF' # Dark center
T='#ebdbb2FF' # Parchment text
W='#cc241dFF' # Crimson (Wrong password)
V='#b8bb26FF' # Moss Green (Verifying)

# --- Fonts ---
F='JetBrainsMono Nerd Font'

i3lock \
  --blur 7 \
  --clock \
  --indicator \
  \
  --insidever-color=$D \
  --ringver-color=$V \
  --insidewrong-color=$D \
  --ringwrong-color=$W \
  --inside-color=$D \
  --ring-color=$C \
  --line-color=$D \
  --separator-color=$D \
  \
  --verif-color=$V \
  --wrong-color=$W \
  --time-color=$T \
  --date-color=$T \
  --layout-color=$T \
  --keyhl-color=$W \
  --bshl-color=$W \
  \
  --time-str="%H:%M" \
  --date-str="%A, %d %B" \
  --verif-text="Decrypting..." \
  --wrong-text="Access Denied" \
  --noinput-text="" \
  --greeter-text="" \
  \
  --time-font="$F" \
  --date-font="$F" \
  --verif-font="$F" \
  --wrong-font="$F" \
  \
  --time-size=65 \
  --date-size=22 \
  --verif-size=18 \
  --wrong-size=18 \
  \
  --radius=100 \
  --ring-width=4 \
  \
  --ind-pos="x+w/2:y+h/2+120" \
  --time-pos="x+w/2:y+h/2-80" \
  --date-pos="tx:ty+40"
