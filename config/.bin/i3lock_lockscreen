#!/bin/sh -e
# Lock screen script 
# Activates i3lock and turns off the screen

# Lock screen
_lock_screen() {
    i3lock --color=151a23 -e 
}

_wait(){
    if [ $# -eq 0 ] ; then
        sleep 60
    else
        sleep $1
    fi
}

# Validates if i3lock is running, if it is turns off the display
_turn_off_display(){
    pgrep i3lock && xset dpms force off &
}


_lock_screen && _wait && _turn_off_display