{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ../../modules/base.nix
    ../../modules/system/syncthing.nix
    /etc/nixos/hardware-configuration.nix
    ../../modules/des/cosmic.nix
    ../../modules/system
    ../../modules/home
  ];

  # Nix: auto-GC y deduplicación del store. Evita que builds largos
  # (compilar COSMIC desde fuente) llenen el disco: si el store pasa de
  # max-free, el daemon borra paths no referenciados durante el build.
  nix.settings = {
    auto-optimise-store = true;
    min-free = 20 * 1024 * 1024 * 1024; # 20 GiB libres mínimo
    max-free = 60 * 1024 * 1024 * 1024; # GC automático sobre 60 GiB
  };

  # El driver del kernel hid_magicmouse captura el Magic Trackpad 2 (05ac:0265)
  # y lo trata como "pointing stick" (PROP=5), por lo que el cursor no se mueve
  # en Wayland/KWin. Con blacklist, hid-generic lo maneja como touchpad normal.
  boot.blacklistedKernelModules = [ "hid_magicmouse" ];

  # OBS Virtual Camera: módulo v4l2loopback del kernel en uso.
  # exclusive_caps=1 es necesario para que OBS/chromium detecten el dispositivo.
  boot.extraModulePackages = [ config.boot.kernelPackages.v4l2loopback.out ];
  boot.kernelModules = [ "v4l2loopback" ];
  boot.extraModprobeConfig = ''
    options v4l2loopback exclusive_caps=1 max_buffers=2
  '';

  # Hostname
  networking.hostName = "synnax";

  # X11
  services.xserver.enable = true;
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # User account — grupos extra sobre los del módulo base
  users.users.fsanabria.extraGroups = [
    "docker"
    "libvirtd"
    "kvm"
    "scanner"
    "lp"
    "input"
  ];

  # Steam + Proton
  programs.steam = {
    enable = true;
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };

  # GameMode (temporary OS-level optimizations while gaming)
  programs.gamemode.enable = true;

  # Graphics (required for Steam — 32-bit libs for Proton compatibility)
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # UHK (Ultimate Hacking Keyboard): reglas udev para acceso non-root
  # al firmware. Requiere que el usuario esté en el grupo "input".
  hardware.keyboard.uhk.enable = true;

  # Kanata installed but not auto-started (use kanata-toggle to enable)
  systemd.services.kanata-default.wantedBy = lib.mkForce [ ];

  # EPSON L6270 (USB). Cola CUPS declarativa con el driver ESC/P-R 2.
  # El driver (epson-escpr2) se instala en modules/system/services.nix.
  # Así la impresora aparece sola en el diálogo de impresión de todas las apps.
  hardware.printers = {
    ensureDefaultPrinter = "EPSON_L6270";
    ensurePrinters = [
      {
        name = "EPSON_L6270";
        location = "Casa";
        deviceUri = "usb://EPSON/L6270%20Series?serial=583847353030363315&interface=1";
        model = "epson-inkjet-printer-escpr2/Epson-L6270_Series-epson-escpr2-en.ppd";
      }
    ];
  };

  # Windows dual boot: copy EFI/Microsoft from Windows ESP to NixOS ESP
  # Windows ESP: nvme0n1p1 (UUID 6243-2DC7)
  system.activationScripts.copyWindowsEfi = ''
    tmp=$(mktemp -d)
    if mount -t vfat /dev/disk/by-uuid/6243-2DC7 "$tmp" -o ro 2>/dev/null; then
      cp -rf "$tmp/EFI/Microsoft" /boot/EFI/
      umount "$tmp"
    fi
    rmdir "$tmp"
  '';

  system.stateVersion = "25.11";
}