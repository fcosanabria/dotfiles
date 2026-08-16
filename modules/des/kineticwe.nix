{ inputs, ... }:

{
  imports = [ inputs.kineticwe.nixosModules.default ];

  # Habilita KineticWE
  programs.kineticwe.enable = true;

  # Display Manager (SDDM recomendado para Wayland)
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
}
