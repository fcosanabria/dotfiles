source /usr/share/cachyos-fish-config/cachyos-config.fish

# Setting up TMUX on startup
if type -q tmux
    if not test -n "$TMUX"
        tmux attach-session -t default; or tmux new-session -s default
    end
end

# Start ssh-agent if not already running
if not pgrep -f ssh-agent >/dev/null
    eval (ssh-agent -c)
end

# Set SSH_AUTH_SOCK and SSH_AGENT_PID if they're not set
if not set -q SSH_AUTH_SOCK
    set -gx SSH_AUTH_SOCK (find /tmp -name "agent.*" -user (whoami) 2>/dev/null | head -1)
end

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
alias homelab='cd ~/git/homelab/'
alias notes='cd ~/vaults/vault/'
alias repos='cd ~/git/'

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

# opencode
fish_add_path /home/fcosanabria/.opencode/bin
fish_add_path /home/bin
