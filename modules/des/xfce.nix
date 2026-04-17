{ config, lib, pkgs, ... }:

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

  # ── XFCE-specific packages ────────────────────────────────────────
  environment.systemPackages = with pkgs; [
    # -- File Manager --
    xfce.thunar
    xfce.thunar-volman
    xfce.thunar-archive-plugin

    # -- Panel Plugins --
    xfce.xfce4-whiskermenu-plugin
    xfce.xfce4-pulseaudio-plugin
    xfce.xfce4-clipman-plugin

    # -- System Tray & Audio --
    networkmanagerapplet
    pavucontrol

    # -- Utilities --
    xdg-utils
  ];

  # ── Polkit ─────────────────────────────────────────────────────────
  security.polkit.enable = true;
}
