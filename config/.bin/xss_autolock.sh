#!/bin/sh -e
# Lauch session lock

message="Screen will lock in 1 minute"

_launch_session_lock(){
    xset s 480 60
}

_trigger_screensaver(){
    xss-lock -n "dunstify '$message'" -l $HOME/.bin/i3lock_lockscreen.sh
}

_launch_session_lock && _trigger_screensaver
