#!/bin/bash

# MacOS System Configuration
defaults write -g ApplePressAndHoldEnabled -bool false # Disable press and hold

# ZSH Configuration
ln -s $HOME/git/dotfiles/zsh-config/M1/zshrc $HOME/.zshrc

# Nvim Confiuration

brew install neovim
mkdir -p $HOME/.config/nvim/

## Alacritty Configuration
mkdir -p $HOME/.config/alacritty/
ln -s $HOME/git/dotfiles/alacritty/macos/alacritty.yml $HOME/.config/alacritty/alacritty.yml

# Installing Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Installing Homebrew Packages

# Programming and Development Tools
brew install git
brew install node
brew install python3
brew install pip3
curl https://sh.rustup.rs -sSf | sh

# Terminal Tools
brew install tmux
brew install fzf
brew install bat
brew install exa
brew install ripgrep
brew install htop
brew install lazygit
brew install tldr
brew install tree
brew install wget

# Other Packages
brew install --cask alacritty
brew install koekeishiya/formulae/yabai
brew install koekeishiya/formulae/skhd
brew install --cask vagrant
brew install --cask slack
brew install --cask keycastr
brew install --cask obs
brew install --cask firefox
brew install --cask spotify
brew install --cask karabiner-elements
brew install --cask vagrant
brew install --cask virtualbox
brew install --cask virtualbox-extension-pack
brew install --cask obsidian
brew install --cask fig
brew install --cask via
brew install --cask cleanshot
brew install --cask iina
brew install --cask bitwarden
brew install --cask discord
brew install --cask warp
brew install --cask ticktick
brew install --cask appcleaner
brew install --cask the-unarchiver
brew install --cask utm
brew install qemu
brew install raycast
brew install --cask stremio
