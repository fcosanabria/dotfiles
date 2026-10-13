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
}
