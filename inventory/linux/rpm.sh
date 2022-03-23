#!/bin/bash

# Este repositorio debe de colocarse en ~/Documents/git

# ------------------------------------------------------------ # 

cd ~/Downloads

##  Adding Repos and Updates

### Vagrant
sudo dnf config-manager --add-repo https://rpm.releases.hashicorp.com/fedora/hashicorp.repo

### Brave
sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/x86_64/
sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc

### VS Codium
sudo rpmkeys --import https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg
printf "[gitlab.com_paulcarroty_vscodium_repo]\nname=download.vscodium.com\nbaseurl=https://download.vscodium.com/rpms/\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg\nmetadata_expire=1h" | sudo tee -a /etc/yum.repos.d/vscodium.repo

### Flatpak Installation
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# ------------------------------------------------------------ # 

## Update repos
sudo dnf updates

# Installation Process

## Install basic utils

### Core Utils
sudo dnf install -y dnf-plugins-core

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

### Vagrant Installation
sudo dnf -y install vagrant

### Ansible Installation
sudo dnf -y install ansible

### Brave installation
sudo dnf -y install brave-browser

### Neovim Installation
sudo dnf -y install neovim

### zsh install 
sudo dnf -y install zsh

### Other Utilities
sudo dnf -y install exa
sudo dnf -y install bat
sudo dnf -y install screenkey
sudo dnf -y install ocrfeeder
sudo dnf -y install plank
sudo dnf -y install paperwork
sudo dnf -y install gitg

### Flatpak Apps

flatpak install -y flathub com.discordapp.Discord
flatpak install -y flathub com.spotify.Client
flatpak install -y flathub com.valvesoftware.Steam
flatpak install -y flathub org.fedoraproject.MediaWriter
flatpak install -y flathub org.pitivi.Pitivi
flatpak install -y flathub org.gnome.Evolution
flatpak install -y flathub de.haeckerfelix.Fragments
flatpak install -y flathub org.gnome.SoundRecorder
flatpak install -y flathub com.github.gi_lom.dialect
flatpak install -y flathub org.gnome.Builder
flatpak install -y flathub com.obsproject.Studio
flatpak install -y flathub com.orama_interactive.Pixelorama
flatpak install -y flathub org.darktable.Darktable
flatpak install -y flathub org.flameshot.Flameshot
flatpak install -y flathub com.github.buddhi1980.mandelbulber2
flatpak install -y flathub com.logseq.Logseq
flatpak install -y flathub com.bitwarden.desktop
flatpak install -y flathub com.github.tchx84.Flatseal
flatpak install -y flathub com.getmailspring.Mailspring
flatpak install -y flathub io.github.lainsce.Quilter
flatpak install -y flathub org.zotero.Zotero
flatpak install -y flathub org.gustavoperedo.FontDownloader

### VS Codium
sudo dnf install -y codium

# ------------------------------------------------------------ # 

# Config Files

## zsh config
chsh -s $(which zsh)
ln -s $HOME/Documents/git/dotfiles/zshrc $HOME/.zshrc

## Neovim config

mkdir $HOME/.config/nvim/
touch $HOME/.config/nvim/init.vim
ln -s $HOME/Documents/git/dotfiles/nvim-config/init.vim $HOME/.config/nvim/
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'


# MANUAL INSTALLATION
echo "Install Jetbrains ToolBox"
echo "Install VirtualBox"

"$@"
# This is my Fedora Server condifguraton
