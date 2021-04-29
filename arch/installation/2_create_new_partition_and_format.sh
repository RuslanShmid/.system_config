#!/bin/sh

sed -e 's/\s*\([\+0-9a-zA-Z]*\).*/\1/' << EOF | fdisk /dev/sda
  n
  p



  a
  w
EOF

mkfs.ext4 /dev/sda1

