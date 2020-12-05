## dmenu

## rofi

[rofi](https://github.com/davatorium/rofi) is a file and application launcher and window switcher. Based on dmenu, extends it's usability and features.

```
# pacman -S rofi
```

It is possible to set operation modes, themes, fonts and sizes through command line
```
rofi -theme solarized -font "hack 10" \
         -show run -modi run \
         -location 1 -width 100 \
		 -lines 2 -line-margin 0 -line-padding 1 \
		 -separator-style none -font "mono 10" -columns 9 -bw 0 \
		 -disable-history \
		 -hide-scrollbar \
		 -color-window "#222222, #222222, #b1b4b3" \
		 -color-normal "#222222, #b1b4b3, #222222, #005577, #b1b4b3" \
		 -color-active "#222222, #b1b4b3, #222222, #007763, #b1b4b3" \
		 -color-urgent "#222222, #b1b4b3, #222222, #77003d, #b1b4b3" \
		 -kb-row-select "Tab" -kb-row-tab ""
```

Also, configuration files and command line options can be set up through `.rasi` files, where is possible to set operation modes, themes, fonts and sizes, just like the command line version.

```

```

Rofi will parse first configuration found at `~/.config/rofi/config.rasi` and then the theme.
