{ config, pkgs, lib, inputs, ... }:

let
  inherit (lib) mkIf;
in
{
  config = mkIf config.services.desktopManager.cosmic.enable {
    home-manager.users.fsanabria = {
      imports = [
        inputs.cosmic-manager.homeManagerModules.cosmic-manager
      ];

      # ── COSMIC Desktop settings (via cosmic-manager) ─────────────────
      wayland.desktopManager.cosmic = {
        enable = true;

        compositor = {
          # Tiling activado por defecto en todos los workspaces
          autotile = true;
          autotile_behavior = {
            __type = "enum";
            variant = "PerWorkspace";
          };

          workspaces = {
            workspace_layout = {
              __type = "enum";
              variant = "Vertical";
            };
            workspace_mode = {
              __type = "enum";
              variant = "OutputBound";
            };
          };
        };
      };

      # ── Display layout vía cosmic-randr ──────────────────────────────
      # Aplica la configuración de displays que se guardó en
      # ~/.local/state/cosmic-comp/outputs.ron:
      #   DP-1:     3840×2160 @144 Hz, scale 1.25, posición (0, 1080)
      #   HDMI-A-1: 1920×1080 @60 Hz, escala 1.0, posición (519, 0)
      systemd.user.services.cosmic-display-layout = {
        Unit = {
          Description = "Apply COSMIC display layout";
          After = [ "graphical-session.target" ];
          PartOf = [ "graphical-session.target" ];
        };
        Service = {
          Type = "oneshot";
          RemainAfterExit = true;
          ExecStart = let
            r = "${pkgs.cosmic-randr}/bin/cosmic-randr";
          in [
            "${r} mode DP-1 3840 2160 --refresh 143982 --scale 1.25 --pos-x 0 --pos-y 1080"
            "${r} mode HDMI-A-1 1920 1080 --refresh 60000 --pos-x 519 --pos-y 0"
          ];
        };
        Install.WantedBy = [ "graphical-session.target" ];
      };
    };
  };
}
