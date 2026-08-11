{ inputs, ... }: {
  imports = [
    inputs.openscreen.nixosModules.default
  ];

  programs.openscreen.enable = true;
}
