# Music player

## Tizonia
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

## Cava
[Cava](https://github.com/karlstav/cava) is a terminal based visualizer for audio, is not accurate, it does not represent a proper sound spectrum. Is is only purpose is to look aesthetic when playing music.
