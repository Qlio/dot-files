#!/usr/bin/env bash

killall -q polybar
# If all your bars have ipc enabled, you can also use
# polybar-msg cmd quit

# Launch top bar
echo "---" | tee -a /tmp/polybar-top.log
polybar top >>/tmp/polybar-top.log 2>&1 & disown
echo $! >> /tmp/polybar-top-pid
