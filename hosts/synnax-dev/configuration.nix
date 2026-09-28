{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ../../modules/base.nix
    ./hardware-configuration.nix
    ../../modules/des/qtile.nix
    ../../modules/home/alacritty.nix
    ../../modules/home/fish.nix
    ../../modules/home/git.nix
    ../../modules/home/starship.nix
  ];

  # ── Bootloader: VM usa SeaBIOS (BIOS) → GRUB en /dev/vda ──────────
  # El módulo base define systemd-boot con mkDefault; aquí se sobreescribe.
  boot.loader.systemd-boot.enable = lib.mkForce false;
  boot.loader.grub = {
    enable = true;
    device = "/dev/vda";
  };
  boot.loader.timeout = 5;

  # Hostname
  networking.hostName = "synnax-dev";

  # SSH para deploy remoto desde el desktop (nixos-rebuild --target-host)
  services.openssh.enable = true;
  networking.firewall.allowedTCPPorts = [ 22 ];

  # QEMU guest agent para integración con virt-manager
  services.qemuGuest.enable = true;

  # User account — llave SSH del desktop sobre el usuario del módulo base
  users.users.fsanabria.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAPMwYp59oGH4j33+QSyE97gHIimCJh+PXDCeKc3PiLj fsanabria@fastmail.com"
  ];

  system.stateVersion = "25.11";
}