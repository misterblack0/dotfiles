#!/bin/bash

if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root"
    exit 1
else
    #Update and Upgrade
    echo "Updating and Upgrading"
    apt-get update && sudo apt-get upgrade -y

    sudo apt-get install dialog
    cmd=(dialog --separate-output --checklist "Please select software you want to install:" 22 76 16)
    options=(1 "Build Essentials" on # any option can be set to default to "on"
        2 "Curl" on
        3 "Software-properties-common" on
        4 "wget" on
        5 "apt-transport-https" on
        6 "nodejs" on
        7 "npm" on
        8 "git" on
        9 "" on
        10 "Visual Studio Code" on
        11 "" on
        12 "Brave Browser" on
        13 "" on
        14 "" on)
    choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
    clear
    for choice in $choices; do
        case $choice in
        1)
            #Install curl*
            echo "Installing curl"
            apt install curl -y
            ;;

        2)
            #Install Software-properties-common
            echo "Software-properties-common"
            apt install software-properties-common -y

            ;;
        esac
    done
fi
