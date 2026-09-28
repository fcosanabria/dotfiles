{ config, pkgs, lib, ... }:

{
  config = lib.mkIf config.programs.sway.enable {
    home-manager.users.fsanabria = {

      # ── Sway ──────────────────────────────────────────────────────────
      wayland.windowManager.sway = {
        enable = true;
        checkConfig = false;          # Wallpaper path not available in sandbox
        systemd.enable = true;        # Sway-session.target for services

        config = {
          modifier = "Mod4";          # Super key
          terminal = "ghostty";

          # ── Monitor: 4K @ 144Hz, scale 1.5 ──────────────────────────
          output = {
            "*" = {
              mode = "3840x2160@144Hz";
              scale = "1.5";
              bg = "~/Pictures/1405510.webp fill";
            };
          };

          # ── Cursor ───────────────────────────────────────────────────
          seat."*".xcursor_theme = "Adwaita 24";

          # ── Input ────────────────────────────────────────────────────
          input = {
            "type:keyboard" = {
              xkb_layout = "us";
            };
            "type:touchpad" = {
              tap = "enabled";
              natural_scroll = "disabled";
              dwt = "enabled";       # Disable while typing
            };
            "type:pointer" = {
              accel_profile = "flat";
            };
          };

          # ── Appearance ───────────────────────────────────────────────
          gaps = {
            inner = 2;
            outer = 2;
          };

          fonts = {
            names = [ "Adwaita Sans" ];
          };

          window = {
            titlebar = false;
            border = 2;
          };

          floating.titlebar = false;

          # ── Window rules ─────────────────────────────────────────────
          window.commands = [
            # ── Floating: dialogs & popups ──────────────────────────────
            {
              criteria = { window_role = "pop-up"; };
              command = "floating enable";
            }
            {
              criteria = { window_role = "dialog"; };
              command = "floating enable";
            }
            {
              criteria = { window_type = "dialog"; };
              command = "floating enable";
            }
          ];

          # ── Disable default swaybar (waybar is started via startup) ──
          bars = [];

          # ── Keybindings ──────────────────────────────────────────────
          keybindings = let
            mod = "Mod4";
            screenshotArea = pkgs.writeShellScript "sway-screenshot-area" ''
              set -eu

              dir="$HOME/Pictures/screenshots"
              ${pkgs.coreutils}/bin/mkdir -p "$dir"

              geometry="$(${pkgs.slurp}/bin/slurp)" || exit 0
              file="$dir/$(${pkgs.coreutils}/bin/date +%Y-%m-%d_%H-%M-%S).png"

              ${pkgs.grim}/bin/grim -g "$geometry" "$file"
              ${pkgs.wl-clipboard}/bin/wl-copy --type image/png < "$file"
            '';
          in {
            # Launch
            "${mod}+Return" = "exec ghostty";
            "${mod}+space" = "exec vicinae toggle";

            # Window management
            "${mod}+q" = "kill";
            "${mod}+f" = "fullscreen toggle";
            "${mod}+Shift+space" = "floating toggle";
            "${mod}+r" = "focus mode_toggle";
            "${mod}+a" = "focus parent";

            # Focus (vim-style)
            "${mod}+h" = "focus left";
            "${mod}+j" = "focus down";
            "${mod}+k" = "focus up";
            "${mod}+l" = "focus right";

            # Move windows (vim-style)
            "${mod}+Shift+h" = "move left";
            "${mod}+Shift+j" = "move down";
            "${mod}+Shift+k" = "move up";
            "${mod}+Shift+l" = "move right";

            # Layout
            "${mod}+o" = "layout toggle split";
            "${mod}+backslash" = "layout toggle";

            # Workspaces
            "${mod}+1" = "workspace number 1";
            "${mod}+2" = "workspace number 2";
            "${mod}+3" = "workspace number 3";
            "${mod}+4" = "workspace number 4";
            "${mod}+5" = "workspace number 5";
            "${mod}+6" = "workspace number 6";
            "${mod}+7" = "workspace number 7";
            "${mod}+8" = "workspace number 8";
            "${mod}+9" = "workspace number 9";

            # Move to workspace
            "${mod}+Shift+1" = "move container to workspace number 1";
            "${mod}+Shift+2" = "move container to workspace number 2";
            "${mod}+Shift+3" = "move container to workspace number 3";
            "${mod}+Shift+4" = "move container to workspace number 4";
            "${mod}+Shift+5" = "move container to workspace number 5";
            "${mod}+Shift+6" = "move container to workspace number 6";
            "${mod}+Shift+7" = "move container to workspace number 7";
            "${mod}+Shift+8" = "move container to workspace number 8";
            "${mod}+Shift+9" = "move container to workspace number 9";

            # Screenshot (area → clipboard + ~/Pictures/screenshots/)
            "${mod}+Shift+s" = "exec ${screenshotArea}";

            # Clipboard history (cliphist + fuzzel)
            "${mod}+v" = "exec cliphist list | fuzzel --dmenu | cliphist decode | wl-copy";

            # Session
            "${mod}+Shift+e" = "exec swaymsg exit";
            "${mod}+Shift+c" = "reload";
            "${mod}+Shift+r" = "restart";

            # Audio (pamixer + avizo OSD)
            "XF86AudioRaiseVolume" = "exec pamixer -i 5 && avizo-client volume";
            "XF86AudioLowerVolume" = "exec pamixer -d 5 && avizo-client volume";
            "XF86AudioMute"        = "exec pamixer -t && avizo-client volume";
            "XF86AudioMicMute"     = "exec pamixer --default-source -t && avizo-client volume";

            # Brightness (brightnessctl + avizo OSD)
            "XF86MonBrightnessUp"   = "exec brightnessctl set +5% && avizo-client brightness";
            "XF86MonBrightnessDown" = "exec brightnessctl set 5%- && avizo-client brightness";
          };

          # ── Startup ──────────────────────────────────────────────────
          startup = [
            { command = "waybar"; }
            { command = "${pkgs.kdePackages.polkit-kde-agent-1}/libexec/polkit-kde-authentication-agent-1"; }
            { command = "nm-applet --indicator"; }
            { command = "udiskie"; }
          ];
        };
      };

      # ── Waybar (default swaybar design, Adwaita Sans) ─────────────────
      programs.waybar = {
        enable = true;

        settings.mainBar = {
          layer = "top";
          position = "bottom";

          modules-left = [
            "sway/workspaces"
          ];
          modules-right = [
            "tray"
            "clock"
          ];

          "sway/workspaces" = {
            disable-scroll = true;
            format = "{name}";
          };

          clock = {
            format = "{:%Y-%m-%d %H:%M}";
          };

          tray = {
            icon-size = 16;
            spacing = 4;
          };
        };

        style = ''
          * {
            font-family: "Adwaita Sans", sans-serif;
            font-size: 13px;
            border: none;
            border-radius: 0;
            min-height: 0;
          }

          window#waybar {
            background: #000000;
            color: #ffffff;
          }

          #workspaces button {
            padding: 0 5px;
            color: #ffffff;
            background: #000000;
            border: 1px solid #000000;
          }

          #workspaces button.focused {
            color: #ffffff;
            background: #285577;
            border: 1px solid #4c7899;
          }

          #workspaces button.urgent {
            color: #ffffff;
            background: #900000;
            border: 1px solid #2f343a;
          }

          #clock {
            padding: 0 6px;
            color: #ffffff;
          }

          #tray {
            padding: 0 6px;
          }
        '';
      };

      # ── Swaync (notification center + sound) ─────────────────────────
      services.swaync = {
        enable = true;
        settings = {
          positionX = "right";
          positionY = "top";
          layer = "overlay";
          control-center-layer = "overlay";
          control-center-margin-top = 10;
          control-center-margin-right = 10;
          timeout = 10;
          timeout-low = 5;
          timeout-critical = 0;
          fit-to-screen = true;
          control-center-width = 400;
          notification-window-width = 400;
          scripts = {
            "notification-sound" = {
              exec = "${pkgs.libcanberra-gtk3}/bin/canberra-gtk-play -i message";
              app-name = ".*";
            };
          };
        };
        style = ''
          * {
            font-family: "Adwaita Sans", sans-serif;
            font-size: 13px;
          }

          .notification-row {
            outline: none;
          }

          .notification-row:focus,
          .notification-row:hover {
            background: alpha(#285577, 0.8);
          }

          .notification {
            border-radius: 8px;
            margin: 6px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.4);
            background: #323232;
            border: 1px solid #444444;
          }

          .notification-content {
            background: transparent;
            padding: 12px;
          }

          .close-button {
            background: #900000;
            color: white;
            border-radius: 50%;
            padding: 4px;
          }

          .control-center {
            background: #222222;
            border: 1px solid #333333;
            border-radius: 8px;
          }

          .control-center-list {
            background: transparent;
          }

          .widget-title {
            padding: 12px;
            font-size: 16px;
            font-weight: bold;
            color: #ffffff;
          }

          .widget-dnd {
            padding: 8px 12px;
          }

          .widget-dnd > switch {
            background: #444444;
            border-radius: 12px;
          }

          .widget-dnd > switch:checked {
            background: #285577;
          }
        '';
      };

      # ── Avizo (audio/brightness OSD) ─────────────────────────────────
      services.avizo = {
        enable = true;
        settings = {
          default = {
            time = 2.0;
            yOffset = 0.9;
            fadeIn = 0.2;
            fadeOut = 0.5;
          };
        };
      };

      # ── Swaylock ─────────────────────────────────────────────────────
      programs.swaylock = {
        enable = true;
        settings = {
          color = "000000";
          show-failed-attempts = true;
        };
      };

      # ── Swayidle ─────────────────────────────────────────────────────
      services.swayidle = {
        enable = true;
        events = {
          before-sleep = "swaylock -f -c 000000";
        };
        timeouts = [
          { timeout = 300; command = "swaylock -f -c 000000"; }
          { timeout = 600; command = "swaymsg 'output * power off'"; resumeCommand = "swaymsg 'output * power on'"; }
        ];
      };

      # ── Cursor (GNOME/Adwaita) ───────────────────────────────────────
      home.pointerCursor = {
        enable = true;
        name    = "Adwaita";
        package = pkgs.adwaita-icon-theme;
        size    = 24;
        gtk.enable = true;
      };

      # ── Default apps (Dolphin as file manager) ───────────────────────
      xdg.mimeApps = {
        enable = true;
        defaultApplications = {
          "inode/directory" = [ "org.kde.dolphin.desktop" ];
        };
      };
    };
  };
}
