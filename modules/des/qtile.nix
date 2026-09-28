{
  config,
  pkgs,
  ...
}:

{
  # ── Display Manager ────────────────────────────────────────────────
  services.xserver.enable = true;
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.xkb = {
    layout = "us";
    options = "compose:rwin"; # Compose key en Win derecha (igual que el resto de hosts)
  };

  # ── Qtile Window Manager (X11) ─────────────────────────────────────
  # La config vive en ./qtile/config.py (NixOS la instala en
  # /etc/xdg/qtile/config.py). Empezar desde ahí: layouts, keys, bar.
  services.xserver.windowManager.qtile = {
    enable = true;
    configFile = ./qtile/config.py;
  };

  # ── Paquetes del entorno ────────────────────────────────────────────
  environment.systemPackages = with pkgs; [
    # -- Launcher & Clipboard --
    rofi          # App launcher (mod+d)
    xclip         # Clipboard X11

    # -- Display & Compositor --
    picom         # Compositor X11
    xrandr
    brightnessctl # Backlight / LED control

    # -- File Manager --
    thunar
    thunar-volman
    thunar-archive-plugin
    tumbler       # Thumbnails para Thunar
    xarchiver     # Extractor de archivos comprimidos (mod+z)
    unzip
    zip
    p7zip

    # -- Previewers --
    ristretto     # Viewer de imágenes (mod+r)
    zathura       # Viewer de PDF (backend mupdf incluido)

    # -- SMB / Network shares (Thunar via GVFS) --
    samba         # Cliente
    cifs-utils

    # -- System Tray & Audio --
    networkmanagerapplet
    pavucontrol
    pamixer

    # -- Notifications & Clipboard (iguales a los de XFCE) --
    xfce.xfce4-notifyd        # Notificaciones estilo XFCE
    xfce.xfce4-clipman-plugin # Clipboard manager (binario xfce4-clipman)

    # -- Screen locker --
    slock

    # -- Bluetooth --
    blueman       # GTK Bluetooth manager (tray applet)

    # -- Authentication --
    kdePackages.polkit-kde-agent-1
    gnome-keyring # Credential storage (Wi-Fi, SSH, GPG) — igual que el resto de hosts
    libsecret     # Secret service API

    # -- USB Auto-mount --
    udiskie       # User-space auto-mount for removable media
  ];

  # ── Polkit ──────────────────────────────────────────────────────────
  security.polkit.enable = true;

  # ── Keyring / Secret Service (gnome-keyring, igual que el resto de hosts) ──
  services.gnome.gnome-keyring.enable = true;
  security.pam.services.login.enableGnomeKeyring = true;

  # ── SMB / Network shares (Thunar via GVFS) ───────────────────────────
  services.gvfs.enable = true;
  services.samba = {
    enable = true;
    openFirewall = false; # Solo cliente, no compartir
  };

  # ── Bluetooth (bluez + blueman GUI) ──────────────────────────────────
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  # ── USB Auto-mount (udisks2 + udiskie) ──────────────────────────────
  services.udisks2.enable = true;
}