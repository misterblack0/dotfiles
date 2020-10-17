#!/bin/bash
# Marius's Development Machine Setup on Linux Mint
# Author : Marius

sudo apt-get update
sudo apt install software-properties-common apt-transport-https curl
sudo apt-get install build-essential git

# Neovim
sudo apt-get install neovim

# Nodejs & npm
sudo apt install nodejs
sudo apt install npm

# Visual Studio Code
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt update
sudo apt install code

# Brave Browser
curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install brave-browser