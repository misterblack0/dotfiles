#!/bin/bash
# Marius's Development Machine Setup on Linux
# Author : Marius

sudo apt update
sudo apt upgrade -y

#dependencies.list
sudo apt install curl build-essential software-properties-common wget

#Install programs from repo
sudo apt install git gimp npm virtualbox telegram-desktop nodejs ffmpeg ssh symlinks -y

sudo apt install apt-transport-https
sudo apt-get install git

# Visual Studio Code
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt-get update
sudo apt-get install code

# Brave Browser
curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt-get update
sudo apt-get install brave-browser
