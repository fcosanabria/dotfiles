{ config, pkgs, ... }:

{
  home-manager.users.fsanabria = {
    programs.git = {
      enable = true;
      settings.user.name = "Francisco Sanabria";
      settings.user.email = "fsanabria@fastmail.com";
    };
  };
}
