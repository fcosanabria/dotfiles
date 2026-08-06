{
  config,
  lib,
  pkgs,
  ...
}:

let
  # ── Cortile: tiling window manager on top of Xfwm ─────────────────
  # Not packaged in nixpkgs, built from upstream source.
  cortile = pkgs.buildGoModule rec {
    pname = "cortile";
    version = "2.5.2";

    src = pkgs.fetchFromGitHub {
      owner = "leukipp";
      repo = "cortile";
      rev = "v${version}";
      hash = "sha256-2/U7oQO2vOrmoPR+s9VMSWS+d/YqZ5Ic0ieSxSA6SP4=";
    };

    vendorHash = "sha256-VlIPsUogiCQeWWrFsueB6COa91CWIGx3hb7HKC59rS0=";

    env.CGO_ENABLED = 0;

    ldflags = [
      "-s"
      "-w"
      "-X main.name=cortile"
      "-X main.target=linux-amd64"
      "-X main.version=${version}"
    ];

    meta = {
      description = "Linux auto tiling manager with hot corner support for Xfwm and other EWMH compliant window managers";
      homepage = "https://github.com/leukipp/cortile";
      license = lib.licenses.mit;
      mainProgram = "cortile";
      platforms = lib.platforms.linux;
    };
  };
in
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

    # -- Calendar & Online Accounts --
    gnome-online-accounts
    gnome-calendar

    # -- PolicyKit Authentication Agent --
    polkit_gnome

    # -- Tiling Window Manager (on top of Xfwm) --
    cortile
  ];

  # ── Polkit ─────────────────────────────────────────────────────────
  security.polkit.enable = true;
}
