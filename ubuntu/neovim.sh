#!/bin/sh

sudo apt-get install software-properties-common -y # add-apt-repository dependencies
sudo apt-get install python3-pip -y
pip3 install --upgrade pip
pip3 install neovim  --user                                # deoplete dependency
pip3 install --upgrade neovim
sudo add-apt-repository ppa:neovim-ppa/stable -y   # add repository
sudo apt-get update                                # update list
sudo apt-get install neovim -y                     # install neovim
sudo apt-get install coderay -y                    # install coderay for syntax highlight in fzv preview

mkdir -p ~/.config/nvim/       # create config folders
mkdir -p ~/.config/nvim/colors # create themes folder

ln -s ~/.private_config/shared/vendor/monokai-phoenix.vim ~/.config/nvim/colors # link theme
ln -s ~/.private_config/shared/dotfiles/init.vim ~/.config/nvim/                # link config

sudo apt-get install curl # install curl
# install Plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

nvim +PlugInstall +qall #install plugins
