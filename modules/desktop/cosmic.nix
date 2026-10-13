{ pkgs, ... }:

{
  # ── Display Manager & Desktop Environment (COSMIC) ───────────────────
  services.displayManager.cosmic-greeter.enable = true;
  services.desktopManager.cosmic.enable = true;

  # Rendimiento: scheduler de System76 (recomendado por la wiki de NixOS)
  services.system76-scheduler.enable = true;

  # Firefox: desactivar tema libadwaita para que respete el tema de COSMIC
  programs.firefox.preferences."widget.gtk.libadwaita-colors.enabled" = false;

  # Keyring: desbloquear gnome-keyring al iniciar sesión con cosmic-greeter
  security.pam.services.cosmic-greeter.enableGnomeKeyring = true;

  # USB: udisks2 para que cosmic-files monte unidades removibles
  services.udisks2.enable = true;

  # ── SMB / Network shares (cosmic-files via GVFS) ─────────────────────
  services.gvfs.enable = true;
  services.samba = {
    enable = true;
    openFirewall = false; # Solo cliente, no compartir
  };

  # ── Keyring / Secret Service (gnome-keyring) ─────────────────────────
  services.gnome.gnome-keyring.enable = true;
  security.pam.services.login.enableGnomeKeyring = true;

  # ── Polkit auth agent (autostart system-wide; COSMIC procesa XDG autostart) ──
  environment.etc."xdg/autostart/polkit-kde-authentication-agent.desktop".text = ''
    [Desktop Entry]
    Type=Application
    Name=Polkit Authentication Agent
    Exec=${pkgs.kdePackages.polkit-kde-agent-1}/libexec/polkit-kde-authentication-agent-1
    OnlyShowIn=COSMIC;
    X-KDE-autostart-phase=1
  '';

  # ── Variables de entorno Wayland ─────────────────────────────────────
  environment.sessionVariables = {
    # Permite clipboard managers (ej. cliphist). NOTA: da acceso global
    # al portapapeles a todas las ventanas (trade-off de seguridad).
    COSMIC_DATA_CONTROL_ENABLED = 1;
    NIXOS_OZONE_WL = "1"; # Electron apps en Wayland (vscode, discord)
    ELECTRON_OZONE_PLATFORM_HINT = "wayland";
    MOZ_ENABLE_WAYLAND = "1"; # Firefox Wayland
    QT_QPA_PLATFORM = "wayland"; # Qt apps en Wayland
    SDL_VIDEODRIVER = "wayland";
    _JAVA_AWT_WM_NONREPARENTING = "1";
  };
}
