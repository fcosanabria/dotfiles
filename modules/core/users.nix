{ pkgs, ... }:

{
  # Usuario base. Los grupos específicos de cada host (docker, libvirtd,
  # kvm, input, ...) se añaden en hosts/<host>/default.nix.
  users.users.fsanabria = {
    isNormalUser = true;
    description = "Francisco Sanabria";
    shell = pkgs.fish;
    extraGroups = [
      "networkmanager"
      "wheel"
      "scanner"
      "lp"
    ];
  };
}
