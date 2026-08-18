{ inputs, pkgs, ... }:

{
  imports = [ inputs.mangowm.nixosModules.default ];

  # Habilita MangoWM
  programs.mango.enable = true;

  # Display manager con soporte Wayland para seleccionar la sesión mango
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };

  # Paquetes elegidos para la sesión MangoWM
  environment.systemPackages = with pkgs; [
    waybar
    rofi-wayland
    swaynotificationcenter
    swaylock
    swayidle
  ];

  # Permite desbloquear con swaylock
  security.pam.services.swaylock = { };

  # Variables de entorno Wayland
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    ELECTRON_OZONE_PLATFORM_HINT = "wayland";
    MOZ_ENABLE_WAYLAND = "1";
    QT_QPA_PLATFORM = "wayland";
  };
}
