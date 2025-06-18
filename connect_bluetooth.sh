#!/bin/bash

# MAC address of your Bluetooth speaker
SPEAKER_MAC="D4:F5:47:65:CB:C2"

# MAC address of your Bluetooth keyboard
KEYBOARD_MAC="F8:0C:A4:19:A7:FE"

# Wait a few seconds to ensure Bluetooth service is ready
sleep 5

# --- Speaker Connection ---
echo "Checking Speaker (MAC: $SPEAKER_MAC)..."
# Check if the speaker is already connected
SPEAKER_CONNECTED=$(bluetoothctl info "$SPEAKER_MAC" | grep "Connected: yes")

if [ -z "$SPEAKER_CONNECTED" ]; then
	echo "Connecting to Bluetooth speaker ($SPEAKER_MAC)..."
	bluetoothctl connect "$SPEAKER_MAC"
else
	echo "Speaker ($SPEAKER_MAC) already connected."
fi

echo # Add a blank line for better readability

# --- Keyboard Connection ---
echo "Checking Keyboard (MAC: $KEYBOARD_MAC)..."
# Check if the keyboard is already connected
KEYBOARD_CONNECTED=$(bluetoothctl info "$KEYBOARD_MAC" | grep "Connected: yes")

if [ -z "$KEYBOARD_CONNECTED" ]; then
	echo "Connecting to Bluetooth keyboard ($KEYBOARD_MAC)..."
	bluetoothctl connect "$KEYBOARD_MAC"
else
	echo "Keyboard ($KEYBOARD_MAC) already connected."
fi

echo "Script finished."
