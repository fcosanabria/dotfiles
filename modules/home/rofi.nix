{ config, pkgs, lib, ... }:

{
  config = lib.mkIf config.programs.sway.enable {
  home-manager.users.fsanabria = {
    programs.rofi = {
      enable = true;
      terminal = "ghostty";
      font = "BerkeleyMono Nerd Font Mono 12";
      theme = "gruvbox-dark-hard";
    };
  };
  };
}
