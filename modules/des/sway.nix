{ config, lib, pkgs, ... }:

{
  # ── Display Manager (greetd + tuigreet) ─────────────────────────────
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --time --sessions /run/current-system/sw/share/wayland-sessions";
        user = "greeter";
      };
    };
  };

  environment.pathsToLink = [ "/share/wayland-sessions" ];

  # ── Sway Window Manager ─────────────────────────────────────────────
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    extraPackages = with pkgs; [
      swaylock        # Screen locker
      swayidle        # Idle management (lock/suspend)
      swaybg          # Wallpaper setter
    ];
  };

  # ── XDG Desktop Portal (screen sharing, file picker, etc.) ──────────
  xdg.portal = {
    extraPortals = [ pkgs.xdg-desktop-portal-wlr pkgs.xdg-desktop-portal-gtk ];
    config.common.default = [ "wlr" "gtk" ];
  };

  # ── Sway ecosystem packages ─────────────────────────────────────────
  environment.systemPackages = with pkgs; [
    # -- Launcher & Notifications --
    rofi
    mako

    # -- Screenshots & Screen Recording --
    grim
    slurp
    wf-recorder

    # -- Clipboard --
    wl-clipboard        # wl-copy / wl-paste
    cliphist            # Clipboard history manager

    # -- Display & Brightness --
    brightnessctl       # Backlight / LED control
    kanshi              # Auto display profile switching
    wdisplays           # GUI for display layout

    # -- Media Keys --
    playerctl           # MPRIS media player control

    # -- File Manager --
    kdePackages.dolphin
    kdePackages.kio-extras
    samba
    cifs-utils
    kdePackages.ark

    # -- Authentication --
    kdePackages.polkit-kde-agent-1

    # -- System Tray & Audio --
    networkmanagerapplet
    pavucontrol

    # -- Misc Wayland Utilities --
    wev                 # Wayland event viewer (debug keybinds)
    xdg-utils           # xdg-open and friends
  ];

  # ── Security: allow swaylock to verify passwords ────────────────────
   security.pam.services.swaylock = {};

  # ── Polkit (needed for privileged actions / SMB mounts) ─────────────
  security.polkit.enable = true;

  # ── Environment variables for Wayland ───────────────────────────────
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";           # Electron apps on Wayland
    MOZ_ENABLE_WAYLAND = "1";       # Firefox Wayland
    QT_QPA_PLATFORM = "wayland";    # Qt apps on Wayland
    SDL_VIDEODRIVER = "wayland";
    _JAVA_AWT_WM_NONREPARENTING = "1";
  };
}
