#!/bin/bash

# Rename default folder names

mv /home/$USER/Desktop/Downloads /home/$USER/Desktop/downloads
mv /home/$USER/Documents /home/$USER/documents
mv /home/$USER/Music /home/$USER/music
mv /home/$USER/Pictures /home/$USER/pictures
mv /home/$USER/Public /home/$USER/public
mv /home/$USER/Videos /home/$USER/videos
mv /home/$USER/Templates /home/$USER/templates

# Installation of many packages in a fresh Mint

###################################
# Add repositories
###################################
echo
echo "Installing repositories..."
echo
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo add-apt-repository ppa:ubuntuhandbook1/gimp
sudo add-apt-repository ppa:deadsnakes/ppa

curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
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
sudo apt-get install htop ncdu build-essential tasksel gparted p7zip-full p7zip-rar curl wget software-properties-common apt-transport-https gnupg -y
### desktop
sudo apt-get install gimp gimp-gmic vim virtualbox -y
### browser
sudo apt-get install chromium brave-browser -y
### tools
### torrent and direct download
## developing
sudo apt-get install python -y
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.0/install.sh | bash
### compilers and IDEs
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo apt-get install code -y
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
