#!/bin/bash
# Author: Keith Wade
# Git: https://www.github.com/keawade
# Version: 0.0.1

RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
NC='\033[0m' # No Color

echo "Welcome to Arch!"
echo "This script will guide you through your Arch installation."
read -p "Please press [Enter] to begin..."

# Check for internet connectivity
echo "Checking for network connectivity..."
wget -q --tries=4 --timeout=4 --spider http://google.com
if [[ $? -eq 0 ]]; then
  echo "[${GREEN}SUCCESS${NC}] Network connection online"
else
  echo "[${RED}FAILED${NC}] Please check your network connection"
  exit 0
fi

# Prepare storage devices
lsblk
echo "Please select the disk you wish to install to (a, b, c, etc): "
read drive
echo "/dev/sd${drive} selected:"
lsblk /dev/sd${drive}

read -r -p "\n[${ORANGE}WARNING${NC}] The contents of /dev/sd${drive} will be erased! Continue? [y/N] " response
case $response in
  [yY][eE][sS]|[yY]) 
    
    ;;
  *)
    exit 0
    ;;
esac

echo "What partition table do you want to use?"
echo "  1) GPT"
echo "  2) MSDOS"
echo "  1) /dev/sd${drive}1 > /"
echo "  2) /dev/sd${drive}1 > /boot"
echo "  1) /dev/sd${drive}1 > /boot"
echo "  1) /dev/sd${drive}1 > /boot"
echo "  1) /dev/sd${drive}1 > /boot"
echo "  1) /dev/sd${drive}1 > /boot"
echo "  1) /dev/sd${drive}1 > /boot"
echo "  1) /dev/sd${drive}1 > /boot"
echo "  1) /dev/sd${drive}1 > /boot"
echo "  1) /dev/sd${drive}1 > /boot"
read -r -p ""


# chroot
pacman -S wget --noconfirm
