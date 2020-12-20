#!/bin/sh

[[ -f ~/.Xresources ]] && xrdb -merge -I $HOME ~/.Xresources

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

exec picom &
exec feh --bg-fill $HOME/.wallpapers/t480.png --no-fehbg &
exec wmname LG3D &
exec dunst &

exec sxhkd &
exec bspwm 2>~/.cache/.bspwm.err > ~/.cache/.bspwm.out
