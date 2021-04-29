#!/bin/sh

### Fonts installation
sudo pacman -S terminus-font --noconfirm
sudo pacman -S terminus-font-otb --noconfirm

### Install fonts in case of incorrect rendering japanese fonts
sudo pacman -S noto-fonts-cjk noto-fonts-emoji noto-fonts                                                  --noconfirm
aurman -S ttf-freefont ttf-ms-fonts ttf-linux-libertine ttf-dejavu ttf-inconsolata ttf-ubuntu-font-family  --noconfirm


