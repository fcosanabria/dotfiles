{
  config,
  lib,
  pkgs,
  ...
}:

{
  # ── Display Manager ────────────────────────────────────────────────
  services.xserver.enable = true;
  services.xserver.displayManager.lightdm.enable = true;

  # ── XFCE Desktop Environment ──────────────────────────────────────
  services.xserver.desktopManager.xfce.enable = true;

  # ── XDG Desktop Portal ────────────────────────────────────────────
  xdg.portal = {
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    config.common.default = [ "gtk" ];
  };

  # ── Bluetooth ──────────────────────────────────────────────────────
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  # GPG agent + pinentry are configured in modules/home/gpg.nix (base)
  # with pinentry-gtk2 override in this file's home-manager section below.

  # ── XFCE-specific packages ────────────────────────────────────────
  environment.systemPackages = with pkgs; [
    # -- File Manager --
    thunar
    thunar-volman
    thunar-archive-plugin

    # -- Panel Plugins --
    xfce4-whiskermenu-plugin
    xfce4-pulseaudio-plugin
    xfce4-clipman-plugin
    xfce4-cpugraph-plugin
    xfce4-dict
    xfce4-fsguard-plugin
    xfce4-genmon-plugin
    xfce4-netload-plugin
    xfce4-systemload-plugin
    xfce4-weather-plugin
    xfce4-xkb-plugin

    # -- Bluetooth --
    blueman

    # -- System Tray & Audio --
    networkmanagerapplet
    pavucontrol

    # -- Archive Manager --
    xarchiver
    p7zip
    zip

    # -- Utilities --
    xdg-utils

    # -- PolicyKit Authentication Agent --
    polkit_gnome
  ];

  # ── Polkit ─────────────────────────────────────────────────────────
  security.polkit.enable = true;
}
