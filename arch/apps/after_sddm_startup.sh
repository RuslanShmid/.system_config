#!/bin/bash

# install fisher
# curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
aurman -S fisher --noconfirm

fisher add FabioAntunes/fish-nvm # install fish nvm.
fisher add jethrokuan/fzf        # install history search plugin

# install omf
curl -L https://get.oh-my.fish | fish
omf install default
omf theme default
