# Mind Palace
Automated Developer Machine Setup
Over the time we crowd our machine with loads of vscode plugins and sometimes they overalap each other, this way we make sure we use/expand consistent tooling accross the team

[Diagram](./diagram.png) <img src="./diagram.png" width="900">

Install git and clone this repo(https://github.com/pranaySinghDev/mind-palace)

## Repo structure
- Readme.md
- hosts/Mac/install.sh
- Hosts/windows/install.cmd
- backends/Golang /vangrantfile
- backends/nodejs/vangrantfile
- Frontends/Vue/vangrantfile

## Setup
There are three ways to configure your project:
1.config.yaml : base config to get you started (Will be commited to git)
2.config_local.yaml : your custom config which will be merged with base config (Upto you if you want to commit)
3.env : Not to be committed (Sensetive tokens like github developer token will be stored here)

### Connect to vagrant via host vscode
https://medium.com/@lizrice/ssh-to-vagrant-from-vscode-5b2c5996bc0e#:~:text=Connect%20VScode%20to%20the%20machine,view%20and%20edit%20inside%20VScode.



## Features
* Yaml configurable vagrant provisioning with .env support 
* Host environment setup
    - [X] Brew
    - [X] Vscode and its extensions
    - [X] Brave
    - [X] Virtual box
    - [X] Vagrant 
    - [X] Vagrant boxes
    - [X] Postman
    - [X] Spotify


* Guest development environment setup
    - [X] Install ubuntu
    - [X] Install Golang
    - [X] Install git and setup git access
    - [X] Clone the repos
    - [X] Install docker
    - [X] Install advance shell with themes
    - [ ] Install proto dependencies
    - [ ] Install godotenv
    - [ ] Install drive and sync personal folder
    - [ ] Setup startup apps 
    - [ ] Adding GCP creds and cli
    - [ ] Adding AWS creds and cli 
    - [ ] Add backup before vagrant destroy trigger 
    - [ ] Share your environment via ssh
