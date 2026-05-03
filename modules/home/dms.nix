{ config, lib, inputs, ... }:

{
  config = lib.mkIf config.programs.sway.enable {
    home-manager.users.fsanabria = {
      imports = [ inputs.dms.homeModules.dank-material-shell ];

      programs.dank-material-shell = {
        enable = true;

        # Auto-start via sway-session.target (systemd.enable = true in sway module)
        systemd = {
          enable = true;
          restartIfChanged = true;
        };

        enableSystemMonitoring = true;
        enableDynamicTheming   = true;
        enableAudioWavelength  = true;
        enableClipboardPaste   = true;
        enableCalendarEvents   = true;
        enableVPN              = true;
      };
    };
  };
}
