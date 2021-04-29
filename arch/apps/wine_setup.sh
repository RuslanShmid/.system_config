#!/bin/sh

# Before start this script you have to got to /etc/pacman.conf
# and uncomment

# [multilib]
# Include = /etc/pacman.d/mirrorlist

aurman -S wine        --noconfirm # able to execute exe files
aurman -S wine-mono   --noconfirm # able to run .NET
aurman -S wine_gecko  --noconfirm # able to run html



# aurman -Rs wine-mono   --noconfirm # able to run .NET
# aurman -Rs wine_gecko  --noconfirm # able to run html
# aurman -Rs wine        --noconfirm # able to execute exe files
