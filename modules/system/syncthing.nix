{ config, lib, pkgs, ... }:

{
  # System-level Syncthing service (enabled -> starts at boot via multi-user.target)
  services.syncthing = {
    enable = true;
    user = "fsanabria";
    dataDir = "/home/fsanabria/.syncthing";
    openDefaultPorts = true;
  };

  # Icono de bandeja solo en hosts con sesión gráfica
  # (writing-deck es consola pura, sin X11/Wayland).
  home-manager.users.fsanabria = lib.mkIf config.services.xserver.enable {
    services.syncthing.tray.enable = true;
  };
}
