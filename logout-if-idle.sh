#!/bin/bash

# Set maximum idle time (in milliseconds, e.g. 10 minutes = 600000)
MAX_IDLE=600000

# Set polling interval (in seconds, default: 60 seconds for less frequent checking)
POLLING_INTERVAL=${POLLING_INTERVAL:-60}

# Continuous monitoring loop
while true; do
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
        
        # Exit the loop after logout
        break
    fi
    
    # Wait before next check
    sleep "$POLLING_INTERVAL"
done
