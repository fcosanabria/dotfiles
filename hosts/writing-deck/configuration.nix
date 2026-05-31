{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    /etc/nixos/hardware-configuration.nix
    ../../modules/home/tmux.nix
    ../../modules/home/nvim.nix
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

  # Fish must be enabled system-wide to be used as login shell
  programs.fish.enable = true;

  # kmscon - modern console with Adwaita Mono Nerd Font, autologin
  services.kmscon = {
    enable = true;
    fonts = [
      { name = "Adwaita Mono"; package = pkgs.nerd-fonts.adwaita-mono; }
    ];
    extraConfig = ''
      font-size=12
    '';
  };

  # Autologin on tty1
  services.getty.autologinUser = "fsanabria";

  # Nix Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Garbage Collector
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  # Packages - minimal set for writing deck
  environment.systemPackages = with pkgs; [
    git
    tmux
    fish
    acpi
    brightnessctl
    htop
    wget
    curl
    tree
  ];

  # Fonts
  fonts.packages = with pkgs; [
    nerd-fonts.adwaita-mono
  ];

  # User account
  users.users.fsanabria = {
    isNormalUser = true;
    description = "Francisco Sanabria";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.fish;
  };

  # lazyvim-nix home-manager module and LazyVim config are in ../../modules/home/nvim.nix

  # Home Manager
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.backupFileExtension = "hm-backup";
  home-manager.users.fsanabria = { pkgs, ... }: {
    home.username = "fsanabria";
    home.homeDirectory = "/home/fsanabria";
    home.stateVersion = "25.11";

    # Git
    programs.git = {
      enable = true;
      settings.user.name = "Francisco Sanabria";
      settings.user.email = "fsanabria@fastmail.com";
    };

    # Fish - auto-launch tmux on tty1 login
    programs.fish = {
      enable = true;
      loginShellInit = ''
        # Auto-launch tmux with nvim on tty1
        if not set -q TMUX; and test (tty) = /dev/tty1
            exec tmux new-session nvim
        end
      '';
    };
  };

  # Syncthing service
  services.syncthing = {
    enable = true;
    user = "fsanabria";
    dataDir = "/home/fsanabria/.syncthing";
  };

  system.stateVersion = "25.11";
}
