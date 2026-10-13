{ pkgs, ... }:

{
  # ── Display Manager (X11) ────────────────────────────────────────────
  services.xserver.enable = true;
  services.xserver.displayManager.lightdm.enable = true;

  # ── XFCE Desktop Environment ─────────────────────────────────────────
  services.xserver.desktopManager.xfce.enable = true;

  # ── Polkit ───────────────────────────────────────────────────────────
  security.polkit.enable = true;

  # Bluetooth, portal GTK y audio (PipeWire) vienen de modules/system.
  # La config del panel/xfce4 es manual (xfce4-panel, whiskermenu, etc.).

  # ── XFCE-specific packages ───────────────────────────────────────────
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

    # -- System Tray & Audio --
    networkmanagerapplet
    pavucontrol

    # -- Archive Manager --
    xarchiver
    p7zip
    zip

    # -- Utilities --
    xdg-utils

    # -- Calendar & Online Accounts --
    gnome-online-accounts
    gnome-calendar

    # -- PolicyKit Authentication Agent --
    polkit_gnome
  ];
}
