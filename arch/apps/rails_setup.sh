#!/bin/sh

curl -sSL https://get.rvm.io | bash
sudo pacman -S postgresql-libs --noconfirm

rm ~/.gemrc
ln -s ~/.system_config/shared/dotfiles/.gemrc ~/.gemrc
curl -L --create-dirs -o ~/.config/fish/functions/rvm.fish https://raw.github.com/lunks/fish-nuggets/master/functions/rvm.fish

