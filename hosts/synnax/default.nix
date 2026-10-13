{
  config,
  pkgs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/desktop/cosmic.nix
  ];

  # Hostname
  networking.hostName = "synnax";

  # Nix: umbrales de GC para esta máquina (a veces compila COSMIC desde
  # fuente y llena el disco). auto-optimise/gc base están en core/nix.nix.
  nix.settings.min-free = 20 * 1024 * 1024 * 1024; # 20 GiB libres mínimo
  nix.settings.max-free = 60 * 1024 * 1024 * 1024; # GC automático sobre 60 GiB

  # Magic Trackpad 2 (05ac:0265): hid_magicmouse lo trata como "pointing
  # stick" y el cursor no se mueve en Wayland. Con blacklist, hid-generic
  # lo maneja como touchpad normal.
  boot.blacklistedKernelModules = [ "hid_magicmouse" ];

  # OBS Virtual Camera: módulo v4l2loopback del kernel.
  # exclusive_caps=1 es necesario para que OBS/chromium detecten el dispositivo.
  boot.extraModulePackages = [ config.boot.kernelPackages.v4l2loopback.out ];
  boot.kernelModules = [ "v4l2loopback" ];
  boot.extraModprobeConfig = ''
    options v4l2loopback exclusive_caps=1 max_buffers=2
  '';

  # Grupos adicionales (se concatenan con los de core/users.nix)
  users.users.fsanabria.extraGroups = [
    "docker"
    "libvirtd"
    "kvm"
    "input"
  ];

  # Steam + Proton
  programs.steam = {
    enable = true;
    extraCompatPackages = with pkgs; [ proton-ge-bin ];
  };

  # GameMode (optimizaciones del OS mientras se juega)
  programs.gamemode.enable = true;

  # Graphics (libs 32-bit para compatibilidad con Proton)
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # EPSON L6270 (USB). Cola CUPS declarativa con el driver ESC/P-R 2.
  # El driver (epson-escpr2) se instala en modules/system/services/printing.nix.
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

  # Windows dual boot: copia EFI/Microsoft desde el ESP de Windows al ESP de NixOS.
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
