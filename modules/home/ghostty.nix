{ config, pkgs, ... }:

{
  home-manager.users.fsanabria = {
    programs.ghostty = {
      enable = true;
      settings = {
        theme = "Gruvbox Dark Hard";
        font-size = 16;
        font-family = "Berkeley Mono";
        font-family-bold = "Berkeley Mono";
        font-family-italic = "Berkeley Mono";
        font-family-bold-italic = "Berkeley Mono";
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
