#!/bin/bash 

sudo apt-get -y install fish
sudo chsh -s /usr/bin/fish vagrant
mkdir -p ~/.config/fish
touch ~/.config/fish/config.fish
# apt install -y runc && systemctl start podman