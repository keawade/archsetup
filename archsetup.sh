#!/bin/bash
# Author: Keith Wade
# Git: https://www.github.com/keawade
# Version: 0.0.1

echo Welcome to keawade
read 

USER=

# Create User
useradd -m -G wheel -s /bin/bash $USER

# Install Aura
wget https://aur.archlinux.org/packages/au/aura-bin/aura-bin.tar.gz
tar -xvf aura-bin.tar.gz
cd aura-bin
makepkg -s
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
# ------- oh-my-zsh -------
set -e

if [ ! -n "$ZSH" ]; then
  ZSH=~/.oh-my-zsh
fi

echo "\033[0;34mCloning Oh My Zsh...\033[0m"
hash git >/dev/null 2>&1 && env git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git $ZSH

echo "\033[0;34mLooking for an existing zsh config...\033[0m"
if [ -f ~/.zshrc ] || [ -h ~/.zshrc ]; then
  echo "\033[0;33mFound ~/.zshrc.\033[0m \033[0;32mBacking up to ~/.zshrc.pre-oh-my-zsh\033[0m";
  mv ~/.zshrc ~/.zshrc.pre-oh-my-zsh;
fi

echo "\033[0;34mUsing the Oh My Zsh template file and adding it to ~/.zshrc\033[0m"
cp $ZSH/templates/zshrc.zsh-template ~/.zshrc
sed -i -e "/^export ZSH=/ c\\
export ZSH=$ZSH
" ~/.zshrc

echo "\033[0;34mCopying your current PATH and adding it to the end of ~/.zshrc for you.\033[0m"
sed -i -e "/export PATH=/ c\\
export PATH=\"$PATH\"
" ~/.zshrc

TEST_CURRENT_SHELL=$(expr "$SHELL" : '.*/\(.*\)')
if [ "$TEST_CURRENT_SHELL" != "zsh" ]; then
    echo "\033[0;34mTime to change your default shell to zsh!\033[0m"
    chsh -s $(grep /zsh$ /etc/shells | tail -1)
fi
unset TEST_CURRENT_SHELL
# ------- oh-my-zsh -------
