#!/bin/bash

# ZSH Configuration
ln -s $HOME/git/dotfiles/zsh-config/zshrc-personal $HOME/.zshrc

# Nvim Confiuration

brew install neovim
mkdir -p $HOME/.config/nvim/

## Alacritty Configuration
mkdir -p $HOME/.config/alacritty/
ln -s $HOME/git/dotfiles/alacritty/macos/alacritty.yml $HOME/.config/alacritty/alacritty.yml

# Installing Other Apps
brew install --cask alacritty
brew install tmux
brew install tree # Check pwd estructure as tree view. 
brew install lazygit
brew install bat # Great alternative to cat command. 
brew install exa # Great a alternative to ls command. 
brew install wget
brew install vagrant
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
# brew install --cask bitwarden
# brew install --cask discord
# brew install --cask warp
# brew install --cask ticktick
brew tap dteoh/sqa
brew install slowquitapps
brew install --cask appcleaner
brew install --cask the-unarchiver
brew install --cask dozer
brew install --cask utm