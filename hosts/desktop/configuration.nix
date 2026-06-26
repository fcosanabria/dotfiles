{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    /etc/nixos/hardware-configuration.nix
    ../../modules/des/kde.nix
    ../../modules/system
    ../../modules/home
  ];

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 5;
  boot.loader.timeout = 20;
  boot.loader.efi.canTouchEfiVariables = true;

  # Hostname
  networking.hostName = "synnax";

  # Networking
  networking.networkmanager.enable = true;

  # Timezone
  time.timeZone = "America/Costa_Rica";

  # Locale
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "es_CR.UTF-8";
    LC_IDENTIFICATION = "es_CR.UTF-8";
    LC_MEASUREMENT = "es_CR.UTF-8";
    LC_MONETARY = "es_CR.UTF-8";
    LC_NAME = "es_CR.UTF-8";
    LC_NUMERIC = "es_CR.UTF-8";
    LC_PAPER = "es_CR.UTF-8";
    LC_TELEPHONE = "es_CR.UTF-8";
    LC_TIME = "es_CR.UTF-8";
  };

  # X11
  services.xserver.enable = true;
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # User account
  users.users.fsanabria = {
    isNormalUser = true;
    description = "Francisco Sanabria";
    extraGroups = [ "networkmanager" "wheel" "docker" "libvirtd" "kvm" "scanner" "lp" ];
    shell = pkgs.fish;
  };

  # Home Manager base config
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.backupFileExtension = "hm-backup";
  home-manager.users.fsanabria = {
    home.username = "fsanabria";
    home.homeDirectory = "/home/fsanabria";
    home.stateVersion = "25.11";
  };

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

  # Kanata installed but not auto-started (use kanata-toggle to enable)
  systemd.services.kanata-default.wantedBy = lib.mkForce [];

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
