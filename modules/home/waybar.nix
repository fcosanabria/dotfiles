{ config, pkgs, lib, ... }:

{
  home-manager.users.fsanabria = {
    programs.waybar = {
      enable = true;

      settings.mainBar = {
        layer = "top";
        position = "bottom";

        modules-left = [
          "sway/workspaces"
          "sway/mode"
        ];
        modules-center = [
          "sway/window"
        ];
        modules-right = [
          "idle_inhibitor"
          "custom/sep"
          "pulseaudio"
          "custom/sep"
          "battery"
          "custom/sep"
          "clock"
          "custom/sep"
          "tray"
        ];

        "custom/sep" = {
          format = "|";
          tooltip = false;
        };

        "sway/workspaces" = {
          disable-scroll = true;
          format = "{name}";
        };

        "sway/mode" = {
          format = "{}";
        };

        "sway/window" = {
          max-length = 50;
          tooltip = false;
        };

        clock = {
          format = "{:%Y-%m-%d %H:%M}";
          tooltip-format = "<tt>{calendar}</tt>";
          calendar = {
            mode = "month";
            weeks-pos = "left";
            format = {
              months = "<b>{}</b>";
              weeks = "<b>W{}</b>";
              today = "<b><u>{}</u></b>";
            };
          };
        };

        idle_inhibitor = {
          format = "{icon}";
          format-icons = {
            activated = "Caff ON";
            deactivated = "Caff OFF";
          };
          tooltip-format-activated = "Idle inhibitor active";
          tooltip-format-deactivated = "Idle inhibitor inactive";
        };

        pulseaudio = {
          format = "Vol {volume}%";
          format-muted = "Vol MUTE";
          scroll-step = 5;
          on-click = "pavucontrol";
          on-click-right = "pamixer -t";
        };

        battery = {
          format = "Bat {capacity}%";
          states = {
            warning = 30;
            critical = 15;
          };
        };

        tray = {
          icon-size = 16;
          spacing = 4;
        };
      };

      style = ''
        * {
          font-size: 13px;
          font-family: "BerkeleyMono Nerd Font Mono", monospace;
          border: none;
          border-radius: 0;
          min-height: 0;
        }

        window#waybar {
          background: #323232;
          color: #ffffff;
        }

        #workspaces button {
          padding: 0 5px;
          color: #888888;
          background: #222222;
          border: 1px solid #333333;
          margin: 0;
        }

        #workspaces button.focused {
          color: #ffffff;
          background: #285577;
          border: 1px solid #4c7899;
        }

        #workspaces button.visible {
          color: #ffffff;
          background: #5f676a;
          border: 1px solid #333333;
        }

        #workspaces button.urgent {
          color: #ffffff;
          background: #900000;
          border: 1px solid #2f343a;
        }

        #workspaces button:hover {
          box-shadow: none;
          text-shadow: none;
          background: #285577;
          border: 1px solid #4c7899;
          color: #ffffff;
        }

        #mode {
          color: #ffffff;
          background: #900000;
          padding: 0 5px;
        }

        #custom-sep {
          color: #666666;
          padding: 0 2px;
        }

        #window {
          padding: 0 8px;
          color: #ffffff;
          background: #222222;
          border: 1px solid #333333;
        }

        #clock,
        #pulseaudio,
        #battery,
        #idle_inhibitor,
        #tray {
          padding: 0 6px;
          color: #ffffff;
        }

        #idle_inhibitor.activated {
          color: #ffffff;
          background: #285577;
        }
      '';
    };
  };
}
