{ config, pkgs, ... }:

{
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
          caps a s d f h j k l ; spc m lmet lalt
        )

        (defvar
          tap-time 150
          hold-time 200
        )

        (defalias
          cap (tap-hold 100 200 esc (layer-while-held nav))
          a (multi f24 (tap-hold $tap-time $hold-time a lmet))
          s (multi f24 (tap-hold $tap-time $hold-time s lalt))
          d (multi f24 (tap-hold $tap-time $hold-time d lsft))
          f (multi f24 (tap-hold $tap-time $hold-time f lctl))
          j (multi f24 (tap-hold $tap-time $hold-time j rctl))
          k (multi f24 (tap-hold $tap-time $hold-time k rsft))
          l (multi f24 (tap-hold $tap-time $hold-time l ralt))
          ; (multi f24 (tap-hold $tap-time $hold-time ; rmet))
        )

        (deflayer base
          @cap @a @s @d @f h @j @k @l @; spc m lalt lmet
        )

        (deflayer nav
          _    _    _    _    _    left down up right _    bspc ret _    _
        )
      '';
    };
  };
}
