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
              variant = "Horizontal";
            };
            workspace_mode = {
              __type = "enum";
              variant = "OutputBound";
            };
          };

          # 4 workspaces fijos por salida
          pinned_workspaces = lib.flatten (
            map (output:
              map (id: {
                output = {
                  name = output;
                  edid = {
                    __type = "optional";
                    value = null;
                  };
                };
                tiling_enabled = true;
                id = {
                  __type = "optional";
                  value = null;
                };
                name = {
                  __type = "optional";
                  value = null;
                };
              }) [ "1" "2" "3" "4" ]
            ) [ "DP-1" "DP-2" "HDMI-A-1" ]
          );
        };

        # ── Apariencia / Frosted Glass ──────────────────────────────────
        appearance = {
          theme = {
            mode = "dark";
            dark = {
              frosted = {
                __type = "enum";
                variant = "Medium";
              };
              frosted_windows = true;
              frosted_panel = true;
              frosted_applets = true;
              frosted_system_interface = true;
              accent = {
                __type = "optional";
                value = {
                  red = 0.9921569;
                  green = 0.6313726;
                  blue = 0.627451;
                };
              };
              corner_radii = {
                radius_0 = { __type = "tuple"; value = [ 0.0 0.0 0.0 0.0 ]; };
                radius_xs = { __type = "tuple"; value = [ 4.0 4.0 4.0 4.0 ]; };
                radius_s = { __type = "tuple"; value = [ 8.0 8.0 8.0 8.0 ]; };
                radius_m = { __type = "tuple"; value = [ 16.0 16.0 16.0 16.0 ]; };
                radius_l = { __type = "tuple"; value = [ 32.0 32.0 32.0 32.0 ]; };
                radius_xl = { __type = "tuple"; value = [ 160.0 160.0 160.0 160.0 ]; };
              };
            };
            light = {
              frosted = {
                __type = "enum";
                variant = "Medium";
              };
              frosted_windows = true;
              frosted_panel = true;
              frosted_applets = true;
              frosted_system_interface = true;
              corner_radii = {
                radius_0 = { __type = "tuple"; value = [ 0.0 0.0 0.0 0.0 ]; };
                radius_xs = { __type = "tuple"; value = [ 4.0 4.0 4.0 4.0 ]; };
                radius_s = { __type = "tuple"; value = [ 8.0 8.0 8.0 8.0 ]; };
                radius_m = { __type = "tuple"; value = [ 16.0 16.0 16.0 16.0 ]; };
                radius_l = { __type = "tuple"; value = [ 32.0 32.0 32.0 32.0 ]; };
                radius_xl = { __type = "tuple"; value = [ 160.0 160.0 160.0 160.0 ]; };
              };
            };
          };

          toolkit = {
            apply_theme_global = true;
            header_size = {
              __type = "enum";
              variant = "Compact";
            };
            icon_theme = "Cosmic";
            interface_density = {
              __type = "enum";
              variant = "Compact";
            };
            interface_font = {
              family = "Adwaita Sans";
              stretch = { __type = "enum"; variant = "Normal"; };
              style = { __type = "enum"; variant = "Normal"; };
              weight = { __type = "enum"; variant = "Normal"; };
            };
            monospace_font = {
              family = "Berkeley Mono";
              stretch = { __type = "enum"; variant = "Normal"; };
              style = { __type = "enum"; variant = "Normal"; };
              weight = { __type = "enum"; variant = "Normal"; };
            };
          };
        };

        # ── Rotación de wallpapers (artworks en 3 monitores) ────────────
        wallpapers = map (output: {
          inherit output;
          source = {
            __type = "enum";
            variant = "Path";
            value = [ "/home/fsanabria/Pictures/artworks" ];
          };
          filter_by_theme = false;
          filter_method = {
            __type = "enum";
            variant = "Lanczos";
          };
          scaling_mode = {
            __type = "enum";
            variant = "Zoom";
          };
          sampling_method = {
            __type = "enum";
            variant = "Random";
          };
          rotation_frequency = 300;
        }) [ "DP-1" "DP-2" "HDMI-A-1" ];

        # ── Dock ajustes (border radius) ────────────────────────────────
        configFile."com.system76.CosmicPanel.Dock" = {
          version = 1;
          entries = {
            border_radius = 12;
          };
        };

        # ── Cosmic Term (fuente y tamaño) ───────────────────────────────
        configFile."com.system76.CosmicTerm" = {
          version = 1;
          entries = {
            font_name = "Berkeley Mono";
            font_size = 14;
          };
        };
      };

      # ── Display layout vía cosmic-randr ──────────────────────────────
      # Aplica la configuración de 3 displays guardada en
      # ~/.local/state/cosmic-comp/outputs.ron:
      #   DP-1:     3840×2160 @144 Hz, scale 1.25, posición (0, 252)
      #   DP-2:     1920×1080 @144 Hz, escala 1.0, posición (3072, 1080)
      #   HDMI-A-1: 1920×1080 @144 Hz, escala 1.0, posición (3072, 0)
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
            "${r} mode DP-1 3840 2160 --refresh 143982 --scale 1.25 --pos-x 0 --pos-y 252"
            "${r} mode DP-2 1920 1080 --refresh 143999 --pos-x 3072 --pos-y 1080"
            "${r} mode HDMI-A-1 1920 1080 --refresh 143999 --pos-x 3072 --pos-y 0"
            "${r} xwayland --primary DP-1"
          ];
        };
        Install.WantedBy = [ "graphical-session.target" ];
      };

      # ── Polkit auth agent (diálogos de elevación en apps admin) ─────
      # cosmic-session procesa XDG autostart al iniciar sesión.
      xdg.configFile."autostart/polkit-kde-authentication-agent.desktop".text = ''
        [Desktop Entry]
        Type=Application
        Name=Polkit Authentication Agent
        Exec=${pkgs.kdePackages.polkit-kde-agent-1}/libexec/polkit-kde-authentication-agent-1
        OnlyShowIn=COSMIC;
        X-KDE-autostart-phase=1
      '';
    };
  };
}
