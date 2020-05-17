# Manjaro How-To

Manjaro is an open-source linux distro based on `Arch` a rolling distro always on the latest release, because of this and contrary to debain-based distros is more probable to suffer from updates.
Manjaro has some mechanisms to minimize this caveat, like delayed kernel updates and support to simultaneous kernels installed.

Arch and Manjaro are very well documented and maintained.

## Installation
To install Manjaro download it from [Manjaro](https://manjaro.org/download/) page and follow the [user-guide](http://rwthaachen.dl.osdn.jp/storage/g/m/ma/manjaro/Manjaro-User-Guide.pdf).

### TLDR
* [USB ISO Creation](USB-ISO.md)

Manjaro has two installers, `architect`, a terminal based installer to more experienced users and a GUI `calamares` based installer, intuitive and easy to use.
From setup is possible to install non-free graphic drivers, like Nvidia, diminishing troubles when setting up the initial environment.

## DE/WM
Manjaro supports it self or through the community several environments like:
`XFCE`, `KDE`, `GNOME`, `Awesome`, `Budgie`, `Mate`, `i3`, `bspwm`, `Open Box`.

## Differences from other distros
The biggest difference from Manjaro/Arch is the way it updates, by being a rolling distro every installation can be in the latest version.

Manjaro has package manager, [pacman](PACMAN.md#pacman) instead of `apt-get`. 
[Pacman](https://wiki.manjaro.org/index.php?title=Pacman_Overview) maintains carefully their repositories, it also has GUI wrappers and helpers to pacman, like Manjaro's [pamac](PACMAN.md#pamac) which is present in Mi3  by default.

Manjaro and Arch also allow user-based packages, by enabling `AUR` packages in the settings, these are managed by the community, it usually easy to verify the dependencies, age and repository on the details.

Typically neither the Manjaro or Arch community are very `n00b` user friendly, mostly the user is expected to have a fairly basic knowledge of linux and to be able to research on their documentation and wiki, which is very comprehensive and extensively detailed, plus the forum. The community is not however exclusive or unfriendly, but some knowledge and research are expected before asking on the forums.

## Basic settings
Manjaro has a terminal menu to manage settings, `bmenu` in the terminal. This will open a TUI with options, to install new kernels, it's important to install more than one just in case it's needed for recovery. `bmenu` manages other system settings like manage drivers, if gaming is an option and graphic is NVIDIA, installations of bumblebee drivers is recommended. This can be installed by default in the initial OS installation. Check which graphics are correct for the setup, if NVIDIA optimus then use non-free graphics.