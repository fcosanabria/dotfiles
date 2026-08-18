{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:

let
  inherit (lib) mkIf;
in
{
  config = mkIf (config.programs.mango.enable or false) {
    home-manager.users.fsanabria = {
      imports = [
        inputs.mangowm.homeModules.default
      ];

      wayland.windowManager.mango = {
        enable = true;
        systemd = {
          enable = true;
          xdgAutostart = true;
        };

        autostart_sh = ''
          waybar &
          swaync &
        '';
      };

      programs.rofi = {
        enable = true;
        terminal = "ghostty";
      };

      programs.waybar = {
        enable = true;
        systemd.enable = true;
        settings = {
          mainBar = {
            layer = "top";
            position = "top";
            modules-left = [ "clock" ];
            modules-right = [
              "network"
              "pulseaudio"
              "tray"
            ];

            clock.format = "{:%Y-%m-%d %H:%M}";
            network.format-wifi = "WiFi {signalStrength}%";
            network.format-ethernet = "ETH {ifname}";
            network.format-disconnected = "No Net";
            pulseaudio.format = "Vol {volume}%";
            pulseaudio.format-muted = "Vol MUTE";
            tray.spacing = 6;
          };
        };
      };

      programs.swaylock = {
        enable = true;
        settings = {
          color = "000000";
          show-failed-attempts = true;
        };
      };

      services.swayidle = {
        enable = true;
        events = {
          before-sleep = "swaylock -f -c 000000";
        };
        timeouts = [
          {
            timeout = 300;
            command = "swaylock -f -c 000000";
          }
        ];
      };

      services.swaync = {
        enable = true;
        settings = {
          positionX = "right";
          positionY = "top";
          layer = "overlay";
          timeout = 10;
          timeout-low = 5;
          timeout-critical = 0;
          control-center-width = 400;
          notification-window-width = 400;
        };
      };

      home.pointerCursor = {
        name = "Adwaita";
        package = pkgs.adwaita-icon-theme;
        size = 24;
        gtk.enable = true;
      };
    };
  };
}
