{ pkgs, ... }:

{
  # tmux config system-wide (/etc/tmux.conf). Los plugins se referencian por
  # su ruta en el store. smug (session manager) se configura manual en
  # ~/.config/smug (smug solo lee ese directorio).
  environment.etc."tmux.conf".text = ''
    # ── Base ────────────────────────────────────────────────────────────
    set -g default-shell ${pkgs.fish}/bin/fish
    set -g default-terminal "tmux-256color"
    set -g base-index 0
    setw -g pane-base-index 0
    set -s escape-time 0
    set -g history-limit 50000
    set -g mouse on
    setw -g mode-keys vi

    # Prefix C-Space
    unbind C-b
    set -g prefix C-Space

    # ── Personalización ─────────────────────────────────────────────────
    # Set true color
    set-option -sa terminal-overrides ",xterm*:Tc"

    # Send prefix to nested session
    bind C-Space send-prefix

    # Shift Alt vim keys to switch windows
    bind -n M-H previous-window
    bind -n M-L next-window

    # Status bar at the top
    set -g status-position top

    # Status bar transparente con el tema por defecto de tmux
    set -g status-style bg=default

    # Window name format: directory + running program
    set -g automatic-rename-format '#{b:pane_current_path}:#{pane_current_command}'

    # General
    set -g set-clipboard on
    set -g detach-on-destroy off
    set -g allow-passthrough on
    set -g extended-keys on

    # Vi copy mode keybindings
    bind-key -T copy-mode-vi v send-keys -X begin-selection
    bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
    bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel

    # Open splits/windows in current path
    bind '"' split-window -v -c "#{pane_current_path}"
    bind % split-window -h -c "#{pane_current_path}"
    bind c new-window -c "#{pane_current_path}"

    # ── Plugins (run-shell sobre la ruta del store) ─────────────────────
    run-shell ${pkgs.tmuxPlugins.sensible}/share/tmux-plugins/sensible/sensible.tmux
    run-shell ${pkgs.tmuxPlugins.vim-tmux-navigator}/share/tmux-plugins/vim-tmux-navigator/vim-tmux-navigator.tmux
    run-shell ${pkgs.tmuxPlugins.yank}/share/tmux-plugins/yank/yank.tmux
  '';
}
