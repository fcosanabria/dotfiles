{ config, pkgs, lib, ... }:

let
  swayFiles = ./sway/files;

  scripts = [
    "sway-brightness"
    "sway-cheatsheet"
    "sway-focusmode"
    "sway-lock"
    "sway-night"
    "sway-power"
    "sway-volume"
    "sway-wallpaper"
    "waybar-layout"
    "waybar-restart"
    "waybar-style"
  ];

  # Files regenerated at runtime by matugen / the waybar switchers. They are
  # seeded once on activation as writable copies instead of being managed as
  # read-only store symlinks, so the scripts can overwrite them freely.
  seeds = {
    "waybar/colors.css" = "${swayFiles}/waybar/colors.css";
    "waybar/config" = "${swayFiles}/waybar/configs/bintang-default";
    "waybar/style.css" = "${swayFiles}/waybar/styles/islands.css";
    "sway/colors" = "${swayFiles}/sway/colors";
    "foot/colors.ini" = "${swayFiles}/foot/colors.ini";
    "fuzzel/colors.ini" = "${swayFiles}/fuzzel/colors.ini";
  };

  seedScript = lib.concatStringsSep "\n" (
    lib.mapAttrsToList (target: src: ''
      if [ ! -e "$HOME/.config/${target}" ]; then
        run mkdir -p "$(dirname "$HOME/.config/${target}")"
        run cp ${src} "$HOME/.config/${target}"
      fi
    '') seeds
  );

  staticFiles = {
    "waybar/configs/bintang-default" = swayFiles + "/waybar/configs/bintang-default";
    "waybar/configs/compact" = swayFiles + "/waybar/configs/compact";
    "waybar/styles/islands.css" = swayFiles + "/waybar/styles/islands.css";
    "waybar/styles/full-bar.css" = swayFiles + "/waybar/styles/full-bar.css";
    "swaync/config.json" = swayFiles + "/swaync/config.json";
    "swaync/style.css" = swayFiles + "/swaync/style.css";
    "fuzzel/fuzzel.ini" = swayFiles + "/fuzzel/fuzzel.ini";
    "foot/foot.ini" = swayFiles + "/foot/foot.ini";
    "wlogout/layout" = swayFiles + "/wlogout/layout";
    "wlogout/style.css" = swayFiles + "/wlogout/style.css";
    "swayr/config.toml" = swayFiles + "/swayr/config.toml";
    "matugen/config.toml" = swayFiles + "/matugen/config.toml";
    "matugen/templates/colors.css" = swayFiles + "/matugen/templates/colors.css";
    "matugen/templates/foot-colors.ini" = swayFiles + "/matugen/templates/foot-colors.ini";
    "matugen/templates/fuzzel-colors.ini" = swayFiles + "/matugen/templates/fuzzel-colors.ini";
    "matugen/templates/gtk-colors.css" = swayFiles + "/matugen/templates/gtk-colors.css";
    "matugen/templates/sway-colors" = swayFiles + "/matugen/templates/sway-colors";
    "kanshi/config" = swayFiles + "/kanshi/config";
    "gammastep/config.ini" = swayFiles + "/gammastep/config.ini";
    "fontconfig/fonts.conf" = swayFiles + "/fontconfig/fonts.conf";
  };
in
{
  config = lib.mkIf config.programs.sway.enable {
    home-manager.users.fsanabria = { lib, pkgs, ... }: {

      # ── Sway config (SwayFX rice) ─────────────────────────────────────
      xdg.configFile = {
        "sway/config".text = builtins.replaceStrings
          [ "@POLKIT_AGENT@" ]
          [ "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1" ]
          (builtins.readFile (swayFiles + "/sway/config"));
      }
      // builtins.listToAttrs (
        map (name: {
          name = "sway/scripts/${name}";
          value.source = swayFiles + "/sway/scripts/${name}";
        }) scripts
      )
      // builtins.listToAttrs (
        lib.mapAttrsToList (name: src: {
          inherit name;
          value.source = src;
        }) staticFiles
      );

      # ── Seed runtime-mutable defaults (matugen / waybar switchers) ────
      home.activation.swaySeedDefaults = lib.hm.dag.entryAfter [ "writeBoundary" ] seedScript;

      # ── Cursor (GNOME/Adwaita, matches `seat seat0 xcursor_theme`) ────
      home.pointerCursor = {
        enable = true;
        name = "Adwaita";
        package = pkgs.adwaita-icon-theme;
        size = 24;
        gtk.enable = true;
      };

      # ── Default apps (Dolphin as file manager) ────────────────────────
      xdg.mimeApps = {
        enable = true;
        defaultApplications = {
          "inode/directory" = [ "org.kde.dolphin.desktop" ];
        };
      };
    };
  };
}
