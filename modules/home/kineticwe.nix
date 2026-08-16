{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:

let
  inherit (lib) mkIf;
in
{
  config = mkIf (config.programs.kineticwe.enable or false) {
    home-manager.users.fsanabria = {
      imports = [
        inputs.kineticwe.homeModules.default
      ];

      programs.kineticwe.enable = true;
    };
  };
}
