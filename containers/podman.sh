#!/bin/bash 

# sudo apt-get -y update
# sudo apt-get -y install podman
# sudo apt install -y runc 
# sudo systemctl start podman
echo "[-] Installing basic utilities [-]"
sudo apt-get install curl wget gnupg2 -y
echo "[-] Sourcing release [-]"
source /etc/os-release
echo "[-] Downloading lib containers [-]"
sudo sh -c "echo 'deb http://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/xUbuntu_${VERSION_ID}/ /' > /etc/apt/sources.list.d/devel:kubic:libcontainers:stable.list"
echo "[-] Fetching release key [-]"
sudo wget -nv https://download.opensuse.org/repositories/devel:kubic:libcontainers:stable/xUbuntu_${VERSION_ID}/Release.key -O- | apt-key add -
echo "[-] Getting updates [-]"
sudo apt-get update -qq -y
echo "[-] Fixing container lib issues by manually installing (https://software.opensuse.org/download/package?package=catatonit&project=devel%3Akubic%3Alibcontainers%3Astable [-])"
echo 'deb http://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/xUbuntu_20.04/ /' | sudo tee /etc/apt/sources.list.d/devel:kubic:libcontainers:stable.list
curl -fsSL https://download.opensuse.org/repositories/devel:kubic:libcontainers:stable/xUbuntu_20.04/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/devel_kubic_libcontainers_stable.gpg > /dev/null
sudo apt update
sudo apt install catatonit
echo "[-] Installing podman [-]"
sudo apt-get -qq --yes install podman
echo "[-] Installing docker-compose [-]"
sudo curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose


