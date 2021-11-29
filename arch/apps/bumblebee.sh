#!/bin/sh

yay -S bumblebee --noconfirm

sudo systemctl start bumblebeed.service
sudo systemctl enable bumblebeed.service
sudo gpasswd -a $USER bumblebee

sudo pacman -S xf86-video-intel --noconfirm
#################### Nvidia card
# sudo pacman -S nvidia-lts --noconfirm # for lts kernel
# sudo pacman -S nvidia-settings --noconfirm
####################
# env vblank_mode=0 optirun glxspheres64
# env vblank_mode=0 primusrun glxspheres64
# nvidia-smi -l 1 # nvidia stats

# optirun nvidia-settings -c :8

### Do now forger to reload afterwards

