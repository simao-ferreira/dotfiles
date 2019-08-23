# Appearance
When using clean Mi3 the visual setup is rather minimal, background and bars are very basic. But there are various options to manage and improve the setup. Mi3 setup is extremely configurable.

### Wallpaper
There is an installation of Viewnior a image viewer and Nitrogen to setup a wallpaper.
[Viewnior](https://siyanpanayotov.com/project/viewnior) is a simple minimalist image viewer that provides a clean interface with extra space. 

[Nitrogen](https://wiki.archlinux.org/index.php/nitrogen) is light and simple desktop background browser and setter for X Window.

Nitrogen has some flaws, like not being able to recognize some file types. Configurations can be found at `.config/nitrogen/bg-saved.cfg`.
A good replacement for Viewnior and more versatile for the i3 config wallpaper settings setup, is [feh](https://feh.finalrewind.org/).
Can be installed through pamac or`sudo pacman -S feh`.

For changing the wallpaper add to `/.i3/config`:
`exec_always --no-startup-id feh --bg-scale ~/.wallpapers/forest-nightscape.jpg`.
It can occur that this does not work after configuration. This is because nitrogen takes precedence when `.i3/config` runs. 
To test if the configuration is working press `mod4+Shift+r`. If after reboot the new wallpaper is not set, usually there is a line under `i3/config` starting Nitrogen, the wallpaper loader by default. By commenting this line, the new setup instruction will work when rebooting.

### Menu bar
The standard status bar is i3bar, it uses the i3status as default source for data, this can be changed.
Configuration resides in `.config/i3status/config`
There are other popular options like `polybar`.

* [Polybar](POLYBAR.md)

### Compton
[Compton](https://wiki.archlinux.org/index.php/Compton) is a window manager compositor  for Xorg.
It also provides transparency and shadow to windows through `compton`.
To do this change `.config/compton.conf`, and add or modify as follows:
```opacity-rule = [
  "75:class_g = 'URxvt' && focused",
  "60:class_g = 'URxvt' && !focused"
];
```
Other apps can be added or configured, with different transparencies. 

Compton is not set by default, it's also necessary to add `compton -b` to `.i3/config` to launch it at start.
Modify the wallpaper setup as: 
`exec_always --no-startup-id feh --bg-scale ~/.wallpapers/sunset.jpg; sleep 1; compton -b`.

`Chromium` and other apps might not function properly after changes to `compton`. A possible solution is to change the `compron.config` from `backend = "xrender` to `"backend = "glx"`.

### Icon packs, cursors and fonts
More configurations can be made, either by adding or modifying the config or using the GUI of `lxappearance`, also called `Customize look and feel`. This package is installed by default, from it with it is possible to load new icon packs, mouse cursors, among other configurations. Also changing fonts and font size.

Fonts are loaded in different ways under Mi3, there are several config files or applications with different fonts setup.
When changing the `.i3/config` file the font input changes bar fonts, but not apps and terminal. For terminal Mi3 comes with URxvt as default, for it changed can be made `.Xresources`. URxvt is more configurable than usual, and when installing it from scratch it's look is extremely different from the configurations usually seem online.

When setting new settings with `lxappearance` also can happen that some resources are unrecognizable for URxvt.
[URxvt](https://wiki.archlinux.org/index.php/Rxvt-unicode) manuals are very complete and detailed.
Important when using HiDpi screens, to increase font size first check `/usr/share/fonts/misc/fonts.alias` and take a look at settings.
From there edit the `.Xresources` accordingly, `10x20` is a good setting for an HiDpi setup.

Some apps like `gedit` or `chromium` have a specific configurations, usually found under preferences or settings.

### Redshift
[redshift](http://jonls.dk/redshift/) provides color temperature configurations, also known as night light.
 
Night light does not come with Mi3 as with other distro's, `redshift` is one of the options, as `flux`. 
For redshift it's necessary to configure geo location, this can be mocked, providing a static value or coordinate. 
Another options, more comprehensive, is to install and use [geoclue](https://gitlab.freedesktop.org/geoclue/geoclue/wikis/home), available under pamac or through pacman as `geoclue2`.
 
The `geoclue2` configuration can be edited at `/etc/geoclue/geoclue.conf`, adding:
```[redshift]
allowed=true
system=false
users=
```

It is also necessary to start both applications at launch, for that edit the `/.i3/config` settings for both Redshift and geoclue:

```exec --no-startup-id /usr/lib/geoclue-2.0/demos/agent
exec --no-startup-id redshift-gtk
```

### Dunst
The  default notification manager is `dunst` on i3 can be configured at `~/.config/dunst/dunstrc`.

[Dunst](https://dunst-project.org/) can be configured to have different colors, size and font, among other settings.

### Caffeine
The screen saver in Mi3 is a locking mechanism configured via i3lock, that blurs the workspace. 
It's configured defaults will block even when using the device with Netflix, Youtube or Spotify.
It is possible to add a script and stop the i3lock from blocking the system when sound is playing or by placing the mouse at a specified spot. 
Other option is to install a application like the `caffeine-ng` package, that enable the user to specify and change the locking. Caffeine works without altering the i3lock configurations.
To enable it add to `/.i3/config` the following line
`exec -no-startup-id caffeine`. 

This also adds an icon to the bar, where is possible to switch it on/off when needed. Default is off.

The existence of the tray icon is specific to the [caffeine-ng](https://github.com/caffeine-ng/caffeine-ng) package, that is a split from the original one, mainly because of this.

### Login manager
The login manager is LightDM, the configuration for the greeter (login screen manager) is set at `/etc/lightdm/slick-greeter.conf`
It's possible to check for other installed greeters at `/usr/share/xgreeters` all `.desktop` files are the greeters installed.
To configure the login background `sudo lightdm-settings` and there you can change backgrounds.

For this to work is advisable to move the backgrounds to `/usr/share/backgrounds` or `/usr/share/pixmaps` depending on the greeter installed. To work with `lightDM` images and pictures can't be located under `/home`. 
One helpful tool during this configuration is `dm-tool switch-to-greeter`, that allows to check the greeter changes from within the session. Login password it's necessary.
  
### Pywal
One interesting option to manage color schemes is `pywal`. It can be installed via `sudo pacman -S python-pywall` or `sudo pacman -S python-pip`+`sudo pip3 install pywal`+`pip3 install --user pywal`.
To run it `wal -i </path/to/img.jpg>`.
It will generate a new color scheme to `.cache/wal`.

However given the split system used on Mi3, this will be applied to URxvt but not on i3bar, gedit, or rofi. Also may not be present after reboot.

It's necessary to run `wal -R` on each startup of the system. In i3 you can add the command in the `.i3/config` with `exec --no-startup-id wal -R`.

To update the URxvt color scheme with pywal is necessary to add to `~/.bashrc` or `/.zshrc` the following line:
`setsid wal -i <wallpaper-name>`

This will as well change the wallpaper to the one set as image, and run every time a terminal is started.

[Pywal](https://github.com/dylanaraps/pywal) sets it's configurations to `.cache/wal`, to enable it by default a line must be added to `.i3/config` from there will set colors at launch. It is possible to define a template and make it run the same configurations always. This will by run at start, and will overrun other configurations previously set.

The color palette of `.Xresources` will not change directly so neither rofi or i3bar will change. Rofi and URxvt can be configured differently for this, or an external package can be used to manage this, this is also true to i3bar, since i3bar does not use system or `Xresources` to get it's configuration.

Other option is to manually use pywal to generate color palette and manually get it's hex colors for changing the configurations. On `.cache/wal` are already defined some specific files, for `.Xresources` or `rofi`.
