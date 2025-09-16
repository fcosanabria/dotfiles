# Tmux Configuration

This directory contains a comprehensive tmux configuration optimized for development work with vi-mode navigation, system clipboard integration, and a minimal status bar theme.

## Overview

The configuration uses **fish** as the default shell and includes several plugins for enhanced functionality. The setup focuses on productivity with vim-like keybindings and seamless navigation between tmux panes and vim splits.

## Key Configuration Details

### Prefix Key
- **Prefix**: `Ctrl + Space` (replaces default `Ctrl + b`)

### Shell Configuration
- **Default Shell**: Fish (`/bin/fish`)
- **True Color Support**: Enabled for better terminal colors

### Mouse & Clipboard
- **Mouse Support**: Enabled
- **System Clipboard**: Integrated (uses system clipboard for copy/paste)
- **Passthrough**: Enabled (allows programs in panes to bypass tmux for features like image preview)

## Key Bindings

### Prefix-based Commands
| Key Combination | Action |
|----------------|--------|
| `Ctrl + Space` | Prefix key |
| `Ctrl + Space, Ctrl + Space` | Send prefix to nested session |
| `Prefix + "` | Split window vertically (opens in current path) |
| `Prefix + %` | Split window horizontally (opens in current path) |
| `Prefix + c` | Create new window (opens in current path) |

### Non-prefix Commands
| Key Combination | Action |
|----------------|--------|
| `Alt + H` | Switch to previous window |
| `Alt + L` | Switch to next window |

### Vi-mode Copy Commands
| Key Combination | Action |
|----------------|--------|
| `v` | Begin selection (in copy mode) |
| `Ctrl + v` | Toggle rectangle selection (in copy mode) |
| `y` | Copy selection and exit copy mode |

## Installed Plugins

### Core Plugins
1. **TPM (Tmux Plugin Manager)** - `tmux-plugins/tpm`
   - Plugin manager for tmux

2. **Tmux Sensible** - `tmux-plugins/tmux-sensible`
   - Basic tmux settings that everyone can agree on

3. **Vim Tmux Navigator** - `christoomey/vim-tmux-navigator`
   - Seamless navigation between tmux panes and vim splits

4. **Tmux Yank** - `tmux-plugins/tmux-yank`
   - Enhanced copy functionality with system clipboard integration

5. **Minimal Tmux Status** - `niksingh710/minimal-tmux-status`
   - Clean, minimal status bar theme

## General Settings

### Performance & Behavior
- **History Limit**: 50,000 lines
- **Escape Time**: 0ms (no delay for escape sequences)
- **Detach on Destroy**: Disabled (keeps session alive when all windows are closed)
- **Mode Keys**: Vi-mode enabled

### Status Bar Configuration (via minimal-tmux-status)
- **Position**: Top
- **Background Color**: `#698DDA` (blue)
- **Foreground Color**: `#000000` (black)
- **Justification**: Center
- **Indicator**: Shows "tmux" when prefix is active
- **Session Name**: Displayed on the right side
- **Window Format**: ` #I:#W ` (index:name)
- **Zoomed Icon**: `󰊓` (shows when pane is zoomed)

## Installation & Usage

### Plugin Installation
1. Install TPM (if not already installed):
   ```bash
   git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
   ```

2. Reload tmux configuration:
   ```bash
   tmux source-file ~/.config/tmux/tmux.config
   ```

3. Install plugins: `Prefix + I`

### Common Workflows
- **Split Management**: Use `Prefix + "` and `Prefix + %` to create splits in the current directory
- **Window Navigation**: Use `Alt + H/L` for quick window switching
- **Copy Mode**: Enter with `Prefix + [`, select with `v`, copy with `y`
- **Vim Integration**: Navigate seamlessly between vim splits and tmux panes with vim-tmux-navigator

## File Structure
```
dot_config/tmux/
├── tmux.config          # Main configuration file
├── plugins/
│   └── minimal-tmux-status/
│       └── minimal.tmux  # Status bar theme plugin
└── README.md            # This documentation
```

## Customization

The configuration prioritizes:
- **Productivity**: Fast navigation and sensible defaults
- **Integration**: Seamless vim/tmux workflow
- **Aesthetics**: Clean, minimal status bar
- **Flexibility**: Easy to extend with additional plugins

To modify the configuration, edit `tmux.config` and reload with `tmux source-file ~/.config/tmux/tmux.config`.
