# Neovim Configuration

This directory contains a minimal Neovim configuration based on **LazyVim** distribution with carefully selected customizations for development work. The setup focuses on simplicity while maintaining powerful features for coding productivity.

## Overview

The configuration uses **LazyVim** as the base distribution and includes minimal customizations for specific language support, theming, and quality-of-life improvements. It follows a modular approach with plugin-specific configuration files.

## Key Configuration Details

### Base Distribution
- **Framework**: LazyVim (pre-configured Neovim setup)
- **Package Manager**: Lazy.nvim (included with LazyVim)
- **Leader Key**: `Space` (LazyVim default)

### Theme & Appearance
- **Colorscheme**: Tokyo Night (night style)
- **Line Numbers**: Enhanced line numbers plugin
- **Animations**: Disabled for performance (snacks_animate = false)

### General Settings
- **Case Sensitivity**: Smart case search (ignorecase = true)
- **Scroll Offset**: 8 lines (scrolloff = 8)
- **Order Checking**: Disabled for faster startup (lazyvim_check_order = false)

## Key Bindings

### LazyVim Default Keybindings
Since this configuration is based on LazyVim, all default LazyVim keybindings are available. Here are some of the most commonly used ones:

#### General Navigation
| Key Combination | Action |
|----------------|--------|
| `Space` | Leader key |
| `Space + e` | Toggle file explorer (Neo-tree) |
| `Space + /` | Search in project (Telescope) |
| `Space + Space` | Find files (Telescope) |
| `Space + ,` | Switch buffers |
| `Space + w` | Save file |
| `Space + q` | Quit |

#### Code Navigation
| Key Combination | Action |
|----------------|--------|
| `gd` | Go to definition |
| `gr` | Go to references |
| `K` | Hover documentation |
| `Space + ca` | Code actions |
| `Space + cr` | Rename symbol |
| `[d` / `]d` | Previous/Next diagnostic |

#### Window Management
| Key Combination | Action |
|----------------|--------|
| `Ctrl + h/j/k/l` | Navigate between windows |
| `Space + w + s` | Split window horizontally |
| `Space + w + v` | Split window vertically |
| `Space + w + d` | Close window |

#### Terminal
| Key Combination | Action |
|----------------|--------|
| `Space + t` | Open terminal |
| `Ctrl + /` | Toggle terminal |

## Installed Plugins

### Core Plugins (LazyVim)
LazyVim includes a comprehensive set of plugins by default. The configuration extends this with:

### Custom Plugins
1. **Tokyo Night Theme** - `folke/tokyonight.nvim`
   - Modern colorscheme with night style variant

2. **Line Numbers Enhancement** - `shrynx/line-numbers.nvim`
   - Enhanced line number display

### Language Support (Extras)
The configuration includes LazyVim extras for:
- **JSON** - Enhanced JSON editing support
- **TOML** - Configuration file support  
- **YAML** - YAML file editing
- **Markdown** - Markdown editing and preview

### Disabled Plugins
For a cleaner experience, the following plugins are disabled:
- **Noice.nvim** - UI notifications (too intrusive)
- **nvim-notify** - Notification system (simplified approach)

## Markdown Preview Configuration

Special configuration for markdown preview plugin:
- **Auto Start**: Disabled (manual start)
- **Auto Close**: Enabled (closes when switching buffers)
- **Network Access**: Enabled for external access
- **Port**: 8080
- **IP**: 0.0.0.0 (accessible from any network interface)

## Language Server Support

LazyVim provides built-in LSP support for many languages. The extras configuration adds enhanced support for:
- JSON with schema validation
- TOML configuration files
- YAML with schema support
- Markdown with enhanced editing features

## File Structure
```
dot_config/nvim/
├── lua/
│   ├── config/
│   │   └── options.lua          # General Neovim options
│   └── plugins/
│       ├── colorscheme.lua      # Tokyo Night theme configuration
│       ├── disabled.lua         # Disabled plugins list
│       ├── extras.lua           # LazyVim language extras
│       ├── line-numbers.lua     # Line numbers plugin
│       └── markdown-preview.lua # Markdown preview settings
└── README.md                    # This documentation
```

## Usage & Workflows

### Getting Started
1. LazyVim will automatically install all plugins on first launch
2. Use `Space` as the leader key for most commands
3. Press `Space + ?` to see available keybindings

### Common Workflows
- **Project Navigation**: Use `Space + Space` to find files, `Space + /` to search content
- **Code Editing**: LSP features work out of the box for supported languages
- **Terminal Integration**: Toggle terminal with `Ctrl + /` for quick access
- **Markdown Writing**: Automatic preview setup for documentation work

### Plugin Management
- **Install/Update**: LazyVim handles plugin management automatically
- **Lazy Loading**: Plugins are loaded on-demand for fast startup
- **Health Check**: Run `:checkhealth` to verify configuration

## Customization

The configuration prioritizes:
- **Simplicity**: Minimal custom configuration, leveraging LazyVim defaults
- **Performance**: Disabled animations and optimized startup
- **Language Support**: Essential language features without bloat
- **Development Focus**: Streamlined for coding and documentation work

To modify the configuration:
1. Edit files in `lua/config/` for general options
2. Add/modify plugins in `lua/plugins/`
3. LazyVim will automatically reload changes

## LazyVim Resources
- **Documentation**: https://lazyvim.github.io/
- **Keybindings**: Press `Space + ?` in Neovim
- **Plugin List**: `:Lazy` command shows all installed plugins
