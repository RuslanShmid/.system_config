#!/bin/sh

sudo pacman -S openssh --noconfirm

sudo systemctl enable sshd
sudo systemctl start sshd

