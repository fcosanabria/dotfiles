{ config, pkgs, inputs, ... }:

{
  home-manager.users.fsanabria = {
    imports = [ inputs.plasma-manager.homeManagerModules.plasma-manager ];

    home.packages = [ pkgs.kdePackages.krohnkite ];

    programs.plasma = {
      enable = true;

      workspace = {
        colorScheme = "BreezeDark";
      };

      kwin.virtualDesktops = {
        rows = 1;
        names = [ "Desktop 1" "Desktop 2" "Desktop 3" "Desktop 4" ];
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
        general     = { family = "Adwaita Sans"; pointSize = 10; };
        fixedWidth  = { family = "Adwaita Mono"; pointSize = 10; };
        small       = { family = "Adwaita Sans"; pointSize = 8;  };
        toolbar     = { family = "Adwaita Sans"; pointSize = 10; };
        menu        = { family = "Adwaita Sans"; pointSize = 10; };
        windowTitle = { family = "Adwaita Sans"; pointSize = 10; };
      };

      configFile."kwinrc" = {
        "Plugins"."krohnkiteEnabled" = true;
        "Plugins"."virtualdesktopsonlyonprimaryEnabled" = true;
        "Script-krohnkite"."screenGapTop"     = 4;
        "Script-krohnkite"."screenGapBottom"  = 4;
        "Script-krohnkite"."screenGapLeft"    = 4;
        "Script-krohnkite"."screenGapRight"   = 4;
        "Script-krohnkite"."screenGapBetween" = 4;
      };

      shortcuts = {
        # Remove Super+L lock shortcut
        "ksmserver"."Lock Session" = [];

        # Free Meta+Q from activity switcher, assign to close window
        "plasmashell"."manage activities" = [];
        "kwin"."Window Close" = [ "Meta+Q" "Alt+F4" ];

        # Switch to desktop
        "kwin"."Switch to Desktop 1" = [ "Meta+1" ];
        "kwin"."Switch to Desktop 2" = [ "Meta+2" ];
        "kwin"."Switch to Desktop 3" = [ "Meta+3" ];
        "kwin"."Switch to Desktop 4" = [ "Meta+4" ];

        # Krohnkite: window focus (HJKL)
        "kwin"."KrohnkiteFocusLeft"  = [ "Meta+H" ];
        "kwin"."KrohnkiteFocusDown"  = [ "Meta+J" ];
        "kwin"."KrohnkiteFocusUp"    = [ "Meta+K" ];
        "kwin"."KrohnkiteFocusRight" = [ "Meta+L" ];

        # Krohnkite: monocle layout
        "kwin"."KrohnkiteMonocleLayout" = [ "Meta+M" ];

        # Move window between monitors
        "kwin"."Window to Next Screen"     = [ "Meta+Ctrl+Right" ];
        "kwin"."Window to Previous Screen" = [ "Meta+Ctrl+Left" ];
      };
    };
  };
}
