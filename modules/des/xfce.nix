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

  # ── Bluetooth ──────────────────────────────────────────────────────
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  # ── GNOME Keyring ──────────────────────────────────────────────────
  services.gnome.gnome-keyring.enable = true;
  security.pam.services.gdm.enableGnomeKeyring = true;

  # ── GnuPG + SSH Agent ─────────────────────────────────────────────
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

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
  ];

  # ── Polkit ─────────────────────────────────────────────────────────
  security.polkit.enable = true;
}
