```
             o8   oooo                                           
  ooooooo  o888oo  888ooooo   ooooooooo8 oo oooooo    oooooooo8  
888     888 888    888   888 888oooooo8   888    888 888ooooooo  
888     888 888    888   888 888          888                888 
  88ooo88    888o o888o o888o  88oooo888 o888o       88oooooo88  

```
# Others

## Removed

Hexchat

Deluge

Htop

Screenfetch

## Optional

### Conky
[conky](https://github.com/brndnmtthws/conky) is installed and working is already a module of conky, can be configured. 
Opposite to normal behaviour, conky on Mi3 is configured `/usr/share/conky/` and then auto started on`/.i3/config`, the script used to run it is found on `/usr/bin/`.
On Mi3 there are two conky setups, one for cheat sheets and another to settings. By modifying the `/usr/bin/` file relative to the launcher is possible to ignore one, or both.
* Not in use, gotop is used for terminal and polybar scripts for desktop info

### Feh-Blur
Feh-blur allows you to focus your attention on the application in use by applying blur to the desktop background.
* Not interesting since using i3 with gaps, it's more adequate to open-box layouts.

### Oblogout
Oblogout is a configurable logout script with graphical UI, that allows to cancel, restart, shutdown and lock.
* Rofi script is used instead.

### Palemoon
[pale moon](https://github.com/MoonchildProductions/UXP) is the Mi3 default browser. `pale moon` is a fork of `firefox` with emphasis in customization, there is however significant changes between `pale moon` and `firefox`, like running in single-process or not using gecko as engine (uses the goanna fork).
* Removed, firefox or chromium are default tools

### Screenfetch
[Screenfetch](https://github.com/KittyKatt/screenFetch) is a bash terminal informational tool, much to the like of `neofetch`, capable of displaying as much of information as alternatives, however, does not have a config file placed on `home`, what make it harder to manage in a dotfile style.
* Removed, neofetch used instead.

### Figlet
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
## Gnome
Mostly useful on Gnome desktop
* [Gnome bars](GNOME.md)
