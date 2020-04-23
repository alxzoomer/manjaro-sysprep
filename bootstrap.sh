#!/bin/bash

sudo systemctl start sshd

sudo pacman -Sy --noconfirm
sudo pacman -Sy --noconfirm ansible git

mkdir -p ~/projects

git clone https://github.com/alxzoomer/manjaro-sysprep.git ~/projects/manjaro-sysprep

# git clone git@github.com:alxzoomer/manjaro-sysprep.git ~/projects/manjaro-sysprep
