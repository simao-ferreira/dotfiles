#!/usr/bin/env sh

# Terminate already running bar instances, wait until the processes have been shut down
_kill_polybar(){
  killall -q polybar
  while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
}

# Launch bar in all monitors
_launch_bar(){
  if type "xrandr" ; then
    for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
      MONITOR=$m polybar bottom -c ~/.config/polybar/config.ini & 
    done
  else
    polybar bottom -c ~/.config/polybar/config.ini &
  fi
}

_kill_polybar && _launch_bar