#!/bin/bash

# Kill any running instances of Polybar
killall -q polybar

# Wait until Polybar processes are fully terminated
while pgrep -x polybar >/dev/null; do sleep 1; done

# Start Polybar for all your bars
polybar -c ${HOME}/dotfiles/basic_polybar/polybar.config mainbar0 &
polybar -c ${HOME}/dotfiles/basic_polybar/polybar.config mainbar1 &
polybar -c ${HOME}/dotfiles/basic_polybar/polybar.config mainbar2 &
