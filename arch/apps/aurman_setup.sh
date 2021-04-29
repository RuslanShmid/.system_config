#!/bin/sh

git clone https://aur.archlinux.org/aurman.git
cd aurman
gpg --recv-keys 465022E743D71E39
makepkg -si

