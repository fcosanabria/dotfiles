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


## Brave installation
sudo dnf install dnf-plugins-core
sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/x86_64/
sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
sudo dnf install brave-browser


#Neovim configuration
sudo dnf install -y neovim
mkdir $HOME/.config/nvim/
touch $HOME/.config/nvim/init.vim
ln -s $HOME/Documents/dotfiles/init.vim $HOME/.config/nvim/
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'


#zsh install and configuration
sudo dnf install zsh
chsh -s $(which zsh)
ln -s $HOME/Documents/dotfiles/zshrc $HOME/.zshrc

#Other Utilities
sudo dnf -y install exa
sudo dnf -y install bat
sudo dnf install screenkey
sudo dnf install ocrfeeder

"$@"
# This is my Fedora Server condifguraton
