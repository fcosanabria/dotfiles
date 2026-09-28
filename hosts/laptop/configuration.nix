{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ../../modules/base.nix
    ../../modules/system/syncthing.nix
    /etc/nixos/hardware-configuration.nix
    ../../modules/des/xfce.nix
    ../../modules/system
    ../../modules/home
  ];

  # Hostname
  networking.hostName = "zbook";

  # X11
  services.xserver.enable = true;
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # User account — grupos extra sobre los del módulo base
  users.users.fsanabria.extraGroups = [
    "scanner"
    "lp"
  ];

  system.stateVersion = "25.11";
}