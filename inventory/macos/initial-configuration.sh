#!/bin/bash

# MacOS System Configuration

# Disable press and hold
defaults write -g ApplePressAndHoldEnabled -bool false
# Changing Dock Size
defaults write com.apple.dock tilesize -int 35
killall Dock # Restarting Dock

# Disabling Natural Scrolling
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

# ZSH Configuration
ln -s $HOME/git/dotfiles/zsh/zshrc $HOME/.zshrc

# Creating Neovim directory
mkdir -p $HOME/.config/nvim/

# Installing Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

