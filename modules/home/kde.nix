{ config, pkgs, ... }:

{
  programs.plasma = {
    enable = true;

    workspace = {
      colorScheme = "BreezeDark";
    };

    virtualDesktops = {
      rows = 1;
      desktops = [
        { name = "Desktop 1"; }
        { name = "Desktop 2"; }
        { name = "Desktop 3"; }
        { name = "Desktop 4"; }
      ];
    };

    input.keyboard = {
      options = [ "compose:rwin" ];
    };

    shortcuts = {
      # Switch to desktop
      "kwin"."Switch to Desktop 1" = [ "Meta+1" ];
      "kwin"."Switch to Desktop 2" = [ "Meta+2" ];
      "kwin"."Switch to Desktop 3" = [ "Meta+3" ];
      "kwin"."Switch to Desktop 4" = [ "Meta+4" ];

      # Move window to desktop
      "kwin"."Window to Desktop 1" = [ "Meta+Shift+1" ];
      "kwin"."Window to Desktop 2" = [ "Meta+Shift+2" ];
      "kwin"."Window to Desktop 3" = [ "Meta+Shift+3" ];
      "kwin"."Window to Desktop 4" = [ "Meta+Shift+4" ];

      # Move window between monitors
      "kwin"."Window to Next Screen"     = [ "Meta+Ctrl+Right" ];
      "kwin"."Window to Previous Screen" = [ "Meta+Ctrl+Left" ];
    };
  };
}
