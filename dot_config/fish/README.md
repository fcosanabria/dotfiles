# Fish Shell Configuration

This directory contains a comprehensive Fish shell configuration optimized for development work with modern command-line tools, enhanced navigation, and productivity-focused aliases and functions.

## Overview

The configuration integrates several modern CLI tools including **starship** prompt, **zoxide** for smart directory navigation, **atuin** for command history, and **mise** for tool version management. It focuses on improving the terminal experience with better defaults and useful shortcuts.

## Key Configuration Details

### Welcome Message
- **Greeting Function**: Custom `fish_greeting` that runs `fastfetch` for system information display
- **System Info**: Shows system details on every new shell session

### Default Editor
- **Editor**: Neovim (`nvim`) set as the default editor via `$EDITOR` environment variable

### Tool Integration
- **Starship**: Modern, customizable prompt
- **Zoxide**: Smart directory jumping (replaces traditional `cd`)
- **Atuin**: Enhanced command history with search and sync
- **Mise**: Development tool version management

## Aliases

### File Listing (Enhanced with Eza)
| Alias | Command | Description |
|-------|---------|-------------|
| `ls` | `eza -al --color=always --group-directories-first --icons` | Preferred listing with icons and colors |
| `la` | `eza -a --color=always --group-directories-first --icons` | All files and directories |
| `ll` | `eza -la --color=always --group-directories-first --icons` | Long format listing |
| `lt` | `eza -aT --color=always --group-directories-first --icons` | Tree listing |

### Navigation (Enhanced with Zoxide)
| Alias | Command | Description |
|-------|---------|-------------|
| `cd` | `z` | Smart directory navigation |
| `..` | `z ..` | Go up one directory |
| `...` | `z ../..` | Go up two directories |
| `....` | `z ../../..` | Go up three directories |
| `.....` | `z ../../../..` | Go up four directories |
| `......` | `z ../../../../..` | Go up five directories |

### Archive Operations
| Alias | Command | Description |
|-------|---------|-------------|
| `tarnow` | `tar -acf` | Create tar archive with compression |
| `untar` | `tar -zxvf` | Extract tar.gz archive |

### System & Process Management
| Alias | Command | Description |
|-------|---------|-------------|
| `wget` | `wget -c` | Resume wget downloads |
| `psmem` | `ps auxf \| sort -nr -k 4` | Show processes sorted by memory usage |
| `psmem10` | `ps auxf \| sort -nr -k 4 \| head -10` | Top 10 memory-consuming processes |

### Search & Text Processing
| Alias | Command | Description |
|-------|---------|-------------|
| `grep` | `grep --color=auto` | Colored grep output |
| `fgrep` | `fgrep --color=auto` | Colored fixed-string grep |
| `egrep` | `egrep --color=auto` | Colored extended grep |
| `cat` | `bat` | Syntax-highlighted file viewer |

### Kubernetes & Development
| Alias | Command | Description |
|-------|---------|-------------|
| `k` | `kubectl` | Kubernetes command-line tool |
| `ctx` | `kubectx` | Kubernetes context switcher |
| `homelab` | `cd ~/git/homelab/` | Quick navigation to homelab directory |

## Functions

### Development Container Setup
The configuration includes a comprehensive function for setting up development containers:

**Function**: `setup_devcontainer_files`

This function automatically creates a complete devcontainer setup for any repository:

#### Generated Files:
1. **scripts/setup** - Executable setup script that trusts and installs mise tools
2. **mise.toml** - Tool version configuration file
3. **.devcontainer/devcontainer.json** - VS Code devcontainer configuration
4. **.devcontainer/Dockerfile** - Container definition with Ubuntu 24.04 base

#### Features:
- **Dynamic Repository Name**: Automatically detects current repository name
- **Mise Integration**: Includes mise for tool version management
- **Fish Shell Support**: Configures Fish shell in the container
- **Post-Create Command**: Automatically runs setup after container creation

#### Usage:
```fish
setup_devcontainer_files
```

#### Output:
- Creates necessary directories (`scripts/`, `.devcontainer/`)
- Generates all required files with proper permissions
- Provides confirmation message with created files list

## Tool Integration Details

### Starship Prompt
- **Initialization**: `starship init fish | source`
- **Features**: Modern prompt with git status, language versions, and more
- **Customization**: Respects starship configuration files

### Zoxide (Smart CD)
- **Initialization**: `zoxide init fish | source`
- **Features**: Learns your navigation patterns and provides smart jumping
- **Usage**: Use `z <partial-path>` to jump to frequently visited directories

### Atuin (Command History)
- **Initialization**: `atuin init fish | source`
- **Features**: Enhanced command history with search, sync, and statistics
- **Usage**: Ctrl+R for history search with fuzzy matching

### Mise (Tool Version Management)
- **Initialization**: `mise activate fish | source`
- **Features**: Manages development tool versions per project
- **Usage**: Automatically switches tool versions based on project configuration

## File Structure
```
dot_config/fish/
├── config.fish                           # Main configuration file
├── functions/
│   └── setup_devcontainer_files.fish    # Devcontainer setup function
└── README.md                            # This documentation
```

## Usage & Workflows

### Daily Development
- **Navigation**: Use `z` instead of `cd` for smart directory jumping
- **File Listing**: Use `ls`, `ll`, or `lt` for enhanced file browsing
- **History**: Use Ctrl+R for powerful command history search

### Project Setup
- **New Repository**: Run `setup_devcontainer_files` to create devcontainer setup
- **Tool Management**: Use mise.toml files for consistent development environments

### System Monitoring
- **Memory Usage**: Use `psmem` or `psmem10` to check system resources
- **File Content**: Use `cat` (aliased to `bat`) for syntax-highlighted viewing

## Customization

The configuration prioritizes:
- **Modern Tools**: Replaces traditional tools with enhanced alternatives
- **Productivity**: Shortcuts and aliases for common development tasks
- **Consistency**: Standardized development environments via containers
- **Visual Enhancement**: Icons, colors, and better formatting throughout

### Adding Custom Aliases
Add new aliases to `config.fish`:
```fish
alias myalias='command --with-options'
```

### Adding Custom Functions
Create new functions in the `functions/` directory:
```fish
# functions/my_function.fish
function my_function
    # Function code here
end
```

## Dependencies

The configuration expects these tools to be installed:
- **eza**: Modern replacement for `ls`
- **bat**: Syntax-highlighting `cat` replacement
- **starship**: Modern prompt
- **zoxide**: Smart directory navigation
- **atuin**: Command history management
- **mise**: Tool version management
- **fastfetch**: System information display
- **kubectl** & **kubectx**: Kubernetes tools (optional)

Most dependencies are managed through **mise** for consistent installations across environments.
