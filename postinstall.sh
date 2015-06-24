#!/bin/bash
# Author: Keith Wade
# Git: https://www.github.com/keawade
# Version: 0.0.1

echo "Welcome to ArchSetup!\n"

if [ ${USER} != root]; then
  echo "Please run this command as sudo";
  exit 0;
fi

cd

# Install Aura
sudo -u ${USERNAME} wget https://aur.archlinux.org/packages/au/aura-bin/aura-bin.tar.gz
sudo -u ${USERNAME} tar -xvf aura-bin.tar.gz
sudo -u ${USERNAME} cd aura-bin
sudo -u ${USERNAME} makepkg -s
pacman -U aura(tab complete).pkg.tar.xz --noconfirm

# Install GNOME
aura -Syyu gnome brasero cheese devhelp file-roller gedit gedit-code-assistance gitg gnome-builder gnome-calendar gnome-characters gnome-clocks gnome-code-assistance gnome-color-manager gnome-devel-docs gnome-documents gnome-logs gnome-maps gnome-nettool gnome-photos gnome-sound-recorder gnome-tweak-tool gnome-weather seahorse vinagre
systemctl enable gdm --noconfirm

# Common Pacman Packages
aura -S firefox openssh elinks pianobar vlc libreoffice-fresh --noconfirm

# Common AUR Packages
aura -A flattr-icon-theme-git archey3-git ttf-ms-fonts tor-browser-en #alsi --noconfirm

# Install zsh
aura -S zsh wget git --noconfirm

# oh-my-zsh install script credit to github.com/robbyrussell
sudo -u ${USERNAME} sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
