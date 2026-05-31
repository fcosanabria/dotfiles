{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    /etc/nixos/hardware-configuration.nix
  ];

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 5;
  boot.loader.timeout = 10;
  boot.loader.efi.canTouchEfiVariables = true;

  # Hostname
  networking.hostName = "writing-deck";

  # Networking - NetworkManager with nmtui
  networking.networkmanager.enable = true;

  # Timezone
  time.timeZone = "America/Costa_Rica";

  # Locale
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "es_CR.UTF-8";
    LC_IDENTIFICATION = "es_CR.UTF-8";
    LC_MEASUREMENT = "es_CR.UTF-8";
    LC_MONETARY = "es_CR.UTF-8";
    LC_NAME = "es_CR.UTF-8";
    LC_NUMERIC = "es_CR.UTF-8";
    LC_PAPER = "es_CR.UTF-8";
    LC_TELEPHONE = "es_CR.UTF-8";
    LC_TIME = "es_CR.UTF-8";
  };

  # No X11/Wayland - pure console setup
  # We only enable services needed for console operations

  # kmscon - modern console with fonts and 256 colors
  programs.kmscon = {
    enable = true;
    font = "terminus";
    fontSize = 14;
  };

  # Enable getty on tty1 with kmscon
  systemd.services.kmsconvt = {
    wantedBy = [ "getty.target" ];
    after = [ "systemd-user-sessions.service" "ceck.service" ];
    before = [ "getty.target" ];
    serviceConfig = {
      ExecStart = "";
      ExecStart = lib.mkOverride 1 "${pkgs.kmscon}/bin/kmscon --login -- /bin/login -f fsanabria";
      StandardInput = "tty";
      StandardOutput = "tty";
      TTYPath = "/dev/tty1";
      TTYReset = "yes";
      TTYVHangup = "yes";
      Restart = "no";
    };
  };

  # Packages - minimal set for writing deck
  environment.systemPackages = with pkgs; [
    # Editor
    neovim

    # Terminal utilities
    tmux
    git
    fish

    # Network manager TUI
    networkmanager

    # Syncthing
    syncthing
    syncthing-inotify

    # Battery and brightness
    acpi
    light

    # Misc
    htop
    tree
    wget
    curl
  ];

  # Fonts for console
  fonts.packages = with pkgs; [
    terminus-font
    terminus-font-nerdfont
    nerdfonts
  ];

  # User account
  users.users.fsanabria = {
    isNormalUser = true;
    description = "Francisco Sanabria";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.fish;
  };

  # Home Manager for user config
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.fsanabria = { pkgs, ... }: {
    home.username = "fsanabria";
    home.homeDirectory = "/home/fsanabria";
    home.stateVersion = "25.11";

    # Tmux configuration - writer deck style
    programs.tmux = {
      enable = true;
      enableBashIntegration = false;

      extraConfig = ''
        set -g default-terminal "tmux-256color"
        set -g base-index 0
        setw -g pane-base-index 0
        set -g default-shell "${pkgs.fish}/bin/fish"

        # Vi keys
        set -g status-keys vi
        set -g mode-keys vi

        # Status bar at top
        set -g status-position top

        # Green status bar
        set -g status-style bg=green,fg=black

        # Brightness keybindings (F8/F9)
        bind -n F8 run-shell "light -U 10"
        bind -n F9 run-shell "light -A 10"

        # Battery readout
        set-window-option -g status-right "#(acpi -b | grep -m1 -o -P '.{0,2}%')"
      '';
    };

    # Neovim configuration
    programs.neovim = {
      enable = true;
      defaultEditor = true;
      plugins = with pkgs.vimPlugins; [
        vim-vimwiki
      ];
      extraConfig = ''
        " Writer deck vim config
        colorscheme blue
        set linebreak
        set wildmenu
        set showcmd
        set relativenumber
        set number

        " Vimwiki
        let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
        let g:vimwiki_global_ext = 0
      '';
    };

    # Git config
    programs.git = {
      enable = true;
      userName = "Francisco Sanabria";
      userEmail = "fsanabria@protonmail.com";
    };

    # Fish shell
    programs.fish = {
      enable = true;
    };
  };

  # Syncthing service
  services.syncthing = {
    enable = true;
    user = "fsanabria";
    dataDir = "/home/fsanabria/.syncthing";
  };

  # Bashrc: auto-launch tmux with vimwiki on tty1
  environment.etc."profile".text = ''
    # Launch tmux if we aren't already running tmux and we're in the default tty
    if [ -z "${TMUX}" ] && [ $(tty) == "/dev/tty1" ]; then
      exec tmux new-session -d 'nvim -c VimwikiIndex' \; attach
    fi
  '';

  system.stateVersion = "25.11";
}