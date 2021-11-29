#!/bin/sh

sudo pacman -S neovim --noconfirm
sudo pip3 install --upgrade neovim

# Global clipboard
sudo pacman -S xclip --noconfirm

# Installing silver_search for rking/ag.vim (global search)
sudo pacman -S the_silver_searcher --noconfirm

mkdir -p ~/.config/nvim/
mkdir -p ~/.config/nvim/colors

yay -S neobundle-git --noconfirm
yay -S python-pynvim --noconfirm

ln -s ~/.system_config/shared/vendor/monokai-phoenix.vim ~/.config/nvim/colors # link theme
ln -s ~/.system_config/shared/dotfiles/init.vim ~/.config/nvim/                # link config

nvim +NeoBundleInstall +qall
nvim +UpdateRemotePlugins

# cd ~/.vim/bundle/youcompleteme/
# git submodule update --init --recursive
# python3 install.py --all

# curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
#     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
#
# nvim +PlugInstall +qall #install plugins
# nvim +UpdateRemotePlugins +qall

