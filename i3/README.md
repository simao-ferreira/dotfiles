# i3
* [Manjaro](MANJARO.md)

## Settings
To install packages in Mi3 use `sudo pacman -s <package-name>` or through pamac name as `Add/Remove software`.
To update to last versions use `sudo pacman -U`
Is also possible to add user managed packages to pamac, to do this go to pamac top corner and under settings add `AUR`.
To install `AUR`packages from terminal use `yay -S <package>`.
Other helpers for `pacman` can be used instead of `yay`, like `trizen`, `pikaur`, `pakku`, `aura` or `pacaur`. Semantics can be different for them.

Mi3 also brings a command line menu to manage settings, run it by pressing `$mod+Ctrl+b` or `bmenu` in the terminal.
This will bring a text UI with options, like install a new kernel. Or two, just in case it's needed for recovery options.
This is important because Manjaro is a rolling distro based on Arch, and while is running behind the latest it can on occasion break. If it happens select a different kernel when booting.

bmenu is also able to manage drivers, if gaming is an option and graphic is NVIDIA it's necessary to install bumblebee drivers. This should be installed by default if the initial OS installation was done correctly.
Check which graphics correct, if NVIDIA optimus then use non-free graphics.

Also gaps is enabled by default.

Mi3  has a very helpful user guide file included, accessible through `mod+Shift=h`, with the complete keyboard shortcuts.

* [Appearance](APPEARANCE.md)
* [Package Manager](PACMAN.md)

## Browser
Mi3 comes with palemoon as default browser. 
Install Firefox. `sudo pacman -S firefox` or through software manager
Same for Chromium.

Firefox has some issues with webRTC calls and is not reliable in VPN mode.
(add link)

## File Manager
Mi3 has two file managers, one is ranger, a terminal file manager. Neat!
Adding to Ranger there is also pcmanfm, a very well integrated File Manager. Very similar to the gnome version.

## Menu
By default there dmenu, a bar, usually on the top, where it's possible to search for applications.

However there are other options, with more "eye-candy" one of those is rofi.

Install rofi, a "better dmenu" through pamac or `sudo pacman -S rofi`.

After installing edit the .i3/config file, comment the line about dmenu and add:
`bindsym $mod+d exec rofi -lines 12 -padding 18 -width 60 -location 0 -show drun -sidebar-mode -columns 3`
This will replace the usual call to dmenu. dmenu still works if another keybinding is provided. That is a important setting case something breaks on installation.
To move between types like windows, ssh or drun press `shift` while on rofi.

Also it is possible to configure a faster keybinding like the one used on WindowsOS. For moving between open windows: 
`bindsym $mod+Tab exec rofi -lines 12 -padding 18 -width 60 -location 0 -show window -sidebar-mode -columns 3`

Rofi can be configured in several different ways.
`rofi -help` will give you the current configuration and location.
By adding `~/.config/rofi/config.` you can specify the look and feel of rofi window.

Mi3 also has a small menu gnome style, `mod+z` opens a small menu on top. Good emergency option.

## Text Editor
There are as usual several options already installed. `vim` and `nano` are already in Mi3.

For a windowed text editor gnome-editor `gedit` is a reliable option. 
Out of the box spellcheck is not working. Some missing languages or conflict  with the languages installed.
Gedit uses `enchant` which act as a fronted for several spell checkers, some of those being `Hunspell`, `MySpell`, `Ispell` and `Aspell`.
In `pamac` it's possible to install more packages, for example, `aspell-en` and `aspell-de`, this will add English and German spell checkers.

To edit colors install `gedit color scheme` plugin from pamac, this usually installs the `developer-plugins`, which are a group of add-ons for gedit.
To configure the new color scheme, enter `gedit` select `color scheme editor` and configure the changes needed, save under a new name and ID, this will save the new configuration to `.local/shares/gedit/styles`.
Sometimes it add an underline under some text, just enter color scheme again and remove it.

## Time settings
Dual boot always has some troubles with the time settings, by default WinOS and Linux have different settings regarding time, on WinOS the time by default is Local Time, this can be changed, on the BIOS/UEFI or even in the WinOS registry.
However in easier to make Linux use Local time instead of Universal Time.

For this:
`timedatectl set-local-rtc 1`

And to make Linux synchronized:
`timedatectl set-ntp true`

## Terminal
On setup there are UTerm, UXterm and URxvt.
URxvt is highly configurable.

By default Mi3 has `bash` shell, it's configurations can be found at `.bashrc`.

A more complete and versatile option is `zsh`, found through `sudo pacman -S zsh`.
Add also `sudo pacman -S zsh-completions`.

Running `zsh` will run zsh, if it's first time it should open `zsh-newuser-install`. Note: Make sure your terminal's size is at least 72×15 otherwise `zsh-newuser-install` will not run.
From this it's possible to configure history and completion.

The new configuration file is set as `.zshrc`.

Optionally to install `oh-my-zsh` configuration setup run:
`sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`
Adding to to `oh-my-zsh` there are several interesting plugins like git and `agnoster` theme. For themes it's necessary to install `powerline fonts`. This is possible through `AUR` installing `nerd-fonts-complete`. Change the `ZSH_THEME="agnoster"` or other to get "eye-candy" visuals.

## Sound
Out of the box Mi3 comes with AlsaMixer, but sound will not working from headphones, some comments online refer to Alsa not being able to play from Firefox and other programs. Within Mi3 there is also a script to install Pulse Audio with it. Pulse Audio will run on top of AlsaMixer to provide extra capabilities.

Too install it run the scrip `install_pulse`, with that the `/.i3/config` file will change and auto-magically apply all configurations necessary.

To manage external input `mod+ctrl+m` brings the Pulse Audio manager and from there is easy to select the input. For example USB headphones.

After first reboot Pulse Audio may not work. Using `pulseaudio --check` and `pulseaudio -D` makes it work, but once reboot again, it will not run by default again. After some research seams pulse audio is being started before the `/.i3/config` is run.
As so make sure to use only one method of auto starting applications. pulse audio includes these files:
`/etc/X11/xinit/xinitrc.d/pulseaudio`
`/etc/xdg/autostart/pulseaudio.desktop`
`/etc/xdg/autostart/pulseaudio-kde.desktop`
These will conflict with the `/.i3/config` file line, commenting it there resolves the issue.

### Sound player
One good option for streaming players is Tizonia, very heavy but very capable, it includes spotify, plex and google play.
Configuration file can be found at `.config/tizonia`. 
To start spotify ` tizonia --spotify-playlist "#MOON" -s` the -s flag starts the playlist in random.
Or `tizonia  --spotify-recommendations-by-artist-id "2wouN3QXejYa5tKetYdcVX" -s`, the artist id can be obtained through spotify web.
To move to the next track press `n`. `+` and `-` for volume.
For more settings `tizonia --help keyboard`
Documentation at `http://docs.tizonia.org/usage/keyboard.html`

There is also possible to use `spicetify-cli`, but this will run on top of the normal spotify app, just changes the app appearance.

For "eye-candy" is also possible to install cava, it runs on the command line and uses alsa or pulse to get the played music.

## Monitoring
Installed and working is already a module of conky, can be configured. 
Opposite to normal behaviour, conky on Mi3, is configured `/usr/share/conky/` and then auto started on`/.i3/config`, the script used to run it is found on `/usr/bin/`.
On Mi3 there are two conky setups, one for cheat sheets and another to settings. By modifying the `/usr/bin/` file relative to the launcher is possible to ignore one, or both.

Other important options are neofetch to get system info and `htop` or `gotop`.
`gotop` is a more "eye-candy" version.

## Network Manager
The network manager already is installed, to configure the VPN download the OpenVpn server configuration file and add a new VPN using the Network Manager configuration.

By default Nord recommends UDP connection, less stable but more adequate to over the web communications.
Firefox however does not block webRTC java script requests, that makes it insecure to use video streams and other uses as well.
It is possible to change this over Firefox configuration, however some use can be affected. 

Chromium does block this by default, and also has a specific add-on for this.

## Battery

* [Battery](BATTERY.md)

## Programming
Intellij is available through pamac. It is also possible to install more recent implementations of java, openjdk11 is the more common. Is also available through the same way.

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

Bumblebee drivers should kick in when necessary, if not, it's possible to run `primusrun <game-name>`, however this will use different config settings [in /usr/shared][todo]

## Packages

[AUR](PACMAN.md#AUR)

[caffeine](APPEARANCE.md#caffeine)

[compton](APPEARANCE.md#compton)

[dunst](APPEARANCE.md#dunst)

[feh](APPEARANCE.md#wallpaper)

[i3bar](APPEARANCE.md#menu-bar)

[lightdm](APPEARANCE.md#login-manager)

[lxappearance](APPEARANCE.md#icon-packs-cursors-and-fonts)

[nitrogen](APPEARANCE.md#wallpaper)

[pacman](PACMAN.md#pacman)

[pamac](PACMAN.md#pamac)

[pywal](APPEARANCE.md#pywal)

[redshift](APPEARANCE.md#redshift)

[tlp](BATTERY.md#tlp)

[viewnior](APPEARANCE.md#wallpaper)

## Others
Packages to remove:
`palemoon`, `hexchat`.

## TODO
general color paleltte
grub quiet directly to linux
games: how to run them with primusrun and manage config.
spotifyd, etc
`Gtk-WARNING **: 23:31:44.440: Unable to locate theme engine in module_path: "adwaita"`
i3wm-themer
gnome like win press
macos like keyboard press- https://support.apple.com/en-us/HT201586
trim for ssd
spicetify-cli
feh-blur
polybar
oblogout
octopi (vs pamac)
qt5ct & kvantum
i3-gaps 4.13
customized, preconfigured i3status-manjaro 2.11
dmenu-manjaro 4.16-12 patched with recency-awareness and mouse-support
additional categorized menu morc_menu
alsa pre-installed with install_pulse script for easy upgrade to pulseaudio
lxinput for mouse and keyboard configuration
bmenu, ranger, moc and a variety of more CLI-utilities
i3-scrot, i3-exit and conky*
pcmanfm file-browser
gimp, viewnior, epdfview, manjaro-printer
vlc, xfburn
transmission-gtk
manjaro-chroot, gparted, isousb
base-devel
zenity
