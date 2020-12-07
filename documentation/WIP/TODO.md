# Todo 
To research/install/discuss in no order of priority:

- Screenlocker https://wiki.archlinux.org/index.php/List_of_applications#Screen_lockers

- spotify alternative?

- break zsh config

- new color scheme (forest green)

- Update adobe drm on wine

- Test and document dwm

- Test and update I3 and remove MI3 old configurations

- Brightness adjustment

- Volume adjustment

- Update documentation for dmenu, rofi and rasi : https://wiki.archlinux.org/index.php/Dmenu, https://wiki.archlinux.org/index.php/Rofi

- Bin, recycling folder.

- Pipenv: Pipfile, Pip, & Virtualenv.

- Conda
 
- vscode vs pycharm

- Manage zsh without oh-my-zsh

- Manage fonts, theme, etc, with xsettingsd:
https://github.com/mxmilkb/dotfiles/blob/master/X11/.xsettingsd
https://wiki.archlinux.org/index.php/Xsettingsd
https://github.com/derat/xsettingsd
https://github.com/mxmilkb/dotfiles/blob/master/bin/bin/xrandr-rose-vgaprime-hdmiright.sh

- http://dotshare.it/

- https://wiki.archlinux.org/index.php/GRUB#Background_image_and_bitmap_fonts

- vscodium > plugins > themes > configs

- https://github.com/jesprr/dotfiles/tree/master/.config
https://unix.stackexchange.com/questions/71253/what-should-shouldnt-go-in-zshenv-zshrc-zlogin-zprofile-zlogout

- Update privacy and security, profiling and dots for firefox 

- Clean manjaro i3 folder to make it usable as i3 desktop

- Make documentation more abstract

- Study and document important configurations for tlp

- Describe the installation process for bspwm and i3 (maybe extract them from actual documentation)

- create a rofi control center

- searx

- mps-youtube

- w3m - terminal browser.

- manage and share bookmarks between various browsers > take a look at buku

- Music player: mocp

- youtube console player

- virtualbox

- macos like keyboard press and hold - https://support.apple.com/en-us/HT201586:
	* Best solution seems to be compose: https://wiki.archlinux.org/index.php/Xorg/Keyboard_configuration#Configuring_compose_key
	* Alacritty allows some configuration as well

- i3-gaps, i3bar, i3status, dmenu-manjaro, bmenu, ranger, moc, morc_menu, i3-exit, i3-msg, pcmanfm, viewnior, epdfview, manjaro-printer, vlc, xarchiver, xfburn, manjaro-chroot, gparted, isousb, gimp, inkscape, newsboat, vim

- https://www.peerlator.com/blog/MyDotfilesPart5/

- https://realpython.com/python-development-visual-studio-code/

- Pywal >

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

