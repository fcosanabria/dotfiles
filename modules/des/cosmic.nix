{
  config,
  lib,
  pkgs,
  ...
}:

{
  # ── Display Manager & Desktop Environment (COSMIC Epoch 1.8.0) ──────
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

  # ── Bluetooth (bluez + blueman GUI) ──────────────────────────────────
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  # ── SMB / Network shares (cosmic-files via GVFS) ─────────────────────
  services.gvfs.enable = true;
  services.samba = {
    enable = true;
    openFirewall = false; # Solo cliente, no compartir
  };

  # ── Keyring / Secret Service (gnome-keyring) ─────────────────────────
  services.gnome.gnome-keyring.enable = true;
  security.pam.services.login.enableGnomeKeyring = true;

  # ── System packages ──────────────────────────────────────────────────
  environment.systemPackages = with pkgs; [
    # -- Screenshots & Screen Recording --
    grim
    slurp
    wf-recorder

    # -- Clipboard --
    wl-clipboard # wl-copy / wl-paste
    cliphist # Clipboard history manager

    # -- Display & Brightness --
    brightnessctl # Backlight / LED control
    cosmic-randr # CLI para layout de displays

    # -- Media Keys --
    playerctl # MPRIS media player control

    # -- File Manager (COSMIC usa cosmic-files por defecto) --
    thunar
    thunar-volman
    thunar-archive-plugin
    tumbler
    ristretto
    zathura
    kdePackages.kate
    kdePackages.ark
    samba
    cifs-utils

    # -- Authentication (polkit agent; se autostartea en home/cosmic.nix) --
    kdePackages.polkit-kde-agent-1

    # -- System Tray & Audio --
    networkmanagerapplet
    pavucontrol
    pamixer

    # -- Keyring / Secrets --
    gnome-keyring # Credential storage (Wi-Fi, SSH, GPG)
    libsecret # Secret service API

    # -- Misc Wayland Utilities --
    wev # Wayland event viewer (debug keybinds)
    xdg-utils # xdg-open and friends
  ];

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
