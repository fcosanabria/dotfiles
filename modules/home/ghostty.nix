{ config, pkgs, ... }:

{
  home-manager.users.fsanabria = {
    xdg.configFile."ghostty/themes/teide_darker".text = ''
      palette = 0=#12161a
      palette = 1=#F97791
      palette = 2=#38FFA5
      palette = 3=#FFA064
      palette = 4=#5CCEFF
      palette = 5=#B2A3FF
      palette = 6=#0AE7FF
      palette = 7=#a9b1d6
      palette = 8=#414868
      palette = 9=#F73F64
      palette = 10=#41FFDC
      palette = 11=#FFE77A
      palette = 12=#89BEFF
      palette = 13=#FFB3EC
      palette = 14=#00FBFF
      palette = 15=#E7EAEE

      background = #171B20
      foreground = #E7EAEE
      cursor-color = #E7EAEE
      selection-background = #2f3546
      selection-foreground = #E7EAEE
    '';

    programs.ghostty = {
      enable = true;
      settings = {
        theme = "teide_darker";
        font-size = 14;
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
