# Dotfiles
Dotfiles are usually the files used to configure user settings in applications, hence the name dotfiles. They reside in the user home folder and some other locations making it difficult to version manage.

Version management can be important for various reasons, from synchronization across various hosts to fast machine installation. 

Some of the options used to manage the dotfiles range from using git on the user home folder to using dedicated tool to copy or symlink the files.

The arch documentation has a very detailed article about [dotfiles](https://wiki.archlinux.org/index.php/Dotfiles)

## Stow
[Stow](https://www.gnu.org/software/stow/) is a symlink farm manager, that allow you to concentrate data and configurations under one folder, giving the appearance that they are all installed under one place, but then creating as many symlinks as necessary to their correct place.

This make it extra easy to make a repository out of it.

Here more [info](http://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html) can be found, containing an old but very good description about how to work with it.

###TL,DR
Install stow, 

* Create a <dotfile> directory on $HOME
* Create a folder with the name of the package to config
* Create a directory structure identical to the default used by the package to config in the previous folder.
* Move config file to there
* Run stow <folder name>

Something like:
```
dotfiles
├── rofi
│   └── .config
│       └── rofi
│           └── config
```
Run:
```
mkdir ~/dotfiles
mkdir -p ~/dotfiles/rofi/.config/rofi/conf
mv ~/.config/rofi/conf ~/dotfiles/rofi/.config/rofi
cd dotfiles
stow rofi
```

### Important
This by default works from $HOME, so your dotfiles should be there!
