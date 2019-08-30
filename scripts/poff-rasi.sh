#!/bin/sh

rofi_command="rofi -theme themes/poff.rasi"

MENU="$(echo -e " Shutdown\n Logout\n Lock\n Reboot\n鈴 Suspend" | $rofi_command -dmenu -selected-row 2)"
            case "$MENU" in
                *Shutdown) i3exit shutdown;;
                *Logout) i3-msg exit;;
                *Lock) i3exit lock;;                
                *Reboot) i3exit reboot;;
                *Suspend) i3exit suspend;;
            esac
