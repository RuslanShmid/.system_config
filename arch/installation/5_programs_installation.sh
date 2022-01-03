#!/bin/sh

### bash to dash
sudo pacman -S dash --noconfirm # dash
yay -S dashbinsh    --noconfirm # Relink /bin/sh to dash

# sudo pacman -S pulseaudio pulseaudio-alsa      --noconfirm
sudo pacman -S pipewire pipewire-alsa pipewire-pulse wireplumber --noconfirm
sudo pacman -S xorg xorg-xinit                                   --noconfirm

systemctl start --user pipewire-pulse.service

