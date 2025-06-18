#!/bin/bash

# Set maximum idle time (in milliseconds, e.g. 10 minutes = 600000)
MAX_IDLE=600000

# Get the current idle time in milliseconds from GNOME's IdleMonitor
idle_time=$(gdbus call --session --dest org.gnome.Mutter.IdleMonitor --object-path /org/gnome/Mutter/IdleMonitor/Core --method org.gnome.Mutter.IdleMonitor.GetIdletime | grep -o '[0-9]*' | head -1)

# Check if idle time exceeds the limit
if [ "$idle_time" -ge "$MAX_IDLE" ]; then
    # Lock the screen
    gnome-screensaver-command -l
    
    # Wait a moment for the screen to lock before logging out
    sleep 1
    
    # Log out the user
    gnome-session-quit --no-prompt
fi

