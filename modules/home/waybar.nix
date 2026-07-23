{ config, pkgs, lib, ... }:

{
  config = lib.mkIf config.programs.sway.enable {
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
          "wlr/taskbar"
          "custom/sep"
          "network"
          "custom/sep"
          "bluetooth"
          "custom/sep"
          "pulseaudio"
          "custom/sep"
          "custom/notification"
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

        network = {
          format-wifi = "WiFi {signalStrength}%";
          format-ethernet = "ETH {ifname}";
          format-disconnected = "No Net";
          tooltip-format = "{ifname}: {ipaddr}/{cidr} | {essid} ({signalStrength}%)";
          on-click = "nm-connection-editor";
        };

        bluetooth = {
          format = "BT {status}";
          format-disabled = "BT OFF";
          format-connected = "BT {num_connections}";
          tooltip-format = "{controller_alias}\n{device_enumerate}";
          tooltip-format-enumerate-connected = "{device_alias} ({device_address})";
          on-click = "blueman-manager";
        };

        "custom/notification" = {
          exec = "${pkgs.swaynotificationcenter}/bin/swaync-client -swb";
          return-type = "json";
          format = "{icon}";
          format-icons = {
            notification = "🔔";
            none = "🔕";
            inhibited-notification = "🔕";
            dnd-notification = "🔕";
            dnd-none = "🔕";
            dnd-inhibited-notification = "🔕";
            dnd-inhibited-none = "🔕";
          };
          on-click = "swaync-client -t -sw";
          on-click-right = "swaync-client -d -sw";
          tooltip = false;
        };

        "wlr/taskbar" = {
          format = "{icon}";
          icon-size = 16;
          tooltip-format = "{title}";
          on-click = "activate";
          on-click-middle = "close";
          ignore-list = [ "Alacritty" "ghostty" ];
        };
      };

      style = ''
        * {
          font-size: 13px;
          font-family: "Berkeley Mono", monospace;
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

        #network {
          padding: 0 6px;
          color: #ffffff;
        }

        #network.disconnected {
          color: #ff6666;
        }

        #bluetooth {
          padding: 0 6px;
          color: #ffffff;
        }

        #bluetooth.off {
          color: #888888;
        }

        #bluetooth.connected {
          color: #66ccff;
        }

        #custom-notification {
          padding: 0 6px;
          color: #ffffff;
        }

        #custom-notification.has {
          color: #ffcc00;
        }

        #taskbar {
          padding: 0;
        }

        #taskbar button {
          padding: 0 4px;
          color: #888888;
          background: transparent;
          border: 1px solid transparent;
          margin: 0;
        }

        #taskbar button.active {
          color: #ffffff;
          border-bottom: 2px solid #4c7899;
        }

        #taskbar button:hover {
          background: #285577;
          color: #ffffff;
        }
      '';
    };
  };
  };
}
