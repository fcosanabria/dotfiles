#!/bin/bash

# Esto son los programas que he estado instalando en mi PopOS de uso diario

# zsh, ya que me en macos la uso, se me hace mas familiar, ya que paso mas tiempo en zsh, ademas de que es mas amigable.
sudo apt install zsh

chsh -s $(which zsh)

# Solamente si es Ubuntu based disto. No recuerdo si PopOs lo tiene instalado por defecto, pero por si las dudas. 
sudo apt install git 

# nvim install and configuration 
sudo apt install nvim
# nvim configuration 
Copiar de la Mac el configuration file.


# Nodejs and npm install 

sudo apt install nodejs
sudo apt install npm

# Other utilities

sudo apt install bat


# To install
sudo apt install exa
sudo apt install bat

BAT
crt - emulator
Git smart
vs code via microsoft repo
docker
kubernetes
oc command
ferdi
discord
brave
devtools
steam
kubelens
notion enhanced
flameshot
stremio
gnome apps
bitwarden
npm install -g tldr #man replacement

#Stremio install and download
cd Downloads/
curl -o https://dl.strem.io/shell-linux/v4.4.142/stremio_4.4.142-1_amd64.deb
dpkg -y stremio*
