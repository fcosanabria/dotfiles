{ config, pkgs, lib, ... }:

{
  config = lib.mkIf config.services.xserver.desktopManager.xfce.enable {
    home-manager.users.fsanabria = {

      xfconf.settings = {

        # ── Panel ──────────────────────────────────────────────────────────
        xfce4-panel = {
          "/panels" = [ 1 ];
          "/panels/dark-mode" = true;

          # -- Panel 1: Top bar, full width --
          "/panels/panel-1/icon-size" = 16;
          "/panels/panel-1/length" = 100;
          "/panels/panel-1/position" = "p=6;x=0;y=0";
          "/panels/panel-1/position-locked" = true;
          "/panels/panel-1/size" = 26;
          "/panels/panel-1/plugin-ids" = [ 19 4 2 3 6 20 21 22 23 9 8 7 10 27 ];

          # -- Whisker Menu (19) --
          "/plugins/plugin-19" = "whiskermenu";

          # -- Workspace Pager (4) --
          "/plugins/plugin-4" = "pager";
          "/plugins/plugin-4/miniature-view" = false;
          "/plugins/plugin-4/numbering" = false;
          "/plugins/plugin-4/rows" = 1;
          "/plugins/plugin-4/wrap-workspaces" = false;

          # -- Task List (2) --
          "/plugins/plugin-2" = "tasklist";
          "/plugins/plugin-2/flat-buttons" = false;
          "/plugins/plugin-2/grouping" = 1;
          "/plugins/plugin-2/include-all-workspaces" = true;
          "/plugins/plugin-2/middle-click" = 3;
          "/plugins/plugin-2/show-handle" = true;
          "/plugins/plugin-2/show-labels" = true;
          "/plugins/plugin-2/show-only-minimized" = false;
          "/plugins/plugin-2/show-tooltips" = true;
          "/plugins/plugin-2/sort-order" = 1;

          # -- Separator expand (3) --
          "/plugins/plugin-3" = "separator";
          "/plugins/plugin-3/expand" = true;
          "/plugins/plugin-3/style" = 0;

          # -- System Tray (6) --
          "/plugins/plugin-6" = "systray";
          "/plugins/plugin-6/square-icons" = true;

          # -- Clipman (20) --
          "/plugins/plugin-20" = "xfce4-clipman-plugin";

          # -- Notifications (21) --
          "/plugins/plugin-21" = "notification-plugin";

          # -- Power Manager (22) --
          "/plugins/plugin-22" = "power-manager-plugin";

          # -- PulseAudio (23) --
          "/plugins/plugin-23" = "pulseaudio";
          "/plugins/plugin-23/enable-keyboard-shortcuts" = true;

          # -- Separators (9, 7, 27) --
          "/plugins/plugin-9" = "separator";
          "/plugins/plugin-9/style" = 0;
          "/plugins/plugin-7" = "separator";
          "/plugins/plugin-7/style" = 0;
          "/plugins/plugin-27" = "separator";
          "/plugins/plugin-27/expand" = false;

          # -- Clock (8) --
          "/plugins/plugin-8" = "clock";
          "/plugins/plugin-8/digital-date-font" = "Adwaita Sans Medium 8";
          "/plugins/plugin-8/digital-layout" = 3;
          "/plugins/plugin-8/digital-time-font" = "Adwaita Sans Medium 10";
          "/plugins/plugin-8/digital-time-format" = "%T";
          "/plugins/plugin-8/mode" = 2;
          "/plugins/plugin-8/show-week-numbers" = true;
          "/plugins/plugin-8/tooltip-format" = "%A %d %B %Y";

          # -- Actions (10) --
          "/plugins/plugin-10" = "actions";
          "/plugins/plugin-10/appearance" = 1;
          "/plugins/plugin-10/button-title" = 1;
          "/plugins/plugin-10/custom-title" = "NixOS";
          "/plugins/plugin-10/items" = [
            "+lock-screen"
            "-switch-user"
            "+separator"
            "+suspend"
            "-hibernate"
            "-hybrid-sleep"
            "-separator"
            "+shutdown"
            "+restart"
            "+separator"
            "-logout"
            "-logout-dialog"
          ];
        };

        # ── Window Manager (xfwm4) ────────────────────────────────────────
        xfwm4 = {
          "/general/workspace_count" = 4;
          "/general/workspace_names" = [ "1" "2" "3" "4" ];
          "/general/theme" = "Default";
          "/general/title_font" = "Adwaita Sans Bold 10";
          "/general/title_alignment" = "left";
          "/general/button_layout" = "O|SHMC";
          "/general/use_compositing" = true;
          "/general/placement_mode" = "center";
          "/general/cycle_workspaces" = true;
          "/general/scroll_workspaces" = true;
          "/general/borderless_maximize" = true;
          "/general/click_to_focus" = true;
          "/general/raise_on_click" = true;
          "/general/snap_to_border" = true;
          "/general/snap_width" = 10;
          "/general/wrap_cycle" = true;
          "/general/wrap_layout" = true;
          "/general/zoom_desktop" = true;
          "/general/cycle_preview" = true;
        };

        # ── Appearance (xsettings) ─────────────────────────────────────────
        xsettings = {
          "/Gtk/FontName" = "Adwaita Sans 10";
          "/Gtk/MonospaceFontName" = "Adwaita Mono 10";
          "/Gtk/CursorThemeName" = "Adwaita";
          "/Gtk/DecorationLayout" = "icon,menu:minimize,maximize,close";
          "/Net/ThemeName" = "Adwaita-dark";
          "/Net/IconThemeName" = "Rodent";
          "/Xft/DPI" = 96;
        };

        # ── Keyboard Shortcuts ─────────────────────────────────────────────
        xfce4-keyboard-shortcuts = {
          # -- Switch Workspace --
          "/xfwm4/custom/<Super>1" = "workspace_1_key";
          "/xfwm4/custom/<Super>2" = "workspace_2_key";
          "/xfwm4/custom/<Super>3" = "workspace_3_key";
          "/xfwm4/custom/<Super>4" = "workspace_4_key";

          # -- Move Window to Workspace --
          "/xfwm4/custom/<Super><Shift>1" = "move_window_workspace_1_key";
          "/xfwm4/custom/<Super><Shift>2" = "move_window_workspace_2_key";
          "/xfwm4/custom/<Super><Shift>3" = "move_window_workspace_3_key";
          "/xfwm4/custom/<Super><Shift>4" = "move_window_workspace_4_key";

          # -- Command Shortcuts --
          "/commands/custom/override" = true;
          "/commands/custom/<Super>e" = "thunar";
          "/commands/custom/<Super>r" = "xfce4-appfinder -c";
          "/commands/custom/<Primary><Alt>t" = "exo-open --launch TerminalEmulator";
          "/commands/custom/<Primary><Alt>f" = "thunar";
          "/commands/custom/<Primary><Alt>l" = "xflock4";
          "/commands/custom/<Primary><Alt>Delete" = "xfce4-session-logout";
          "/commands/custom/<Primary><Alt>Escape" = "xkill";
          "/commands/custom/<Primary><Shift>Escape" = "xfce4-taskmanager";
          "/commands/custom/<Primary>Escape" = "xfdesktop --menu";
          "/commands/custom/Print" = "xfce4-screenshooter";
          "/commands/custom/<Shift>Print" = "xfce4-screenshooter -r";
          "/commands/custom/<Alt>Print" = "xfce4-screenshooter -w";
        };

      };

    };
  };
}
