{
  config,
  lib,
  pkgs,
  ...
}:

let
  kanata-toggle = pkgs.writeShellScriptBin "kanata-toggle" ''
    SERVICE="kanata-default.service"
    if ${pkgs.systemd}/bin/systemctl is-active --quiet "$SERVICE"; then
      pkexec ${pkgs.systemd}/bin/systemctl stop "$SERVICE"
      ${pkgs.libnotify}/bin/notify-send "Kanata" "Desactivado" --icon=input-keyboard
    else
      pkexec ${pkgs.systemd}/bin/systemctl start "$SERVICE"
      ${pkgs.libnotify}/bin/notify-send "Kanata" "Activado" --icon=input-keyboard
    fi
  '';

  # Epson Scan 2: driver SANE + GUI, con plugins no-libres (OCR + escaneo por red).
  # withGui es true por defecto; withNonFreePlugins requiere allowUnfree (ya activo).
  epsonscan2 = pkgs.epsonscan2.override { withNonFreePlugins = true; };
in
{
  environment.systemPackages = [
    kanata-toggle
    epsonscan2 # GUI bin/epsonscan2 disponible en PATH
  ];
  # Nix Flakes
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  services.dbus.implementation = "dbus";

  # Garbage Collector
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  # Audio (PipeWire)
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Nix-LD (run standard Linux binaries)
  programs.nix-ld.enable = true;

  # Accounts daemon (user profile persistence)
  services.accounts-daemon.enable = true;

  # Power profiles (performance / balanced / power-saver)
  services.power-profiles-daemon.enable = true;

  # Bluetooth
  hardware.bluetooth.enable = true;

  # UPower (battery/power info)
  services.upower.enable = true;

  # Printing (CUPS) + driver Epson ESC/P-R 2 (incluye el PPD de la L6270 y
  # muchos otros modelos EcoTank/WorkForce recientes).
  services.printing.enable = true;
  services.printing.drivers = [ pkgs.epson-escpr2 ];

  # Scanning (SANE) — registra el backend de Epson Scan 2.
  # El usuario debe estar en el grupo "scanner" (y "lp" para escáneres USB).
  hardware.sane.enable = true;
  hardware.sane.extraBackends = [ epsonscan2 ];

  # OpenSSH
  services.openssh.enable = true;

  # Docker
  virtualisation.docker.enable = true;
  users.groups.docker.gid = lib.mkForce 999;

  # KVM / libvirt (Virtual Machines Manager)
  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.qemu_kvm;
      runAsRoot = true;
      swtpm.enable = true;
    };
  };
  programs.virt-manager.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;

  # Kanata
  services.kanata = {
    enable = true;
    keyboards.default = {
      extraDefCfg = "process-unmapped-keys yes";
      config = ''
        (defsrc
          caps h j k l spc m lmet lalt ralt lsft rsft
          t    r w a   s c   v n   x e i o u
        )

        (defalias
          cap (tap-hold 100 200 esc (layer-while-held nav))
          spa (layer-while-held spanish)

          a-acc (fork (unicode á) (unicode Á) (lsft rsft))
          e-acc (fork (unicode é) (unicode É) (lsft rsft))
          i-acc (fork (unicode í) (unicode Í) (lsft rsft))
          o-acc (fork (unicode ó) (unicode Ó) (lsft rsft))
          u-acc (fork (unicode ú) (unicode Ú) (lsft rsft))
          n-acc (fork (unicode ñ) (unicode Ñ) (lsft rsft))
        )

        (deflayer base
          @cap h j k l spc m lalt lmet @spa _    _
          t    r w a   s c   v n   x e i o u
        )

        (deflayer nav
          _    left down up right bspc ret _    _    _    _    _
          C-t  C-r C-w C-a C-s C-c C-v C-n C-x e i o u
        )

        (deflayer spanish
          _    _    _    _    _    _    _    _    _    _    _    _
          _    _    _    @a-acc _    _    _    @n-acc _ @e-acc @i-acc @o-acc @u-acc
        )
      '';
    };
  };
}
