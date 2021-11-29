#!/bin/sh

yay -S python-undervolt         --noconfirm # https://github.com/georgewhewell/undervolt
yay -S intel-undervolt          --noconfirm

# sudo undervolt --core -100 --cache -100 --gpu -75 --temp 85

# open /etc/intel-undervolt.conf set values and enable
# sudo systemctl enable intel-undervolt.service
# sudo systemctl start intel-undervolt.service

