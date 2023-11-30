#!/bin/sh

# install lts kernel
uname -r
#sudo pacman -S linux-lts --noconfirm
#sudo grub-mkconfig -o /boot/grub/grub.cfg
#sudo pacman -S linux-lts-headers --noconfirm
sudo pacman -S intel-ucode --noconfirm                               # install microcode for intel prossesors
sudo grub-mkconfig -o /boot/grub/grub.cfg
sudo sh -c "cat helpers/disable_grub_delay_command >> /etc/default/grub"
sudo sh -c "echo 'blacklist pcspkr' > /etc/modprobe.d/nobeep.conf"   # disable pcspkr
sudo cp helpers/31_hold_shift /etc/grub.d/
sudo chmod a+x /etc/grub.d/31_hold_shift
sudo grub-mkconfig -o /boot/grub/grub.cfg
# sudo pacman -S adobe-source-sans-pro-fonts aspell-en enchant gst-libav gst-plugins-good hunspell-en icedtea-web jre8-openjdk languagetool libmythes mythes-en pkgstats ttf-anonymous-pro ttf-bitstream-vera ttf-dejavu ttf-droid ttf-gentium ttf-liberation ttf-ubuntu-font-family --noconfirm             && install additional packages
sudo pacman -S ufw --noconfirm                                                   # install firefall
sudo ufw enable
sudo ufw status verbose
sudo systemctl enable ufw.service
# sudo pacman-optimize

# turn on fish C-r search
# fish_user_key_bindings
