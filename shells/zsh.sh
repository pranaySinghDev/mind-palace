#!/bin/bash 

# Script to install Zsh and add exports
echo "[-] Installing oh my zsh [-]"
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc

echo "[-] Installing Powelevel 10k theme [-]"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
echo  '
unset ZSH_THEME
ZSH_THEME="powerlevel10k/powerlevel10k"' >> ~/.zshrc

echo "[-] Installing plugins [-]"
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
echo  '
unset plugins
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)' >> ~/.zshrc

echo "[-] Configure theme defaults [-]"
echo '[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh'  >> ~/.zshrc

echo "
export GOPATH=$HOME/go
export GOROOT=/usr/local/go
export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin
" >> .zshrc