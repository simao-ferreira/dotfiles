# i3

## Settings
To install packages in Mi3 use `sudo pacman -s <package-name>` or through pamac name as `Add/Remove software`.
To update to last versions use `sudo pacman -U`
Is also possible to add user managed packages to pamac, to do this go to pamac top corner and under settings add `AUR`.
 
Mi3 also brings a command line menu to manage settings, run it by pressing `$mod+Ctrl+b` or `bmenu` in the terminal.
This will bring a text UI with options, like install a new kernel. Or two, just in case it's needed for recovery options.
This is important because Manjaro is a rolling distro based on Arch, and while is running behind the latest it can on occasion break. If it happens select a different kernel when booting.

bmenu is also able to manage drivers, if gaming is an option and graphic is NVIDIA it's necessary to install bumblebee drivers. This should be installed by default if the initial OS installation was done correctly.
Check which graphics correct, if NVIDIA optimus then use non-free graphics.

Also gaps is enabled by default.

Mi3  has a very complete user guide and a brilliant file included, accessible through `mod+Shift=h`, with the complete keyboard shortcuts.

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

## Time settings
Dual boot always has some troubles with the time settings, by default WinOS and Linux have different settings regarding time, on WinOS the time by default is Local Time, this can be changed, on the BIOS/UEFI or even in the WinOS registry.
However in easier to make Linux use Local time instead of Universal Time.

For this:
`timedatectl set-local-rtc 1`

And to make Linux synchronized:
`timedatectl set-ntp true`

## Terminal
On setup there are UTerm, UXterm and URxvt.
URxvt is highly configurable. Highly.

By default Mi3 has `bash` shell, it's configurations can be found at `.bashrc`.

A more complete and versatile option is `zsh`, found through `sudo pacman -S zsh`.
Add also `sudo pacman -S zsh-completions`.

Running `zsh` will run zsh, if it's first time it should open `zsh-newuser-install`. Note: Make sure your terminal's size is at least 72×15 otherwise `zsh-newuser-install` will not run.
From this it's possible to configure history and completion.

The new configuration file is set as `.zshrc`.

Optionally to install `oh-my-zsh` configuration setuo run:
`sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`
Adding to to `oh-my-zsh` there are several interesting plugins like git and `agnoster` theme. For themes it's necessary to install `powerline fonts`. This is possible through `AUR` installing `nerd-fonts-complete`. Change the `ZSH_THEME="agnoster"` or other to get "eye-candy" visuals.

## Appearance
When using clean Mi3 the visual setup is rather minimal, background and bars are very basic.
There are various options to manage and improve the setup.

### Wallpaper
There is an installation of Viewnior a image viewer and Nitrogen to setup a wallpaper, Nitrogen has some flaws, like not being able to recognize some file types.

To replace Viewnior and help with the wallpaper setup install feh, through pamac or `sudo pacman -S feh`
 
For changing the wallpaper add to `/.i3/config`:
`exec_always --no-startup-id feh --bg-scale ~/.wallpapers/forest-nightscape.jpg`
But this might not work immediately, when pressing `mod4+Shift+r` if the new wallpaper appears but not when restarting, usually there is a line under `i3/config` starting Nitrogen, the wallpaper loader by default, that does not recognise .jpg files. By commenting this line, the previous instruction will work when rebooting.

### Compton
It's also possible to add transparency and shadow to windows through `compton`, on `.config/compton.conf` add:
`opacity-rule = [`

`  "75:class_g = 'URxvt' && focused",`

`  "60:class_g = 'URxvt' && !focused"`

`];`

But this will not be set by default, it's necessary to add `compton -b` to launch it.
Add `exec_always --no-startup-id feh --bg-scale ~/.wallpapers/sunset.jpg; sleep 1; compton -b` to `.i3/conf`

Also can happen that this settings interfere with chromium. To solve this change `backend = "xrender` to `"backend = "glx"`.

### Icon packs, cursors and fonts
More configurations can be made, either bu modifying the config or using `lxappearence`, also called `Customize look and feel`, installed by default, with it is possible to load icon packs, mouse cursors, amongst other configurations. Also changing fonts and font size.

However fonts are loaded in different config files.
By default when changing the config file, the font input changes bar fonts, but not apps and terminal. For terminal URxvt comes as default, and with it the defaults can be changed at `.Xresources` however this terminal is more complex than usual to configure.

When setting new settings with lxappearence also can happen that some resources are unrecognizable for URxvt.
For more info go to `https://wiki.archlinux.org/index.php/Rxvt-unicode`, there it's possible to understand more about configurations like fonts on URxvt.

To increase the font size got to `/usr/share/fonts/misc/fonts.alias` and take a look at settings.
Edit the .Xresources accordingly, 10x20 is a good setting for an HiDPi setup.

Apps like gedit have a specific configuration found under `preferences`.

### Redshift
Night light does not come with Mi3 as with other distro's, one options is to install Redshift. It needs Geo location to work, it's possible to setup a static value or location. A more comprehensive option is to install and use `geoclue2` for configure with Redshift. 
The geoclue configuration can be edited at `/etc/geoclue/geoclue.conf` , just add:

`[redshift]`
`allowed=true`
`system=false`
`users=`

After that is necessary to start both applications at launch, for that edit the `/.i3/config` settings for both Redshift and geoclue.

`exec --no-startup-id /usr/lib/geoclue-2.0/demos/agent`
`exec --no-startup-id redshift-gtk`

### Dunst
The  default notification manager is `dunst` on i3 can be configured at `~/.config/dunst/dunstrc`.
Dunst can be configured to have different colors, size and font, amongst other things.

### Menu bar
The standard status bar is i3bar, it can be manipulated with help of i3status.
Configuration resides in `.config/i3status/config`
There are other options to use, like `polybar`. [todo]

### Caffeine
Instead of a screen saver Mi3 has a locking mechanism configured via i3lock. It usually blocks when using Netflix or Spotify. To solve this, is possible to install `caffeine-ng` package, after add to `/.i3/config` the following line
`exec -no-startup-id caffeine`. This also adds an icon to the bar and allows to switch it on/off when needed. the default is off.

### Login manager
The login manager is LightDM, the configuration for the greeter (login screen manager) is set at `/etc/lightdm/slick-greeter.conf`
It's possible to check for other installed greeters at `/usr/share/xgreeters` all `.desktop` files are the greeters installed.
To configure the login background `lightdm-settings` should be enough.

### Pywal
One interesting option to manage color schemes is `pywal`. It can be installed via `sudo pacman -S python-pywall` or `sudo pacman -S python-pip`+`sudo pip3 install pywal`+`pip3 install --user pywal`.
To run it `wal -i </path/to/img.jpg>`.
It will generate a new color scheme [TO WHERE?][todo].
However given the split system used on Mi3, this will be applied to URxvt but not on i3bar, gedit, or rofi. Also may not be present after reboot.
It's necessary to run `wal -R` on each startup of the system. In i3 you can add the command in the `.i3/config` with `exec --no-startup-id wal -R`.

To update the URxvt color scheme with pywal is necessary to add to `~/.bashrc`
`# pywal`
`setsid wal -i <wallpaper-name>`
This will however change the default wallpaper to the one set above. This might not be ideal.

Pywal sets it's configurations to `.cache/wal`, to enable it by default a line must be added to `.i3/config` from there will set colors at launch. It is possible to define a template and make it run the same configurations always.
However this will set them at start, this means more time spent running before desktop is ready.
Also, it will not change the color palette of `.Xresources`, so neither rofi or i3bar will change. Rofi can be configured differently for this.
But to do this in i3bar it's necessary another application.
`Xresources` will not be used by i3bar as well. i3bar as to be always configured apart.

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

## Programming
Intellij is available through pamac. It is also possible to install more recent implementations of java, openjdk11 is the more common. Is also available through the same way.

## Gaming
Steam is available through `pamac`.
Steam Play, available through `proton` uses an internal version of `wine` with some special tweaks provided by valve.
Enable `steam-beta` and `Steam Play` on steam settings.

For GOG games, download the `.sh` file and run it `sh <game-name.sh>`

Bumblebee drivers should kick in when necessary, if not, it's possible to run `primusrun <game-name>`, however this will use different config settings [in /usr/shared][todo]

## Others
Packages to remove:
`palemoon`, `hexchat`.

## TODO
general color paleltte
grub quiet directly to linux
games: how to run them with primusrun and manage config.
pywal
spotifyd, etc
Gtk-WARNING **: 23:31:44.440: Unable to locate theme engine in module_path: "adwaita"
Pacman Rosetta
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
lightdm
pamac package manager
lxappearance and nitrogen for customization
lxinput for mouse and keyboard configuration
bmenu, ranger, moc and a variety of more CLI-utilities
compton, dunst, i3-scrot, i3-exit and conky*
pcmanfm file-browser
palemoon internet browser
gimp, viewnior, epdfview, manjaro-printer
vlc, xfburn
hexchat, transmission-gtk
manjaro-chroot, gparted, isousb
base-devel

