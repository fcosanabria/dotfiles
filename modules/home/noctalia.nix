{ config, lib, inputs, ... }:

{
  config = lib.mkIf config.programs.sway.enable {
    home-manager.users.fsanabria = {
      imports = [ inputs.noctalia.homeModules.default ];

      programs.noctalia-shell = {
        enable = true;
        settings = {};
      };
    };
  };
}
