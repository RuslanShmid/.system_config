#!/bin/sh

# Setup Network Service
yay -S network-manager-applet   --noconfirm # (and run nm-applet)
sudo systemctl start NetworkManager
sudo systemctl enable NetworkManager

# Setup timezone
# timedatectl set-timezone Europe/Kiev

