#!/bin/sh

### bash to dash
sudo pacman -S dash                            --noconfirm # dash
sudo aurman -S dashbinsh                       --noconfirm # Relink /bin/sh to dash

sudo pacman -S pulseaudio pulseaudio-alsa      --noconfirm
sudo pacman -S xorg xorg-xinit                 --noconfirm

