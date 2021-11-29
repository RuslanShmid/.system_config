#!/bin/sh

# Before start this script you have to got to /etc/pacman.conf
# and uncomment

# [multilib]
# Include = /etc/pacman.d/mirrorlist

yay -S wine        --noconfirm # able to execute exe files
yay -S wine-mono   --noconfirm # able to run .NET
yay -S wine_gecko  --noconfirm # able to run html



# yay -Rs wine-mono   --noconfirm # able to run .NET
# yay -Rs wine_gecko  --noconfirm # able to run html
# yay -Rs wine        --noconfirm # able to execute exe files
