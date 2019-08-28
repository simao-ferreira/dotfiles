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
dark-base:		color0		#257134
vivid-base:		color1		#3ed808
palid-base:		color2		#9aca79
vivid-alert:		color3		#dc582f
vivid-highlight:	color4		#ffb52a
dark-background:	background	#051608
```

To reload the terminal without logging off run `xrdb .Xresources` and then open a new terminal window.

The alert color stands as red, the highlight stands for yellow, other represent base color in various grades and background, usually a base color near black.

### State
To change color palette change first on `.Xresources`, this will change `URxvt terminal`, `polybar` and `.i3/config` according to current six base as defined.
Others still have to be change manually, these are: `dunst` and `rofi`, 

## Gcolor2
`gcolor2` comes with Mi3, it's a basic program to detect colors, you can use it to get the hex code for a color on-screen.
