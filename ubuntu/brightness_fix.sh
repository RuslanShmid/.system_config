#!/bin/sh

sudo touch /usr/share/X11/xorg.conf.d/20-intel.conf

sudo echo "Section \"Device\"" >> /usr/share/X11/xorg.conf.d/20-intel.conf
sudo echo "       Identifier  \"card0\"">> /usr/share/X11/xorg.conf.d/20-intel.conf
sudo echo "       Driver      \"intel\"">> /usr/share/X11/xorg.conf.d/20-intel.conf
sudo echo "       Option      \"Backlight\"  \"intel_backlight\"">> /usr/share/X11/xorg.conf.d/20-intel.conf
sudo echo "       BusID       \"PCI:0:2:0\"" >> /usr/share/X11/xorg.conf.d/20-intel.conf
sudo echo "EndSection" >> /usr/share/X11/xorg.conf.d/20-intel.conf
