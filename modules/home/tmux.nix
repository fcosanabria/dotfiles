{ pkgs, ... }:

{
  home-manager.users.fsanabria = {
    home.packages = [ pkgs.smug ];

    xdg.configFile."smug/nix.yml".text = ''
      session: nix
      root: ~/nix
      windows:
        - name: dev
          selected: true
          layout: main-vertical
          commands:
            - nvim
          panes:
            - type: horizontal
              commands:
                - opencode
            - type: vertical
              commands:
                - fish
    '';

    programs.tmux = {
      enable = true;
      shell = "${pkgs.fish}/bin/fish";
      terminal = "tmux-256color";
      prefix = "C-Space";
      baseIndex = 0;
      escapeTime = 0;
      historyLimit = 50000;
      mouse = true;
      keyMode = "vi";

      plugins = with pkgs.tmuxPlugins; [
        sensible
        vim-tmux-navigator
        yank
      ];

      extraConfig = ''
        # Set true color
        set-option -sa terminal-overrides ",xterm*:Tc"

        # Send prefix to nested session
        bind C-Space send-prefix

        # Shift Alt vim keys to switch windows
        bind -n M-H previous-window
        bind -n M-L next-window

        # Status bar at the top
        set -g status-position top

        # Oxocarbon Theme — color palette
        oxo_bg="#161616"
        oxo_fg="#dde1e6"
        oxo_dim="#525252"
        oxo_red="#ee5396"
        oxo_green="#42be65"
        oxo_blue="#33b1ff"
        oxo_cyan="#3ddbd9"
        oxo_purple="#be95ff"
        oxo_yellow="#ffe97b"
        oxo_teal="#08bdba"

        # Status bar styling
        set -g status-style "bg=$oxo_bg,fg=$oxo_fg"
        set -g status-left-length 50
        set -g status-right-length 100
        set -g status-interval 5

        # Left status: session name (purple → cyan)
        set -g status-left "#[fg=$oxo_bg,bg=$oxo_purple,bold] 󰇄 #S #[fg=$oxo_purple,bg=$oxo_bg,bold]▏"

        # Window status format: each window is a separate block
        set -g window-status-format "#[fg=$oxo_dim,bg=$oxo_bg]  #[fg=$oxo_fg] #I:#W #[fg=$oxo_dim]  "
        set -g window-status-current-format "#[fg=$oxo_teal,bg=$oxo_bg,bold]  #[fg=$oxo_teal,bg=$oxo_bg,bold] #I:#W #[fg=$oxo_teal,bg=$oxo_bg]  "
        set -g window-status-separator ""
        set -g window-status-activity-style "fg=$oxo_yellow"
        set -g window-status-bell-style "fg=$oxo_red,bold"

        # Right status: date (blue) → time (green) → background
        set -g status-right "#[fg=$oxo_blue,bg=$oxo_bg]  %Y-%m-%d #[fg=$oxo_dim]│#[fg=$oxo_green,bg=$oxo_bg]  %H:%M "

        # Pane borders
        set -g pane-border-style "fg=$oxo_dim"
        set -g pane-active-border-style "fg=$oxo_teal"

        # Message styling
        set -g message-style "fg=$oxo_bg,bg=$oxo_teal,bold"
        set -g message-command-style "fg=$oxo_bg,bg=$oxo_purple,bold"

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
      '';
    };
  };
}
