{
  config,
  pkgs,
  ...
}:

{
  # ── Display Manager ────────────────────────────────────────────────
  services.xserver.enable = true;
  services.xserver.displayManager.lightdm.enable = true;

  # ── Qtile Window Manager (básico, X11) ─────────────────────────────
  # La config vive en ./qtile/config.py (NixOS la instala en
  # /etc/xdg/qtile/config.py). Empezar desde ahí: layouts, keys, bar.
  services.xserver.windowManager.qtile = {
    enable = true;
    configFile = ./qtile/config.py;
  };

  # ── Paquetes mínimos del entorno ────────────────────────────────────
  environment.systemPackages = with pkgs; [
    rofi          # App launcher (mod+d)
    xclip         # Clipboard X11
    xrandr
    pavucontrol
    networkmanagerapplet
    picom         # Compositor X11 (opcional, quitar si no se usa)
  ];

  # ── Polkit ──────────────────────────────────────────────────────────
  security.polkit.enable = true;
}