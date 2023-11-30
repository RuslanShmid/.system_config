#!/bin/bash

# install fisher
# curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
yay -S fisher --noconfirm

fisher install FabioAntunes/fish-nvm # install fish nvm.
fisher install jethrokuan/fzf        # install history search plugin
fisher install jhillyerd/plugin-git  # git plugins
# fisher install acomagu/fish-async-prompt
# fisher install jorgebucaran/spark.fish

# install omf
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
omf install default
omf theme default

# docs
# https://github.com/jorgebucaran/cookbook.fish#how-do-i-create-a-function-in-fish
# https://github.com/jorgebucaran/awsm.fish
# https://github.com/jorgebucaran/getopts.fish
# https://github.com/jorgebucaran/fishtape
