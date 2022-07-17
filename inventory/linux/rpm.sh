#!/bin/bash

# Este repositorio debe de colocarse en ~/Documents/git

# ------------------------------------------------------------ #
# ANTES DE CORRER ESTO HAY QUE CONFIGURAR LAS LLAVES DE GITHUB 



## Update repos
sudo dnf updates

### Core Utils
sudo dnf install -y dnf-plugins-core
sudo dnf install -y dnf-utils

### Gnome Stuff
sudo dnf install -y gnome-extensions-app
sudo dnf install -y gnome-tweaks

### git 
sudo dnf -y install git

###  Virtualization Tools for Fedora
sudo dnf -y install bridge-utils libvirt virt-install qemu-kvm
lsmod | grep kvm # check if the virtualization is ready
sudo dnf -y install libvirt-devel virt-top libguestfs-tools # More Virtualization tools for Fedora
### https://computingforgeeks.com/how-to-install-kvm-on-fedora/ Virtualization tools reference. 

## Install other Apps
echo "---------------- Installing Other Apps ----------------"

### Install Vivaldi
sudo dnf config-manager --add-repo https://repo.vivaldi.com/archive/vivaldi-fedora.repo
sudo dnf install vivaldi-stable -y

### Nodejs and npm
sudo dnf -y install nodejs
sudo dnf -y install npm

### zsh install 
sudo dnf -y install zsh

### Alacritty Install
sudo dnf -y install cmake freetype-devel fontconfig-devel libxcb-devel libxkbcommon-devel g++
sudo dnf -y install alacritty
ln -s $HOME/Documents/git/dotfiles/alacritty/Linux/alacritty.yml $HOME/.config/alacritty/alacritty.yml

### Other Utilities
sudo dnf -y install exa
sudo dnf -y install bat
sudo dnf -y install screenkey
sudo dnf -y install ocrfeeder
sudo dnf -y install paperwork
sudo dnf -y install gitg
sudo dnf -y install gittyup
sudo dnf -y installs virt-manager
sudo dnf -y tmux
sudo dnf -y flatpak
sudo dnf install gnome-shell-extension-pop-shell

#Snapd
sudo dnf install snapd

# Config Files

## zsh config
echo "---------------- ZSH configuration ----------------"
chsh -s $(which zsh)
ln -s $HOME/Documents/git/dotfiles/zsh-config/linux/zshrc $HOME/.zshrc

## Tmux config

ln -s $HOME/Documents/git/dotfiles/tmux.conf $HOME/.tmux.conf

## Chaging CapsLock to Ctrl

echo "Chaging CapsLock to Ctrl................"
setxkbmap -layout us -option ctrl:swapcaps

# MANUAL INSTALLATION
echo "Install Jetbrains ToolBox"
echo "Install and configure VirtualBox"
echo "Install Nerd Fonts"
echo "Install Lunarvim"
echo "Install nvim https://github.com/neovim/neovim/releases/tag/v0.7.0"
echo "Download the flathub repo file form here https://flatpak.org/setup/Fedora"

"$@"
# This is my Fedora Server condifguraton
