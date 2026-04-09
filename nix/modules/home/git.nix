{ config, pkgs, ... }:

{
  home-manager.users.fsanabria = {
    programs.git = {
      enable = true;
      userName = "Francisco Sanabria";
      userEmail = "fsanabria@fastmail.com";
    };
  };
}
