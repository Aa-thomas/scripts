#!/bin/bash

# Set maximum idle time (in milliseconds, e.g. 10 minutes = 600000)
MAX_IDLE=600000

# Get the current idle time in milliseconds
idle_time=$(xprintidle)

# Check if idle time exceeds the limit
if [ "$idle_time" -ge "$MAX_IDLE" ]; then
	# Lock the screen
	gnome-screensaver-command -l

	# Wait a moment for the screen to lock before logging out
	sleep 1

	# Log out the user
	gnome-session-quit --no-prompt
fi
