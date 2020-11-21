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




Testing...


# List Apps to install here
ESSENTIAL_APPS='htop nano inxi powertop powerline solaar tlp gparted screenfetch youtube-dl'
DEVELOPER_APPS='android-tools-adb android-tools-fastboot git npm nodejs ctags gcc make'
PYTHON_APPS='python-pip pylint python-appindicator python-dbus python-dev python-gconf' 
PYTHON2_APPS='python-keybinder python-notify python-vte python-xdg'
PYTHON3_APPS='python3 python3-pip python3-dev'
EXTRA_APPS='weechat gtkhash notify-os'
INSPACE=' '

# Combine all app vars
APPS_INSTALL=$ESSENTIAL_APPS$INSPACE$DEVELOPER_APPS
APPS_INSTALL=$APPS_INSTALL$INSPACE$PYTHON_APPS
APPS_INSTALL=$APPS_INSTALL$INSPACE$PYTHON2_APPS
APPS_INSTALL=$APPS_INSTALL$INSPACE$PYTHON3_APPS
APPS_INSTALL=$APPS_INSTALL$INSPACE$EXTRA_APPS

echo "Current system..."
uname -a    # Display system information
echo "This will install the following apps:"
echo $APPS_INSTALL | tr " " "\n"
echo "Also, a repo will be added for Chrome & VSCode."
echo -n "Press ENTER to continue or Ctrl-c to quit."
read
echo ""
echo ""

# Update system
sudo apt update
sudo apt upgrade -y

echo "Install the apps..."

# Install Apps
sudo apt install $APPS_INSTALL -y

# Get Signing Key for Google Chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 

# Add Google Chrome Repo to sources.list.d
sudo sh -c "echo "deb https://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list"

# Update System and Install Google Chrome
sudo apt-get update
sudo apt-get install google-chrome-stable

# Get gpg keys for VSCode 
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EB3E94ADBE1229CF

# Add Microsoft VSCode Repo to sources.list.d
sudo sh -c "echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list"

# Update System and Install VSCode
sudo apt-get update
sudo apt-get install code

echo "If .bashrc missing powerline then update."
# Test for powerline in .bashrc
if [ $(grep -Fc "powerline" $HOME/.bashrc) -gt 0 ]; then
    echo ".bashrc has powerline config statement"
    echo "Here is the powerline part of .bashrc:"
    echo ""
    grep -F "powerline" $HOME/.bashrc

else
    echo "" >> $HOME/.bashrc
    echo "# enable powerline for bash terminal" >> $HOME/.bashrc
    echo "if [ -f /usr/share/powerline/bindings/bash/powerline.sh ]; then" >> $HOME/.bashrc
    echo "   source /usr/share/powerline/bindings/bash/powerline.sh" >> $HOME/.bashrc
    echo "fi" >> $HOME/.bashrc
    echo "Updated .bashrc for powerline, restart terminal or enter bash command."
fi

echo ""
echo ""