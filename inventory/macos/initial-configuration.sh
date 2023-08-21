#!/bin/bash

# MacOS System Configuration
# Disable press and hold
defaults write -g ApplePressAndHoldEnabled -bool false 

# ZSH Configuration
ln -s $HOME/git/dotfiles/zsh-config/M1/zshrc $HOME/.zshrc

mkdir -p $HOME/.config/nvim/

## Alacritty Configuration
mkdir -p $HOME/.config/alacritty/
ln -s $HOME/git/dotfiles/alacritty/macos/alacritty.yml $HOME/.config/alacritty/alacritty.yml

# Installing Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# npm pre-confiration for Lunavim

mkdir ~/.npm-global
npm config set prefix '~/.npm-global'

if [ -f ~/.profile ]; then
  # If the file exists, append the export line to the end of the file
  cat << EOF >> ~/.profile
export PATH=~/.npm-global/bin:$PATH
EOF
else
  # If the file doesn't exist, create it and write the export line
  echo "export PATH=~/.npm-global/bin:$PATH" > ~/.profile
fi

source ~/.profile