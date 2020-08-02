# Programming

## Intellij IDEA
Is possible to install intellij IDEA from their site, the community version is available via pacman, the ultimate edition via AUR.
```
# pacman -S code intellij-idea-community-edition
```

If the IDEA becomes frozen or just have a blank screen, try set wmname to LG3D.

## Java
It is possible to have more then one jdk installed at the same time, tools like Intellij allows to choose in the settings which version to build and run with. But other tools make it necessary to change the system default.

To change it Arch provides a [script](https://wiki.archlinux.org/index.php/java), to set it
```
# archlinux-java status
# archlinux-java set <jre-version>
```

## Vscodium
[vscodium](https://vscodium.com/) is a clean, no telemetry version, of Microsoft open source vscode.
```
# yay -S vscodium-bin
```

It's one of the most powerful code editor to date, multi-platform, is built on top of `electron` but that does not stop it from being fast and capable.
Also has a large amount of extensions and support from MS and individuals.

To manage installed extensions export them
```
# code --list-extensions >> extensions-list.txt
```
And install them from file
```
# cat extensions-list.txt | xargs -n 1 code --install-extension
```

Alternatives:
* sublime
* atom
* notepad++

## Python

 * [Wiki](https://wiki.python.org/moin/BeginnersGuide/Download)

 * Pipenv: Sacred Marriage of Pipfile, Pip, & Virtualenv.
 
 * vscode vs pycharm


