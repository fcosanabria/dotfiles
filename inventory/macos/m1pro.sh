#!/bin/bash

# MacOS System Configuration
defaults write -g ApplePressAndHoldEnabled -bool false # Disable press and hold

# ZSH Configuration
ln -s $HOME/git/dotfiles/zsh-config/M1/zshrc $HOME/.zshrc

mkdir -p $HOME/.config/nvim/

## Alacritty Configuration
mkdir -p $HOME/.config/alacritty/
ln -s $HOME/git/dotfiles/alacritty/macos/alacritty.yml $HOME/.config/alacritty/alacritty.yml

# Installing Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
