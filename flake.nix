{
  description = "NixOS config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs =
    { self, nixpkgs, ... }:
    let
      mkHost =
        name:
        nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./modules/core
            ./modules/system
            ./modules/user
            ./hosts/${name}
          ];
        };
    in
    {
      nixosConfigurations = {
        synnax = mkHost "synnax";
        zbook = mkHost "zbook";
      };
    };
}
