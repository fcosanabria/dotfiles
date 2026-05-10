{ config, pkgs, lib, ... }:

{
  config = lib.mkIf config.programs.sway.enable {
  home-manager.users.fsanabria = {

    # ── Sway ────────────────────────────────────────────────────────────
    wayland.windowManager.sway = {
      enable = true;
      checkConfig = false;          # Wallpaper path not available in sandbox
      systemd.enable = true;       # Sway-session.target for services

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
          outer = 0;
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
          {
            criteria = { app_id = "org.pulseaudio.pavucontrol"; };
            command = "floating enable, resize set 500 400, move position cursor, move down 20";
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
          "${mod}+space" = "exec dms ipc launcher toggle";
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
        };

        # ── Startup ───────────────────────────────────────────────────
        startup = [
          { command = "noctalia-shell"; }
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

    # ── Mako (notifications) — deshabilitado, noctalia maneja notificaciones
    services.mako.enable = false;

    # ── Kanshi (display profiles) ─────────────────────────────────────
    services.kanshi = {
      enable = true;
      settings = [
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
