{ config, pkgs, lib, ... }:

{
  config = lib.mkIf config.programs.sway.enable {
  home-manager.users.fsanabria = {

    # ── Sway ────────────────────────────────────────────────────────────
    wayland.windowManager.sway = {
      enable = true;
      checkConfig = false;          # Wallpaper path not available in sandbox
      systemd.enable = true;       # Sway-session.target for services

      # ── Workspace assignments to outputs ──────────────────────────
      # Workspace 5 always on HDMI (top monitor)
      extraConfig = ''
        workspace 5 output HDMI-A-1
      '';

      config = {
        modifier = "Mod4";         # Super key
        terminal = "ghostty";

        # ── Cursor ─────────────────────────────────────────────────────
        seat."*".xcursor_theme = "Adwaita 24";

        # ── Input ──────────────────────────────────────────────────────
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

        # ── Appearance ─────────────────────────────────────────────────
        gaps = {
          inner = 2;
          outer = 2;
        };

        fonts = {
            names = [ "BerkeleyMono Nerd Font Mono" ];
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

          # ── Floating: pavucontrol ───────────────────────────────────
          {
            criteria = { app_id = "org.pulseaudio.pavucontrol"; };
            command = "floating enable, resize set 500 400, move position cursor, move down 20";
          }

          # ── Workspace 1: Browsers ──────────────────────────────────
          {
            criteria = { app_id = "firefox"; };
            command = "move container to workspace number 1";
          }
          {
            criteria = { class = "firefox"; };
            command = "move container to workspace number 1";
          }
          {
            criteria = { app_id = "brave-browser"; };
            command = "move container to workspace number 1";
          }
          {
            criteria = { class = "Brave-browser"; };
            command = "move container to workspace number 1";
          }
          {
            criteria = { app_id = "vivaldi-stable"; };
            command = "move container to workspace number 1";
          }
          {
            criteria = { class = "Vivaldi"; };
            command = "move container to workspace number 1";
          }

          # ── Workspace 2: Development (terminals, editors, IDEs) ────
          {
            criteria = { app_id = "ghostty"; };
            command = "move container to workspace number 2";
          }
          {
            criteria = { class = "ghostty"; };
            command = "move container to workspace number 2";
          }
          {
            criteria = { app_id = "code"; };
            command = "move container to workspace number 2";
          }
          {
            criteria = { class = "Code"; };
            command = "move container to workspace number 2";
          }
          {
            criteria = { app_id = "vscodium"; };
            command = "move container to workspace number 2";
          }
          {
            criteria = { class = "VSCodium"; };
            command = "move container to workspace number 2";
          }
          {
            criteria = { app_id = "jetbrains-pycharm"; };
            command = "move container to workspace number 2";
          }
          {
            criteria = { class = "jetbrains-pycharm"; };
            command = "move container to workspace number 2";
          }
          # ── Workspace 3: Productivity (email, calendar, chat) ──────
          {
            criteria = { app_id = "evolution"; };
            command = "move container to workspace number 3";
          }
          {
            criteria = { class = "Evolution"; };
            command = "move container to workspace number 3";
          }
          {
            criteria = { app_id = "superproductivity"; };
            command = "move container to workspace number 3";
          }
          {
            criteria = { class = "superproductivity"; };
            command = "move container to workspace number 3";
          }
          {
            criteria = { app_id = "thunderbird"; };
            command = "move container to workspace number 3";
          }
          {
            criteria = { class = "thunderbird"; };
            command = "move container to workspace number 3";
          }
          {
            criteria = { app_id = "slack"; };
            command = "move container to workspace number 3";
          }
          {
            criteria = { class = "Slack"; };
            command = "move container to workspace number 3";
          }
          # ── Workspace 5: Discord (HDMI monitor) ────────────────────
          {
            criteria = { app_id = "discord"; };
            command = "move container to workspace number 5";
          }
          {
            criteria = { class = "discord"; };
            command = "move container to workspace number 5";
          }
          {
            criteria = { app_id = "telegram-desktop"; };
            command = "move container to workspace number 3";
          }
          {
            criteria = { class = "telegram-desktop"; };
            command = "move container to workspace number 3";
          }

          # ── Workspace 4: Media (music, video, streaming) ───────────
          {
            criteria = { app_id = "spotify"; };
            command = "move container to workspace number 4";
          }
          {
            criteria = { class = "Spotify"; };
            command = "move container to workspace number 4";
          }
          {
            criteria = { app_id = "cider"; };
            command = "move container to workspace number 4";
          }
          {
            criteria = { class = "cider"; };
            command = "move container to workspace number 4";
          }
          {
            criteria = { app_id = "stremio"; };
            command = "move container to workspace number 4";
          }
          {
            criteria = { class = "stremio"; };
            command = "move container to workspace number 4";
          }
          {
            criteria = { app_id = "vlc"; };
            command = "move container to workspace number 4";
          }
          {
            criteria = { class = "vlc"; };
            command = "move container to workspace number 4";
          }
          {
            criteria = { app_id = "mpv"; };
            command = "move container to workspace number 4";
          }
          {
            criteria = { class = "mpv"; };
            command = "move container to workspace number 4";
          }
        ];

        # ── Disable default swaybar (waybar is started via startup) ───
        bars = [];

        # ── Keybindings ───────────────────────────────────────────────
        keybindings = let
          mod = "Mod4";
          rofi = "rofi -show drun";
        in {
          # Launch
          "${mod}+Return" = "exec ghostty";
          "${mod}+d" = "exec ${rofi}";
          "${mod}+space" = "exec ${rofi}";
          "${mod}+b" = "exec firefox";

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
          "${mod}+s" = "layout stacking";
          "${mod}+w" = "layout tabbed";
          "${mod}+e" = "layout toggle split";
          "${mod}+o" = "layout toggle split";
          "${mod}+v" = "splitv";
          "${mod}+Shift+v" = "splith";

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
          "${mod}+Shift+s" = ''exec mkdir -p ~/Pictures/screenshots && grim -g "$(slurp)" - | tee ~/Pictures/screenshots/$(date +%Y-%m-%d_%H-%M-%S).png | wl-copy'';

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

        # ── Startup ───────────────────────────────────────────────────
        startup = [
          { command = "waybar"; }
          { command = "kanshi"; }
          { command = "${pkgs.kdePackages.polkit-kde-agent-1}/libexec/polkit-kde-authentication-agent-1"; }
          { command = "nm-applet --indicator"; }
        ];
      };
    };

    # ── Desktop Entries ───────────────────────────────────────────────
    xdg.desktopEntries.kanata-toggle = {
      name = "Kanata Toggle";
      comment = "Activar o desactivar Kanata";
      exec = "kanata-toggle";
      icon = "input-keyboard";
      terminal = false;
      categories = [ "Utility" ];
    };

    # ── Cursor ────────────────────────────────────────────────────────
    home.pointerCursor = {
      name    = "Adwaita";
      package = pkgs.adwaita-icon-theme;
      size    = 24;
      gtk.enable = true;
    };

    # ── Swaylock ──────────────────────────────────────────────────────
    programs.swaylock = {
      enable = true;
      settings = {
        color = "000000";
        show-failed-attempts = true;
      };
    };

    # ── Swayidle ──────────────────────────────────────────────────────
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

    # ── Swaync (notification center) ─────────────────────────────────────
    services.swaync = {
      enable = true;
      settings = {
        positionX = "right";
        positionY = "top";
        layer = "overlay";
        control-center-layer = "overlay";
        control-center-margin-top = 10;
        control-center-margin-right = 10;
        notification-icon-size = 48;
        notification-body-image-height = 100;
        notification-body-image-width = 200;
        timeout = 10;
        timeout-low = 5;
        timeout-critical = 0;
        fit-to-screen = true;
        control-center-width = 400;
        notification-window-width = 400;
      };
      style = ''
        * {
          font-family: "BerkeleyMono Nerd Font Mono";
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

    # ── Avizo (audio/brightness OSD) ─────────────────────────────────────
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

    # ── Wlsunset (blue light filter) ─────────────────────────────────────
    services.wlsunset = {
      enable = true;
      latitude = 9.9281;
      longitude = -84.0907;
      temperature = {
        day = 6500;
        night = 3500;
      };
    };

    # ── Kanshi (display profiles) ─────────────────────────────────────
    # Kanshi auto-switches profiles based on connected displays.
    # Profiles are tried in order; the first matching profile activates.
    services.kanshi = {
      enable = true;
      settings = [
        # ── Dual external monitors (HDMI on top, DP on bottom) ────────
        # HDMI above DP, centered horizontally. DP at 1.25x scale.
        {
          profile.name = "dual-monitors";
          profile.outputs = [
            {
              criteria = "HDMI-A-1";
              status = "enable";
              mode = "1920x1080@60Hz";
              position = "576,0";  # Centered: (3072-1920)/2 = 576
              scale = 1.0;
            }
            {
              criteria = "DP-1";
              status = "enable";
              mode = "3840x2160@144Hz";
              position = "0,1080";  # Below HDMI
              scale = 1.25;
            }
          ];
        }

        # ── Single HDMI monitor ──────────────────────────────────────
        {
          profile.name = "hdmi-only";
          profile.outputs = [
            {
              criteria = "HDMI-A-1";
              status = "enable";
              mode = "1920x1080@60Hz";
              position = "0,0";
              scale = 1.0;
            }
          ];
        }

        # ── Single DP monitor ────────────────────────────────────────
        {
          profile.name = "dp-only";
          profile.outputs = [
            {
              criteria = "DP-1";
              status = "enable";
              mode = "3840x2160@144Hz";
              position = "0,0";
              scale = 1.25;
            }
          ];
        }

        # ── Fallback: enable any connected display ───────────────────
        # Catches any setup not matched above.
        {
          profile.name = "default";
          profile.outputs = [
            { criteria = "*"; status = "enable"; }
          ];
        }
      ];
    };

  };
  };
}
