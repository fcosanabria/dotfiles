{ config, lib, pkgs, ... }:

{
  # System-level Syncthing service (enabled -> starts at boot via multi-user.target)
  # This is the webpage http://localhost:8384
  services.syncthing = {
    enable = true;
    user = "fsanabria";
    dataDir = "/home/fsanabria/.syncthing";
    openDefaultPorts = true;
  };
}
