{
  config,
  lib,
  pkgs,
  ...
}:

with lib.gvariant;

{
  config = lib.mkIf config.services.desktopManager.gnome.enable {
    home-manager.users.fsanabria = {
      dconf.enable = true;

      dconf.settings = {
        "org/gnome/desktop/interface" = {
          color-scheme = "prefer-dark";
          accent-color = "slate";
          gtk-theme = "adw-gtk3-dark";
          icon-theme = "Adwaita";
          cursor-theme = "Adwaita";
          cursor-size = 24;
          show-battery-percentage = true;
          enable-hot-corners = false;
        };

        "org/gnome/desktop/background" = {
          picture-uri = "file:///run/current-system/sw/share/backgrounds/gnome/adwaita-l.jxl";
          picture-uri-dark = "file:///run/current-system/sw/share/backgrounds/gnome/adwaita-d.jxl";
          picture-options = "zoom";
        };

        "org/gnome/mutter" = {
          dynamic-workspaces = false;
          edge-tiling = false;
          workspaces-only-on-primary = true;
        };

        "org/gnome/desktop/wm/preferences" = {
          num-workspaces = mkInt32 4;
          button-layout = ":";
        };

        "org/gnome/desktop/wm/keybindings" = {
          switch-to-workspace-1 = [ "<Super>1" ];
          switch-to-workspace-2 = [ "<Super>2" ];
          switch-to-workspace-3 = [ "<Super>3" ];
          switch-to-workspace-4 = [ "<Super>4" ];
          move-to-workspace-1 = [ "<Super><Shift>1" ];
          move-to-workspace-2 = [ "<Super><Shift>2" ];
          move-to-workspace-3 = [ "<Super><Shift>3" ];
          move-to-workspace-4 = [ "<Super><Shift>4" ];
          move-to-monitor-left = [ "<Super><Control>Left" ];
          move-to-monitor-right = [ "<Super><Control>Right" ];
        };

        "org/gnome/shell/keybindings" = {
          switch-to-application-1 = mkEmptyArray type.string;
          switch-to-application-2 = mkEmptyArray type.string;
          switch-to-application-3 = mkEmptyArray type.string;
          switch-to-application-4 = mkEmptyArray type.string;
        };

        "org/gnome/desktop/input-sources" = {
          xkb-options = [ "compose:rwin" ];
        };

        "org/gnome/desktop/peripherals/mouse" = {
          accel-profile = "flat";
        };

        "org/gnome/desktop/peripherals/touchpad" = {
          natural-scroll = false;
          two-finger-scrolling-enabled = true;
        };

        "org/gnome/shell" = {
          disable-user-extensions = false;
          enabled-extensions = [
            "caffeine@patapon.info"
            "appindicatorsupport@rgcjonas.gmail.com"
          ];
        };
      };

      gtk = {
        enable = true;
        font = {
          name = "Adwaita Sans";
          size = 10;
        };
        theme = {
          name = "adw-gtk3-dark";
          package = pkgs.adw-gtk3;
        };
        gtk4.theme = {
          name = "adw-gtk3-dark";
          package = pkgs.adw-gtk3;
        };
        iconTheme = {
          name = "Adwaita";
          package = pkgs.adwaita-icon-theme;
        };
        cursorTheme = {
          name = "Adwaita";
          package = pkgs.adwaita-icon-theme;
          size = 24;
        };
        gtk3.extraConfig = {
          gtk-application-prefer-dark-theme = true;
        };
        gtk4.extraConfig = {
          gtk-application-prefer-dark-theme = true;
        };
      };

      home.pointerCursor = {
        name = "Adwaita";
        package = pkgs.adwaita-icon-theme;
        size = 24;
        gtk.enable = true;
        x11.enable = true;
      };

      xdg.desktopEntries.kanata-toggle = {
        name = "Kanata Toggle";
        comment = "Activar o desactivar Kanata";
        exec = "kanata-toggle";
        icon = "input-keyboard";
        terminal = false;
        categories = [ "Utility" ];
      };
    };
  };
}
