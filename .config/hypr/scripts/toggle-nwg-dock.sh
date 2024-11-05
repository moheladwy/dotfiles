#! /bin/bash

# Check if nwg-dock-hyprland is running and kill it if it is
pid=$(pgrep -f 'nwg-dock-hyprland')
if [ -n "$pid" ]; then # If nwg-dock-hyprland is running, kill it
    kill -KILL $pid
else # If nwg-dock-hyprland is not running, start it
    nwg-dock-hyprland -w 2 -i 28 -mb 10 -hd 0 -d -nolauncher
fi
