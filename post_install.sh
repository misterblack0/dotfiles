#!/bin/bash

if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root"
    exit 1
else
    #Update and Upgrade
    echo "Updating and Upgrading"
    apt-get update && sudo apt-get upgrade -y

    sudo apt-get install dialog
    cmd=(dialog --separate-output --checklist "Select the name of the software you want to install :" 22 76 16)
    options=(1 "Build Dependencies" on # any option can be set to default to "on"
        2 "git" on
        3 "Node.js & Npm" on
        4 "Brave Browser" on
        5 "Visual Studio Code" on
        6 "Filezilla" on
        7 "htop" on
        8 "iftop" on
        9 "ncdu" on
        10 "Virtual Box" on
        11 "Gimp" on
        12. "Shutter" on)
    choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
    clear
    for choice in $choices; do
        case $choice in
        1)
            #Install dependencies*
            echo "Installing dependencies"
            apt install build-essential curl wget software-properties-common apt-transport-https -y
            ;;

        2)
            #Install git
            echo "Installing git"
            apt install git -y
            ;;
        3)
            #Install Node.js
            echo "Installing nodejs & npm"
            apt install npm -y
            ;;
        4)
            #Install Brave Browser
            echo "Software-properties-common"
            curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
            echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
            apt-get update
            apt install brave-browser -y
            ;;
        5)
            #Install Visual Studio Code
            echo "Installing Visual Studio Code"
            add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
            apt-get update
            apt install code -y
            ;;
        6)
            #Install Filezilla
            echo "Installing Filezilla"

            apt install filezilla -y
            ;;
        7)
            #Install htop
            echo "Installing htop"

            apt install htop -y
            ;;
        8)
            #Install iftop
            echo "Installing iftop"

            apt install iftop -y
            ;;
        9)
            #Install ncdu
            echo "Installing ncdu"

            apt install ncdu -y
            ;;
        10)
            #Install Virtual Box
            echo "Installing Virtual Box"

            apt install virtualbox -y
            ;;
        11)
            #Install Gimp
            echo "Installing Gimp"
            add-apt-repository ppa:otto-kesselgulasch/gimp
            apt update
            apt install gimp -y
            ;;
        12)
            #Install Shutter
            echo "Installing Shutter"
            apt install shutter gnome-web-photo libgoo-canvas-perl -y
            ;;
        esac
    done
fi
