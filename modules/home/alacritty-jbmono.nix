{
  config,
  lib,
  pkgs,
  ...
}:

{
  # Override de fuente para la VM: JetBrains Mono Nerd (Berkeley Mono
  # no está instalada aquí). Los hosts con Berkeley Mono usan el default
  # de modules/home/alacritty.nix.
  home-manager.users.fsanabria = {
    programs.alacritty.settings.font = {
      normal = {
        family = lib.mkForce "JetBrainsMono Nerd Font";
        style = lib.mkForce "Regular";
      };
      bold = {
        family = lib.mkForce "JetBrainsMono Nerd Font";
        style = lib.mkForce "Bold";
      };
      italic = {
        family = lib.mkForce "JetBrainsMono Nerd Font";
        style = lib.mkForce "Italic";
      };
      bold_italic = {
        family = lib.mkForce "JetBrainsMono Nerd Font";
        style = lib.mkForce "Bold Italic";
      };
    };
  };
}