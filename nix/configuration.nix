# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "zbook"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  
  # Enabling Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Configuring Garbage Collector
  nix.gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 10d";
  };

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Costa_Rica";

  # Select internationalisation properties.
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

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  # GNOME Desktop configuration
  services.gnome.core-developer-tools.enable = true;

  # Declarative GNOME dconf settings (system-wide defaults)
  programs.dconf = {
    enable = true;
    profiles.user.databases = [{
      settings = with lib.gvariant; {

        "org/gnome/desktop/interface" = {
          color-scheme = "prefer-dark";
          accent-color = "slate";
          enable-hot-corners = false;
          show-battery-percentage = true;
        };

        # Wallpaper
        "org/gnome/desktop/background" = {
          picture-uri = "file:///run/current-system/sw/share/backgrounds/gnome/adwaita-l.jxl";
          picture-uri-dark = "file:///run/current-system/sw/share/backgrounds/gnome/adwaita-l.jxl";
          picture-options = "zoom";
        };

        # Workspaces
        "org/gnome/mutter" = {
          dynamic-workspaces = true;
          edge-tiling = false;
          workspaces-only-on-primary = true;
        };

        "org/gnome/desktop/wm/preferences" = {
          num-workspaces = mkInt32 4;
          button-layout = ":";
        };

        # Workspace switching keybindings
        "org/gnome/desktop/wm/keybindings" = {
          switch-to-workspace-1 = [ "<Super>1" ];
          switch-to-workspace-2 = [ "<Super>2" ];
          switch-to-workspace-3 = [ "<Super>3" ];
          switch-to-workspace-4 = [ "<Super>4" ];
          move-to-workspace-1 = [ "<Super><Shift>1" ];
          move-to-workspace-2 = [ "<Super><Shift>2" ];
          move-to-workspace-3 = [ "<Super><Shift>3" ];
          move-to-workspace-4 = [ "<Super><Shift>4" ];
        };

        # Disable default Super+N app switching (conflicts with workspace switching)
        "org/gnome/shell/keybindings" = {
          switch-to-application-1 = mkEmptyArray type.string;
          switch-to-application-2 = mkEmptyArray type.string;
          switch-to-application-3 = mkEmptyArray type.string;
          switch-to-application-4 = mkEmptyArray type.string;
        };

        # Mouse & Touchpad
        "org/gnome/desktop/peripherals/mouse" = {
          accel-profile = "flat";
        };

        "org/gnome/desktop/peripherals/touchpad" = {
          natural-scroll = false;
          two-finger-scrolling-enabled = true;
        };

        # Extensions habilitadas
        "org/gnome/shell" = {
          disable-user-extensions = false;
          enabled-extensions = [
            "grimble@lmt.github.io"
            "caffeine@patapon.info"
            "appindicatorsupport@rgcjonas.gmail.com"
          ];
        };

        # Keybindings de Grimble (vim-style)
        "org/gnome/shell/extensions/grimble" = {
          keybinding-config = "Custom";
          keybinding-close = [ "<Super>q" ];
          keybinding-focus = [ "<Super>space" ];
          keybinding-focus-bottom = [ "<Super>j" ];
          keybinding-focus-left = [ "<Super>h" ];
          keybinding-focus-right = [ "<Super>l" ];
          keybinding-focus-top = [ "<Super>k" ];
          keybinding-maximize = [ "<Super>f" ];
          keybinding-move-bottom = [ "<Super><Shift>k" ];
          keybinding-move-left = [ "<Super><Shift>h" ];
          keybinding-move-right = [ "<Super><Shift>l" ];
          keybinding-move-top = [ "<Super><Shift>k" ];
          keybinding-resize = [ "<Super>r" ];
          keybinding-search = [ "<Control><Alt>b" ];
          keybinding-open-settings = [ "<Control><Super>g" ];
          tile-padding = mkInt32 4;
        };
      };
    }];
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.fsanabria = {
    isNormalUser = true;
    description = "Francisco Sanabria";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.fish;
    packages = with pkgs; [
    #  thunderbird
    ];
  };

  # Install firefox.
  programs.firefox.enable = true;

  # Enable fish
  programs.fish.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    gcc
    tree-sitter
    atuin
    vim
    wget
    neovim
    tmux
    ghostty
    eza
    zoxide
    fd
    espanso-wayland
    obsidian
    bazaar
    emacs
    vesktop
    kmonad
    devcontainer
    devpod
    git
    lazygit
    curl
    fzf
    ripgrep
    bat
    jetbrains-toolbox
    anki
    chezmoi
    gh
    podman
    claude-code
    vscode
    cider-2
    libreoffice-fresh
    fish
    unzip
    btop
    fastfetch
    siyuan
    starship
    helix
    gnome-extension-manager
    gnomeExtensions.grimble-tiling-wm
    gnomeExtensions.caffeine
    gnomeExtensions.appindicator
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Enable Flatpak
  services.flatpak.enable = true;

  # Enable AppImages
  programs.appimage.enable = true;
  programs.appimage.binfmt = true;
  
  # KMonad System Service Configuration and Creation
  systemd.services.kmonad = {
    description = "Kmonad keyboard remapper";
    after = [ "systemd-udev-settle.service" ];
    wantedBy = [ "multi-user.target" ];

    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.kmonad}/bin/kmonad /home/fsanabria/.config/kmonad/config.kbd";
      Restart = "on-failure";
      # Kmonad access to root user
      User = "root";
    };
  };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?

}
