# Manjaro How-To

Manjaro is an open-source linux distro based on Arch rolling distro, contrary to Ubuntu based distros is more probable to break due to updates, it has several mechanisms to minimize this caveat, like delayed kernel updates and support to simultaneous kernels installed. 

Arch and Manjaro are very well documented and maintained.

## Installation
To install Manjaro download it from [Manjaro](https://manjaro.org/download/) page and follow the [user-guide](http://rwthaachen.dl.osdn.jp/storage/g/m/ma/manjaro/Manjaro-User-Guide.pdf).

### TLDR
To create a live USB on the terminal use `sudo fdisk -l` to get the USB drive name, usually something like *sdb*, replace [downloaded-version] and [device] and use `sudo dd if=manjaro-[downloaded-version].iso of=/dev/[device] bs=4M`.

Just make sure your flash is not formated as `exFat` or `ntfs`, sometimes is not recognized. 

Manjaro has two installers, `architect`, a terminal based installer to more experienced users and a GUI `calamares` based installer, intuitive and easy to use.
From setup is possible to install non-free graphic drivers, like Nvidia, diminishing troubles when setting up the inicial environment.

Manjaro supported desktop environments are:

`XFCE`, `KDE`and `GNOME`.

Community supported versions are also available like:
`Budgie`, `Mate`, `i3`, `bspwm`, `Open Box`.

There are several others, but these are the most common ones.

## Differences from other distros
The biggest difference from Manjaro/Arch is the way it updates, by being a rolling distro every installation can be in the latest version.

Manjaro has package manager, [pacman](PACMAN.md#pacman) instead of `apt-get`. 
[Pacman](https://wiki.manjaro.org/index.php?title=Pacman_Overview) maintains carefully their repositories, it also has GUI wrappers to pacman, the most known ones are `octopi` and [pamac](PACMAN.md#pamac) which is present in i3  by default.

Manjaro also allows Arch user based packages, by enabling `AUR` packages in the settings, these are managed by the community, it usually easy to verify the dependencies, age and repository on the details.

Typically neither the Manjaro or Arch community are very n00b user friendly, mostly the user is expected to have a fairly basic knowledge of linux and to be able to research on their documentation and wiki, which is very comprehensive and extensively detailed, plus the forum. The community is not however exclusive or unfriendly, but some knowledge and research are expected before asking on the forums.

