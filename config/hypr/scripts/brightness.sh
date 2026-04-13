#!/bin/bash

LAPTOP_MONITOR_NAME="amdgpu_bl1"
MSI_MONITOR_NAME="1"
brightness_code=10
contrast_code=12
max_brightness_value=100
min_brightness_value=5
contrast_default=70

# Function to set the brightness of the screen to maximum.
max() {
  ddcutil setvcp "$brightness_code" "$max_brightness_value" --display "$MSI_MONITOR_NAME"
  ddcutil setvcp "$contrast_code" "$contrast_default" --display "$MSI_MONITOR_NAME"
  brightnessctl s -d "$LAPTOP_MONITOR_NAME" "$max_brightness_value"%
}

# Function to set the brightness of the screen to minimum.
min() {
  ddcutil setvcp "$brightness_code" "$min_brightness_value" --display "$MSI_MONITOR_NAME"
  ddcutil setvcp "$contrast_code" "$contrast_default" --display "$MSI_MONITOR_NAME"
  brightnessctl s -d "$LAPTOP_MONITOR_NAME" "$min_brightness_value"%
}

# Function to increase brightness of the screen.
increase() {
  local value=$1
  ddcutil setvcp "$brightness_code" + "$value" --display "$MSI_MONITOR_NAME"
  ddcutil setvcp "$contrast_code" "$contrast_default" --display "$MSI_MONITOR_NAME"
  brightnessctl s -d "$LAPTOP_MONITOR_NAME" +"$value"%
}

# Function to decrease brightness of the screen.
decrease() {
  local value=$1
  ddcutil setvcp "$brightness_code" - "$value" --display "$MSI_MONITOR_NAME"
  ddcutil setvcp "$contrast_code" "$contrast_default" --display "$MSI_MONITOR_NAME"
  brightnessctl s -d "$LAPTOP_MONITOR_NAME" "$value"%-
}

help() {
  echo "Usage: brightness.sh [OPTION] [VALUE]"
  echo "Increase or decrease the brightness of the screen."
  echo
  echo "Options:"
  echo "  --increase, -i VALUE    Increase the brightness by VALUE."
  echo "  --decrease, -d VALUE    Decrease the brightness by VALUE."
  echo "  --max, -m               Set the brightness to maximum."
  echo "  --min, -n               Set the brightness to minimum."
  echo "  --help, -h              Display this help message and exit."
}

# Main function to handle the arguments.
main() {
  case $1 in
  --increase | -i)
    increase "$2"
    ;;
  --decrease | -d)
    decrease "$2"
    ;;
  --max | -m)
    max
    ;;
  --min | -n)
    min
    ;;
  --help | -h)
    help
    ;;
  *)
    echo "Invalid option"
    help
    exit 1
    ;;
  esac
}

# Call the main function with command-line arguments
main "$@"
