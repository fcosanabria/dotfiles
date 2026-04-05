{ config, lib, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/des/gnome.nix
    ../../modules/system/packages.nix
    ../../modules/system/services.nix
    ../../modules/home/fish.nix
  ];

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Hostname
  networking.hostName = "zbook";

  # Networking
  networking.networkmanager.enable = true;

  # Timezone
  time.timeZone = "America/Costa_Rica";

  # Locale
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "es_CR.UTF-8";
    LC_IDENTIFICATION = "es_CR.UTF-8";
    LC_MEASUREMENT = "es_CR.UTF-8";
    LC_MONETARY = "es_CR.UTF-8";
    LC_NAME = "es_CR.UTF-8";
    LC_NUMERIC = "es_CR.UTF-8";
    LC_PAPER = "es_CR.UTF-8";
    LC_TELEPHONE = "es_CR.UTF-8";
    LC_TIME = "es_CR.UTF-8";
  };

  # X11
  services.xserver.enable = true;
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # User account
  users.users.fsanabria = {
    isNormalUser = true;
    description = "Francisco Sanabria";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.fish;
  };

  system.stateVersion = "25.11";
}
