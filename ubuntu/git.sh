#!/bin/sh

# install git
sudo add-apt-repository ppa:git-core/ppa -y # add repository
sudo apt-get update
sudo apt-get install git

# configure git
git config --global user.name 'Volodymyr Kaban'
git config --global user.email 'kaban.volodymyr@gmail.com'
git config --global core.editor vim

# configure aliases
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status
git config --global alias.unstage 'reset HEAD --'

# set global gitignore
git config --global core.excludesfile ~/.private_config/shared/dotfiles/.gitignore_global
