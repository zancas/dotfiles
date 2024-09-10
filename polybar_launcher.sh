#!/bin/bash

# Kill any running instances of Polybar
killall -q polybar

# Wait until Polybar processes are fully terminated
while pgrep -x polybar >/dev/null; do sleep 1; done

# Start Polybar for all your bars
polybar mainbar0 &
polybar mainbar1 &
polybar mainbar2 &
