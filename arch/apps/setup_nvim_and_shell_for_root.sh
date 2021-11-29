#!/bin/sh

rm /root/.config/fish/config.fish
rm /root/.config/fish/fishd.arch

mkdir -p /root/.config/fish

ln -s ~/.system_config/shared/dotfiles/.config/fish/config.fish /root/.config/fish/config.fish
ln -s ~/.system_config/shared/dotfiles/.config/fish/fishd.arch ~/.config/fish/fishd.arch
# $ ln -s ~/.system_config/shared/dotfiles/.config/fish/functions/fzf_key_bindings.fish ~/.config/fish/functions/fzf_key_bindings.fish
# $ ln -s ~/.system_config/shared/dotfiles/.config/fish/functions/fish_user_key_bindings.fish ~/.config/fish/functions/fish_user_key_bindings.fish

chsh -s $(which fish)
