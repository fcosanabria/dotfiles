{ pkgs, ... }:

{
  hardware.openrazer.enable = true;
  hardware.openrazer.users = [ "fsanabria" ];

  environment.systemPackages = with pkgs; [
    polychromatic
  ];
}
