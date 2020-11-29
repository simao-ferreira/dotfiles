# External Monitor

Tools to manage external monitors:
* xrandr
* arandr

Use `xrand -q` to get connected displays and resolutions, if both monitors have the same resolution but different sizes `--scale <number>x<number>` flag can be configured, consider though, the screen position has to be asserted accordingly using the `--pos <number>x<number>` flag. 

To ease this tweaking it's possible to set position and rotation using `ARandR` and then export these configurations.

Although the configuration may work flawlessly, most of the time small things evade immediate notice, like background resolution changing or miss-aligned, screen-lock image resolution not correct, bars in the wrong place, or most importantly some apps need specific configurations to work flawlessly.

`xrandr` can be configured at `.xinitrc` or wm config files. 

* [HiDPI](https://wiki.archlinux.org/index.php/HiDPI)

## Bspwm
After installation, bspwm manages monitor surprisingly well without specifying any configurations, but for a dual monitor setup configurations are necessary, and it is not enough the xorg basic settings, so in order to enable command line interface into `randr` and manage rotation, resolution and resize, install
```
# pacman -S xorg-xrandr
```

[xrandr](https://wiki.archlinux.org/index.php/Xrandr) facilitates configurations significantly.


To manage in a simple way position, precedence, resolution or orientation on the fly with a graphical interface
```
# pacman -S arandr
```

Mostly works out of the box with bspwm


## I3
To manage external monitors Manjaro i3 uses `xrandr`, there are several ways to add monitors them into an i3 setup, in this case the following configuration represents modes in the i3 config, accessible via shortcuts.

The config already has some modes like the `resize` or `gaps` mode, following their process, select a shortcut to display the mode and bind a command to some specific keys, this way it possible to set more than one configuration.

```
# Set the shortcuts and what they do
set $mode_display Ext Screen (d) DP1 ON, (r) DP1 Vertical , (x) DP1 Mirror
mode "$mode_display" {
    bindsym d exec --no-startup-id xrandr --output eDP1 --primary --mode 2560x1440 --pos 219x1872 --rotate normal --output DP1 --mode 2560x1440 --scale 1.3x1.3 --pos 0x0 --rotate normal, mode "default"
    bindsym r exec --no-startup-id xrandr --output eDP1 --primary --mode 2560x1440 --pos 0x3328 --rotate normal --output DP1 --mode 2560x1440 --scale 1.3x1.3 --pos 0x0 --rotate left, mode "default"
    bindsym x exec --no-startup-id xrandr --output eDP1 --primary --mode 2560x1440 --pos 0x0 --rotate normal --output DP1 --mode 2560x1440 --scale 1x1 --rotate normal, mode "default"

    # back to normal: Enter or Escape
    bindsym Return mode "default"
    bindsym Escape mode "default"
}
# Declare here the shortcut to bring the display selection menu
bindsym $mod+x mode "$mode_display"
```