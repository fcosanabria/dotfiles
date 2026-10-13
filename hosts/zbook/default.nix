{
  imports = [
    # Generado por nixos-generate-config en cada máquina; vive fuera de git.
    /etc/nixos/hardware-configuration.nix
    ./kanata.nix
    ../../modules/desktop/xfce.nix
  ];

  # Hostname
  networking.hostName = "zbook";

  system.stateVersion = "25.11";
}
