# List Apps to install here

# ESSENTIAL_APPS='htop nano inxi powertop powerline solaar tlp gparted screenfetch youtube-dl'
# DEVELOPER_APPS='android-tools-adb android-tools-fastboot git npm nodejs ctags gcc make'
# EXTRA_APPS='weechat gtkhash notify-os'

ESSENTIAL_APPS='htop nano tlp powerline build-essential gparted tasksel screenfetch curl wget software-properties-common apt-transport-https'
DEVELOPER_APPS='git npm nodejs vim virtualbox python make'
EXTRA_APPS='chromium brave-browser filezilla'

INSPACE=' '

# Combine all app vars
APPS_INSTALL=$ESSENTIAL_APPS$INSPACE$DEVELOPER_APPS
APPS_INSTALL=$APPS_INSTALL$INSPACE$EXTRA_APPS

echo "Current system..."
uname -a # Display system information
echo "This will install the following apps:"
echo $APPS_INSTALL | tr " " "\n"
echo "Also, a repo will be added for Chrome & VSCode."
echo -n "Press ENTER to continue or Ctrl-c to quit."
read
echo ""
echo ""

# Remove programs not used
echo "Removing programs not used..."

sudo apt-get remove hexchat hexchat-common thunderbird -y

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
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor >microsoft.gpg
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
    echo "" >>$HOME/.bashrc
    echo "# enable powerline for bash terminal" >>$HOME/.bashrc
    echo "if [ -f /usr/share/powerline/bindings/bash/powerline.sh ]; then" >>$HOME/.bashrc
    echo "   source /usr/share/powerline/bindings/bash/powerline.sh" >>$HOME/.bashrc
    echo "fi" >>$HOME/.bashrc
    echo "Updated .bashrc for powerline, restart terminal or enter bash command."
fi

echo ""
echo ""
