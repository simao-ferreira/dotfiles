#!/bin/sh

rofi_command="rofi -theme themes/poff.rasi"

#commands
shutdown=" Shutdown"
logout=" Logout"
lock=" Lock"
reboot=" Reboot"
suspend="鈴 Suspend"
options="$shutdown\n$logout\n$lock\n$reboot\n$suspend"

MENU="$(echo -e "$options" | $rofi_command -dmenu -selected-row 2)"
            case "$MENU" in
                $shutdown) i3exit shutdown;;
                $logout) i3-msg exit;;
                $lock) i3exit lock;;                
                $reboot) i3exit reboot;;
                $suspend) i3exit suspend;;
            esac
