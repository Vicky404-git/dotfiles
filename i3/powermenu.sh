#!/bin/bash

# Define the options
options="🛡Lock\n🚪Logout\n💤Suspend\n♻️Reboot\n🛑Shutdown"

# Pipe the options into rofi and capture the user's choice
chosen=$(printf "$options" | rofi -dmenu -i -p " 🗡 Power: ")

# Execute the corresponding command
case "$chosen" in
*"Lock"*)
  ~/.config/i3/lock.sh
  ;;
*"Logout"*)
  i3-msg exit
  ;;
*"Suspend"*)
  ~/.config/i3/lock.sh &
  sleep 1 && systemctl suspend
  ;;
*"Reboot"*)
  systemctl reboot
  ;;
*"Shutdown"*)
  systemctl poweroff
  ;;
esac
