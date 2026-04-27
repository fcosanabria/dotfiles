{ config, pkgs, ... }:

{
  home-manager.users.fsanabria = {
    programs.ghostty = {
      enable = true;
      settings = {
        theme = "Gruvbox Dark Hard";
        font-size = 17;
        font-family = "Berkeley Mono";
        font-family-bold = "Berkeley Mono";
        font-family-italic = "Berkeley Mono";
        font-family-bold-italic = "Berkeley Mono";
        font-style = "Regular";
        font-style-bold = "Bold";
        font-style-italic = "Oblique";
        font-style-bold-italic = "Bold Oblique";
        gtk-titlebar = false;
        window-width = 160;
        window-height = 48;
      };
    };
  };
}
