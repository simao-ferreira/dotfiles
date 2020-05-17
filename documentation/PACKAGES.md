```
                  |                          
 __ \   _` |  __| |  /  _` |  _` |  _ \  __| 
 |   | (   | (      <  (   | (   |  __/\__ \ 
 .__/ \__,_|\___|_|\_\\__,_|\__, |\___|____/ 
_|                          |___/            

```

## Caffeine
With the presence of a screen lock mechanism, configured via i3lock or other, the configured defaults will block even when using the device with Netflix, Youtube or Spotify.

It is possible to add a script and stop the i3lock from blocking the system when sound is playing or by placing the mouse at a specified spot. 

Other option is to install a application like the `caffeine-ng` package, that enable the user to specify and change the locking. Caffeine works without altering the i3lock configurations.

The existence of the tray icon is specific to the [caffeine-ng](https://github.com/caffeine-ng/caffeine-ng) package, that is a split from the original one, mainly because of this.


## Conky
[conky](https://github.com/brndnmtthws/conky) is a light weight, configurable system monitor.

Opposite to normal behavior, conky on Manjaro i3 is configured `/usr/share/conky/` and then auto started on`/.i3/config`, the script used to run it is found on `/usr/bin/`.
On Mi3 there are two conky setups, one for cheat sheets and another to settings. By modifying the `/usr/bin/` file relative to the launcher is possible to ignore one, or both.
* Not in use, ytop is used for terminal and polybar scripts for desktop info

## Feh
[Feh](https://feh.finalrewind.org/) is image viewer, light and powerful is also used for launching wallpapers. 
```
# pacman -S feh
```

For changing the wallpaper add to configuration a command, with the wanted wallpaper and definitions.
```
# feh --bg-scale ~/.wallpapers/<image>.jpg
```

Alternatives
[Viewnior](https://siyanpanayotov.com/project/viewnior) is a simple minimalist image viewer that provides a clean interface. 

[Nitrogen](https://wiki.archlinux.org/index.php/nitrogen) is light and simple desktop background browser and setter for X Window.

Nitrogen has some quirks, like not being able to recognize some file types. Configurations can be found at `.config/nitrogen/bg-saved.cfg`.

## Feh-Blur
Feh-blur allows you to focus your attention on the application in use by applying blur to the desktop background.

## Figlet
[Figlet](https://github.com/cmatsuoka/figlet) is a program to create characters in various types of configurations, run `figlet <text>` or `figlet -f <font> <text>`.
* Mostly used for beautification of readme files and program headers.

Example:
```
 _ _ _          _   _     _       
| (_) | _____  | |_| |__ (_)___   
| | | |/ / _ \ | __| '_ \| / __|  
| | |   <  __/ | |_| | | | \__ \_ 
|_|_|_|\_\___|  \__|_| |_|_|___(_)
```

## Gedit
Out of the box spellcheck is not working on gedit. Some missing languages or conflict  with the languages installed.
Gedit uses `enchant` which act as a fronted for several spell checkers, some of those being `Hunspell`, `MySpell`, `Ispell` and `Aspell`.
It's possible to install more packages, for example, `aspell-en` and `aspell-de`, this will add English and German spell checkers.

To edit colors install `gedit color scheme` plugin from pamac, this usually installs the `developer-plugins`, which are a group of add-ons for gedit.
To configure the new color scheme, enter `gedit` select `color scheme editor` and configure the changes needed, save under a new name and ID, this will save the new configuration to `.local/shares/gedit/styles`.
Sometimes it add an underline under some text, just enter color scheme again and remove it.

## i3scrot
[i3scrot](https://github.com/pazuzu156/i3scrot) is shell script thats uses `scrot` to take a screenshot of your open displays.

Not exclusive for i3.

## Iosevka & Awesome Fonts

Available on `AUR` via nerd-fonts repository
```
# yay -Ss nerd-fonts-complete
```

## Maim
[maim](https://github.com/naelstrof/maim) is a screenshot tool, created to improve upon the limitations of `scrot`. It's improvements are mainly on selecting an area of the screen to print.
It also needs to receive a directory to save the print screen.

Example:
```
# maim --select -u > ~/Pictures/$(date +%Y%m%d%s).png
```

## Neofetch
[Neofetch](https://github.com/dylanaraps/neofetch) configuration file is placed in `.config/neofetch`, in it it's possible to change position of display information, also witch info is displayed. It is also possible to change the image displayed.

## Oblogout
Oblogout is a configurable logout script with graphical UI, that allows to cancel, restart, shutdown and lock.
* Rofi script is used instead.

## Palemoon
[pale moon](https://github.com/MoonchildProductions/UXP) is the Mi3 default browser. `pale moon` is a fork of `firefox` with emphasis in customization, there is however significant changes between `pale moon` and `firefox`, like running in single-process or not using gecko as engine (uses the goanna fork).
* Removed, firefox or chromium are default tools

## Redshift
[redshift](http://jonls.dk/redshift/) provides color temperature configurations, also known as night light.
  
For redshift it's necessary to configure geo location, this can be mocked, providing a static value or coordinate. Another option is to install and use [geoclue](https://gitlab.freedesktop.org/geoclue/geoclue/wikis/home), available under pamac or through pacman as `geoclue2`.
 
The `geoclue2` configuration can be edited at `/etc/geoclue/geoclue.conf`, adding:

```
[redshift]
allowed=true
system=false
users=
```

* Adding `redshift-gtk` will add a icon to the `tray_output`, if the icon is not necessary it enough to add just `redshift`

## Reflector

[Reflector](https://wiki.archlinux.org/index.php/Reflector) is script to rank the most up to date mirrors and sort them.

This will update `/etc/pacman.d/mirrorlist`, is a good idea to have a copy before running the commands.

There is also possible to create a hook and run it as a service on a schedule. 


Select 50 HTTP or HTTPS mirrors synced recently, sorted by speed 
```
# reflector --latest 50 --protocol http --protocol https --sort rate --save /etc/pacman.d/mirrorlist
```

Or select mirrors synced in the last 12h in Germany/Austria/France
```
# reflector --verbose --country Austria --country France --country Germany --age 12 --protocol https --sort rate --save /etc/pacman.d/mirrorlist
```

For listing available countries
``` 
# reflector --list-countries
```

## Screenfetch
[Screenfetch](https://github.com/KittyKatt/screenFetch) is a bash terminal informational tool, much to the like of `neofetch`, capable of displaying as much of information as alternatives, however, does not have a config file placed on `home`, what make it harder to manage in a dotfile style.
* Removed, neofetch used instead.

## Zathura
[zathura](https://pwmt.org/projects/zathura/) is a document viewer with vi style keybindings
it supports directly and with dependencies comicbooks, pdf, epub and xps.
```
#  pacman -S zathura zathura-cb zathura-pdf-mupdf
```