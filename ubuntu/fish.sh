#!/bin/sh


sudo apt-add-repository ppa:fish-shell/release-2

sudo apt-get update

sudo apt-get install -y fish curl #install tmux

chsh -s `which fish`

command curl -sSL https://rvm.io/mpapis.asc | sudo gpg --import -

echo "function fish_user_key_bindings" > ~/.config/fish/functions/fish_user_key_bindings.fish
echo " fish_vi_key_bindings" >> ~/.config/fish/functions/fish_user_key_bindings.fish
echo "end" >> ~/.config/fish/functions/fish_user_key_bindings.fish

ln -s ~/.private_config/shared/dotfiles/config.fish ~/.config/fish/config.fish # link config

# install ohf
curl -L https://get.oh-my.fish | fish

omf install cbjohnson # install theme

omf theme cbjohnson # set theme
