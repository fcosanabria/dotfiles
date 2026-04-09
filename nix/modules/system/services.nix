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

  # KMonad System Service
  systemd.services.kmonad = {
    description = "Kmonad keyboard remapper";
    after = [ "systemd-udev-settle.service" ];
    wantedBy = [ "multi-user.target" ];

    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.kmonad}/bin/kmonad /home/fsanabria/.config/kmonad/config.kbd";
      Restart = "on-failure";
      User = "root";
    };
  };
}
