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

  # ── GTK/Qt Theme Synchronization (Dark/Light mode) ────────────────────
  # Portal para que GTK4/libadwaita y Qt sigan el tema del sistema
  services.xdg-desktop-portal = {
    enable = true;
    cosmic.enable = true;
    gtk.enable = true;
  };

  # GTK: forzar preferencia de tema oscuro/claro vía gsettings
  # Esto se sincroniza automáticamente con COSMIC
  gnome.gsettings = {
    "org.gnome.desktop.interface.color-scheme" = "prefer-dark";
    "org.gnome.desktop.interface.gtk-theme" = "Adwaita";
    "org.gnome.desktop.interface.icon-theme" = "Adwaita";
    "org.gnome.desktop.interface.cursor-theme" = "Adwaita";
  };

  # Qt: usar kvantum como platform theme para respetar tema del sistema
  qt = {
    enable = true;
    platformTheme = "kvantum";
    style = "kvantum";
  };

  # Kvantum theme que sigue el tema del sistema (cosmic/kde)
  environment.systemPackages = with pkgs; [
    kvantum
    kvantum-theme-materia
    qt5ct
    qt6ct
  ];

  # Variables de entorno Wayland + theme sync
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
    # Qt theme sync
    QT_QPA_PLATFORMTHEME = "kvantum";
    QT_STYLE_OVERRIDE = "kvantum";
    # GTK theme sync (deja que xdg-desktop-portal + gsettings manejen dark/light)
  };
}
