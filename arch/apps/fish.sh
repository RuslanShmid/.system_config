#!/bin/sh

sudo pacman -S fish --noconfirm
sudo pacman -S fzf  --noconfirm # for fish history search

rm ~/.config/fish/config.fish
rm ~/.config/fish/fishd.arch

mkdir -p ~/.config/fish
mkdir -p ~/.config/fish/functions

ln -s ~/.system_config/shared/dotfiles/.config/fish/config.fish                           ~/.config/fish/config.fish
ln -s ~/.system_config/shared/dotfiles/.config/fish/fishd.arch                            ~/.config/fish/fishd.arch
# ln -s ~/.system_config/shared/dotfiles/.config/fish/functions/fzf_key_bindings.fish       ~/.config/fish/functions/fzf_key_bindings.fish
# ln -s ~/.system_config/shared/dotfiles/.config/fish/functions/fish_user_key_bindings.fish ~/.config/fish/functions/fish_user_key_bindings.fish

chsh -s $(which fish)
