#!/bin/env bash

# WIP

# Stow symlink for config files
echo "Updating i3 config files"
stow i3

echo "Updating home dotfiles"
stow homefiles

echo "Updating compton, dunst, i3status, neofetch, ranger, redshift"
stow config

echo "Updating rofi and polybar"
stow polybar rofi

echo "Updating gedit and fonts"
stow local

echo "Updating wallpapers"
stow wallpapers

# Useful for Gnome desktop
#echo "Updating gtk css bars"
#stow gtk

