{ config, lib, pkgs, ... }:

{
  # ── Login: greetd + ReGreet (GTK greeter, Wayland-native) ────────────
  services.displayManager.regreet = {
    enable = true;
    font = {
      name = "Adwaita Sans";
      package = pkgs.adwaita-fonts;
      size = 14;
    };
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };
    settings = {
      background = {
        path = "${pkgs.gnome-backgrounds}/share/backgrounds/gnome/adwaita-d.jxl";
        fit = "Cover";
      };
      GTK = {
        application_prefer_dark_theme = true;
      };
      appearance = {
        greeting_msg = "Welcome back!";
      };
    };
  };

  # ── Sway (SwayFX: blur, shadows, rounded corners) ───────────────────
  # The compositor is SwayFX; per-user config (islands waybar, matugen
  # theming, 12 workspaces, scripts) lives in modules/home/sway.nix.
  programs.sway = {
    enable = true;
    package = pkgs.swayfx;
    wrapperFeatures.gtk = true;
    extraPackages = with pkgs; [
      swaylock        # Screen locker
      swayidle        # Idle management (lock/suspend)
      swaybg          # Wallpaper setter (fallback when awww is off)
    ];
  };

  # ── XDG Desktop Portal (screen sharing, file picker, etc.) ──────────
  xdg.portal = {
    extraPortals = [ pkgs.xdg-desktop-portal-wlr pkgs.xdg-desktop-portal-gtk ];
    config.common.default = [ "wlr" "gtk" ];
  };

  # ── Sway ecosystem packages (no bundled apps — bring your own) ──────
  environment.systemPackages = with pkgs; [
    # -- Bar, launcher, notifications, power menu --
    waybar
    fuzzel              # dmenu-style picker (launcher, clipboard, wallpaper)
    swaynotificationcenter
    wlogout             # Power menu
    swayr               # MRU window switcher (Alt+Tab)

    # -- Terminal --
    foot

    # -- Clipboard --
    wl-clipboard        # wl-copy / wl-paste
    cliphist            # Clipboard history manager

    # -- Screenshots & Screen Recording --
    grim
    slurp
    swappy              # Annotate screenshots
    wf-recorder         # Screen recording (clips)
    wshowkeys           # Keystroke overlay for recordings

    # -- Wallpaper & dynamic theming --
    matugen             # Wallpaper-driven colors
    awww                # Smooth wallpaper daemon (renamed from swww)

    # -- Night light & display profiles --
    gammastep
    kanshi

    # -- Display & Brightness --
    brightnessctl

    # -- Media Keys --
    playerctl           # MPRIS media player control

    # -- System Tray & Audio --
    networkmanagerapplet
    pavucontrol
    pamixer

    # -- Bluetooth --
    blueman             # GTK Bluetooth manager (tray applet)

    # -- USB Auto-mount --
    udiskie             # User-space auto-mount for removable media

    # -- Keyring / Secrets --
    gnome-keyring       # Credential storage (Wi-Fi, SSH, GPG)
    libsecret           # Secret service API

    # -- Auth & notifications --
    polkit_gnome        # Polkit authentication agent (GUI prompts)
    libnotify           # notify-send

    # -- File Manager (Dolphin) --
    kdePackages.dolphin
    kdePackages.dolphin-plugins
    kdePackages.ark                      # Archive extraction
    kdePackages.kio-extras               # SMB/network browsing, thumbnails
    kdePackages.kio-fuse                 # Mount remote locations via FUSE
    kdePackages.ffmpegthumbs             # Video thumbnails
    kdePackages.kdegraphics-thumbnailers # Image thumbnails

    # -- Samba / CIFS --
    samba
    cifs-utils

    # -- Misc Wayland Utilities --
    wev                 # Wayland event viewer (debug keybinds)
    xdg-utils           # xdg-open and friends
    procps              # pgrep/pkill (used by the sway scripts)
  ];

  # ── Security: allow swaylock to verify passwords ────────────────────
  security.pam.services.swaylock = {};

  # ── Polkit (needed for privileged actions / SMB mounts) ─────────────
  security.polkit.enable = true;

  # ── SMB / Network shares (Dolphin via GVFS + KIO) ───────────────────
  services.gvfs.enable = true;
  services.samba = {
    enable = true;
    openFirewall = false;               # Solo cliente, no compartir
  };

  # ── Bluetooth (bluez + blueman GUI) ──────────────────────────────────
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  # ── USB Auto-mount (udisks2 + udiskie) ──────────────────────────────
  services.udisks2.enable = true;

  # ── Keyring / Secret Service (gnome-keyring) ────────────────────────
  services.gnome.gnome-keyring.enable = true;
  security.pam.services.login.enableGnomeKeyring = true;

  # ── Environment variables for Wayland ───────────────────────────────
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";           # Electron apps on Wayland
    ELECTRON_OZONE_PLATFORM_HINT = "wayland";  # Force Electron Wayland native
    MOZ_ENABLE_WAYLAND = "1";       # Firefox Wayland
    QT_QPA_PLATFORM = "wayland";    # Qt apps on Wayland
    SDL_VIDEODRIVER = "wayland";
    _JAVA_AWT_WM_NONREPARENTING = "1";
  };
}
