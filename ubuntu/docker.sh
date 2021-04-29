#!/bin/sh

sudo apt-get update

sudo apt-get install \
   apt-transport-https \
   ca-certificates \
   curl \
   software-properties-common

sudo apt-get remove docker docker-engine docker.io curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key -

sudo apt-key fingerprint 0EBFCD88

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   xenial \
   stable"

sudo apt-get update

sudo apt-get install docker-ce docker-compose

# use without sudo

sudo groupadd docker

sudo usermod -aG docker $USER

sudo systemctl enable docker
