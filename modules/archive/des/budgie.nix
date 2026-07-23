{ config, lib, pkgs, ... }:

{
  # ── Display Manager ────────────────────────────────────────────────
  services.xserver.enable = true;
  services.xserver.displayManager.lightdm.enable = true;

  # ── Budgie Desktop Environment ─────────────────────────────────────
  services.desktopManager.budgie.enable = true;

  # ── XDG Desktop Portal ────────────────────────────────────────────
  xdg.portal = {
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    config.common.default = [ "gtk" ];
  };

  # ── Budgie-specific packages ───────────────────────────────────────
  environment.systemPackages = with pkgs; [
    budgie-desktop-view

    # -- File Manager --
    nemo

    # -- System Tray & Audio --
    networkmanagerapplet
    pavucontrol

    # -- Utilities --
    xdg-utils
  ];

  # ── Polkit ─────────────────────────────────────────────────────────
  security.polkit.enable = true;
}
