{
  config,
  lib,
  pkgs,
  ...
}:

{
  # ── Bootloader: default systemd-boot (hosts pueden override con mkForce) ─
  boot.kernelPackages = lib.mkDefault pkgs.linuxPackages_latest;
  boot.loader.systemd-boot = {
    enable = lib.mkDefault true;
    configurationLimit = lib.mkDefault 5;
  };
  boot.loader.timeout = lib.mkDefault 20;
  boot.loader.efi.canTouchEfiVariables = lib.mkDefault true;

  # ── Networking ─────────────────────────────────────────────────────
  networking.networkmanager.enable = true;

  # ── Timezone ───────────────────────────────────────────────────────
  time.timeZone = "America/Costa_Rica";

  # ── Locale ─────────────────────────────────────────────────────────
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

  # ── User account (hosts agregan grupos extra con lib.mkForce/lists) ─
  users.users.fsanabria = {
    isNormalUser = true;
    description = "Francisco Sanabria";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    shell = pkgs.fish;
  };

  # ── Home Manager base config ───────────────────────────────────────
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.backupFileExtension = "hm-backup-1";
  home-manager.users.fsanabria = {
    home.username = "fsanabria";
    home.homeDirectory = "/home/fsanabria";
    home.stateVersion = "25.11";
  };

  # ── Nix Flakes ─────────────────────────────────────────────────────
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # ── Garbage Collector ──────────────────────────────────────────────
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };
}