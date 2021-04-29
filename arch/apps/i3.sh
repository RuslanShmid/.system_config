#!/bin/sh

sudo pacman -S i3                  --noconfirm
sudo pacman -S dmenu               --noconfirm
sudo pacman -S xorg-xsetroot       --noconfirm # for changing desktop backgroud

rm ~/.config/i3/config

mkdir -p ~/.config/i3/

ln -s ~/.system_config/shared/dotfiles/.config/i3/config ~/.config/i3/config

