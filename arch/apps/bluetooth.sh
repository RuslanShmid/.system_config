#!/bin/sh

sudo pacman -S bluez              --noconfirm
sudo pacman -S bluez-utils        --noconfirm
sudo systemctl enable bluetooth.service
sudo systemctl start bluetooth.service
sudo pacman -S blueman            --noconfirm

# start the bluetooth manager
# blueman-applet &
