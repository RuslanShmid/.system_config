#!/bin/sh

dconf write /org/gnome/desktop/input-sources/xkb-options "['grp:alt_shift_toggle', 'grp_led:scroll', 'caps:escape']"
# setxkbmap -option caps:escape
# xset r rate 190 65

gsettings set org.gnome.settings-daemon.peripherals.keyboard repeat-interval 60
gsettings set org.gnome.settings-daemon.peripherals.keyboard delay 190
