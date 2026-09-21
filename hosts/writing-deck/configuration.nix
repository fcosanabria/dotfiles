{
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ../../modules/system/syncthing.nix
    ../../modules/system/openscreen.nix
    /etc/nixos/hardware-configuration.nix
    ../../modules/home/tmux.nix
    ../../modules/home/nvim.nix
  ];

  # Kernel params - force landscape in TTY/kmscon.
  # Keep both connector names as fallback (unknown one is ignored by the kernel).
  # If orientation is upside-down, swap 90 <-> 270 and fbcon rotate 1 <-> 3.
  boot.kernelParams = [
    "video=DSI-1:rotate=90"
    "video=eDP-1:rotate=90"
    "fbcon=rotate:1"
  ];

  # Bootloader and Kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 5;
  boot.loader.timeout = 10;
  boot.loader.efi.canTouchEfiVariables = true;

  # Hostname
  networking.hostName = "writing-deck";

  # Networking - NetworkManager with nmtui
  networking.networkmanager.enable = true;

  # SSH access for remote administration from local network.
  services.openssh.enable = true;
  networking.firewall.allowedTCPPorts = [ 22 ];

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

  # X11 - bare Openbox (no DE, no display manager). Trilium Notes runs here.
  services.xserver = {
    enable = true;
    xkb = {
      layout = "us";
      variant = "";
    };
    windowManager.openbox.enable = true;
  };

  # Mesa/GL drivers (needed by Electron apps like Trilium)
  hardware.graphics.enable = true;

  # Single-app setup; disable desktop sandbox integrations that pull portal
  # requirements and are unnecessary here.
  services.flatpak.enable = false;
  xdg.portal = {
    enable = false;
    extraPortals = lib.mkForce [ ];
  };
  programs.appimage.enable = false;
  programs.appimage.binfmt = false;

  # Fish must be enabled system-wide to be used as login shell
  programs.fish.enable = true;

  # kmscon - modern console with Adwaita Mono Nerd Font, autologin
  services.kmscon = {
    enable = true;
    config = {
      rotate = "right";
      font-size = 12;
      font-name = "Adwaita Mono";
    };
  };

  # Kanata - apply the same keyboard behavior used in the main setup.
  services.kanata = {
    enable = true;
    keyboards.default = {
      extraDefCfg = "process-unmapped-keys yes";
      config = ''
        (defsrc
          caps h j k l spc m lmet lalt ralt lsft rsft
          t    r w a   s c   v n   x e i o u
        )

        (defalias
          cap (tap-hold 100 200 esc (layer-while-held nav))
          spa (layer-while-held spanish)

          a-acc (fork (unicode á) (unicode Á) (lsft rsft))
          e-acc (fork (unicode é) (unicode É) (lsft rsft))
          i-acc (fork (unicode í) (unicode Í) (lsft rsft))
          o-acc (fork (unicode ó) (unicode Ó) (lsft rsft))
          u-acc (fork (unicode ú) (unicode Ú) (lsft rsft))
          n-acc (fork (unicode ñ) (unicode Ñ) (lsft rsft))
        )

        (deflayer base
          @cap h j k l spc m lalt lmet @spa _    _
          t    r w a   s c   v n   x e i o u
        )

        (deflayer nav
          _    left down up right bspc ret _    _    _    _    _
          C-t  C-r C-w C-a C-s C-c C-v C-n C-x e i o u
        )

        (deflayer spanish
          _    _    _    _    _    _    _    _    _    _    _    _
          _    _    _    @a-acc _    _    _    @n-acc _ @e-acc @i-acc @o-acc @u-acc
        )
      '';
    };
  };

  # Autologin on tty1 (console) and tty2 (X/Openbox)
  services.getty.autologinUser = "fsanabria";
  systemd.services."getty@tty2" = {
    enable = true;
    serviceConfig.ExecStart = [
      "" # reset the template's ExecStart
      "${lib.getExe' pkgs.util-linux "agetty"} --autologin fsanabria --noclear tty2 linux"
    ];
  };

  # Nix Flakes
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

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
    # X11/Openbox session
    trilium-desktop
    alacritty
    xinit
    xrandr
    xauth
  ];

  # Fonts
  fonts.packages = with pkgs; [
    nerd-fonts.adwaita-mono
  ];

  # User account
  users.users.fsanabria = {
    isNormalUser = true;
    description = "Francisco Sanabria";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    shell = pkgs.fish;
  };

  # lazyvim-nix home-manager module and LazyVim config are in ../../modules/home/nvim.nix

  # Home Manager
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.backupFileExtension = "hm-backup-1";
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

    # Fish - auto-launch tmux on tty1 login, X/Openbox on tty2
    programs.fish = {
      enable = true;
      loginShellInit = ''
        # Auto-launch tmux with nvim on tty1
        if not set -q TMUX; and test (tty) = /dev/tty1
            exec tmux new-session nvim
        end
        # Start X/Openbox on tty2
        if test (tty) = /dev/tty2
            exec startx
        end
      '';
    };

    # X11 session: start Openbox (with autostart) on `startx`
    home.file.".xinitrc" = {
      executable = true;
      text = ''
        #!/bin/sh
        [ -f "$HOME/.config/openbox/autostart" ] && . "$HOME/.config/openbox/autostart"
        exec openbox
      '';
    };

    # Openbox: minimal config, no menus/panels. A = Alt key.
    home.file.".config/openbox/rc.xml" = {
      text = ''
        <?xml version="1.0" encoding="UTF-8"?>
        <openbox_config xmlns="http://openbox.org/3.4/rc">
          <placement>
            <policy>Smart</policy>
          </placement>
          <focus>
            <focusNew>yes</focusNew>
            <followMouse>no</followMouse>
          </focus>
          <desktops>
            <number>1</number>
            <firstdesk>1</firstdesk>
          </desktops>
          <keyboard>
            <keybind key="A-t">
              <action name="Execute">
                <command>alacritty</command>
              </action>
            </keybind>
            <keybind key="A-F4">
              <action name="Close"/>
            </keybind>
            <keybind key="A-Tab">
              <action name="NextWindow"/>
            </keybind>
            <keybind key="A-Shift-Tab">
              <action name="PreviousWindow"/>
            </keybind>
          </keyboard>
          <mouse>
            <context name="Frame">
              <mousebind button="A-Left" action="Press"><action name="FocusAndRaise"/></mousebind>
              <mousebind button="A-Left" action="Drag"><action name="Move"/></mousebind>
              <mousebind button="A-Right" action="Press"><action name="FocusAndRaise"/></mousebind>
              <mousebind button="A-Right" action="Drag"><action name="Resize"/></mousebind>
            </context>
          </mouse>
        </openbox_config>
      '';
    };

    # Openbox autostart: rotate portrait panel + launch Trilium
    home.file.".config/openbox/autostart" = {
      executable = true;
      text = ''
        #!/bin/sh
        # Portrait panel - same rotation the kernel applies to the console.
        for c in DSI-1 eDP-1; do
          xrandr --output "$c" --rotate right 2>/dev/null && break
        done

        # Writing app
        trilium-desktop &
      '';
    };
  };

  system.stateVersion = "25.11";
}
