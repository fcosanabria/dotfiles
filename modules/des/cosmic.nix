{ config, pkgs, ... }:

{
  # Display Manager & Desktop Environment
  services.displayManager.cosmic-greeter.enable = true;
  services.desktopManager.cosmic.enable = true;
}
