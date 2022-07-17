#!/bin/bash

# ANTES DE CORRER ESTO HAY QUE CONFIGURAR LAS LLAVES DE GITHUB

sudo apt upgrade

# zsh stuff
sudo apt -y install zsh
chsh -s $(which zsh)
ln -s $HOME/Documents/git/dotfiles/zsh-config/linux/zshrc $HOME/.zshrc

# Solamente si es Ubuntu based disto. No recuerdo si PopOs lo tiene instalado por defecto, pero por si las dudas. 
sudo apt -y install git 

echo "---------------- NeoVim configuration ----------------"
# nvim install and configuration 

mkdir $HOME/.config/nvim/
ln -s $HOME/Documents/git/dotfiles/nvim-config/init.vim $HOME/.config/nvim/

# Install Vivaldi

sudo apt -y install wget gnupg2 # First you need to install wget if you do not have it. To do so use;
wget -qO- https://repo.vivaldi.com/archive/linux_signing_key.pub | sudo apt-key add - # Once you install wget, use it to download the Vivaldi browser packages;
sudo add-apt-repository 'deb https://repo.vivaldi.com/archive/deb/ stable main' # 
sudo apt update
sudo apt -y install vivaldi-stable

# Nodejs and npm install 

sudo apt -y install nodejs
sudo apt -y install npm

# Other utilities

sudo apt -y install exa
sudo apt -y install bat
sudo apt -y install gnome-extensions-app
sudo apt -y install gnome-tweaks
sudo apt -y install screenkey
sudo apt -y install ocrfeeder
sudo apt -y install paperwork #unable to find package name
sudo apt -y install gitg
sudo apt -y install gittyup #unable to find packege name
sudo apt -y install virt-manager
sudo apt -y spice-vdagent spice-webdavd
sudo apt -y install tmux
sudo apt -y install flatpak
flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Snapd
sudo apt -y install snapd
sudo snap install code ----classic

# Chaging CapsLock to Ctrl

echo "Chaging CapsLock to Ctrl................"
setxkbmap -layout us -option ctrl:swapcaps

# MANUAL INSTALLATION
echo "Install Jetbrains ToolBox"
echo "Install and configure VirtualBox"
echo "Install Nerd Fonts"
echo "Install Lunarvim"
echo "Install nvim"
https://github.com/neovim/neovim/releases/tag/v0.7.0

"$@"
