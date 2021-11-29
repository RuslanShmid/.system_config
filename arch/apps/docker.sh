#!/bin/sh

yay -S docker             --noconfirm
yay -S docker-compose     --noconfirm
yay -S docker-machine     --noconfirm

sudo systemctl enable docker.service
sudo systemctl start docker.service
# sudo systemctl stop docker.service

sudo groupadd docker
sudo usermod -aG docker $USER # Add user to docker group. Reboot after, if does not work.

