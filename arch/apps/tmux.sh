#!/bin/sh

sudo pacman -S tmux --noconfirm

rm ~/.tmux.conf
ln -s ~/.system_config/shared/dotfiles/.tmux.conf ~/.tmux.conf

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm #install tpm

sudo ln -sf ~/.system_config/shared/dev_scripts/init_rails_session /usr/bin/
sudo ln -sf ~/.system_config/shared/dev_scripts/init_react_session /usr/bin/

