{ ... }:

{
  # ── Montaje CIFS/Samba del NAS (Asustor AS5402T) ──────────────────────
  # fstab + cifs-utils. Al ser un montaje de sistema, COSMIC Files lo
  # muestra en la barra lateral (x-gvfs-show) sin depender de GVFS.
  #
  # Credenciales FUERA del store. Créalas una sola vez:
  #   sudo mkdir -p /etc/samba/credentials
  #   sudo install -m 600 /dev/null /etc/samba/credentials/nas
  #   sudoedit /etc/samba/credentials/nas
  # con el contenido:
  #   username=fsanabria
  #   password=TU_PASSWORD
  systemd.tmpfiles.rules = [
    "d /etc/samba/credentials 0700 root root -"
  ];

  fileSystems."/mnt/nas" = {
    device = "//192.168.31.7/AS5402T";
    fsType = "cifs";
    options = [
      "credentials=/etc/samba/credentials/nas"
      "uid=1000" # fsanabria
      "gid=100" # users
      # Montaje bajo demanda: no bloquea el arranque si el NAS está apagado
      "x-systemd.automount"
      "noauto"
      "x-systemd.idle-timeout=60" # desmonta tras 60 s sin uso
      "x-systemd.device-timeout=5s"
      "x-systemd.mount-timeout=5s"
      "_netdev"
      "nofail"
      # Visible en la barra lateral de COSMIC Files
      "x-gvfs-show"
      "x-gvfs-name=NAS"
    ];
  };
}
