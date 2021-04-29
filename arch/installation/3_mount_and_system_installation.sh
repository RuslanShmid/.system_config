#!/bin/bash

mount /dev/sda2 /mnt                          # mount mnt to dev/sda1
mkdir /mnt/home
mount /dev/sda3 /mnt/home
lsblk                                         # check if mounted
# pacstrap -i /mnt base base-devel --noconfirm  # instalation base and base devel to mnt
pacstrap /mnt base base-devel linux linux-firmware dhcpcd
genfstab -U -p /mnt >> /mnt/etc/fstab         # generate fstab file

