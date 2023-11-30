#!/bin/sh

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
sudo pacman -S bower           --noconfirm
yay -S npm                  --noconfirm
yay -S yarn                 --noconfirm

