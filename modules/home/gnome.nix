{
  config,
  lib,
  pkgs,
  ...
}:

{
  config = lib.mkIf config.services.desktopManager.gnome.enable {
    home-manager.users.fsanabria = {
      dconf.enable = true;

      dconf.settings = {
        "org/gnome/desktop/interface" = {
          color-scheme = "prefer-dark";
          gtk-theme = "adw-gtk3-dark";
          icon-theme = "Adwaita";
          cursor-theme = "Adwaita";
          cursor-size = 24;
          show-battery-percentage = true;
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
