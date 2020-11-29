
### Pywal
One interesting option to manage color schemes is `pywal`. It can be installed via `sudo pacman -S python-pywall` or 

```
sudo pacman -S python-pip
sudo pip3 install pywal
pip3 install --user pywal
```
To run it `wal -i </path/to/img.jpg>`.
It will generate a new color scheme to `.cache/wal`.

However given the split system used on Mi3, this will be applied to URxvt, can be configured to apply on polybar but not on i3bar, gedit, or rofi. Also will not be present after reboot unless some configs are added.

It's necessary to run `wal -R` on each startup of the system. In i3 you can add the command in the `.i3/config` with `exec --no-startup-id wal -R`.

To update the URxvt color scheme with pywal is necessary to add to `~/.bashrc` or `/.zshrc` the following line:
`setsid wal -i <wallpaper-name>`

This will as well change the wallpaper to the one set as image, and run every time a terminal is started.

[Pywal](https://github.com/dylanaraps/pywal) sets it's configurations to `.cache/wal`, to enable it by default a line must be added to `.i3/config` from there will set colors at launch. It is possible to define a template and make it run the same configurations always. This will by run at start, and will overrun other configurations previously set.

The color palette of `.Xresources` will not change directly so neither rofi or i3bar will change. Rofi and URxvt can be configured differently for this, or an external package can be used to manage this, this is also true to i3bar, since i3bar does not use system or `Xresources` to get it's configuration.

Other option is to manually use pywal to generate color palette and manually get it's hex colors for changing the configurations. On `.cache/wal` are already defined some specific files, for `.Xresources` or `rofi`.

