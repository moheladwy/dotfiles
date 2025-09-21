#!/bin/bash
#  ____                               _           _
# / ___|  ___ _ __ ___  ___ _ __  ___| |__   ___ | |_
# \___ \ / __| '__/ _ \/ _ \ '_ \/ __| '_ \ / _ \| __|
#  ___) | (__| | |  __/  __/ | | \__ \ | | | (_) | |_
# |____/ \___|_|  \___|\___|_| |_|___/_| |_|\___/ \__|
#
# Based on https://github.com/hyprwm/contrib/blob/main/grimblast/screenshot.sh
# -----------------------------------------------------

# Screenshots will be stored in $HOME by default.
# The screenshot will be moved into the screenshot directory

# Add this to ~/.config/user-dirs.dirs to save screenshots in a custom folder:
# XDG_SCREENSHOTS_DIR="$HOME/Screenshots"

option_capture_1="Capture Everything"
option_capture_2="Capture Active Display"
option_capture_3="Capture Selection"
save_type=copysave
screenshot_name="screenshot_$(date +%d%m%Y_%H%M%S).jpg"
screenshot_dir="$HOME/Pictures/screenshots"

####
# Chose Screenshot Type
# CMD
type_screenshot_cmd() {
  rofi -dmenu -replace -config ~/.config/rofi/config-screenshot.rasi -i -no-show-icons -l 3 -width 30 -p "Type of screenshot"
}

# Ask for confirmation
type_screenshot_exit() {
  echo -e "$option_capture_1\n$option_capture_2\n$option_capture_3" | type_screenshot_cmd
}

# Confirm and execute
type_screenshot_run() {
  selected_type_screenshot="$(type_screenshot_exit)"
  if [[ "$selected_type_screenshot" == "$option_capture_1" ]]; then
    screenshot_type=screen
    "${1}"
  elif [[ "$selected_type_screenshot" == "$option_capture_2" ]]; then
    screenshot_type=output
    "${1}"
  elif [[ "$selected_type_screenshot" == "$option_capture_3" ]]; then
    screenshot_type=area
    "${1}"
  else
    exit
  fi
}

# take shots
takescreenshot() {
  sleep 1
  grimblast --notify "$save_type" "$screenshot_type" "$screenshot_dir/$screenshot_name"
}

# Execute Command
run() {
  type_screenshot_run
  takescreenshot
}

# Run the command with the default options for immediate screenshot.
run
