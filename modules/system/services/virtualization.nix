{ pkgs, lib, ... }:

{
  # Docker
  virtualisation.docker.enable = true;
  users.groups.docker.gid = lib.mkForce 999;

  # KVM / libvirt (Virtual Machines Manager)
  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.qemu_kvm;
      runAsRoot = true;
      swtpm.enable = true;
    };
  };
  programs.virt-manager.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;

  # ── Portapapeles compartido host ↔ guest (SPICE) ─────────────────────
  # Ref: https://wiki.nixos.org/wiki/Virt-manager (sección "Guest Agent")
  #
  # El lado del host ya está completo con lo de arriba: el cliente SPICE
  # de virt-manager sincroniza el portapapeles solo. Los servicios de la
  # wiki (services.qemuGuest / services.spice-vdagentd) van en la config
  # del GUEST — en un host físico serían daemons muertos (no hay puerto
  # virtio spicevmc que atender).
  #
  # Checklist por VM:
  #   1. Display tipo SPICE (default de virt-manager al crear la VM).
  #   2. Canal spicevmc "com.redhat.spice.0" — virt-manager lo añade solo
  #      con display SPICE (ver "Show virtual hardware details" > Channel).
  #   3. Dentro del guest:
  #      - NixOS/Linux: services.qemuGuest.enable = true;
  #                     services.spice-vdagentd.enable = true;
  #      - Windows:     instalar "virtio-win guest tools" (incluye el
  #                     vdagent de SPICE).
}
