{ pkgs, ... }:

{
  home-manager.users.fsanabria = {
    home.packages = [ pkgs.smug ];

    xdg.configFile."smug/nix-config.yml".text = ''
      session: nix-config
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

    xdg.configFile."smug/notes-migration.yml".text = ''
      session: notes-migration
      root: ~/
      windows:
        - name: Editor
          layout: even-horizontal
          commands:
            - nvim ~/Notes/
          panes:
            - commands:
                - nvim ~/Downloads/Workspace.md
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
      '';
    };
  };
}
