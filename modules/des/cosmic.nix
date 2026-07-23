{ config, pkgs, ... }:

{
  # Display Manager & Desktop Environment
  services.displayManager.cosmic-greeter.enable = true;
  services.desktopManager.cosmic.enable = true;

  # Excluir apps core que no usamos (cosmic-edit: ya hay neovim/vscode/zed).
  # cosmic-edit NO está en corePkgs, así que no genera el warning del módulo.
  environment.cosmic.excludePackages = with pkgs; [ cosmic-edit ];

  # Rendimiento: scheduler de System76 (recomendado por la wiki de NixOS)
  services.system76-scheduler.enable = true;

  # Firefox: desactivar tema libadwaita para que respete el tema de COSMIC
  programs.firefox.preferences."widget.gtk.libadwaita-colors.enabled" = false;

  # Keyring: desbloquear gnome-keyring al iniciar sesión con cosmic-greeter
  security.pam.services.cosmic-greeter.enableGnomeKeyring = true;

  # USB: udisks2 para que cosmic-files monte unidades removibles
  services.udisks2.enable = true;

  # Variables de entorno Wayland
  environment.sessionVariables = {
    # Permite clipboard managers (ej. cliphist). NOTA: da acceso global
    # al portapapeles a todas las ventanas (trade-off de seguridad).
    COSMIC_DATA_CONTROL_ENABLED = 1;
    NIXOS_OZONE_WL = "1"; # Electron apps en Wayland (vscode, discord)
    ELECTRON_OZONE_PLATFORM_HINT = "wayland";
    MOZ_ENABLE_WAYLAND = "1"; # Firefox Wayland
    QT_QPA_PLATFORM = "wayland"; # Qt apps en Wayland
    SDL_VIDEODRIVER = "wayland";
  };
}
