{ config, pkgs, ... }:

{
  # Display Manager (greetd + tuigreet for standalone Wayland WMs)
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd qtile start -b wayland";
        user = "greeter";
      };
    };
  };

  # QTile Window Manager (Wayland)
  services.xserver.windowManager.qtile = {
    enable = true;
    backend = "wayland";
    extraPackages = p: with p; [ qtile-extras ];
  };

  # QTile-useful packages
  environment.systemPackages = with pkgs; [
    # -- Core WM --
    qtile
    rofi-wayland        # App launcher (Wayland-native)
    dunst               # Notifications
    swaybg              # Wallpaper setter (Wayland)
    grim                # Screenshots (Wayland)
    slurp               # Region selector for grim
    brightnessctl       # Brightness control

    # -- File Manager --
    dolphin             # Qt file manager
    kio-extras          # SMB/CIFS support for Dolphin
    samba               # SMB client libraries
    cifs-utils          # Mount SMB shares via fstab or manually
    ark                 # Archive manager (integrates with Dolphin)

    # -- Authentication (needed for SMB mounts on Wayland) --
    polkit-kde-agent

    # -- System Tray & Audio --
    networkmanagerapplet
    pavucontrol
  ];
}
