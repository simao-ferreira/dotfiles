#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
#polybar top -c ~/repositories/unix/i3/.config/polybar/config.ini &
#polybar bottom -c ~/repositories/unix/i3/.config/polybar/config.ini &
polybar top -c ~/.config/polybar/config.ini &
polybar bottom -c ~/.config/polybar/config.ini &
