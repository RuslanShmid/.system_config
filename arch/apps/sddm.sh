#!/bin/sh

sudo pacman -S sddm                            --noconfirm
sudo systemctl enable sddm.service
