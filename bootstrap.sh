#!/bin/bash

PROJECT_DIR=~/projects/manjaro-sysprep
sudo systemctl start sshd
sudo systemctl enable sshd

# Upgrade packages
sudo pacman -Syu --noconfirm
# Install ansible stuff
sudo pacman -S --noconfirm ansible git yay ansible-lint yamllint vim

mkdir -p ~/projects

if [[ -d "${PROJECT_DIR}" ]] ; then
  cd ~/projects/manjaro-sysprep
  git pull
else
  git clone https://github.com/alxzoomer/manjaro-sysprep.git ~/projects/manjaro-sysprep
  cd ~/projects/manjaro-sysprep
fi

# git clone git@github.com:alxzoomer/manjaro-sysprep.git ~/projects/manjaro-sysprep

make init
