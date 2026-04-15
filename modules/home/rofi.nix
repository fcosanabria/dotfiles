{ config, pkgs, lib, ... }:

{
  home-manager.users.fsanabria = {
    programs.rofi = {
      enable = true;
      terminal = "ghostty";
      font = "Berkeley Mono 12";
    };
  };
}
