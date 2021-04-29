#!/bin/sh

sudo pacman -S git  --noconfirm

# Set git aliases
~/.system_config/shared/git

# gitiglore_global
rm ~/.gitconfig
ln -s ~/.system_config/shared/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/.system_config/shared/dotfiles/.gitignore_global ~/.gitignore_global

sudo pacman -S meld --noconfirm
git config --global merge.tool meld
