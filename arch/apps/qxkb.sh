#!/bin/sh

aurman -S qxkb --noconfirm

rm ~/.config/qxkb.cfg

ln -s ~/.system_config/shared/dotfiles/.config/qxkb.cfg ~/.config/qxkb.cfg
