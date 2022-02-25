#!/bin/bash

#Basic Installation Tools

sudo dnf update
sudo dnf install -y git
sudo dnf -y install bridge-utils libvirt virt-install qemu-kvm #Virtualization Tools for Fedora
lsmod | grep kvm # check if the virtualization is ready
sudo dnf -y install libvirt-devel virt-top libguestfs-tools # More Virtualization tools for Fedora
# https://computingforgeeks.com/how-to-install-kvm-on-fedora/ Virtualization tools reference. 

# Vagrant Installation
sudo dnf install -y dnf-plugins-core
sudo dnf config-manager --add-repo https://rpm.releases.hashicorp.com/fedora/hashicorp.repo
sudo dnf -y install vagrant


#Neovim configuration
sudo dnf install -y neovim
mkdir $HOME/.config/nvim/
touch $HOME/.config/nvim/init.vim
ln -s $HOME/Documents/dotfiles/init.vim $HOME/.config/nvim/


#zsh install and configuration
sudo dnf install zsh
chsh -s $(which zsh)
ln -s $HOME/Documents/dotfiles/zshrc $HOME/.zshrc

#Other Utilities
sudo dnf -y install exa
sudo dnf -y install bat

"$@"
# This is my Fedora Server condifguraton
