{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:

{
  config = lib.mkIf config.services.desktopManager.plasma6.enable {
    home-manager.users.fsanabria = {
      imports = [ inputs.plasma-manager.homeModules.plasma-manager ];

      home.packages = [ pkgs.kdePackages.krohnkite ];

      xdg.desktopEntries.kanata-toggle = {
        name = "Kanata Toggle";
        comment = "Activar o desactivar Kanata";
        exec = "kanata-toggle";
        icon = "input-keyboard";
        terminal = false;
        categories = [ "Utility" ];
      };

      programs.plasma = {
        enable = true;

        workspace = {
          colorScheme = "BreezeDark";
        };

        kwin.virtualDesktops = {
          rows = 1;
          names = [
            "Desktop 1"
            "Desktop 2"
            "Desktop 3"
            "Desktop 4"
          ];
        };

        input.keyboard = {
          options = [ "compose:rwin" ];
        };

        input.mice = [
          {
            name = "Logitech USB Receiver";
            vendorId = "046d";
            productId = "c547";
            accelerationProfile = "none";
          }
        ];

        fonts = {
          general = {
            family = "Adwaita Sans";
            pointSize = 10;
          };
          fixedWidth = {
            family = "Adwaita Mono";
            pointSize = 10;
          };
          small = {
            family = "Adwaita Sans";
            pointSize = 8;
          };
          toolbar = {
            family = "Adwaita Sans";
            pointSize = 10;
          };
          menu = {
            family = "Adwaita Sans";
            pointSize = 10;
          };
          windowTitle = {
            family = "Adwaita Sans";
            pointSize = 10;
          };
        };

        configFile = {
          # ── KWin ───────────────────────────────────────────────────────────
          "kwinrc" = {
            "Plugins"."krohnkiteEnabled" = true;
            "Plugins"."virtualdesktopsonlyonprimaryEnabled" = true;
            "Script-krohnkite"."screenGapTop" = 4;
            "Script-krohnkite"."screenGapBottom" = 4;
            "Script-krohnkite"."screenGapLeft" = 4;
            "Script-krohnkite"."screenGapRight" = 4;
            "Script-krohnkite"."screenGapBetween" = 4;
            # HiDPI: Xwayland scaling
            "Xwayland"."Scale" = 1.25;
          };

          # ── Global KDE settings ────────────────────────────────────────────
          "kdeglobals" = {
            # Animations at 25% duration (snappy feel)
            "KDE"."AnimationDurationFactor" = 0.25;
            # Default terminal
            "General"."TerminalApplication" = "ghostty";
            "General"."TerminalService" = "com.mitchellh.ghostty.desktop";
            # Font rendering
            "General"."XftAntialias" = true;
            "General"."XftHintStyle" = "hintslight";
            "General"."XftSubPixel" = "none";
          };
        };

        # ── Panel ─────────────────────────────────────────────────────────────
        panels = [
          {
            location = "bottom";
            floating = true;
            height = 34;
            widgets = [
              "org.kde.plasma.kickoff"
              "org.kde.plasma.activitypager"
              {
                name = "org.kde.plasma.icontasks";
                config.General = {
                  iconSpacing = 0;
                  indicateAudioStreams = false;
                  interactiveMute = false;
                  launchers = "";
                };
              }
              "org.kde.plasma.marginsseparator"
              "org.kde.plasma.systemtray"
              "org.kde.plasma.digitalclock"
              "org.kde.plasma.showdesktop"
            ];
          }
        ];

        shortcuts = {
          # ── Session ────────────────────────────────────────────────────────
          "ksmserver"."Lock Session" = [ ];
          "plasmashell"."manage activities" = [ ];

          # ── Window management ──────────────────────────────────────────────
          "kwin"."Window Close" = [
            "Meta+Q"
            "Alt+F4"
          ];
          "kwin"."Window to Next Screen" = [ "Meta+Ctrl+Right" ];
          "kwin"."Window to Previous Screen" = [ "Meta+Ctrl+Left" ];

          # ── Switch virtual desktop ─────────────────────────────────────────
          "kwin"."Switch to Desktop 1" = [ "Meta+1" ];
          "kwin"."Switch to Desktop 2" = [ "Meta+2" ];
          "kwin"."Switch to Desktop 3" = [ "Meta+3" ];
          "kwin"."Switch to Desktop 4" = [ "Meta+4" ];

          # ── Move window to virtual desktop ─────────────────────────────────
          "kwin"."Window to Desktop 1" = [ "Meta+Shift+1" ];
          "kwin"."Window to Desktop 2" = [ "Meta+Shift+2" ];
          "kwin"."Window to Desktop 3" = [ "Meta+Shift+3" ];
          "kwin"."Window to Desktop 4" = [ "Meta+Shift+4" ];

          # ── Krohnkite: focus ───────────────────────────────────────────────
          "kwin"."KrohnkiteFocusLeft" = [ "Meta+H" ];
          "kwin"."KrohnkiteFocusDown" = [ "Meta+J" ];
          "kwin"."KrohnkiteFocusUp" = [ "Meta+K" ];
          "kwin"."KrohnkiteFocusRight" = [ "Meta+L" ];
          "kwin"."KrohnkiteFocusPrev" = [ "Meta+\\" ];

          # ── Krohnkite: move windows ────────────────────────────────────────
          "kwin"."KrohnkiteShiftLeft" = [ "Meta+Shift+H" ];
          "kwin"."KrohnkiteShiftDown" = [ "Meta+Shift+J" ];
          "kwin"."KrohnkiteShiftUp" = [ "Meta+Shift+K" ];
          "kwin"."KrohnkiteShiftRight" = [ "Meta+Shift+L" ];

          # ── Krohnkite: resize ──────────────────────────────────────────────
          "kwin"."KrohnkiteShrinkWidth" = [ "Meta+Ctrl+H" ];
          "kwin"."KrohnkiteGrowHeight" = [ "Meta+Ctrl+J" ];
          "kwin"."KrohnkiteShrinkHeight" = [ "Meta+Ctrl+K" ];
          "kwin"."KrohnkitegrowWidth" = [ "Meta+Ctrl+L" ];

          # ── Krohnkite: layouts ─────────────────────────────────────────────
          "kwin"."KrohnkiteMonocleLayout" = [ "Meta+M" ];
          "kwin"."KrohnkiteNextLayout" = [ "Meta+\\" ];
          "kwin"."KrohnkitePreviousLayout" = [ "Meta+|" ];
          "kwin"."KrohnkiteSetMaster" = [ "Meta+Return" ];
          "kwin"."KrohnkiteToggleFloat" = [ "Meta+F" ];
          "kwin"."KrohnkiteFloatAll" = [ "Meta+Shift+F" ];
        };
      };
    };
  };
}
