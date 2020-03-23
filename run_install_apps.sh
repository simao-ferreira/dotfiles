#!/bin/env bash

# WIP

# Synchronize pacman database
sudo pacman -Syy

# Browser
echo "Updating browsers"
sudo pacman -S firefox thunderbird --needed --noconfirm

# Basic
echo "Update util and appearence packages"
sudo pacman -S git rofi feh neofetch ytop stow --needed --noconfirm

# Terminal
echo "Terminal updates"
sudo pacman -S zsh --needed --noconfirm

# Text editor
echo "Installing gedit"
sudo pacman -S gedit gedit-plugins aspell-en aspell-de aspell-pt --needed --noconfirm

# Text editor
echo "Installing code tools"
sudo pacman -S code intellij-idea-community-edition --needed --noconfirm

# Night light
echo "Installing night light"
sudo pacman -S redshift  caffeine-ng --needed --noconfirm

# Fonts
sudo pacman -S ttf-font-awesome adobe-source-code-pro-fonts --needed --noconfirm

# AUR
echo "AUR installations and updates"
if [ -x "$(command -v yay)" ]; then
    yay -S ttf-nerd-fonts-symbols nerd-fonts-complete --noconfirm
else
    echo "No AUR helper was found! Installation failed!"
    exit 1
fi

#.Xresources
#Test if file exists, if not uses touch to create it
if [ -e $HOME/.Xresources ]
then
	echo ".Xresources exists already."
else
	touch $HOME/.Xresources
fi
