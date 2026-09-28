{
  config,
  pkgs,
  ...
}:

{
  home-manager.users.fsanabria = {
    programs.alacritty = {
      enable = true;
      settings = {
        # Mismo look que ghostty: tema oxocarbon, Berkeley Mono 14.
        font = {
          normal = {
            family = "Berkeley Mono";
            style = "Regular";
          };
          bold = {
            family = "Berkeley Mono";
            style = "Bold";
          };
          italic = {
            family = "Berkeley Mono";
            style = "Oblique";
          };
          bold_italic = {
            family = "Berkeley Mono";
            style = "Bold Oblique";
          };
          size = 14;
        };

        colors = {
          primary = {
            background = "#161616";
            foreground = "#ffffff";
          };
          normal = {
            black = "#262626";
            red = "#ee5396";
            green = "#42be65";
            yellow = "#ffe97b";
            blue = "#33b1ff";
            magenta = "#ff7eb6";
            cyan = "#3ddbd9";
            white = "#dde1e6";
          };
          bright = {
            black = "#393939";
            red = "#ee5396";
            green = "#42be65";
            yellow = "#ffe97b";
            blue = "#33b1ff";
            magenta = "#ff7eb6";
            cyan = "#3ddbd9";
            white = "#ffffff";
          };
          cursor = {
            text = "#000000";
            cursor = "#ffffff";
          };
          selection = {
            text = "#000000";
            background = "#393939";
          };
        };

        window = {
          # Equivalente a window-width/height de ghostty (160x48 celdas)
          dimensions = {
            columns = 160;
            lines = 48;
          };
        };
      };
    };
  };
}