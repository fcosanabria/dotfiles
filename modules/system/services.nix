{ config, pkgs, ... }:

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
    options = "--delete-older-than 10d";
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

  # Printing (CUPS)
  services.printing.enable = true;

  # OpenSSH
  services.openssh.enable = true;

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
        )

        (defalias
          cap (tap-hold 100 200 esc (layer-while-held nav))
        )

        (deflayer base
          @cap h j k l spc m lalt lmet
        )

        (deflayer nav
          _    left down up right bspc ret _    _
        )
      '';
    };
  };
}
