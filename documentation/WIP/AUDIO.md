# Audio

## Audio settings
Out of the box Mi3 comes with `AlsaMixer`, that is not able to play sound to headphones and fails to recognize `Firefox` sound amongst other packages. 

Mi3 allows you to install `PulseAudio`, to run it on top of `AlsaMixer` to provide extra capabilities. This can be done running `install_pulse`, with that the `/.i3/config` file will change and auto-magically apply all configurations necessary.

To manage external input `mod+ctrl+m` brings the `PulseAudio` manager and from there is easy to select the input. For example USB headphones.

#### Issues
After first reboot Pulse Audio did not work. Using `pulseaudio --check` and `pulseaudio -D` it works, but once reboot again, it will not run by default again. 

After some research seams pulse audio is being started before the `/.i3/config` runs. Make sure to use only one method of auto starting applications. 

PulseAudio install script includes these files:
`/etc/X11/xinit/xinitrc.d/pulseaudio`
`/etc/xdg/autostart/pulseaudio.desktop`
`/etc/xdg/autostart/pulseaudio-kde.desktop`
These will conflict with the `/.i3/config`, commenting it there resolves the issue.

## Headphones

## VLC
Comes by default.

## Spotify**
When installing the `spotify` app is normal that the keys do not match. For whatever reason, change DNS to something different (1.1.1.1) and try again.

## Tizonia* 
[Tizonia](http://tizonia.org/) is a command-line player for linux, with support for several online streaming tools like Google Play Music, Spotify or Youtube.

Tizonia is very heavy but very capable, for spotify it uses the spotify API, has very verbose command line usability but does not have visual representation for the spotify account link, so it is not possible to search in a easy way for a playlist or a artist, it is always necessary to have a id for searching.

Configuration file can be found at `.config/tizonia`. 
To start spotify ` tizonia --spotify-playlist "#MOON" -s` the -s flag starts the playlist in random.
Or `tizonia  --spotify-recommendations-by-artist-id "2wouN3QXejYa5tKetYdcVX" -s`, the artist id can be obtained through spotify web.
To move to the next track press `n`. for volume `+` or `-`.

For more settings `tizonia --help keyboard`

Documentation at `http://docs.tizonia.org/usage/keyboard.html`

## Spicetify
[Spicetify-cli](https://github.com/khanhas/spicetify-cli) is a command line utility to use on top of the Spotify application, it's main use is to modify the typical UI from the app and clean some heavy or not useful components.

It allows also for inclusion of custom apps, in the same spotify window.

## Spotify-tui*
[Spotify-tui](https://github.com/Rigellute/spotify-tui) is a console client for spotify, however it needs spotify or spotifyd installed as it's just a wrapper for the web API which does not handle streaming.

## Cava
[Cava](https://github.com/karlstav/cava) is a terminal based visualizer for audio, is not accurate, it does not represent a proper sound spectrum. Is is only purpose is to look aesthetic when playing music.

##### * not in use, mostly research

##### ** needs detail