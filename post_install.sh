#!/bin/bash

# Installation of many packages in a fresh Mint

###################################
# Add repositories
###################################
echo
echo "Installing repositories..."
echo
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo add-apt-repository ppa:otto-kesselgulasch/gimp
sudo add-apt-repository ppa:deadsnakes/ppa

###################################
# Update and Upgrade
###################################
echo
echo "Updating and upgrading..."
echo
sudo apt-get update && sudo apt-get upgrade -y

###################################
# Remove programs not used
###################################
echo
echo "Removing programs not used..."
echo
sudo apt-get remove hexchat hexchat-common thunderbird -y

###################################
# Installations
###################################
echo
echo "Installing programs..."
echo

## system
### important
sudo apt-get install htop ncdu tasksel gparted p7zip-full p7zip-rar curl wget software-properties-common apt-transport-https -y
### desktop
sudo apt-get install gimp virtualbox -y
### pdf tools
### tools
### torrent and direct download
## developing
sudo apt-get install python -y
### compilers and IDEs
sudo apt-get install build-essential code -y
### libraries
### python
### repositories
sudo apt-get install git ssh openssh-server filezilla filezilla-common -y
### tools
### web tools
sudo apt-get install npm -y

###################################
# Cleaning
###################################
echo
echo "Cleaning..."
sudo apt-get autoclean

###################################
# Finish!
###################################
echo
echo "Finish! All done!"
echo
