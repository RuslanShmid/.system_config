#!/bin/sh

sudo apt-get update
sudo apt-get install -y mc htop unity-tweak-tool indicator-cpufreq indicator-multiload
export $(dbus-launch)

ln -s ~/.private_config/shared/dotfiles/.inputrc ~/inputrc # vim bindings in rails c
