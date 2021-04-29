#!/bin/sh

gsettings set org.gnome.desktop.background picture-uri file:///home/finwe/.private_config/shared/vendor/wallpaper.png

sudo sh -c "echo 'deb http://download.opensuse.org/repositories/home:/Horst3180/xUbuntu_16.04/ /' > /etc/apt/sources.list.d/home:Horst3180.list"

sudo apt-get update
sudo apt-get install arc-theme
