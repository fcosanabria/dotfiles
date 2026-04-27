{ config, lib, pkgs, ... }:

{
  # Display Manager & Desktop Environment
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  # GNOME Developer Tools
  services.gnome.core-developer-tools.enable = true;

  # Declarative GNOME dconf settings (system-wide defaults)
  programs.dconf = {
    enable = true;
    profiles.user.databases = [{
      settings = with lib.gvariant; {

        "org/gnome/desktop/interface" = {
          color-scheme = "prefer-dark";
          accent-color = "slate";
          enable-hot-corners = false;
          show-battery-percentage = true;
        };

        # Wallpaper
        "org/gnome/desktop/background" = {
          picture-uri = "file:///run/current-system/sw/share/backgrounds/gnome/adwaita-l.jxl";
          picture-uri-dark = "file:///run/current-system/sw/share/backgrounds/gnome/adwaita-l.jxl";
          picture-options = "zoom";
        };

        # Workspaces
        "org/gnome/mutter" = {
          dynamic-workspaces = false;
          edge-tiling = false;
          workspaces-only-on-primary = true;
        };

        "org/gnome/desktop/wm/preferences" = {
          num-workspaces = mkInt32 4;
          button-layout = ":";
        };

        # Workspace switching keybindings
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

        # Disable default Super+N app switching (conflicts with workspace switching)
        "org/gnome/shell/keybindings" = {
          switch-to-application-1 = mkEmptyArray type.string;
          switch-to-application-2 = mkEmptyArray type.string;
          switch-to-application-3 = mkEmptyArray type.string;
          switch-to-application-4 = mkEmptyArray type.string;
        };

        # Keyboard: Compose key on Right Super
        "org/gnome/desktop/input-sources" = {
          xkb-options = [ "compose:rwin" ];
        };

        # Mouse & Touchpad
        "org/gnome/desktop/peripherals/mouse" = {
          accel-profile = "flat";
        };

        "org/gnome/desktop/peripherals/touchpad" = {
          natural-scroll = false;
          two-finger-scrolling-enabled = true;
        };

        # Extensions
        "org/gnome/shell" = {
          disable-user-extensions = false;
          enabled-extensions = [
            "grimble@lmt.github.io"
            "caffeine@patapon.info"
            "appindicatorsupport@rgcjonas.gmail.com"
          ];
        };

        # Grimble keybindings (vim-style tiling)
        "org/gnome/shell/extensions/grimble" = {
          keybinding-config = "Custom";
          keybinding-close = [ "<Super>q" ];
          keybinding-focus = [ "<Super>space" ];
          keybinding-focus-bottom = [ "<Super>j" ];
          keybinding-focus-left = [ "<Super>h" ];
          keybinding-focus-right = [ "<Super>l" ];
          keybinding-focus-top = [ "<Super>k" ];
          keybinding-maximize = [ "<Super>f" ];
          keybinding-move-bottom = [ "<Super><Shift>k" ];
          keybinding-move-left = [ "<Super><Shift>h" ];
          keybinding-move-right = [ "<Super><Shift>l" ];
          keybinding-move-top = [ "<Super><Shift>k" ];
          keybinding-resize = [ "<Super>r" ];
          keybinding-search = [ "<Control><Alt>b" ];
          keybinding-open-settings = [ "<Control><Super>g" ];
          tile-padding = mkInt32 4;
        };
      };
    }];
  };

  # GNOME-specific packages
  environment.systemPackages = with pkgs; [
    gnome-extension-manager
    gnomeExtensions.grimble-tiling-wm
    gnomeExtensions.caffeine
    gnomeExtensions.appindicator
  ];
}
