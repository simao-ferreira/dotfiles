```
 _____      __      ___    ___ ___      __      ___    
/\ '__`\  /'__`\   /'___\/' __` __`\  /'__`\  /' _ `\  
\ \ \L\ \/\ \L\.\_/\ \__//\ \/\ \/\ \/\ \L\.\_/\ \/\ \ 
 \ \ ,__/\ \__/.\_\ \____\ \_\ \_\ \_\ \__/.\_\ \_\ \_\
  \ \ \/  \/__/\/_/\/____/\/_/\/_/\/_/\/__/\/_/\/_/\/_/
   \ \_\                                               
    \/_/          
```
# PACMAN

Pacman is the package manager for Arch based systems. [Pacman](https://wiki.archlinux.org/index.php/pacman) allows the installation of binary repository packages, adding the capability to edit or replace the building scripts.
When installing a package `pacman` also installs the dependencies in the same instruction.

There several tools on `pacman` to make it even easier to use, like `pactree` that allows to verify the tree of dependencies of a package.

Adding to `pacman` there is also support for `AUR`, packages provided by the community.

For linux users coming from other distributions there [pacman rosetta](https://wiki.archlinux.org/index.php/Pacman/Rosetta), a very useful page containing detailed instructions to use `pacman` on the command line.

### Basic commands
Install a package: `sudo pacman -S <package>`.
Uninstall a single package: `sudo pacman -R <package>`
Uninstall a package and it's dependencies not needed by any other installed package: `sudo pacman -Rs <package>`

Flags: `--needed` only installs if the package is not installed or updated, `--noconfirm` does not need password, useful for scripts.

Synchronize package database `sudo pacman -Syy`
Synchronize package database and full system upgrade `sudo pacman -Syu`

## Pamac
There are options as a GUI wrapper for `pacman`, one of those is `pamac`, very simple and basic, functionalities include update packages, installed packages, explicitly installed packages, repos, etc...

Is possible to add `AUR` through the options of `pamac`.

## AUR
[AUR](https://wiki.archlinux.org/index.php/Arch_User_Repository), or Arch user repository is a community management tool for repositories. Some of the official repositories start as AUR repos, but it allows Arch to provide more extensive number os repositories. 
The downside is the content is user produced, that carries some risks.

To install through command line it's possible to use `yay`. [yay](https://github.com/Jguer/yay) is a helper for `pacman` and `AUR`.

[cleaning-tidying](https://wiki.archlinux.org/index.php/Pacman/Tips_and_tricks#Removing_unused_packages_(orphans))
