#!/bin/sh

rofi_command="rofi -theme themes/help-menu.rasi"

MENU="$(echo -e "
New terminal: +Enter
Rofi: +d / +Tab
Browser: +c
Audio: +Ctrl+m
File manager: +F3
Morc menu; +z
Bmenu: +Ctrl+b
Printscreen/window/box:	Print / +Print/ +Shift+Print
New app down/right: +v / +h
Switch workspace 1-8: +1-8
Send focused to ws: +Ctrl+1-8
Send and switch to ws: +Shift+1-8
Navigate ws: +Ctrl+Arrowkeys
Toggle floating focus: +Shift+Space
Kill focus: +Shift+q 
Reload environment: +Shift+r
Resize: +r
Full screen: +f
Gaps: +Shift+g
Kill/Reload compton: +t / +Ctrl+t
Restart notifications: +Shift+d
Kill notifications: +Ctrl+Space
Shutdown: +Ctrl+c / +0
Help: +Shift+h" | $rofi_command -dmenu)"
