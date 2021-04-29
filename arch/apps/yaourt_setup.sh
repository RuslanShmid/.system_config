#!/bin/sh

sudo pacman -S --needed base-devel git wget yajl --noconfirm
cd /tmp
git clone https://aur.archlinux.org/package-query.git
cd package-query/
makepkg -si --noconfirm && cd /tmp/
git clone https://aur.archlinux.org/yaourt.git
cd yaourt/
makepkg -si --noconfirm
cd ~/

