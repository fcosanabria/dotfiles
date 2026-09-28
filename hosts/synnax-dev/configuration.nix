{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/des/qtile.nix
    ../../modules/home/fish.nix
    ../../modules/home/ghostty.nix
    ../../modules/home/git.nix
    ../../modules/home/starship.nix
  ];

  # ── Bootloader: SeaBIOS (BIOS) → GRUB en /dev/vda ─────────────────
  boot.loader.grub = {
    enable = true;
    device = "/dev/vda";
  };
  boot.loader.timeout = 5;

  # Hostname
  networking.hostName = "synnax-dev";

  # Networking - NetworkManager (libvirt NAT, DHCP)
  networking.networkmanager.enable = true;

  # SSH para deploy remoto desde el desktop (nixos-rebuild --target-host)
  services.openssh.enable = true;
  networking.firewall.allowedTCPPorts = [ 22 ];

  # QEMU guest agent para integración con virt-manager
  services.qemuGuest.enable = true;

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

  # User account
  users.users.fsanabria = {
    isNormalUser = true;
    description = "Francisco Sanabria";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    shell = pkgs.fish;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAPMwYp59oGH4j33+QSyE97gHIimCJh+PXDCeKc3PiLj fsanabria@fastmail.com"
    ];
  };

  # Home Manager base config
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.backupFileExtension = "hm-backup-1";
  home-manager.users.fsanabria = {
    home.username = "fsanabria";
    home.homeDirectory = "/home/fsanabria";
    home.stateVersion = "25.11";
  };

  # Nix Flakes
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Garbage Collector
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  system.stateVersion = "25.11";
}