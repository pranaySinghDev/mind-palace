#!/bin/bash 

# Notes
# While installing virtual box you have to manually allow security permissions when asked for

# Install brew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
echo 'export PATH="/usr/local/bin:$PATH"' >> ~/.bash_profile

## Make changes according to the apps you need
declare -a apps=("visual-studio-code" "slack" "brave-browser" "virtualbox" "vagrant" "vagrant-manager" "postman" "spotify" "fish")

## Install the above apps
for i in "${apps[@]}"
do
   echo "$i"
   # Prints the current version and installs only if its not installed already
   brew ls --versions --cask $i || brew install --cask $i
done

# Add VScode extensions
declare -a codeext=("shd101wyy.markdown-preview-enhanced" "golang.go" "ms-vscode-remote.remote-ssh" "zxh404.vscode-proto3" "coenraads.bracket-pair-colorizer" "pomdtr.excalidraw-editor" "ms-vscode-remote.remote-ssh")
## now loop through the above extensions
for i in "${codeext[@]}"
do
   # Installs the vscode plugins with latest version
    code --install-extension $i --force
done

mkdir /Users/pranay/workspace
# vagrant up
