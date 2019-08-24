#!/bin/sh

# In progress
rofi -sep "|" -dmenu -i -p 'Poweroff Menu' -location 0 -yoffset 0 -xoffset 0 -width 35 -hide-scrollbar -line-padding 4 -padding 20 -lines 4 <<< " +Ctrl+c: Sutdown | Reload: +Shift+r "
