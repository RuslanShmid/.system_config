#!/bin/sh

sudo pacman -S dunst                    --noconfirm # notification manager

rm ~/.config/dunst/dunstrc
mkdir -p ~/.config/dunst
ln -s ~/.system_config/shared/dotfiles/.config/dunst/dunstrc ~/.config/dunst/dunstrc

