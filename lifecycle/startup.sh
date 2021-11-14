#!/bin/bash 

#Create yopu utility folders

mkdir -p workspace
mkdir -p downloads
mkdir -p trash
mkdir -p notes

#Update Linux
sudo apt-get update -y
# Add Gcc,make and other essential utility programs
sudo apt install build-essential -y
