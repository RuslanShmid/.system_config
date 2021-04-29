#!/bin/sh

# ls -sf /usr/share/zoneinfo/Europe/Kiev /etc/localtime  # set localtie
# cp /usr/share/zoneinfo/Europe/Kiev /etc/localtime  # set the time zone. BIOS time should be in UTC
ln -sf /usr/share/zoneinfo/Europe/Kiev /etc/localtime  # set the time zone. BIOS time should be in UTC
hwclock --systohc --utc                                #
echo arch > /etc/hostname                              # set computer name
systemctl enable dhcpcd                                # enable network service
# systemctl start  dhcpcd
pacman -S grub --noconfirm                             # grub instalation
grub-install #/dev/sda                                  # install grub to partision
grub-mkconfig -o /boot/grub/grub.cfg                   # config grub
pacman -S neovim --noconfirm                           # install neovim to edit files
# mkinitcpio -P
mkinitcpio -p linux

# /etc/hosts
# 127.0.0.1	localhost
# ::1		localhost
