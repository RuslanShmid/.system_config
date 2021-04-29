#!/bin/sh

swapon --show
free -h
sudo fallocate -l 8192Mb /swapfile
cd /
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
swapon --show
cd ~/.system_config/arch/apps/
sudo sh -c "cat helpers/load_swapfile_on_system_startup >> /etc/fstab"

### If you want to change side of the swap
# sudo swapoff -a
# sudo rm -f /swapfile
# sudo fallocate -l 8192Mb /swapfile
# sudo chmod 600 /swapfile
# sudo mkswap /swapfile
# sudo swapon /swapfile
