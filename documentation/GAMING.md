# Gaming

Gaming on Linux is a different concept when compared to windows, most games are not ready to run in linux.
To run them are several options, the most effortless is steam.


[Steam](https://store.steampowered.com/) on Manjaro is ready available though `pamac`. But is not available directly through `pacman` on vanilla `Arch`.

## Multilib

[multilib](https://wiki.archlinux.org/index.php/Official_repositories#multilib) is a repository that contains 32-bit applications, that can be run on a 64-bit environment. Steam needs multilib enabled to be available on `pacman` on Arch.

To enable it un-comment `/etc/pacman.conf` following lines
```
[multilib]
Include = /etc/pacman.d/mirrorlist
```

After upgrade the system
```
# pacman -Syu

```

## Steam

Steam Play, available through `proton` uses an internal version of `wine` with some special tweaks provided by valve.
Enable `steam-beta` and `Steam Play` on steam settings.

## GOG

For GOG games, download the `.sh` file and run it `sh <game-name.sh>`

## Bumblebee

[Bumblebee](https://wiki.archlinux.org/index.php/Bumblebee) is an implementation for hybrid graphics that *auto-magically* detects the necessity to use Nvidia graphics. When necessary it's possible to define in steam which games run from start with nvidia,
Set up a variable in the environment `sudo sh -c 'echo OPTIMUS_PREFIX=\"primusrun\" >> /etc/environment'`. Logout and login the desktop sessions. Then in steam client select the game from the library page, right-click, and select properties.
Click the SET LAUNCH OPTIONS button and specify `$OPTIMUS_PREFIX %command%`for the command line.
A simpler option is just to set directly launcher options to  `primusrun %command%`.

Some games refuse to start with any of the above configurations.

Bumblebee drivers should kick in when necessary, if not, it's possible to run `primusrun <game-name>`, however this will start a different profile/config settings in `/usr/shared`.

## Nvidia

Install the nvidia necessary packages
```
# pacman -S nvidia nvidia-utils lib32-nvidia-utils
```

## Discord
Discord is a proprietary messaging/streaming application. Uses `Electron`.
```
# pacman -S discord
```

[ripcord](https://wiki.archlinux.org/index.php/Ripcord) is an alternative built on `qt`.