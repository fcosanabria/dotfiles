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

        # Kanagawa Dragon Theme — color palette
        dragon_bg="#181616"
        dragon_fg="#c5c9c5"
        dragon_gold="#c4b28a"
        dragon_blue="#8ba4b0"
        dragon_gray="#282727"
        dragon_darkgray="#0d0c0c"

        # Status bar styling
        set -g status-style "bg=$dragon_bg,fg=$dragon_fg"
        set -g status-left-length 50
        set -g status-right-length 100
        set -g status-interval 5

        # Left status: session name
        set -g status-left "#[fg=$dragon_bg,bg=$dragon_gold,bold] 󰇄 #S #[fg=$dragon_gold,bg=$dragon_bg]"

        # Window status format
        set -g window-status-format "#[fg=$dragon_fg,bg=$dragon_darkgray] #I:#W #[fg=$dragon_darkgray,bg=$dragon_bg]"
        set -g window-status-current-format "#[fg=$dragon_bg,bg=$dragon_blue,bold] #I:#W #[fg=$dragon_blue,bg=$dragon_bg]"
        set -g window-status-separator ""

        # Right status: date & time
        set -g status-right "#[fg=$dragon_gray,bg=$dragon_bg]#[fg=$dragon_fg,bg=$dragon_gray]  %Y-%m-%d #[fg=$dragon_gold,bg=$dragon_gray]#[fg=$dragon_bg,bg=$dragon_gold,bold]  %H:%M "

        # Pane borders
        set -g pane-border-style "fg=$dragon_gray"
        set -g pane-active-border-style "fg=$dragon_gold"

        # Message styling
        set -g message-style "fg=$dragon_bg,bg=$dragon_gold,bold"
        set -g message-command-style "fg=$dragon_bg,bg=$dragon_blue,bold"

        # Window name format: directory + running program
        set -g automatic-rename-format '#{b:pane_current_path}:#{pane_current_command}'

        # General
        set -g set-clipboard on
        set -g detach-on-destroy off
        set -g allow-passthrough on

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
