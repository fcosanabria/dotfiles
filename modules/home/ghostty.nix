{ config, pkgs, ... }:

{
  home-manager.users.fsanabria = {
    programs.ghostty = {
      enable = true;
      settings = {
        theme = "Gruvbox Dark Hard";
        font-size = 14;
        font-family = "BerkeleyMono Nerd Font Mono";
        font-family-bold = "BerkeleyMono Nerd Font Mono";
        font-family-italic = "BerkeleyMono Nerd Font Mono";
        font-family-bold-italic = "BerkeleyMono Nerd Font Mono";
        font-style = "Regular";
        font-style-bold = "Bold";
        font-style-italic = "Oblique";
        font-style-bold-italic = "Bold Oblique";
        window-width = 160;
        window-height = 48;
      };
    };
  };
}
