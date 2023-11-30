#!/bin/sh

### Fonts installation
# sudo pacman -S terminus-font     --noconfirm
# sudo pacman -S terminus-font-otb --noconfirm
# yay -S ttf-consolas-ligaturized --noconfirm
sudo pacman -S ttf-fira-mono --noconfirm
sudo pacman -S ttf-fira-code --noconfirm

### Install fonts in case of incorrect rendering japanese fonts
sudo pacman -S noto-fonts-cjk noto-fonts-emoji noto-fonts --noconfirm # some of those fonts is also needed for fish and other symbols
# yay -S ttf-freefont ttf-ms-fonts ttf-linux-libertine ttf-dejavu ttf-inconsolata ttf-ubuntu-font-family  --noconfirm

