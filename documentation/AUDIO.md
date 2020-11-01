# Audio

## Alsa
[ALSA](https://wiki.archlinux.org/index.php/Advanced_Linux_Sound_Architecture) or *Advanced Linux Sound Architecture* is a sound card driver present in the Kernel. It has a ncurses interface available and allows management by command.
It is also used for other high level APIs and interfaces, like `pulseaudio`.

In Manjaro there were some initial issues working with `ALSA`, was not able to play sound to headphones, failed to recognize sound in some applications, one of them `Firefox`.

## Cava
[Cava](https://github.com/karlstav/cava) is a terminal based visualizer for audio, is not accurate, it does not represent a proper sound spectrum. Is is only purpose is to look aesthetic when playing music.

## Pavucontrol
[Pavucontrol](https://freedesktop.org/software/pulseaudio/pavucontrol/) is a sound server GUI for pulse audio. Uses GTK.

## Pulseaudio
[Pulseaudio](https://wiki.archlinux.org/index.php/PulseAudio) is a sound server that provides the interface and subsystem for `ALSA` drivers, it more user friendly and has a larger set of capabilities and configurations.

### Installation:
Manjaro has a scrip `install_pulse`, that will install and setup pulse, also modifies the i3 configuration file adequately.

On Arch
```
# pacman -S pulseaudio pulseaudio-alsa pulseaudio-bluetooth pavucontrol
```

This will install all necessary packages to alsa, pulse-audio, bluetooth sound and a gtk-ui pavucontrol.

Usually sound starts mutted.

#### Issues
On Manjaro after first reboot `pulseaudio` did not work. Using `pulseaudio --check` and `pulseaudio -D` it works, but once reboot again, it will not run by default again. This happens because `pulseaudio` can be setup system wide or per user, in this case was being initiated before the i3 configuration runs.
It is important to make sure only one method of auto starting applications exists.

PulseAudio install script can include these files:
```
/etc/X11/xinit/xinitrc.d/pulseaudio
/etc/xdg/autostart/pulseaudio.desktop
/etc/xdg/autostart/pulseaudio-kde.desktop
```

These will conflict with the `/.i3/config`, commenting it there resolves the issue.

## Spicetify
[Spicetify-cli](https://github.com/khanhas/spicetify-cli) is a command line utility to use on top of the Spotify application, it's main use is to modify the typical UI from the app and clean some heavy or not useful components.

It allows also for inclusion of custom apps, in the same spotify window.

## Spotify
When installing the `spotify` app it happens that some keys do not match, this becomes an issue, preventing the successful installation.

Solution is to change DNS to something different (1.1.1.1) and try again.

## Spotify-tui
[Spotify-tui](https://github.com/Rigellute/spotify-tui) is a console client for spotify, however it needs spotify or spotifyd installed as it's just a wrapper for the web API which does not handle streaming.

## Tizonia
[Tizonia](http://tizonia.org/) is a command-line player for linux, with support for several online streaming tools like Google Play Music, Spotify or Youtube.

Tizonia is very heavy but very capable, for spotify it uses the spotify API, has very verbose command line usability but does not have visual representation for the spotify account link, so it is not possible to search in a easy way for a playlist or a artist, it is always necessary to have a id for searching.

Configuration file can be found at `.config/tizonia`.
To start spotify ` tizonia --spotify-playlist "#MOON" -s` the -s flag starts the playlist in random.
Or `tizonia  --spotify-recommendations-by-artist-id "2wouN3QXejYa5tKetYdcVX" -s`, the artist id can be obtained through spotify web.
To move to the next track press `n`. for volume `+` or `-`.

For more settings `tizonia --help keyboard`

Documentation at `http://docs.tizonia.org/usage/keyboard.html`