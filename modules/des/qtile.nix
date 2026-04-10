{ config, pkgs, ... }:

{
  # Display Manager (greetd + tuigreet for standalone Wayland WMs)
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --time --sessions /run/current-system/sw/share/wayland-sessions:/run/current-system/sw/share/xsessions";
        user = "greeter";
      };
    };
  };

  # Ensure session .desktop files are linked into the system profile
  environment.pathsToLink = [ "/share/wayland-sessions" "/share/xsessions" ];

  # XDG Desktop Portal (screen sharing, file picker, etc.)
  xdg.portal = {
    extraPortals = [ pkgs.xdg-desktop-portal-wlr pkgs.xdg-desktop-portal-gtk ];
    config.common.default = [ "wlr" "gtk" ];
  };

  # QTile Window Manager
  services.xserver.windowManager.qtile = {
    enable = true;
    extraPackages = p: with p; [ qtile-extras ];
  };

  # QTile-useful packages
  environment.systemPackages = with pkgs; [
    # -- Core WM --
    rofi                # App launcher
    dunst               # Notifications
    swaybg              # Wallpaper setter (Wayland)
    grim                # Screenshots (Wayland)
    slurp               # Region selector for grim
    brightnessctl       # Brightness control

    # -- File Manager --
    kdePackages.dolphin    # Qt file manager
    kdePackages.kio-extras # SMB/CIFS support for Dolphin
    samba               # SMB client libraries
    cifs-utils          # Mount SMB shares via fstab or manually
    kdePackages.ark     # Archive manager (integrates with Dolphin)

    # -- Authentication (needed for SMB mounts on Wayland) --
    kdePackages.polkit-kde-agent-1

    # -- System Tray & Audio --
    networkmanagerapplet
    pavucontrol
  ];
}
