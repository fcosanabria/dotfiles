## Run fastfetch as welcome message
function fish_greeting
    fastfetch
end

## Environment setup
# Apply .profile: use this to put fish compatible .profile stuff in
if test -f ~/.fish_profile
    source ~/.fish_profile
end

# Add ~/.local/bin to PATH
if test -d ~/.local/bin
    if not contains -- ~/.local/bin $PATH
        set -p PATH ~/.local/bin
    end
end

# Add depot_tools to PATH
if test -d ~/Applications/depot_tools
    if not contains -- ~/Applications/depot_tools $PATH
        set -p PATH ~/Applications/depot_tools
    end
end

## Useful aliases
# Replace ls with eza
alias ls='eza -al --color=always --group-directories-first --icons' # preferred listing
alias la='eza -a --color=always --group-directories-first --icons' # all files and dirs
alias ll='eza -la --color=always --group-directories-first --icons' # long format
alias lt='eza -aT --color=always --group-directories-first --icons' # tree listing alias l.="eza -a | grep -e '^\.'" # show only dotfiles

# Common use
alias tarnow='tar -acf '
alias untar='tar -zxvf '
alias wget='wget -c '
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
alias ..='z ..'
alias ...='z ../..'
alias ....='z ../../..'
alias .....='z ../../../..'
alias ......='z ../../../../..'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias k='kubectl'
alias ctx='kubectx'
alias cat='bat'
alias cd='z'
alias homelab 'cd ~/git/homelab/'

# Get the error messages from journalctl
alias jctl="journalctl -p 3 -xb"

# Set default editor to neovim
set -gx EDITOR nvim

# Mise configuration
if command -v mise >/dev/null
    mise activate fish | source
end
# Starship configuration for Fish
starship init fish | source

# Zoxide configuration for Fish
zoxide init fish | source

# Atuin configuration for Fish
atuin init fish | source
