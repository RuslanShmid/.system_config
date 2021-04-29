#!/bin/sh

# pacman -Suy            --noconfirm     # update pacman databases
pacman -S python       --noconfirm
pacman -S reflector    --noconfirm
pacman -S neovim       --noconfirm
# reflector --verbose --latest 20 --protocol http --protocol https --sort rate --save /etc/pacman.d/mirrorlist  # set mirrorlist
reflector --verbose --latest 20 --protocol https --sort rate --save /etc/pacman.d/mirrorlist  # set mirrorlist

