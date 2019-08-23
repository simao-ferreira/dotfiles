#!/bin/env bash

# WIP

# Synchronize pacman database
sudo pacman -Syy

# Browser
echo "Updating browsers"
sudo pacman -S firefox chromium --needed --noconfirm

# Basic
echo "Update util and appearence packages"
sudo pacman -S git rofi feh neofetch gotop-git stow --needed --noconfirm

# Terminal
echo "Terminal updates"
sudo pacman -S zsh --needed --noconfirm

# Text editor
echo "Installing gedit"
sudo pacman -S gedit gedit-plugins aspell-en aspell-de aspell-pt --needed --noconfirm

# Night light
echo "Installing night light"
sudo pacman -S redshift geoclue2  caffeine-ng --needed --noconfirm

# Fonts
sudo pacman -S ttf-font-awesome adobe-source-code-pro-fonts --needed --noconfirm

# AUR
echo "AUR installations and updates"
if [ -x "$(command -v yay)" ]; then
    yay -S ttf-nerd-fonts-symbols nerd-fonts-complete --noconfirm
elif [ -x "$(command -v trizen)" ]; then
    trizen -S ttf-nerd-fonts-symbols nerd-fonts-complete
elif [ -x "$(command -v pikaur)" ]; then
    pikaur -S ttf-nerd-fonts-symbols nerd-fonts-complete
elif [ -x "$(command -v pakku)" ]; then
    pakku -S ttf-nerd-fonts-symbols nerd-fonts-complete
elif [ -x "$(command -v pacaur)" ]; then
    pacaur -S ttf-nerd-fonts-symbols nerd-fonts-complete
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
