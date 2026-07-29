{ config, lib, pkgs, ... }:

{
  # Soporte para montajes CIFS/Samba
  environment.systemPackages = [ pkgs.cifs-utils ];

  fileSystems."/mnt/nas" = {
    device = "//192.168.31.7/"; # Asumiendo 'share', el usuario puede ajustarlo
    fsType = "cifs";
    options = let
      # Opciones para que no bloquee el arranque si el NAS no está disponible
      automount_opts = "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s";
    in ["${automount_opts},guest,uid=1000,gid=100"];
  };
}
