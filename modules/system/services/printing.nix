{ pkgs, ... }:

let
  # Epson Scan 2: driver SANE + GUI, con plugins no-libres (OCR + escaneo por red).
  epsonscan2 = pkgs.epsonscan2.override { withNonFreePlugins = true; };
in
{
  environment.systemPackages = [ epsonscan2 ]; # GUI bin/epsonscan2 en PATH

  # Impresión (CUPS) + driver Epson ESC/P-R 2 (L6270 y otros EcoTank/WorkForce).
  services.printing.enable = true;
  services.printing.drivers = [ pkgs.epson-escpr2 ];

  # Escaneo (SANE) — registra el backend de Epson Scan 2.
  # El usuario debe estar en los grupos "scanner" y "lp" (ver core/users.nix).
  hardware.sane.enable = true;
  hardware.sane.extraBackends = [ epsonscan2 ];
}
