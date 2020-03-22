```
 _ _____  __        ___ _    _ 
(_)___ /  \ \      / (_) | _(_)
| | |_ \   \ \ /\ / /| | |/ / |
| |___) |   \ V  V / | |   <| |
|_|____/     \_/\_/  |_|_|\_\_|

```
# i3
The purpose of this documentation is to provide context for the existing configuration files and support for this setup.

This is an ongoing process, not all changes are completely documented. 

This is for personal use and contain the results of research and experimentation, this documentation provides basic explanations, some can be incomplete, insufficient or even misleading, this is only conceived for personal purposes.
 
* [Manjaro](MANJARO.md)

The following details where conceived for the i3 version of Manjaro. 

## Status

![Progress status](IMG/status_27_12_19.png)

## Basic settings
Installing new software under Manjaro is primarily be done through [pacman](PACMAN.md) the package manager. 
This is done through terminal by running `sudo pacman -s <package-name>` or through the GUI wrapper `pamac`, package description is `Add/Remove software`.

Mi3 has a terminal menu to manage settings, run it by pressing `$mod+Ctrl+b` or running `bmenu` in the terminal. This will open a text UI with options, to install new kernels, it's important to install more than one just in case it's needed for recovery. 
This can be important because Manjaro is a rolling distro based on Arch, and while is running behind the latest, to provide extra protection, it can on occasion break. To recover select a different kernel when booting. 

`bmenu` manages other system settings like manage drivers, if gaming is an option and graphic is NVIDIA, installations of bumblebee drivers is recomended. This can be installed by default in the initial OS installation. Check which graphics are correct for the setup, if NVIDIA optimus then use non-free graphics.

Mi3  has a very helpful user guide file included, accessible through `mod+Shift+h`, with some of the most important keyboard shortcuts.

Detailed settings:

* [Appearance](APPEARANCE.md)
* [Audio](WIP/AUDIO.md)
* [Battery](BATTERY.md)
* [Color Palette](COLOR-PALETTE.md)
* [Dotfiles](DOTFILES.md)
* [Firmware](FIRMWARE.md)
* [Package Manager](PACMAN.md)

## Browser
Mi3 champions `pale moon` as default browser. To install Firefox run `sudo pacman -S firefox` or through software manager, same for any other browser.

Firefox has some issues with webRTC calls and is not reliable in VPN mode. To [change](https://www.privacytools.io/browsers/#webrtc) this enter `about:config` in the firefox address bar and press enter, search for `media.peerconnection.enabled` and change it to false. 
To make shore every single WebRTC related setting is disabled change also `media.peerconnection.turn.disable` to `true`, `media.peerconnection.use_document_iceservers` to `false`, `media.peerconnection.video.enabled` to `false` and `media.peerconnection.identity.timeout` to `1`.

When using an external mouse firefox scrolling can be very slow, it's possible to [change](https://wiki.archlinux.org/index.php/Firefox/Tweaks#Mouse_wheel_scroll_speed) this in `about:config` modifying `mousewheel.acceleration.start` to `-1`, `mousewheel.acceleration.factor` to the desired number (`10` to `20` are common values).
Mozilla's recommendation is to set `mousewheel.default.delta_multiplier_y` between `200` and `500` (default: `100`, adequate: `300`).

## File Manager
Mi3 file managers are ranger, a terminal file manager, and `pcmanfm`, a more typical graphical interface.

Ranger is written in python, by default presents three columns, the middle one is the *working* panel, to move between them you can use arrows or other defined keys. The most right column allows previews for files and images. It includes capabilities *vim-like* with keybindings and bookmarks. It is also possible to use external scripts. 

To make `ranger` display hidden files edit `rc.conf` with `set show_hidden true`.

Ranger uses the default color scheme defined at `.Xresources`, but a specific theme can be set, adding `set colorscheme <scheme>`, original setup contains `deafult`, `jungle`, `snow` and `solarized` themes.
 
Adding to Ranger there is also pcmanfm, a standard linux integrated File Manager. Very similar to the gnome version.

## Menu
By default there dmenu, a fast and light menu for the X system, it's presented as a bar, usually on the top, where it reads text from STDIN and creates a menu with options related to the user input, the navigation is done by moving through options using the arrow keys (or other defined for the same purpose) and uses the `dmenu_run` wrapper for application launcher.

To run it from the console run`dmenu_run`, if a top bar exists, like `i3status` or `polybar`, `dmenu` will appear on top of it.

However there are other options with more "eye-candy", one of those is rofi.

Install rofi, a "better dmenu" through pamac or `sudo pacman -S rofi`.

After installing edit the `.i3/config` file, comment the line about dmenu and add:
`bindsym $mod+d exec rofi -lines 12 -padding 18 -width 60 -location 0 -show drun -sidebar-mode -columns 3`
* This command works for the initial setup, some changes need to be made according to settings, for example using a rasi theme.

This will replace the usual call to `dmenu`. However `dmenu` still works if another keybinding is provided. That is a important setting case something breaks on installation.
To move between types like windows, ssh or drun press `shift+<arrows>` while on rofi.

Also it is possible to configure a faster keybinding like the one used on WindowsOS. For moving between open windows: 
`bindsym $mod+Tab exec rofi -lines 12 -padding 18 -width 60 -location 0 -show window -sidebar-mode -columns 3`

Rofi can be configured in several different ways.
`rofi -help` will give you the current configuration and location.
By adding `~/.config/rofi/config.` you can specify the look and feel of rofi window.

Another option, more powerful but easier to update is using rasi configurations, this allows to define a theme, with a color pattern and different settings, as an example is possible to define looks for specified modules.
Rasi themes work in addition to the config file.
This allows visuals more complex, but defined with a more modular approach, easier to manage and change, also make it easy to integrate with scripts. 
To find themes got to [rasi-themes](https://github.com/davatorium/rofi-themes), this repo has a few to use or as example.

Mi3 also has a small categorized menu cascade style `morc_menu`, called with `mod+z`, that will open a simple menu up top, displaying categories with applications. Good emergency option.

## Text Editor
There are as usual several options already installed. `vim` and `nano` are already in Mi3.

For a windowed text editor Mi3 brings `mousepad`, however gnome-editor `gedit` is a reliable option. 
Out of the box spellcheck is not working on gedit. Some missing languages or conflict  with the languages installed.
Gedit uses `enchant` which act as a fronted for several spell checkers, some of those being `Hunspell`, `MySpell`, `Ispell` and `Aspell`.
In `pamac` it's possible to install more packages, for example, `aspell-en` and `aspell-de`, this will add English and German spell checkers.

To edit colors install `gedit color scheme` plugin from pamac, this usually installs the `developer-plugins`, which are a group of add-ons for gedit.
To configure the new color scheme, enter `gedit` select `color scheme editor` and configure the changes needed, save under a new name and ID, this will save the new configuration to `.local/shares/gedit/styles`.
Sometimes it add an underline under some text, just enter color scheme again and remove it.

Other option is to use something like OSS-Code (Visual Studio Code), Sublime, Atom, etc...

## Time settings
Dual boot always has some troubles with the time settings, by default WinOS and Linux have different settings regarding time, on WinOS the time by default is Local Time, this can be changed, on the BIOS/UEFI or even in the WinOS registry.
However in easier to make Linux use Local time instead of Universal Time.

for this run `timedatectl`, to query and change system clock setting:
`timedatectl set-local-rtc 1`

And to make Linux synchronized:
`timedatectl set-ntp true`

## Terminal
On setup there are UTerm, UXterm and URxvt.
URxvt is highly configurable.

By default Mi3 has `bash` shell, to install `zsh` run `sudo pacman -S zsh` and `sudo pacman -S zsh-completions`.

Running `zsh` will run zsh first time configuration, if doesn't run `zsh-newuser-install`, from this it's possible to configure history and completion. The new configuration file is found as `.zshrc`.

Note: Make sure your terminal's size is at least 72×15 otherwise `zsh-newuser-install` will not run.

Optionally there is [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) to manage the zsh configuration, to add it run:
`sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`
Adding to to `oh-my-zsh` there are several plugins like git and `agnoster` theme. For themes it can be necessary to install `powerline fonts`. This is possible through `AUR` installing `nerd-fonts-complete`. Change the `ZSH_THEME="agnoster"` or other to get "eye-candy" visuals.

## Monitoring
For monitoring some favorite options are neofetch, to get system info, and `gotop`, to get live system status.
`gotop` is a terminal "eye-candy" version of common tools like `htop`.

[Neofetch](https://github.com/dylanaraps/neofetch) configuration file is placed in `.config/neofetch`, in it it's possible to change position of display information, also witch info is displayed. It is also possible to change the image displayed.

Mi3 comes with `htop` and `screenfetch`, `htop` is visually less clear and `screenfetch` is not as configurable.

Most of options available on `htop` or `gotop` are possible to get if configured on `i3bar/i3status` or `polybar`.

## Network Manager
The network manager already is installed, to configure the VPN download the OpenVpn server configuration file and add a new VPN using the Network Manager configuration.

By default UDP is the recommended connection, less stable but more adequate to over the web communications.
Firefox however does not block webRTC javascript requests, that makes it insecure to use video streams and other uses as well.
It is possible to change this over Firefox configuration, however some use can be affected. 

Chromium does block this by default, and also has a specific add-on for this.

## Programming
Intellij is available through pamac. It is also possible to install more recent implementations of java, openjdk11 is the one more widely used. Is also available through the same way.

* [Java](PROGRAMMING.MD#java)


## Gaming
Steam is available through `pamac`.
Steam Play, available through `proton` uses an internal version of `wine` with some special tweaks provided by valve.
Enable `steam-beta` and `Steam Play` on steam settings.

Bumblebee *auto-magically* detects the necessity to use Nvidia graphics. When necessary it's possible to define in steam which games run from start with nvidia,
Set up a variable in the environment `sudo sh -c 'echo OPTIMUS_PREFIX=\"primusrun\" >> /etc/environment'`. Logout and login the desktop sessions. Then in steam client select the game from the library page, right-click, and select properties.
Click the SET LAUNCH OPTIONS button and specify `$OPTIMUS_PREFIX %command%`for the command line.
A simpler option is just to set directly launche options to  `primusrun %command%`.

Some games refuse to start with any of the above configurations.

For GOG games, download the `.sh` file and run it `sh <game-name.sh>`

Bumblebee drivers should kick in when necessary, if not, it's possible to run `primusrun <game-name>`, however this will start a different profile/config settings in `/usr/shared`.

## Print Screen
To take a print screen there is i3scrot, a command line application that takes a screenshot of your open displays.
It's possible to use the Mi3 binds to take a screenshot without the command line, to do that press `Print` or `mod+Print` to take full screen, or `mod+Shift+print` to select the area. Both are stored at `~/Pictures` by default.

# Dependencies
Managed dependencies on this documentation.

| Package        | Description                                                                             |
| :------------: |:--------------------------------------------------------------------------------------- |
| [AUR](PACMAN.md#AUR) | Community driven repository
| [caffeine](APPEARANCE.md#caffeine) | Prevents screen-saver and "sleep" 
| [cava](WIP/AUDIO.md#cava) | Sound vizualizer 
| [compton](APPEARANCE.md#compton) | Compositor, used to manage for example transparency and shadow
| [conky](OTHERS.md#conky) | Lightweight system monitor, used on desktop 
| [dunst](APPEARANCE.md#dunst) | Notification manager
| [dmenu](README.md#Menu) | Desktop Menu, also used as package launcher
| [feh](APPEARANCE.md#wallpaper) | Image viewer, can be used to manage desktop background
| [fwupd](FIRMWARE.md) | Firmware Manager
| [gedit](README.md#text-editor) | Gnome UI Text editor
| [git-secret](GIT-SECRET.md) | Git tool to encrypt files
| [gcolor2](COLOR-PALETTE.md#gcolor2) | Color picker GUI
| [geoclue2](APPEARANCE.md#redshift) | Location framework
| [gtk](GNOME.md) | GTK detail configuration
| [i3bar](APPEARANCE.md#menu-bar) | Status bar
| [i3scrot](README.md#print-screen) | Screen capture utility
| [lightdm](APPEARANCE.md#login-manager) | Display Manager, used to manage login
| [logiops](MOUSE.md) | Bluetooth mouse configuration 
| [lxappearance](APPEARANCE.md#icon-packs-cursors-and-fonts) | Gtk theme switcher
| [neofetch](README.md#monitoring) | Command line system information tool
| [nitrogen](APPEARANCE.md#wallpaper) | Background manager
| [pacman](PACMAN.md#pacman) | Package Manager
| [pale moon](OTHERS.md#palemoon) | Browser
| [pamac](PACMAN.md#pamac) | Package Manager GUI wrapper
| [polybar](POLYBAR.md) | Status bar, powerful and configurable
| [pywal](APPEARANCE.md#pywal) | Color scheme generator
| [ranger](README.md#file-manager) | File Manager
| [redshift](APPEARANCE.md#redshift) | Screen color temperature utility
| [rofi](README.md#Menu) | Window switcher, also used as package launcher
| [screenfetch](OTHERS.md#screenfetch) | Bash system information tool
| [spotify](WIP/AUDIO.md#spotify) | Spotify official player
| [spicetify-cli](WIP/AUDIO.md#spicetify) | Spotify wrapper
| [stow](DOTFILES.md#stow) | Symlink utility, used for generating git managed configuration files
| [tizonia]((WIP/AUDIO.md#tizonia)) | Terminal audio stream player 
| [tlp](BATTERY.md#tlp) | Battery Manager
| [viewnior](APPEARANCE.md#wallpaper) | Image viewer
| [yay](PACMAN.md#AUR) | Command line AUR helper

## Addicional packages
[Others](OTHERS.md)
[Maintenance](MAINTENANCE.md)

## TODO

[Todo](WIP/TODO.md)