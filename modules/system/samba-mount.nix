{ config, lib, pkgs, ... }:

{
  # Soporte para montajes CIFS/Samba
  environment.systemPackages = [ pkgs.cifs-utils ];

  # Archivo de credenciales del NAS. Edita aquí el usuario y contraseña
  # cuando los tengas (reemplaza YOUR_USERNAME / YOUR_PASSWORD).
  # Nota: al declararlo aquí el contenido queda en el store (legible). Si
  # prefieres más seguridad, crea el archivo a mano con `chmod 600` y
  # borra este bloque.
  environment.etc."samba/credentials/nas" = {
    text = ''
      username=YOUR_USERNAME
      password=YOUR_PASSWORD
    '';
    mode = "0600";
  };

  # NAS Asustor (192.168.31.7). Ajusta el nombre del share si es distinto
  # (los Asustor suelen traer "Public" por defecto).
  fileSystems."/mnt/nas" = {
    device = "//192.168.31.7/Public";
    fsType = "cifs";
    options = let
      # Opciones para que no bloquee el arranque si el NAS no está disponible
      automount_opts = "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s";
    in ["${automount_opts},credentials=/etc/samba/credentials/nas,uid=1000,gid=100"];
  };
}
