#!/bin/sh

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
sudo pacman -S bower           --noconfirm
yay -S npm                  --noconfirm
yay -S yarn                 --noconfirm

