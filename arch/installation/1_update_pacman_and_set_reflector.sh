#!/bin/sh

# pacman -Suy            --noconfirm     # update pacman databases
sudo pacman -S python       --noconfirm
sudo pacman -S reflector    --noconfirm
sudo pacman -S neovim       --noconfirm
# reflector --verbose --latest 20 --protocol http --protocol https --sort rate --save /etc/pacman.d/mirrorlist  # set mirrorlist
sudo reflector --verbose --latest 20 --protocol https --sort rate --save /etc/pacman.d/mirrorlist  # set mirrorlist

