# Manjaro How-To

Manjaro is an open-source linux distro based on Arch rolling distro, contrary to Ubuntu based distros, more probable to break due to updates, it has several mechanisms to minimize this caveat, like delayed kernel updates and support to simultaneous kernels installed. Arch and Manjaro are very well documented and maintained.

## Installation
To install Manjaro download it from [Manjaro](https://manjaro.org/download/) page, during this process open the [user-guide](http://rwthaachen.dl.osdn.jp/storage/g/m/ma/manjaro/Manjaro-User-Guide.pdf).

### TLDR
To create a live USB on the terminal use `sudo fdisk -l` to get the USB drive name, usually something like *sdb*, replace [downloaded-version] and [device] and use `sudo dd if=manjaro-[downloaded-version].iso of=/dev/[device] bs=4M`.

Manjaro has two installers, `architect`, a terminal based installer to more experienced users and a GUI `calamares` based installer, intuitive and easy to use.
From setup is possible to install non-free graphic drivers, like Nvidia, diminishing troubles when setting up the inicial environment.

Manjaro supported desktop environments are:

`XFCE`, `KDE`and `GNOME`.

Community supported versions are also available like:
`Budgie`, `Mate`, `i3` or `Open Box`.

There are several others, but these are the most common ones.

## Basics
Manjaro package manager is [pacman](PACMAN.md#pacman) instead of `apt-get`. [Pacman](https://wiki.manjaro.org/index.php?title=Pacman_Overview) is mantained from carefully managed repositories, it also has two GUI options to wrap pacman, `octopi` and [pamac](PACMAN.md#pamac) which is the i3 default GUI.

Manjaro also allows Arch user based packages, though `AUR`, that can be enable on settings, these are managed by the community and contain the dependencies, age and repository on the details.

Typically neither the Manjaro or Arch community are very n00b user friendly, mostly the user is expected to have a fairly basic knowledge of linux and to be able to research on their documentation and wiki, which is very comprehensive and extensively detailed, plus the forum.
The community is not however exclusive or unfriendly, but some knowledge and research are expected before asking on the forums.

