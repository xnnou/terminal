#!/bin/bash
sudo apt update -y && sudo apt upgrade -y && sudo apt autoclean && sudo apt autoremove
sudo apt install -y tmux fish htop vim net-tools

LANGUAGE=en_US.UTF-8
LC_ALL=en_US.UTF-8
LANG=en_US.UTF-8
LC_CTYPE=en_US.UTF-8

export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
locale-gen en_US.UTF-8

sudo timedatectl set-timezone UTC
sudo timedatectl set-timezone Asia/Phnom_Penh
