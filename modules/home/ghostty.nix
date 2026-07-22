{ config, pkgs, ... }:

{
  home-manager.users.fsanabria = {
    xdg.configFile."ghostty/themes/oxocarbon".text = ''
      palette = 0=#262626
      palette = 1=#ee5396
      palette = 2=#42be65
      palette = 3=#ffe97b
      palette = 4=#33b1ff
      palette = 5=#ff7eb6
      palette = 6=#3ddbd9
      palette = 7=#dde1e6
      palette = 8=#393939
      palette = 9=#ee5396
      palette = 10=#42be65
      palette = 11=#ffe97b
      palette = 12=#33b1ff
      palette = 13=#ff7eb6
      palette = 14=#3ddbd9
      palette = 15=#ffffff

      background = #161616
      foreground = #ffffff
      cursor-color = #ffffff
      selection-background = #393939
      selection-foreground = #000000
    '';

    programs.ghostty = {
      enable = true;
      settings = {
        theme = "oxocarbon";
        font-size = 12;
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
