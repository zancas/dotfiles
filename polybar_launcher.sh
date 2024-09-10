#!/bin/bash

# Kill any running instances of Polybar
killall -q polybar

# Wait until Polybar processes are fully terminated
while pgrep -x polybar >/dev/null; do sleep 1; done

# Set the monitor environment variable
MONITOR=eDP-1

# Start Polybar for all your bars
monitor=$MONITOR polybar -c ${HOME}/dotfiles/basic_polybar/polybar.config mainbar0 &
monitor=$MONITOR polybar -c ${HOME}/dotfiles/basic_polybar/polybar.config mainbar1 &
monitor=$MONITOR polybar -c ${HOME}/dotfiles/basic_polybar/polybar.config mainbar2 &
