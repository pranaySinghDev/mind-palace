#!/bin/bash 

#install nerdctl
wget https://github.com/containerd/nerdctl/releases/download/v0.12.1/nerdctl-full-0.12.1-linux-amd64.tar.gz
sudo tar Cxzvvf /usr/local nerdctl-full-0.12.1-linux-amd64.tar.gz
rm erdctl-full-0.12.1-linux-amd64.tar.gz
sudo apt-get install -y uidmap
containerd-rootless-setuptool.sh install
nerdctl run -d --name nginx -p 8080:80 nginx:alpine
