#!/bin/env bash

# WIP

# Stow symlink for config files
echo "Updating i3 config files"
stow i3

echo "Updating home dotfiles"
stow homefiles zsh

echo "Updating compton, dunst, ranger, polybar, rofi, i3status"
stow compton dunst ranger polybar rofi i3status

echo "Updating gedit and redshift"
stow gedit redshift

echo "Updating fonts and wallpapers"
stow fonts wallpapers

# Useful for Gnome desktop
#echo "Updating gtk css bars"
#stow gtk

