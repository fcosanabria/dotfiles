{ config, lib, pkgs, ... }:

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
in
{
  environment.systemPackages = [ kanata-toggle ];
  # Nix Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

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

  # Printing (CUPS)
  services.printing.enable = true;

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

  # KMonad System Service (disabled)
  systemd.services.kmonad = {
    description = "Kmonad keyboard remapper";
    after = [ "systemd-udev-settle.service" ];
    # wantedBy = [ "multi-user.target" ];

    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.kmonad}/bin/kmonad /home/fsanabria/.config/kmonad/config.kbd";
      Restart = "on-failure";
      User = "root";
    };
  };

  # Kanata
  services.kanata = {
    enable = true;
    keyboards.default = {
      extraDefCfg = "process-unmapped-keys yes";
      config = ''
        (defsrc
          caps h j k l spc m lmet lalt
          t    r w a   s c   v n   x
        )

        (defalias
          cap (tap-hold 100 200 esc (layer-while-held nav))
        )

        (deflayer base
          @cap h j k l spc m lalt lmet
          t    r w a   s c   v n   x
        )

        (deflayer nav
          _    left down up right bspc ret _    _
          C-t  C-r C-w C-a C-s C-c C-v C-n C-x
        )
      '';
    };
  };
}
