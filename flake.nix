{
  description = "Nixos config flake";

  inputs = {
    # Nota: usar COSMIC 1.8.0 requiere el PR NixOS/nixpkgs#562003 (sin cache
    # binaria). Con nixos-unstable obtenemos 1.6.0 desde cache.nixos.org
    # (cero compilación). Cuando el PR se mergee, acá ya estará 1.8.0 cacheada.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    lazyvim-nix = {
      url = "github:pfassina/lazyvim-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    cosmic-manager = {
      url = "github:HeitorAugustoLN/cosmic-manager";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };
    llm-agents.url = "github:numtide/llm-agents.nix";
    openscreen.url = "github:getopenscreen/openscreen";
  };

  outputs =
    { self, nixpkgs, ... }@inputs:
    {
      nixosConfigurations.synnax = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/desktop/configuration.nix
          inputs.home-manager.nixosModules.default
        ];
      };
      nixosConfigurations.zbook = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/laptop/configuration.nix
          inputs.home-manager.nixosModules.default
        ];
      };
      nixosConfigurations.synnax-dev = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/synnax-dev/configuration.nix
          inputs.home-manager.nixosModules.default
        ];
      };
    };
}