# Color Palette
There are several tools to create a color palette, one online tool that has various templates to use and allows to verify immediately is [terminal.sexy](https://terminal.sexy/), it generates a `.Xresources` type color script.

Color configuration is however difficult to manage in Mi3, `URxvt` uses the default `.Xresources`, polybar can use colors from there as well through `${xrdb:colorX}` scripting, but rofi does not, same for `i3bar`, `gedit`, `qt` and `gnome`applications.

For the i3 config file it's possible to set a pattern and use `.Xresources` color palette.

Extract a palette from `terminal.sexy` or `pywal`. from that pattern chose six colors to use and then change `rofi`. If the pattern is based on a theme, like `solarized dark` it's possible to modify gedit scheme.

Theme in use: Solarized.dark with green as base color.
```
! special
*.foreground:   #9aca79
*.background:   #051608
*.cursorColor:  #9aca79

! black
*.color0:       #257134
*.color8:       #257134

! red
*.color1:       #dc582f
*.color9:       #dc582f

! green
*.color2:       #3ed808
*.color10:      #3ed808

! yellow
*.color3:       #ffb52a
*.color11:      #ffb52a

! blue
*.color4:       #26d297
*.color12:      #26d297

! magenta
*.color5:       #ffb52a
*.color13:      #ffb52a

! cyan
*.color6:       #0ef6e5
*.color14:      #0ef6e5

! white
*.color7:       #48504a
*.color15:      #9aca79
```
Six set for other apps:
```
;*.dark-green:		color0		#257134
;*.palid-green:		color15		#9aca79
;*.vivid-green:		color2		#3ed808
;*.vivid-red: 		color1		#dc582f
;*.vivid-yellow:	color3		#ffb52a
;*.dark-bg:		background	#051608
```

To reload the terminal without logging off run `xrdb .Xresources` and then open a new terminal window.

