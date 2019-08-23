#!/bin/sh
# *Lock) i3lock-fancy ;;

MENU="$(rofi -sep "|" -dmenu -i -p 'System' -location 0 -yoffset 0 -xoffset 0 -width 35 -hide-scrollbar -line-padding 4 -padding 20 -lines 4 -font "TerminessTTFNerdFontMono 14" <<< " Lock| Logout| Reboot| Shutdown")"
            case "$MENU" in
                *Lock) i3lock ;;
                *Logout) i3-msg exit;;
                *Reboot) systemctl reboot ;;
                *Shutdown) systemctl -i poweroff
            esac
