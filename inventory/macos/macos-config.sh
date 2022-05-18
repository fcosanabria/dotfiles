#!/bin/bash


function preConfig { #this func contains all pre-configure stuff we will need to start. 
	
	# Crear el git centralized directory.
	mkdir -p $HOME/Documents/git/
	
	# Install Homebrew
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

	echo "==== Remember to run the parallel commands to make sure Homebrew is using what it needs. ======= "
	echo "================================================================================================ "
	echo "==== Remember to run the parallel commands to make sure Homebrew is using what it needs. ======= "


	# Install xcode CLI tools ~ XCode Situation & Git
	xcode-select --install

	# Adding the zsh dot file to home. 
	# ln -s $HOME/Documents/git/dotfiles/zsh-config/macOS/zshrc $HOME/.zshrc
	# optional, ya que voy a usar AstroNvim entonces el uso de este nvim file no se necesita. 
}

function ibmConfig {
	
	# Installing IBM Cli
	cd Downloads/
	wget https://download.clis.cloud.ibm.com/ibm-cloud-cli/2.5.0/IBM_Cloud_CLI_2.5.0.pkg
	installer -pkg IBM_Cloud_CLI_2.5.0.pkg -target CurrentUserHomeDirectory

	# IBM CLI Plugins
	ibmcloud plugin install observe-service
	ibmcloud plugin install container-registry
	ibmcloud plugin install container-service

}


function nvimConfig {

	# NeoVim and AstroNVIM configuration
	# Go the following link: to download the lastest release. O.7.0 to use AstroNvim
	# https://github.com/neovim/neovim
	# or use brew --HEAD to install development version.
	
	mkdir -p $HOME/.config/nvim/
	# ln -s $HOME/Documents/git/dotfiles/nvim-config/init.vim $HOME/.config/nvim/init.vim
	# Se encuentra comentado por que no es necesario usar este .vim configuration, que ahora
	# quiero usar AstroNvim
	
	# Optional Requirements for AstroNvim

	# ripgrep
	# https://github.com/BurntSushi/ripgrep
	
	brew install ripgrep

	# lazygit
	#
	# https://github.com/jesseduffield/lazygit#homebrew
	
	brew install jesseduffield/lazygit/lazygit
	
	# Htop
	#

	
	brew install htop

	# Clone the AstroNvim Repo

	git clone https://github.com/AstroNvim/AstroNvim ~/.config/nvim
	nvim +PackerSync


 #Basic Setup

: '
	Install LSP
	Enter :LspInstall followed by the name of the server you want to install
	Example: :LspInstall pyright

	Install language parser
	Enter :TSInstall followed by the name of the language you want to install
	Example: :TSInstall python

	Manage plugins
	Run :PackerClean to remove any disabled or unused plugins
	Run :PackerSync to update and clean plugins

	Update AstroNvim
	Run :AstroUpdate to get the latest updates from the repository
'
}


function brewInstall {

	brew install iterm2 # Install best terminal emulator ever made. 
	brew install argocd
	brew install bat # Great alternative to cat command. 
	brew install exa # Great a alternative to ls command. 
	brew install helm
	brew install k9s # https://k9scli.io/
	brew install kdash # https://github.com/kdash-rs/kdash
	brew install kubectl
	brew install kubectx
	brew install openshift-cli
	brew install neovim
	brew install terraform
	brew install tree # Check pwd estructure as tree view. 
	brew install terraform
	brew install wget 
	brew install peco
	brew install vagrant
	brew install --cask flameshot
	brew install --cask keycastr
	brew tap homebrew/cask-fonts #This sis for installing the hack nerd font. 
	brew install --cask font-hack-nerd-font # Installing the nerd font
	brew install --cask font-fira-code # Installing the Fira Code Font.  
# brew install asdf # Manage CLI version on local machine.

}

## Manual Installation

#Amethyst window manager
#Fig - Add On for the Terminal.
#Docker
#Keep checking the list for MacOS
# Tick Tick # N/A
# IINA - Video Player for modern stuff. 
# Notion
# Aphematime
# All windows appear
# The Unarchiver
# OBS
# KAP - Grabar video
# Backtrack - Grabar audio
# Rectagle - Window Manager
# Selfcontrol 
# Virtual Box 
# Sleeve - Spotify
# Spotify
# Dropzone4
# Appcleaner
# Cheatsheet
# Text Sniper
# Raindrop
# MediaHuman Video Converter
# Stremio
# App Flowy 
# Dozer - Hide Icons on Menubar
# Logseq 
# Brave Browser 
# Visual Studio Code - Configurations, extensions and themes are already in GitHub account. 
# Bitwarden
# Ferdi
# Discord
# Google Drive
# Karabiner-Elements


### Other Tool you use. 


#This script is to install local files - not sure if it works. 
# usage: installdmg https://example.com/path/to/pkg.dmg
# function installdmg {
#     set -x
#     tempd=$(mktemp -d)
#     curl $1 > $tempd/pkg.dmg
#     listing=$(sudo hdiutil attach $tempd/pkg.dmg | grep Volumes)
#     volume=$(echo "$listing" | cut -f 3)
#     if [ -e "$volume"/*.app ]; then
#       sudo cp -rf "$volume"/*.app /Applications
#     elif [ -e "$volume"/*.pkg ]; then
#       package=$(ls -1 "$volume" | grep .pkg | head -1)
#       sudo installer -pkg "$volume"/"$package" -target /
#     fi
#     sudo hdiutil detach "$(echo "$listing" | cut -f 1)"
#     rm -rf $tempd
#     set +x
# }

# https://apple.stackexchange.com/questions/73926/is-there-a-command-to-install-a-dmg
 

"$@"
