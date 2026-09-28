{ config, pkgs, lib, ... }:

{
  config = lib.mkIf config.programs.sway.enable {
    home-manager.users.fsanabria = {

      # ── Vicinae launcher ─────────────────────────────────────────────
      home.packages = [ pkgs.vicinae ];

      # Config declarativa. Edita este JSONC para cambiar el launcher.
      xdg.configFile."vicinae/config.jsonc".text = ''
        {
          // Fuente de la interfaz
          "font": {
            "normal": {
              "family": "Adwaita Sans"
            }
          },

          // Tema oscuro por defecto
          "theme": {
            "dark": {
              "name": "vicinae-dark",
              "icon_theme": "auto"
            }
          }
        }
      '';

      # Daemon en segundo plano (el launcher se abre con `vicinae toggle`)
      systemd.user.services.vicinae = {
        Unit = {
          Description = "Vicinae Launcher Daemon";
          After = [ "graphical-session.target" ];
          PartOf = [ "graphical-session.target" ];
        };
        Service = {
          Type = "simple";
          ExecStart = "${pkgs.vicinae}/bin/vicinae server --replace";
          Restart = "on-failure";
          RestartSec = 60;
        };
        Install = {
          WantedBy = [ "graphical-session.target" ];
        };
      };
    };
  };
}
