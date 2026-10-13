{
  imports = [
    ./hardware-configuration.nix
    ./kanata.nix
    ../../modules/desktop/xfce.nix
  ];

  # Hostname
  networking.hostName = "zbook";

  system.stateVersion = "25.11";
}
