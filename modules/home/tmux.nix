{ pkgs, ... }:

{
  home-manager.users.fsanabria = {
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

        # Teide Darker Theme — color palette
        teide_bg="#171B20"
        teide_fg="#E7EAEE"
        teide_text="#171B20"
        teide_comment="#586172"
        teide_date="#5CCEFF"
        teide_time="#FFE77A"
        teide_alert="#F97791"
        teide_pomodoro="#F73F64"
        teide_session="#38FFA5"
        teide_window="#545c7e"

        # Status bar styling
        set -g status-style "bg=$teide_bg,fg=$teide_fg"
        set -g status-left-length 50
        set -g status-right-length 100
        set -g status-interval 5

        # Left status: session name
        set -g status-left "#[fg=$teide_bg,bg=$teide_session,bold] 󰇄 #S #[fg=$teide_session,bg=$teide_bg]"

        # Window status format
        set -g window-status-format "#[fg=$teide_fg,bg=$teide_text] #I:#W #[fg=$teide_text,bg=$teide_bg]"
        set -g window-status-current-format "#[fg=$teide_bg,bg=$teide_date,bold] #I:#W #[fg=$teide_date,bg=$teide_bg]"
        set -g window-status-separator ""

        # Right status: date & time
        set -g status-right "#[fg=$teide_window,bg=$teide_bg]#[fg=$teide_fg,bg=$teide_window]  %Y-%m-%d #[fg=$teide_time,bg=$teide_window]#[fg=$teide_bg,bg=$teide_time,bold]  %H:%M "

        # Pane borders
        set -g pane-border-style "fg=$teide_window"
        set -g pane-active-border-style "fg=$teide_session"

        # Message styling
        set -g message-style "fg=$teide_bg,bg=$teide_session,bold"
        set -g message-command-style "fg=$teide_bg,bg=$teide_date,bold"

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
