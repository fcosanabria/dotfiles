{ pkgs, ... }:

let
  o-tiling = pkgs.stdenv.mkDerivation {
    pname = "o-tiling";
    version = "2.9.12";
    src = pkgs.fetchurl {
      url = "https://github.com/oliwebd/o-tiling/releases/download/v2.9.12/o-tiling%40oliwebd.github.com-v2.9.12.zip";
      sha256 = "10m8q5ja3p9zvjcy1ib8v4i9gl2xgvbk483yrqkq1yziss5m4lxr";
      name = "o-tiling.zip";
    };
    sourceRoot = ".";
    nativeBuildInputs = [ pkgs.unzip ];
    installPhase = ''
      mkdir -p $out/share/gnome-shell/extensions/o-tiling@oliwebd.github.com
      cp -r * $out/share/gnome-shell/extensions/o-tiling@oliwebd.github.com/
    '';
  };
in
{
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  programs.dconf.enable = true;

  xdg.portal = {
    extraPortals = [
      pkgs.xdg-desktop-portal-gnome
      pkgs.xdg-desktop-portal-gtk
    ];
    config.common.default = [
      "gnome"
      "gtk"
    ];
  };

  environment.systemPackages = with pkgs; [
    gnome-tweaks
    gnome-extension-manager
    gnomeExtensions.caffeine
    gnomeExtensions.appindicator
    o-tiling
    geany
  ];
}
