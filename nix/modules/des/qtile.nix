{ config, pkgs, ... }:

{
  # Display Manager (LightDM works well with standalone WMs)
  services.displayManager.lightdm.enable = true;

  # QTile Window Manager (Wayland)
  services.xserver.windowManager.qtile = {
    enable = true;
    backend = "wayland";
    extraPackages = p: with p; [ qtile-extras ];
  };

  # QTile-useful packages
  environment.systemPackages = with pkgs; [
    qtile
    rofi-wayland        # App launcher (Wayland-native)
    dunst               # Notifications
    swaybg              # Wallpaper setter (Wayland)
    grim                # Screenshots (Wayland)
    slurp               # Region selector for grim
    pavucontrol         # Audio control GUI
    networkmanagerapplet # Network tray icon
    brightnessctl       # Brightness control
  ];
}
