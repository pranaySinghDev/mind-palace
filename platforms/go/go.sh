#!/bin/bash 
wget https://golang.org/dl/go1.17.3.linux-amd64.tar.gz
mkdir -p go/src go/bin go/pkg 

echo "
set -x GOPATH $HOME/go
set -x GOROOT /usr/local/go
set -x PATH $PATH:/usr/local/go/bin:$HOME/go/bin
# " >> ~/.config/fish/config.fish

# to download go packages and binaries without login shell
echo "
export GOPATH=$HOME/go
export GOROOT=/usr/local/go
export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin
# " >> ~/.bash_profile

sudo tar -C /usr/local -xzf go1.17.3.linux-amd64.tar.gz
rm go1.17.3.linux-amd64.tar.gz
