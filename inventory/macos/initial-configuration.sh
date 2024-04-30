#!/bin/bash

# MacOS System Configuration
# Disable press and hold
defaults write -g ApplePressAndHoldEnabled -bool false 

# ZSH Configuration
ln -s $HOME/git/dotfiles/zsh/zshrc $HOME/.zshrc

mkdir -p $HOME/.config/nvim/

# Installing Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
