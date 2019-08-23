# Dotfiles
Dotfiles are usually the files used to configure user settings in applications, hence the name dotfiles. They referenced in the user home folder and some other locations making it difficult to version manage.

Version management can be important for various reasons, from synchronization across various hosts to fast machine installation. 

Some of the options used to manage the dotfiles range from using git on the user home folder to using dedicated tool to copy or symlink the files.

The arch documentation has a pretty detailed article about [dotfiles](https://wiki.archlinux.org/index.php/Dotfiles)

## Stow
[Stow](https://www.gnu.org/software/stow/) is a symlink farm manager, that allow you to concentrate data and configurations under one folder, giving the appearance that they are all installed under one place, but then creating as many symlinks as necessary to their correct place.

This make it extra easy to make a repository out of it.

[More info](http://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html)

### Important
This by default works from $HOME, so your dotfiles should be there!
