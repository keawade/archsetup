#!/bin/bash
# Author: Keith Wade
# Git: https://www.github.com/keawade
# Version: 0.0.1

echo "Welcome to Arch!"
echo "This script will guide you through your Arch installation."
read -p "Please press [Enter] to begin..."

wget -q --tries=4 --timeout=4 --spider http://google.com
if [[ $? -eq 0 ]]; then
  echo "Network connection online"
else
  echo "Please check your network connection"
  exit 0
fi
