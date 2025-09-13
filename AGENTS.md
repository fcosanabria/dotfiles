# Agent Guidelines for Dotfiles Repository

This repository is mainly to use it along with Devcontainers.

## Build/Test/Deploy Commands
- `./setup` - Bootstrap setup script (installs fish, chezmoi, applies dotfiles)
- `chezmoi apply` - Apply dotfile changes to the system
- `mise install` - Install all tools defined in dot_config/mise/config.toml
- No test suite - this is a dotfiles configuration repository

## Repository Structure
- This is a chezmoi dotfiles repository for shell/editor configuration
- `dot_*` files/dirs map to hidden files in $HOME (e.g., dot_config → ~/.config)
- `.chezmoiexternals/` - External binary downloads (mise, neovim)
- `.chezmoiscripts/` - Scripts that run during chezmoi apply

## Code Style Guidelines
- Shell scripts: Use `#!/bin/bash`, `set -euo pipefail`, double quotes for variables
- Fish config: Use functions for complex logic, aliases for simple replacements
- Lua (Neovim): Use snake_case, return tables for plugin configs, minimal configuration
- Comments: Spanish comments are acceptable (mixed Spanish/English codebase)

## Configuration Management
- Tools managed via mise (see dot_config/mise/config.toml)
- Neovim uses LazyVim distribution with minimal custom config
- Fish shell with starship prompt and zoxide for navigation
- Default editor: neovim (nvim)

## File Naming
- Follow chezmoi conventions: dot_filename → .filename in home directory
- Template files use .tmpl extension for dynamic content
