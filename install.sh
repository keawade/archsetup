#!/bin/bash
# Author: Keith Wade
# Git: https://www.github.com/keawade
# Version: 0.0.1

RED='\033[0;31m'
GREEN='\033[0;32m'
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
