#!/bin/bash

# Get current brightness level
current_brightness=$(brightnessctl get -d tpacpi::kbd_backlight)

# Set brightness based on current level
case $current_brightness in
    0)
        brightnessctl set 1 -d tpacpi::kbd_backlight
        ;;
    1)
        brightnessctl set 2 -d tpacpi::kbd_backlight
        ;;
    2)
        brightnessctl set 0 -d tpacpi::kbd_backlight
        ;;
    *)
        echo "Unknown brightness level: $current_brightness"
        ;;
esac

