#!/bin/sh

MENU="$(rofi -sep "|" -dmenu -i -p 'Poweroff Menu' -location 0 -yoffset 0 -xoffset 0 -width 35 -hide-scrollbar -line-padding 4 -padding 20 -lines 4 <<< " Lock| Logout| Reboot| Shutdown")"
            case "$MENU" in
                *Lock) blurlock ;;
                *Logout) i3-msg exit;;
                *Reboot) systemctl reboot ;;
                *Shutdown) systemctl -i poweroff
            esac
