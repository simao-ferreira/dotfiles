# Polybar

[Polybar](https://polybar.github.io/) is a highly customable bar for desktop, with built in functionality for systray icons, playback display and controls, CPU an memory loaders, battery and a lot of other functionalities.
It's possible to run personal scripts to manage or improve status or controls, even adding some non existent. 

Polybar is available through `AUR`
```
# yay -S polybar
```

For Mi3 is no different, it's possible to install `polybar` from the `pamac` GUI, there are two options available according to  homepage, it's possible to install the `polybar` package, containing the stable version, or the `polybar-git` for the latest version.

Configuration file can be found at `/usr/share/doc/polybar/config` or `/usr/local/share/doc/polybar/config`, copy it to `.config/poybar` and edit it as wanted.

That configuration is an example, in terminal run `polybar example` to see it working.
To stop an already existent configuration run `killall -q polybar`. 

Some helpful and interesting examples of what is possible can be found at [polibar-themes](https://github.com/adi1090x/polybar-themes).

## Starting polybar

Polybar configuration settings can be divided to easier understanding.
First component to run polybar is a launcher script, to be added on the configuration file (`.i3/config` or `bspwm`) file.

According to documentation it should be fairly straight forward and simple. Example:

```
#!/usr/bin/env bash

# Force kill all running instances of polybar
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bars
polybar bar &
```

After it's creation it's necessary to grant it executable rights `chmod +x ~/.config/polybar/<name>.sh`.
On `.i3/config` add `exec_always --no-startup-id $HOME/.config/polybar/<name>.sh` to run the script at start, and remove 

```
bar {

    i3bar_command i3bar

}
```

For `bspwm` just make sure to run it at the beginning. 

Another alternative is, instead of removing totally the i3bar, just make it invisible always, that will allow you to call on it if is necessary through `Ctrl+mod+m`. To do that don't remove the lines above, but instead add `mode invisible` to it.

Other important note, to be able to use system tray icons already in use through i3bar add to the `.i3/config` bar settings `tray_output none`, this will disable the tray on i3bar and let it be available on polybar. 

## Configurations

The initial config file provided by polybar contains all that is necessary to work with the bar, but there is always something else to be added, from the tray to your quit screen to some script to show the weather in the other side of the world.

This can be added by adding modules. These modules are the called by the bars. The bars and modules use settings and colors to manage their look.

Most often than not it's easier to separate this configs by different files, addressing the similarity of concerns.

Some examples:

```
[global/wm]
margin-top = 0
margin-bottom = 0
; Included files 
include-file = ~/.config/polybar/colors.ini
include-file = ~/.config/polybar/bars.ini
include-file = ~/.config/polybar/modules.ini
```

```
[colors]
background = #9ACA79
foreground = #3ED808
highlight = #257134
dark-text = #08200C
alert = #BD2C40
```

```
[bar/top]
width = ${settings.bar-width}
height = ${settings.bar-height}
radius = 6.0
fixed-center = true
background = ${colors.bar-background}
foreground = ${colors.bar-foreground}
line-size = 3
border-size = 0
border-color = ${colors.bar-foreground}

;Font config, 
font-0 = TerminessTTFNerdFontMono:styles:Bold:size=14;1
font-1 = unifont:fontformat=truetype:size=10:antialias=false;0
font-2 = siji:pixelsize=13;1

padding-left = 1
padding-right = 1
module-margin-left = 1
module-margin-right = 1
modules-left = xwindow
modules-center = browser filemanager
modules-right = date poweroffmenu
; tray needs to be off in i3bar
tray-position = right
tray-padding = 0
tray-reparent = true
```

```
[module/date]
type = internal/date
interval = 5
date = " %a %d %b"
time = "%H:%M "
label = %date% %time%

format-foreground = ${colors.pale-green}
format-underline = ${colors.vivid-green}
```

```
[module/poweroffmenu]
type = custom/text
content = Quit
content-padding = 1
content-foreground = ${colors.vivid-red}
click-left = ~/.config/polybar/scripts/poff MENU
```

It is also possible to run scripts through `type=custom/scripts`, those scripts should be allocated under `.config/polybar/scripts`.
The documentation on this extensive.

To add symbols define font with symbol capacity, then `"%{T<number>}<symbol>%{T-}"` and change number to match font number reference and symbol is the desired icon.






