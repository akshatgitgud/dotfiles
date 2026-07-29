#!/bin/bash
if pgrep -x hyprpanel > /dev/null; then
    killall hyprpanel
else
    hyprpanel &
fi
