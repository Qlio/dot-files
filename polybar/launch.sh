#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use
# polybar-msg cmd quit

# Launch default bar
echo "---" | tee -a /tmp/polybar-default.log
polybar default >>/tmp/polybar-default.log 2>&1 & disown

echo "Bars launched..."
