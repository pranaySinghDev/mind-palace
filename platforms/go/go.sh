#!/bin/bash 

curl -O https://storage.googleapis.com/golang/go1.8.3.linux-amd64.tar.gz
mkdir -p go/src go/bin go/pkg 
echo "
set -x GOPATH $HOME/go
set -x GOROOT /usr/local/go
set -x PATH $PATH:/usr/local/go/bin:$HOME/go/bin
# " >> ~/.config/fish/config.fish

sudo tar -C /usr/local -xzf go1.8.3.linux-amd64.tar.gz
rm go1.8.3.linux-amd64.tar.gz