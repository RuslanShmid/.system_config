#!/bin/sh

sudo pacman -S alacritty --noconfirm

rm ~/.config/alacritty/alacritty.yml
mkdir -p ~/.config/alacritty
ln -s ~/.system_config/shared/dotfiles/.config/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml

