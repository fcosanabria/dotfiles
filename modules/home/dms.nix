{ config, lib, pkgs, inputs, ... }:

let
  teide-darker-theme = {
    dark = {
      name = "Teide Darker";
      primary = "#5CCEFF";
      primaryText = "#12161a";
      primaryContainer = "#3a9dcc";
      secondary = "#B2A3FF";
      surfaceTint = "#5CCEFF";
      surface = "#1a1f25";
      surfaceText = "#E7EAEE";
      surfaceVariant = "#2a3040";
      surfaceVariantText = "#a9b1d6";
      background = "#171B20";
      backgroundText = "#E7EAEE";
      outline = "#586172";
      surfaceContainer = "#1e242c";
      surfaceContainerHigh = "#252c36";
      surfaceContainerHighest = "#2f3546";
      error = "#F97791";
      warning = "#FFE77A";
      info = "#38FFA5";
      matugen_type = "scheme-tonal-spot";
    };
    light = {
      name = "Teide Darker Light";
      primary = "#2a7ba3";
      primaryText = "#ffffff";
      primaryContainer = "#89BEFF";
      secondary = "#7b6bb3";
      surfaceTint = "#2a7ba3";
      surface = "#e8ecf0";
      surfaceText = "#1a1f25";
      surfaceVariant = "#d0d5dc";
      surfaceVariantText = "#3a4050";
      background = "#f0f2f5";
      backgroundText = "#12161a";
      outline = "#8891a0";
      surfaceContainer = "#dde1e6";
      surfaceContainerHigh = "#d5d9de";
      surfaceContainerHighest = "#cdd1d8";
      error = "#c44d60";
      warning = "#a68530";
      info = "#2a8a5a";
      matugen_type = "scheme-tonal-spot";
    };
  };
in
{
  config = lib.mkIf config.programs.sway.enable {
    home-manager.users.fsanabria = {
      imports = [
        inputs.dms.homeModules.dank-material-shell
        inputs.danksearch.homeModules.dsearch
      ];

      home.packages = [
        inputs.dms.inputs.quickshell.packages.${pkgs.system}.default
        pkgs.matugen
        pkgs.cava
        pkgs.dgop
      ];

      systemd.user.services.dms = {
        Service.Environment = [
          "PATH=/etc/profiles/per-user/fsanabria/bin:/run/current-system/sw/bin:/run/wrappers/bin"
        ];
      };

      xdg.configFile."DankMaterialShell/themes/teide_darker.json".text =
        builtins.toJSON teide-darker-theme;

      programs.dank-material-shell = {
        enable = true;

        settings = {
          currentThemeName = "custom";
          customThemeFile = "/home/fsanabria/.config/DankMaterialShell/themes/teide_darker.json";
        };

        systemd = {
          enable = true;
          restartIfChanged = true;
        };

        enableSystemMonitoring = true;
        enableDynamicTheming   = true;
        enableAudioWavelength  = true;
        enableClipboardPaste   = true;
        enableCalendarEvents   = true;
        enableVPN              = false;
      };

      programs.dsearch.enable = true;
    };
  };
}
