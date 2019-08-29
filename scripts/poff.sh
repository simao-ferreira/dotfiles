#!/bin/sh

MENU="$(rofi -sep "|" -dmenu -i -p 'System' -location 0 -yoffset 0 -xoffset 0 -width 35 -hide-scrollbar -line-padding 4 -padding 20 -lines 5 -font "TerminessTTFNerdFontMono 14" <<< " Lock| Logout| Reboot| Suspend|⚡Shutdown")"
            case "$MENU" in
                *Lock) i3exit lock;;
                *Logout) i3exit logout;;
                *Reboot) i3exit reboot;;
                *Suspend) i3exit suspend;;
                *Shutdown) i3exit shutdown;;
            esac
