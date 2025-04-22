#!/bin/sh

stty -echo
read -p "password: " passw
readonly passw
stty echo

set -e

echo $passw | sudo -S apt update -y
echo $passw | sudo -S apt install kali-linux-everything -y
echo $passw | sudo -S apt install kali-tools-identify kali-tools-protect kali-tools-detect kali-tools-respond kali-tools-recover kali-themes-purple -y
echo $passw | sudo -S apt install --reinstall kali-menu
echo $passw | sudo -S apt full-upgrade -y
echo $passw | sudo -S apt autoremove -y

set +e

read -n 1 -s -r -p "Press Enter to reboot..." key

echo $passw | sudo -S reboot
