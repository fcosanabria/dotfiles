{
  config,
  lib,
  pkgs,
  ...
}:

{
  home-manager.users.fsanabria = {
    programs.alacritty = {
      enable = true;
      settings = {
        # Mismo look que ghostty: tema oxocarbon, fuente mono 14.
        # font-family usa mkDefault para que cada host pueda override
        # (synnax-dev no tiene Berkeley Mono → usa JetBrains Mono).
        font = {
          normal = {
            family = lib.mkDefault "Berkeley Mono";
            style = lib.mkDefault "Regular";
          };
          bold = {
            family = lib.mkDefault "Berkeley Mono";
            style = lib.mkDefault "Bold";
          };
          italic = {
            family = lib.mkDefault "Berkeley Mono";
            style = lib.mkDefault "Oblique";
          };
          bold_italic = {
            family = lib.mkDefault "Berkeley Mono";
            style = lib.mkDefault "Bold Oblique";
          };
          size = lib.mkDefault 14;
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